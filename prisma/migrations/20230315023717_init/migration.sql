/*
  Warnings:

  - You are about to drop the `TriviaCategory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `TriviaChoice` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `TriviaQuestion` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `TriviaRound` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `TriviaRoundQuestion` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `TriviaUser` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "TriviaChoice" DROP CONSTRAINT "TriviaChoice_quizId_fkey";

-- DropForeignKey
ALTER TABLE "TriviaQuestion" DROP CONSTRAINT "TriviaQuestion_categoryId_fkey";

-- DropForeignKey
ALTER TABLE "TriviaQuestion" DROP CONSTRAINT "TriviaQuestion_triviaAnswerChoiceId_fkey";

-- DropForeignKey
ALTER TABLE "TriviaRound" DROP CONSTRAINT "TriviaRound_categoryId_fkey";

-- DropForeignKey
ALTER TABLE "TriviaRound" DROP CONSTRAINT "TriviaRound_userId_fkey";

-- DropForeignKey
ALTER TABLE "TriviaRoundQuestion" DROP CONSTRAINT "TriviaRoundQuestion_choiceId_fkey";

-- DropForeignKey
ALTER TABLE "TriviaRoundQuestion" DROP CONSTRAINT "TriviaRoundQuestion_quizId_fkey";

-- DropForeignKey
ALTER TABLE "TriviaRoundQuestion" DROP CONSTRAINT "TriviaRoundQuestion_roundId_fkey";

-- DropTable
DROP TABLE "TriviaCategory";

-- DropTable
DROP TABLE "TriviaChoice";

-- DropTable
DROP TABLE "TriviaQuestion";

-- DropTable
DROP TABLE "TriviaRound";

-- DropTable
DROP TABLE "TriviaRoundQuestion";

-- DropTable
DROP TABLE "TriviaUser";

-- CreateTable
CREATE TABLE "TwitterUser" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "join" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TwitterUser_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TwitterFollow" (
    "id" SERIAL NOT NULL,
    "fromUserId" INTEGER NOT NULL,
    "toUserId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TwitterFollow_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TwitterPost" (
    "id" SERIAL NOT NULL,
    "caption" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TwitterPost_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TwitterDirectMessage" (
    "id" SERIAL NOT NULL,
    "fromUserId" INTEGER NOT NULL,
    "toUserId" INTEGER NOT NULL,
    "text" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TwitterDirectMessage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TwitterHashtag" (
    "id" SERIAL NOT NULL,
    "hashtag" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TwitterHashtag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_TwitterReply" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_TwitterHashtagToTwitterPost" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "TwitterUser_name_key" ON "TwitterUser"("name");

-- CreateIndex
CREATE UNIQUE INDEX "TwitterHashtag_hashtag_key" ON "TwitterHashtag"("hashtag");

-- CreateIndex
CREATE UNIQUE INDEX "_TwitterReply_AB_unique" ON "_TwitterReply"("A", "B");

-- CreateIndex
CREATE INDEX "_TwitterReply_B_index" ON "_TwitterReply"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_TwitterHashtagToTwitterPost_AB_unique" ON "_TwitterHashtagToTwitterPost"("A", "B");

-- CreateIndex
CREATE INDEX "_TwitterHashtagToTwitterPost_B_index" ON "_TwitterHashtagToTwitterPost"("B");

-- AddForeignKey
ALTER TABLE "TwitterFollow" ADD CONSTRAINT "TwitterFollow_fromUserId_fkey" FOREIGN KEY ("fromUserId") REFERENCES "TwitterUser"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TwitterFollow" ADD CONSTRAINT "TwitterFollow_toUserId_fkey" FOREIGN KEY ("toUserId") REFERENCES "TwitterUser"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TwitterPost" ADD CONSTRAINT "TwitterPost_userId_fkey" FOREIGN KEY ("userId") REFERENCES "TwitterUser"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TwitterDirectMessage" ADD CONSTRAINT "TwitterDirectMessage_fromUserId_fkey" FOREIGN KEY ("fromUserId") REFERENCES "TwitterUser"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TwitterDirectMessage" ADD CONSTRAINT "TwitterDirectMessage_toUserId_fkey" FOREIGN KEY ("toUserId") REFERENCES "TwitterUser"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_TwitterReply" ADD CONSTRAINT "_TwitterReply_A_fkey" FOREIGN KEY ("A") REFERENCES "TwitterPost"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_TwitterReply" ADD CONSTRAINT "_TwitterReply_B_fkey" FOREIGN KEY ("B") REFERENCES "TwitterPost"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_TwitterHashtagToTwitterPost" ADD CONSTRAINT "_TwitterHashtagToTwitterPost_A_fkey" FOREIGN KEY ("A") REFERENCES "TwitterHashtag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_TwitterHashtagToTwitterPost" ADD CONSTRAINT "_TwitterHashtagToTwitterPost_B_fkey" FOREIGN KEY ("B") REFERENCES "TwitterPost"("id") ON DELETE CASCADE ON UPDATE CASCADE;
