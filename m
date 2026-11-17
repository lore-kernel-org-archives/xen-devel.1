Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17A4606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 02:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=YPfKJ5NZ
Received: from list by lists.xenproject.org with outflank-mailman.1491837.1692538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT9CY-0008MG-C6; Tue, 17 Nov 2026 02:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491837.1692538; Tue, 17 Nov 2026 02:45:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT9CY-0008M9-8t; Tue, 17 Nov 2026 02:45:42 +0000
Received: by outflank-mailman (input) for mailman id 1491837;
 Tue, 17 Nov 2026 02:45:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nishimura@valinux.co.jp>) id 1xT9CW-0008M3-DL
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 02:45:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xT9CV-00Dsqn-8d
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 03:45:39 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nishimura@valinux.co.jp>)
 id 6afbbf3e-bab6-0a2a0a5309dd-0a2a4501d95a-36
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 03:45:39 +0100
Received: from [52.101.228.88]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nishimura@valinux.co.jp>)
 id 6afbbfd0-5984-0a2a45010019-3465e458a2b2-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 03:45:38 +0100
Received: from TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:15b::9)
 by OS9P286MB7485.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:44b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 02:45:33 +0000
Received: from TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 ([fe80::1150:c5cb:d781:8147]) by TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 ([fe80::1150:c5cb:d781:8147%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 02:45:33 +0000
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
 b=n3G5HWeydnOWALEUULzKoRP5/PydsqL0lyDjruif/IjK1MlzdJlZ+v4KeOngim3Me2U0DEZDV+yugAShy3q2F56j2gkxf34BRJFLVxqdeFDD2bQHB6Wrdg1+t7GOhNmJhJcseuWpyEGlPwLPed+9IyDOIOHBpK2CzBPVEhMIxRVu3eQwvYH7AEmtAx0rVWbbf9HvfdZiQcWzRmFxu63YWNqFboRdfTBUYG3IZLpOfR6UcI1wDYRgy4VVRSUGzi8VNgyIgguJh5wfpcWfkjmXN5140LGj748kB2dY/wB0dLfbuRQM/Mu3autCi4kZOc4HEScjHzheqvwaS6iO8Z0t9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUkaIR8pKv4my8MY7xVlAEOZZmOyCA9V00WbhJSGHSU=;
 b=TPwppj0Fk8TCw8xnWOwas3QhPEvPgddA/lv+y/mBVPgTuxJ10wM1DMkwjS/vMeXT1o/tB3g5lJJu1DNG9p5PLqBFROJd18E9cNhkb0GyXEgHn6Jyo/+Rh4CAx9bgbMvjsQ4PfEz+jHWXjpmmzbhugaD7iPGwKkJLJW3aOnynHKBjStA6jzkVDLCZK6QQIUk2zq+Wd69cCnY6Iri96NtjbpcgWYWassbuo1b/XKcHAysTYxFCZGdSg0ajGp60HMjlkMJI3ZUV/4nvLaGvXbBh2s4u93p6fwDD2ZWhxXJ8U3gsUM2HcM1ZGZI3XgnkC3F6YuOv6s/iLd2Kzu1Ojb5gQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUkaIR8pKv4my8MY7xVlAEOZZmOyCA9V00WbhJSGHSU=;
 b=YPfKJ5NZ0wnkbI7KUIujRJjmeAG8S+KC+5+tNatyP5zNwcDFqlhXIPZ9ljb+cYm089IP6nVyKCaRRMudIrrFHaZd4jtx6GCJRp3fpuL48Yd4Z1XOfwYrYxwbE7oqzwKArO0eveKwO1pSWAAl4gdC+q+INl8IBzDw/V4ywKLDH/Y=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Daisuke Nishimura <nishimura@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Daisuke Nishimura <nishimura@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: its: only clean cache when sending ITS command
Date: Tue, 17 Nov 2026 11:45:18 +0900
Message-ID: <20261117024519.183260-1-nishimura@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0249.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::7) To TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:15b::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2019:EE_|OS9P286MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e51ff71-3b7a-4ed0-181c-08df4454da0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10070799003|18002099003|261009223027099003|56012099006|10067099003|261102123227099003|261021123027099003|261028144727099003|261021133027099003|261026140227099003|261026130827099003|261026121527099003|261026135527099003|261022075727099003|261022113327099003|261022115727099003|261021135927099003|261021130227099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	xFtrwExiCt9Br5DyEsCSMpjTeKMwIOHvgU8jCvZ0WB8lfGOaSxYKlSUDfEZmcjugqx7H1ItcB2Pn3fDkwtbOuAr+am0aqkXNyfBvarhZMkk9pWpxo1z3easeMC38T+z6vUkPhLeQb1F3nz+e4ewjMAPbK82YlgYFmAdL2c+X3UHIyWR7v6Gl70hoNb5FJYzlYv1YyVmBU7aVorGxrpN2cugsBrGa2xRe34b9UgooUVIWeSG5QgU+udLSMsu06tob/1zdzj+hu1hE/t2KdwC0V9ulFFo324a/zH/mxSmBlVLq5XderP04WLU6XACYZPab1SaM52jb9VbNLcMhLyPgvZlefZE2u/9IexTysnrBCUcVFSYV9K9lEOakiNAIELoZoMIxusiFmCIcWEeoa2k2BWm1+ZEDg6CEqKzZQ9j/FJxcYpRkrrHBwsOXbTUcijbWJr1L0G5Fp+r/5XONZvVUgmyNG91MEQVy5SFQbZov+raNq6UvO2ww4GaQz5TVqtjmdy7STxU1r2zRnGqaHTcFx7V/VeS7KAH+JITQinXJN4OAXbBr/dbu7yjZgsrulpRFKzRzKEJQV6BuwyfSNbKK7nvGi1glCRKfdZQuOXStgCSjoIK5ATUGVg3uWGlj8TsT5XrXAruayKN1/davVPFE2o5gRChoNvPbYYToLiK8364=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10070799003)(18002099003)(261009223027099003)(56012099006)(10067099003)(261102123227099003)(261021123027099003)(261028144727099003)(261021133027099003)(261026140227099003)(261026130827099003)(261026121527099003)(261026135527099003)(261022075727099003)(261022113327099003)(261022115727099003)(261021135927099003)(261021130227099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iyFCbZWrxTL3hGcE+br/AadOkqV/0kk0VN01mgnvh+a8+GYEqvly0+kxR0cz?=
 =?us-ascii?Q?hdYqoBsBJSQcTkVcncUJSMoHkvDxZfBcH+xHnafSwJThVNYkiSUrHjjEhgwu?=
 =?us-ascii?Q?86xrSeHvQshb+unLOUz7UUueTfnGKFyLvM328SKi51/WY9EMygqY0vV804OC?=
 =?us-ascii?Q?Zk7dM/oaPGlgRJSzZlNyCI6QW+m3hsL7dADR+QU7vW3OVlyWfRqi57Hrq9s1?=
 =?us-ascii?Q?mirQtOT66EbELypUGkI3U68jhgCbX4xy/NMIWHaB2Exies3yh10wnPMRBnGR?=
 =?us-ascii?Q?tQt2qIEc6lp2ykz+xhQZ2NYH5T5SmZQKdq88zmlPZhrh50gXt9PSDqU9TNnz?=
 =?us-ascii?Q?AzQcwF90kIWVOrB1Q28HqP6NpoVIpNCfIV4/1UhbhDQk5JDnJ4btKAog1Obm?=
 =?us-ascii?Q?HyCbAOA794a/FhoCCgLOy1VA2gg9L9lcfbkguRlAXE9fyV85D5DlCPLIx7G+?=
 =?us-ascii?Q?fUwlKgl22AjaZnjXOfDzLRZU8pGLvvSgangR7gjqmQyOdslI+e7ruaAk8TO6?=
 =?us-ascii?Q?kE8eODK10rJ36bqkhZfJpB/7ZKzcxDMt5wLm8tmrrD++Kp3xAwzKmY2cNwNK?=
 =?us-ascii?Q?lJywzyaGrlVLJi55aaAZiDxQQ0k726P4nB1SzJ1ZEFKe8UCgVsGTjJQgsEXE?=
 =?us-ascii?Q?JWMydsyUMqfs2fz/0ZFHqKVndpQ7eDF/3bwQUeCddhuhqnglnGFcott6EWuh?=
 =?us-ascii?Q?onc2LZHBX7obkmY9H8Xg8qi1/Vuo+Kv5l3aFxCl2X1d3MgLDVgHJQ8isf0vj?=
 =?us-ascii?Q?gcdIptrQanBrG49IH/yNH6BYLOP3CHuCZ6Q+jq1DQ5/yX6rNRBGvcFyP/qHu?=
 =?us-ascii?Q?pV9n0EQPvobd82UsHcFL2PCNcpqJgP2hdY7iWDPv6p+9Qdsg4IDW67P0LRlC?=
 =?us-ascii?Q?oKWOGAD3+mfW29H6cRntIYqG7ir5loAjScCK9cUujBtTktcy1fB0O9WBhJ4s?=
 =?us-ascii?Q?6WuQnkCgirOgb51M6Cb8vsFXXDymE/0aPTjCnPhoTkWg5ITJwMScQaZvaMP/?=
 =?us-ascii?Q?haUbCLMRAGWYD9LSyMf3USG7ZJLIuGqVrFjPCLOWOQFwyP99LFQI/adhLa1T?=
 =?us-ascii?Q?PAsZeyQAwJ1b6zQTPQSM4S+l2XGxseNB3Xk0sbKE3LabBkEIGIB9GI0aZBid?=
 =?us-ascii?Q?KSDkP2V3GcyweUfBrmtIN7XTT9JaJrgbHFQRcxGLrWsHrcoSF1F1X8qN3l3o?=
 =?us-ascii?Q?VlF5ZEuXf1hs7WaLU5q5lrLcUejhPIyG2zQZHP8AuQA0j5nejLNgCBS55cuv?=
 =?us-ascii?Q?jgecw757+UfaPPqHDAicHBCGug1zQ5Y06bSyq0R7fxLAOv7/4NBFK76TkHvQ?=
 =?us-ascii?Q?TX3FCAVB69YidCw7xLcXcFx3IAq2J/6UVh4t0kYuvAKPPuszRYdg1coWV8u/?=
 =?us-ascii?Q?cKHwtrktcbU2mafG9FeCBd6a5ut2E0zAOP4d6XuJcYpf0+5ZryKj1umwN8Kl?=
 =?us-ascii?Q?YfanucFNGSCzaSQV5Kwg61bGb4f6eg05Qt16SiyCJq8ejhSZ67nkjFFo645r?=
 =?us-ascii?Q?Ny3ciVjJ2Gxtb43YPdFkYJ5Ss8LR79rS5b1tY0C/Q+klYLd8+supORF6/MO2?=
 =?us-ascii?Q?8Mw0r07X7d/evQw3zAImqLSEz2rmKraXlhtNah80D9l2DGl3ncUpGlWnrlIq?=
 =?us-ascii?Q?f9zS5kkkm0LVM6L7nS2wSj566CbhWcOpCl4IFr0DIvUzobtjW496h0kDIylQ?=
 =?us-ascii?Q?XA4tSinpHf2e6eqj0HIxHl3afkq1TDj0KzO8DFWYxN6H8lvsb/43gtZLyRl3?=
 =?us-ascii?Q?OtMUg7w6p8VbDqwttCeXF18guk46KZehVZjxStCrqdiWVotQiUrcRVuGLIFn?=
X-MS-Exchange-AntiSpam-MessageData-1: CwPeMNCY6G1IJQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e51ff71-3b7a-4ed0-181c-08df4454da0f
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 02:45:33.6929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hWu/IX4aLv63h5lxbqiwgp+mNPl/vktvm2icIkclxT7+qA58K9hWNS4+UfGBKC8/2qYd5GRsyS4zK7XCUkCHpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB7485
X-purgate-ID: tlsNG-d62444/1794883539-1EA66757-5CC210DE/0/0
X-purgate-type: clean
X-purgate-size: 1289
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

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


