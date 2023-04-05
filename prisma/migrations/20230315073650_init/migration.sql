-- DropForeignKey
ALTER TABLE "_TwitterReply" DROP CONSTRAINT "_TwitterReply_B_fkey";

-- AddForeignKey
ALTER TABLE "_TwitterReply" ADD CONSTRAINT "_TwitterReply_B_fkey" FOREIGN KEY ("B") REFERENCES "TwitterUser"("id") ON DELETE CASCADE ON UPDATE CASCADE;
