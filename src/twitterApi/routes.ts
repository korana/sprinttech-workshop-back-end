import {
  createDMHandler,
  createPostHandler,
  createTWFollowHandler,
  createTWUsersHandler,
  getHashtagsHandler,
  getPostByHashtagHandler,
  getPostByUserHandler,
  getUserProfileHandler,
  likeTweetHandler,
  replyPostHandler,
} from "./twitter.handler";

export const AppRoutes = [
  {
    path: "/createTWUsers",
    method: "post",
    action: createTWUsersHandler,
  },
  {
    path: "/createTWFollow",
    method: "post",
    action: createTWFollowHandler,
  },
  {
    path: "/getUserProfile",
    method: "post",
    action: getUserProfileHandler,
  },
  {
    path: "/createPost",
    method: "post",
    action: createPostHandler,
  },
  {
    path: "/getPostByHashtag",
    method: "post",
    action: getPostByHashtagHandler,
  },
  {
    path: "/getHashtags",
    method: "post",
    action: getHashtagsHandler,
  },
  {
    path: "/getPostByUser",
    method: "post",
    action: getPostByUserHandler,
  },
  {
    path: "/replyPost",
    method: "post",
    action: replyPostHandler,
  },
  {
    path: "/likeTweet",
    method: "post",
    action: likeTweetHandler
  },
  {
    path: "/createDM",
    method: "post",
    action: createDMHandler
  }
];
