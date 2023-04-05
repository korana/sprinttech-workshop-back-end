-- CreateTable
CREATE TABLE "_LikeTweet" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_LikeTweet_AB_unique" ON "_LikeTweet"("A", "B");

-- CreateIndex
CREATE INDEX "_LikeTweet_B_index" ON "_LikeTweet"("B");

-- AddForeignKey
ALTER TABLE "_LikeTweet" ADD CONSTRAINT "_LikeTweet_A_fkey" FOREIGN KEY ("A") REFERENCES "TwitterPost"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LikeTweet" ADD CONSTRAINT "_LikeTweet_B_fkey" FOREIGN KEY ("B") REFERENCES "TwitterUser"("id") ON DELETE CASCADE ON UPDATE CASCADE;
