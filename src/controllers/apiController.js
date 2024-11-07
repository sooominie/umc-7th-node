const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

/**
 * 1. 내가 작성한 리뷰 목록 조회
 */
exports.getUserReviews = async (req, res) => {
  const userId = parseInt(req.params.userId);

  try {
    const reviews = await prisma.review.findMany({
      where: { userId: userId },
      include: { store: true },
      orderBy: { createdAt: 'desc' },
    });

    res.json(reviews);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: '리뷰를 가져오는 중 오류가 발생했습니다.' });
  }
};

/**
 * 2. 특정 가게의 미션 목록 조회
 */
exports.getStoreMissions = async (req, res) => {
  const storeId = parseInt(req.params.storeId);

  try {
    const missions = await prisma.mission.findMany({
      where: { storeId: storeId },
      include: { user: true },
      orderBy: { createdAt: 'desc' },
    });

    res.json(missions);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: '미션을 가져오는 중 오류가 발생했습니다.' });
  }
};

/**
 * 3. 진행 중인 미션 목록 조회
 */
exports.getOngoingMissions = async (req, res) => {
  const userId = parseInt(req.params.userId);

  try {
    const missions = await prisma.mission.findMany({
      where: {
        userId: userId,
        status: '진행 중',
      },
      include: { store: true },
      orderBy: { createdAt: 'desc' },
    });

    res.json(missions);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: '진행 중인 미션을 가져오는 중 오류가 발생했습니다.' });
  }
};

/**
 * 4. 미션 상태 변경
 */
exports.updateMissionStatus = async (req, res) => {
  const missionId = parseInt(req.params.missionId);
  const { status } = req.body;

  // 상태는 '진행 중' 또는 '진행 완료'로 제한
  if (!['진행 중', '진행 완료'].includes(status)) {
    return res.status(400).json({ error: '유효하지 않은 상태입니다.' });
  }

  try {
    const updatedMission = await prisma.mission.update({
      where: { id: missionId },
      data: { status: status },
    });

    res.json(updatedMission);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: '미션 상태를 업데이트하는 중 오류가 발생했습니다.' });
  }
};
