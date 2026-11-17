Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E394D606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 03:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=h3TUb757
Received: from list by lists.xenproject.org with outflank-mailman.1491863.1692565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT9w9-0001Vr-6w; Tue, 17 Nov 2026 03:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491863.1692565; Tue, 17 Nov 2026 03:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT9w9-0001Vk-3o; Tue, 17 Nov 2026 03:32:49 +0000
Received: by outflank-mailman (input) for mailman id 1491863;
 Tue, 17 Nov 2026 03:32:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nishimura@valinux.co.jp>) id 1xT9w7-0001Ve-AG
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 03:32:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xT9w6-00DyoH-4T
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 04:32:46 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nishimura@valinux.co.jp>)
 id 6afbca83-bab6-0a2a0a5309dd-0a2a450cad2a-24
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 04:32:45 +0100
Received: from [52.101.228.118]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nishimura@valinux.co.jp>)
 id 6afbcadb-f479-0a2a450c0019-3465e476401b-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 04:32:45 +0100
Received: from TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:15b::9)
 by TYYP286MB5648.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:293::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 03:32:38 +0000
Received: from TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 ([fe80::1150:c5cb:d781:8147]) by TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 ([fe80::1150:c5cb:d781:8147%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 03:32:38 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xasHy+2ywWSXoDyMyq6baTlq4m1DvNZw7WbMRxdbUnoBUkyyw+QYyJMg4nEZX0465GHKXfjl8S+nIMRAyS3wX1LE+dwjjHqIC+mMPMLzYfwFCq+M2BMzUPhOrFkKqJ8jH1OKnVw0D1ZS9HOiQIkyiz02xD78dYkYxQSbK1as+CKyiIkpzQ8pF0+M39P+aYAVFiLnbqbuy/XLhfAXw4pqFtOMooe0H0xZv0eGHohkDPDBlopv0QD4gCmringF+esargDfnh4r9Q648eMN8YcTAAa6bEkDbWg1+aENcwBT9/LCXLea8aHQuDS3h9TXB7ky/V3O8bVECHHDW3gYMR6mYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LgAnLo+1keKSE6ol7DiWN315AyFHVMi4Wlz3/bQqKU=;
 b=kPeVqG6F68SCNhAQAtLWV1obMcJ96HWoILO5UcnUia/tb7Lm4NCRFYwHIUT2s/MsyDPr2nDvAZ1nwfDcJVn9IqrwYO1Okd6FtvmiZ9gbsBHAQifd8eGMZH8pzO3JQDodC1jOEPck7H/Tqv6trSH4ErNqQgyZooOFDSt9ypDcKJSl8QBhUSx7vyy+vpSB6AnhAvdn36FsKrV/U3zdiKeLhHBk4+E+HTwRqiKF/0nLMxjoxpeb/+G9589fhMO7Q61saCCJk2yfYllrkAAleYr70gvPmVwH2tiu3RvbJfYa2tnciCBXKnbos25VE+w8S/BXTEJObCLdssb6HA6wIZqdEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2LgAnLo+1keKSE6ol7DiWN315AyFHVMi4Wlz3/bQqKU=;
 b=h3TUb757RLB6OLotW2+IiNdTir4SwAPJjEaNPgBRIOMxrLWKnaoLZoCdWppvZY2KJtS8OLWOURT2qSdqkwm+bLXVqQvICDjxSorj03yeaITm4tK+wsViTfr+2V89HKvwr22b+vtMzTMkHnEUtUEPbMY7CMFirrHdi2sYSrSiz5o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Daisuke Nishimura <nishimura@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Daisuke Nishimura <nishimura@valinux.co.jp>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: its: only clean cache when sending ITS command
Date: Tue, 17 Nov 2026 12:32:17 +0900
Message-ID: <20261117033217.184625-1-nishimura@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::8) To TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:15b::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2019:EE_|TYYP286MB5648:EE_
X-MS-Office365-Filtering-Correlation-Id: 73462c40-4a28-44fd-7e31-08df445b6d8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10070799003|18002099003|261009223027099003|56012099006|261102123227099003|261022115727099003|261026130827099003|261026135527099003|10067099003|261026121527099003|261026140227099003|261022113327099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261021133027099003|261028144727099003|261021135927099003|261021130227099003;
X-Microsoft-Antispam-Message-Info:
	+3tKKrIiguJAQneP1PAUFn3/vTUTkGip+A+R1q1OobdHTXbYqKplV9XMdpy+weJTeYeQ8IRXPIVEwdLjcV4B0MZlqD4WtEaMMOHQata4oxT1L+X5bn/i2h93LwavCeUR1fHe1usMUGnvg8JsY6bMxMXkectxjvG1a986FOrwNNY6ODMmwSu4IKi9fj8u8u1dGHQ2rF7ytA7i2+FyXpohLsZD6MKnKvWBzi3hTd7SZb+l5gfaZltpPPd/zDXYKg9wy7liD3kq8BahMp/QLmD6xojFVPVSuSgrZ/wTU4MkdHX8L1jOjMSDfsUDutNt7JmbqFDpWkJ2ycwd5Itri1tcBI1llstjqvqqRnf2sA/sDeXJXIYADE0W3RyQll9BGk4WhXc/ooiIm/Z+/NV2cqN5KtSHEG3mBoQwwq2dGyNjSv+wDF9ScCZWaxetqfIullg4i5DKiXjRceVLNRbmxtupssnlfPyz0k9t12MVgyjvxvYHGTmJoJuQMuG3UAMr6Bzm1yTVEqTS7FPAICCmm/HFPzYBGrw2et//4/WQf5nkq74DIJdAg/QmgBZf2MmadqUZ6MuDQrsC6zeL5bp86qffmbW3MrtkZQgkgbCtNZtgQ5B+0rh9fycztFc/wGeJSCyegrUDFPFRzbe6ppF4ayVmKvH6OjAvVNecqEXSK6k5qrs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10070799003)(18002099003)(261009223027099003)(56012099006)(261102123227099003)(261022115727099003)(261026130827099003)(261026135527099003)(10067099003)(261026121527099003)(261026140227099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261021133027099003)(261028144727099003)(261021135927099003)(261021130227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9Goenr8QjeCfz3Yl8aS+FcgWb8y+XY3G6Hl0agtp04b5zsVceeP7MmkIEDBM?=
 =?us-ascii?Q?EWngJPVUIco9LDzEiBa8ahaLOF3sVtw1VmdwMsVyQomV6t3H+P8x7NSNpnt2?=
 =?us-ascii?Q?A5yMvkmaeFtVaRwaBw6gKNAwe8kIhH1B9Om8SAHzOGOfflRMl1DL8m0doY6W?=
 =?us-ascii?Q?lm8Cbs/eGFHw+sAB0NU6NP29s0UGkejTfDlJcb4aNG9ik3SMnzYNPT6sDFKb?=
 =?us-ascii?Q?SnYfdoTsXDah/btQKvnAupj2ZttGdMsTJDkVz5iOY+Dug9/p25CHkobxETkR?=
 =?us-ascii?Q?Gjr+6h5asQcnSApOLuBoII2MlNRgaHZjI4qmvXUYdvrdO9aDYTgfcy/YoODH?=
 =?us-ascii?Q?I+iD/fKzHicLbzWRa/xOeuu3gGsI3FXRxFYq0xBWCL81UEr6rkCHsBLeHBeT?=
 =?us-ascii?Q?7piOg4BDqvAIS4pUjyLJF2czb1vEkX8jK6uZoEJSkrZQ46VBOCq7WgnkoR3q?=
 =?us-ascii?Q?8gwgIpYe6WwpYnBh7t/ahpEj/zUvXW6t9XI7x8CJfQZU5EzMYnL28XbztHHo?=
 =?us-ascii?Q?WbU4XIkf2okogyjjalIUYQyMir2xj/ZmaU1La/0D11TpMI0cy8uWFUFqeI3D?=
 =?us-ascii?Q?/GdZ363qbbWpPElw5KrKXAlj9aAdjmqQILbJUhZSyiLOHbAdhzC0jHXJ3YzB?=
 =?us-ascii?Q?u+ydJfuPj0ArUQHDBi9D3mJfXCHVRILUPkzi+KyORrImDxuHrD2VnYiBIPm7?=
 =?us-ascii?Q?3XsIBxjuyOhdxkkyAmqZAUl3p06cdDP+Y6OjycLCPF+xmMn1Lj6158XpRpCt?=
 =?us-ascii?Q?giIQd/gg0JI+K9NNjl/cKcxC8QKH3HPD41vl63rX1enmJG/VtzZJyEeBr3Sh?=
 =?us-ascii?Q?LKSE+UPoB4Gh98ElCVq93bSGolW9eFB0PhYqMaTyBSCbIhv56yMNLnFgwEOX?=
 =?us-ascii?Q?edVYQZ8n868n1o6yv67L2Iv+aXgkoEPoWViwnWFPdKqY2ZnvbicxfiYqrZ0Y?=
 =?us-ascii?Q?pMJOjSWnZkQj/cFRj75hZDv4vjJvbaGpLk/2XWtWZRBM5GRupG/1QzY04OLg?=
 =?us-ascii?Q?0o/k4I+baCvTD0tORTyD6P2Z7Zy5AUP+beZP5qwBnYMLPZ5OTyEa7s3R56uU?=
 =?us-ascii?Q?Kb5DFB48lG60YeX5WgLKKalCgtnIyU1HNXmDvXcl2JV11/cpSF9Tqpw5tf05?=
 =?us-ascii?Q?wTKX4Z3rlumuWZsl58KQ2bjQ6eYnVxsqZa2gTdGqCJM4TzPUhKCPxHls4+AF?=
 =?us-ascii?Q?iqCEhkEYefxKfxNOH1DvzJRpTHtV/xXrA/2S5PtfjW9CTX/+Z+E4Uag8ZA3v?=
 =?us-ascii?Q?Ze3CJxEbsGVERKCj71DLuybi77vUjUk4uyzMGq7uyoyy+3CxeSfv2KU4qV/r?=
 =?us-ascii?Q?3al7OrdO6wyy3TDfDS4Oykn3hRJaXyxInf4GwPLWIPOoxPR1n/d7KijaVTKE?=
 =?us-ascii?Q?rrcYRCHsFydGoUFq0xkEjCGmhh65UbGQheu+TCuGVDeESg9w3eK+a9ceGqLv?=
 =?us-ascii?Q?7BZ0EdRtVUMGBMjsTcdrEkkWsqZnqo4TvThsP1WwJR4QTAeOISukgZLNKDX1?=
 =?us-ascii?Q?x/yM+R0hntgy+z4fL9iyr2tanbhyh9ibxbfvoEeGIB3K+5/mdR3rFKU15ZAB?=
 =?us-ascii?Q?jlQz6jg84QFKXQGEuquMsZzPcbL+kLlqUPZ6iUmXEeeTFgC0eJjtt76Kdr2J?=
 =?us-ascii?Q?Be/j7aAcC6WtVZpjuEyFb+WGOZZn2Ddd1iY+ziSC6VbSRWdfkY0qVr3umVPW?=
 =?us-ascii?Q?9azeGwv9+69ECA15HOqnMhg9CCfX+eaiXzZdCYmTrWH0p5Uj+CXOe6g8MT7z?=
 =?us-ascii?Q?Hf0VuMOfUyk0hoBeKKPKAby85SkZsAAx0jm0hc2k8Ahsib6kCbJBnAmbqvw4?=
X-MS-Exchange-AntiSpam-MessageData-1: PXp5Nw4gPVc+ag==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 73462c40-4a28-44fd-7e31-08df445b6d8c
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 03:32:38.1416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvw1JV7tJkK8st+OhKqrZ0RPjoBxFSqWtjk3EKCa92KTvPebQLdWcNUqh+au8CFb6/R9KzsiutrS3Znevkrgww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB5648
X-purgate-ID: tlsNG-d25034/1794886365-51538A5B-335DB7B8/0/0
X-purgate-type: clean
X-purgate-size: 1233
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

There is no need to invalidate cache entry because we just wrote that
memory. So it is guaranteed that cache entry is valid.

But we need to clean (flush) cache line to be sure that ITS sees
command written into the memory.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Daisuke Nishimura <nishimura@valinux.co.jp>
---
(cherry picked from commit fe7142bca56b5c8c8109f581444f89ae09b7544f xen-troops)
---
 xen/arch/arm/gic-v3-its.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 325835b0ad..dc44666233 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -207,8 +207,7 @@ static int its_send_command(struct host_its *hw_its, const void *its_cmd)
 
     memcpy(hw_its->cmd_buf + writep, its_cmd, ITS_CMD_SIZE);
     if ( hw_its->flags & HOST_ITS_FLUSH_CMD_QUEUE )
-        clean_and_invalidate_dcache_va_range(hw_its->cmd_buf + writep,
-                                             ITS_CMD_SIZE);
+        clean_dcache_va_range(hw_its->cmd_buf + writep, ITS_CMD_SIZE);
     else
         dsb(ishst);
 
-- 
2.43.0


