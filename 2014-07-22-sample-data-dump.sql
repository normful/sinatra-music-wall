PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
INSERT INTO "schema_migrations" VALUES('20140717190638');
INSERT INTO "schema_migrations" VALUES('20140718013027');
INSERT INTO "schema_migrations" VALUES('20140718031835');
INSERT INTO "schema_migrations" VALUES('20140721203047');
CREATE TABLE "songs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "title" varchar(255), "url" varchar(255), "created_at" datetime, "updated_at" datetime);
INSERT INTO "songs" VALUES(1,1,'BlasterJaxx – Maxximize On Air 006-CABLE-07-12-2014','http://www.last.fm/music/BlasterJaxx/_/Maxximize+On+Air+006-CABLE-07-12-2014','2014-07-23 00:30:45.077718','2014-07-23 00:30:45.077718');
INSERT INTO "songs" VALUES(2,1,'Cosmic Gate - Wake Your Mind 013-SAT-07-13-2014','http://www.last.fm/music/Cosmic+Gate/_/Wake+Your+Mind+013-SAT-07-13-2014','2014-07-23 00:31:16.577386','2014-07-23 00:31:16.577386');
INSERT INTO "songs" VALUES(3,1,'Tritonal – Tritonia 057-SAT-07-12-2014','http://www.last.fm/music/Tritonal/_/Tritonia+057-SAT-07-12-2014','2014-07-23 00:31:51.103109','2014-07-23 00:31:51.103109');
INSERT INTO "songs" VALUES(4,2,'Helios – Coast Off','http://www.last.fm/music/Helios/_/Coast+Off','2014-07-23 00:32:52.637466','2014-07-23 00:32:52.637466');
INSERT INTO "songs" VALUES(5,2,'Helios – Your Zenith','http://www.last.fm/music/Helios/_/Your+Zenith','2014-07-23 00:33:10.113290','2014-07-23 00:33:10.113290');
INSERT INTO "songs" VALUES(6,3,'Marcus Schossow - Tone Diary 318-SBD-06-26-2014','http://www.last.fm/music/Marcus+Schossow/_/Tone+Diary+318-SBD-06-26-2014','2014-07-23 00:35:02.789569','2014-07-23 00:35:02.789569');
INSERT INTO "songs" VALUES(7,3,'Marcus Schossow - Tone Diary 317-SBD-06-19-2014','http://www.last.fm/music/Marcus+Schossow/_/Tone+Diary+317-SBD-06-19-2014','2014-07-23 00:35:15.985860','2014-07-23 00:35:15.985860');
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255), "password" varchar(255), "created_at" datetime, "updated_at" datetime);
INSERT INTO "users" VALUES(1,'norman@example.com','password','2014-07-23 00:29:25.826798','2014-07-23 00:29:25.826798');
INSERT INTO "users" VALUES(2,'bob@example.com','password','2014-07-23 00:32:37.615527','2014-07-23 00:32:37.615527');
INSERT INTO "users" VALUES(3,'marcus@example.com','password','2014-07-23 00:33:30.744121','2014-07-23 00:33:30.744121');
INSERT INTO "users" VALUES(4,'me@example.com','password','2014-07-23 00:36:09.425037','2014-07-23 00:36:09.425037');
CREATE TABLE "upvotes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "song_id" integer, "created_at" datetime, "updated_at" datetime);
INSERT INTO "upvotes" VALUES(1,3,2,'2014-07-23 00:35:22.759560','2014-07-23 00:35:22.759560');
INSERT INTO "upvotes" VALUES(2,3,1,'2014-07-23 00:35:37.620667','2014-07-23 00:35:37.620667');
INSERT INTO "upvotes" VALUES(3,3,7,'2014-07-23 00:35:41.414501','2014-07-23 00:35:41.414501');
INSERT INTO "upvotes" VALUES(4,4,2,'2014-07-23 00:36:14.548380','2014-07-23 00:36:14.548380');
INSERT INTO "upvotes" VALUES(5,4,5,'2014-07-23 00:36:22.980590','2014-07-23 00:36:22.980590');
INSERT INTO "upvotes" VALUES(6,1,2,'2014-07-23 00:36:38.742195','2014-07-23 00:36:38.742195');
INSERT INTO "upvotes" VALUES(7,1,5,'2014-07-23 00:36:48.052996','2014-07-23 00:36:48.052996');
INSERT INTO "upvotes" VALUES(8,1,1,'2014-07-23 00:36:57.860842','2014-07-23 00:36:57.860842');
INSERT INTO "upvotes" VALUES(9,1,7,'2014-07-23 00:37:03.353343','2014-07-23 00:37:03.353343');
INSERT INTO "upvotes" VALUES(10,1,3,'2014-07-23 00:37:09.001001','2014-07-23 00:37:09.001001');
INSERT INTO "upvotes" VALUES(11,1,4,'2014-07-23 00:37:15.162685','2014-07-23 00:37:15.162685');
CREATE TABLE "reviews" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "song_id" integer, "review_text" varchar(255), "rating" integer, "created_at" datetime, "updated_at" datetime);
INSERT INTO "reviews" VALUES(1,3,2,'Great song!',4,'2014-07-23 00:35:28.873293','2014-07-23 00:35:28.873293');
INSERT INTO "reviews" VALUES(2,1,2,'Nice bass.',5,'2014-07-23 00:37:27.473425','2014-07-23 00:37:27.473425');
INSERT INTO "reviews" VALUES(3,1,1,'Good set.',4,'2014-07-23 00:37:36.819744','2014-07-23 00:37:36.819744');
INSERT INTO "reviews" VALUES(4,1,3,'Nice track selection!',4,'2014-07-23 00:37:52.636763','2014-07-23 00:37:52.636763');
INSERT INTO "reviews" VALUES(5,4,1,'Alright, could have been better...',3,'2014-07-23 00:38:31.910417','2014-07-23 00:38:31.910417');
INSERT INTO "reviews" VALUES(6,4,5,'Relaxing!',5,'2014-07-23 00:38:45.922452','2014-07-23 00:38:45.922452');
INSERT INTO "reviews" VALUES(7,4,6,'On repeat!',4,'2014-07-23 00:39:04.468914','2014-07-23 00:39:04.468914');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('users',4);
INSERT INTO "sqlite_sequence" VALUES('songs',7);
INSERT INTO "sqlite_sequence" VALUES('upvotes',11);
INSERT INTO "sqlite_sequence" VALUES('reviews',7);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
COMMIT;