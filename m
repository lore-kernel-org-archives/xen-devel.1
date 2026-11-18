Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C917B606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 02:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=NudK3fv1
Received: from list by lists.xenproject.org with outflank-mailman.1493603.1693508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTVDO-0007E4-SD; Wed, 18 Nov 2026 02:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493603.1693508; Wed, 18 Nov 2026 02:16:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTVDO-0007Dx-Oy; Wed, 18 Nov 2026 02:16:02 +0000
Received: by outflank-mailman (input) for mailman id 1493603;
 Wed, 18 Nov 2026 02:16:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nishimura@valinux.co.jp>) id 1xTVDN-0007Dq-Ig
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 02:16:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTVDM-00H53Q-QW
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 03:16:00 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nishimura@valinux.co.jp>)
 id 6afd0a3c-bab6-0a2a0a5309dd-0a2a45088886-28
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 03:15:59 +0100
Received: from [52.101.228.130]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nishimura@valinux.co.jp>)
 id 6afd0a5c-f659-0a2a45080019-3465e482deb8-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 03:15:58 +0100
Received: from TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:15b::9)
 by OSZP286MB1942.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 02:15:54 +0000
Received: from TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 ([fe80::1150:c5cb:d781:8147]) by TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 ([fe80::1150:c5cb:d781:8147%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 02:15:52 +0000
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
 b=jMA1O1ljqLgZRCQPD8sDw4NKCKiBiLhQvayjSw52DfvF/OloodOHNcDCGkOL3SUMn846IE+FBjfjUIkIHII2bloS7lDry7hryt+Lg64h2aYitnmIYByAYaIjoSm5bVge618zasgv6ls3hSbmE8CiB7skeawAU+eNKnIu9Zkt3FgciByS8C6JT2Dtn8xWM5S2EO7uD/bHxUWYrloOj/I2IcpFaflJy7kuadXa39OWPO6GEAVPsnYXrZZboQGRof8KRu4LOydmGHBjQoFj8RW4MTTwhEblz1wza0xBvToSNu6MEJrfFXnCpzpKD/osAVGjrgGwd3GwrCJf/o8v8SuRzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovnKkosMrB1fv38MrxAM4+qRimsuEdr04aS/41OUSjE=;
 b=FmMjZKY5D0eZJf/otlbBIv+SM93Wbj5fTk6NZflhCdqg0GXQn/l03ptHqbjSTyH22YIfLSrODBKysJ3f+/iXEfVoDqKjdgAu/frHRq35i2piFd/8WbvHQiPXZSqnGy/w+1rtR5g+ky0Uy6fG1otWRa0RamK0GJ+ha4ipHebRZnfs/alE8WPoUHHT/qfpKVl6yvPniDgitH//eLjl5z3wgjXRcdIVWbsfi/Zb9XRkiEOkKo/7/yPqqrRKbLxHcLfoSXPgZVTVm8GlLeTMKWoGla3uHTeHPIG4Y9GAT2ka3AZe770RgjQjkQe6PacyVRBUviC70hiXB7ud3MO/vNR7Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovnKkosMrB1fv38MrxAM4+qRimsuEdr04aS/41OUSjE=;
 b=NudK3fv1096qYREHfJKyrnO0qhzr9atSekzHz6NmehA7wXJC83x77YTnJoSi75uw5CAhBDM4snJupRtxl5w7kMyF3BtVokfQJIvR8QbSEPduQPCeGsWEmJOvD6RbHxhmQzyKvLiVNeiA4g//dQBA8yXsO/+v0wVOhp83ImVuqeg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Daisuke Nishimura <nishimura@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Daisuke Nishimura <nishimura@valinux.co.jp>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: its: only clean cache when sending ITS command
Date: Wed, 18 Nov 2026 11:15:29 +0900
Message-ID: <20261118021530.231927-1-nishimura@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117033217.184625-1-nishimura@valinux.co.jp>
References: <20261117033217.184625-1-nishimura@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0070.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::12) To TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:15b::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2019:EE_|OSZP286MB1942:EE_
X-MS-Office365-Filtering-Correlation-Id: 16d02608-2ae4-4e6e-1e74-08df4519dea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|23010399003|366016|18002099003|22082099003|261009223027099003|261026135527099003|56012099006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261022115727099003|261021121427099003|261022105027099003|261026130827099003|261022075727099003|261021133027099003|261021130227099003|261022113327099003|261021123027099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	UI5aSBd7g7NeN4UFlcajOiUuJ0ywDcweO2WOU/5ZALaFFVg7k9kzsKEd9o3XJAMWGzaPwabljk5sDvlsHwElEPSZYXW5d5rX1tEYJ/5/rs2KLHqSJAUAy7Fqvk1iFbwrXRd1/rvMVwnaVa6BjdtS6dLNYf6xp3ZYw9fUi50madOvL+WyPHCD0Gqg4bMod0EObVPG/2D1tzIDviO5XF0g6dFjk4HTQRhaEnOL0l+HErle3q9RKIuxDe4OTizCOQFwalmbZrurs38Onlxc+O/e0tP34riij9OAYJCMEHuvcVahhzYBnVx1BQhrT+AVxw+UU4WgG358+VlMtHu036hpUFoKsgB1B6i7iSDGUM6KfL7jbLTSNhoVAsLvLeT3/KGcDjQIjgZpe4KaPBtiOlVaBmVx8r+Qfv9p4LDChMoZsV/RnQXtk/j3AQTuZL9MMGZ74ost42cuxpbXZ5H3J8Tn7UVYWR4czaEFtfVaiszrJMUQX9l8afqDNP0BAi7x0Eb+10cPGu1TvScSKSPMQC6P4X6ZRnGpzQXjx3uwqYKLo3ut1qEra7p8Ho/8sX2va94BXR+ZoxZQtub9Jm82dwtnkju3We3Ll0fDyiLKe6qzGJiAfeEOwxhawvEdcl/TV/bez/tMHIrcssugrqGbN/OtF+Nl1HA7hIUZpUIUujytNuc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(261026135527099003)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022115727099003)(261021121427099003)(261022105027099003)(261026130827099003)(261022075727099003)(261021133027099003)(261021130227099003)(261022113327099003)(261021123027099003)(261021135927099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b/y9WfU6VvOiZ71mpECFuhy1cQAtgtQCTVMcjkiuLet+Oo60ZIDmX6po1dDs?=
 =?us-ascii?Q?AcXYpJqk2Q2SR3vnb5O22FZnqwUqUDN3pOdZY1F1q/8F7DUonjTTD15x2MEP?=
 =?us-ascii?Q?oK6+wseuyKd4FzY1siOaUPR5TZui26bfYHLYpybbLdEQItbhh+yDA6AHEI3M?=
 =?us-ascii?Q?gqGPPHWmVw2fz1Xo31KmyAtEy3FNileHs+mXwgvyLEILqYyTlH8vIjw5Vb+v?=
 =?us-ascii?Q?TR5B1M1s/LS5BcAHCKJ4UeppcChFL77sy5oo/H99RFw7gxLyLis0Rz+93/io?=
 =?us-ascii?Q?Eqr/5jb+PqBPawH6kfBl7cIu+AlSLMp+z80OmaHxfp5j4ZezsnsB5RBzbOXR?=
 =?us-ascii?Q?rH79CAEOz7elE9z1uJ9WvIufyJqxn9H8ZlI3jLOBbtz7U1IAQLQ2LJeB2iRJ?=
 =?us-ascii?Q?aEbwklVT0UI/GXbfVpx9SUo5MJLtTFG+SjXd0+kMZV4r6pv5q5ZF98yKMuTP?=
 =?us-ascii?Q?HaeXrVVdrGyN84PzhE0C495qRHnWejQFo36BcjxkXBHzwWNiLfo/kfdB3aHB?=
 =?us-ascii?Q?Fl8132Si6dljC98uIAo0/BWaq7UzNBf9P36jctbOsFgM6dXFW5jEqEvehBGn?=
 =?us-ascii?Q?j3tY8cwjgxxiqS4oC2+Qx1Z8EqyZy9gWG3l1FiSBP7elhmnw5za/tjtcKlQK?=
 =?us-ascii?Q?kWQ7nD59GZMbmT4z7fxH9W3T9BctiCUkD8I8k9FK1dAE+6QgJFuhxxSX/Gi4?=
 =?us-ascii?Q?uAHthag1OcLNNSA+H+aZbd2oWSjkJTEU6SUvzMuZFgEu2xNc8tyi6eg5Xoj+?=
 =?us-ascii?Q?YStMlkCrd+TEaNp9I3tGfc/fksGlIdBtTMYoY9WxxF7Glcd8/J0oeSJbhRf1?=
 =?us-ascii?Q?1qoCZPBT9z4EuetZjYgftA6K4y3WKGkzB7pfg2RPeEJFTAGxIA5VY0KGRoAA?=
 =?us-ascii?Q?J1CsE0Z/azzum+GxB67EqUt4woxReZkYjGhS9ElxPptD4QgmjY5zAjGx3jb5?=
 =?us-ascii?Q?bZwjD3mkOmH0NTiPNDV5ig4IENchA/OEb2dLpgc2UWvLLPwExnUuBdLv0Llw?=
 =?us-ascii?Q?x9wNhaAlbuhbupNWraRWNpOLemMm+FpOC/ZS4KV+l13BtzZ4FH3xJQhVsU8h?=
 =?us-ascii?Q?z7ts0SDVygMNK0H0Gml9DsUlz4ZfCDwk9cxKde0QZbJU4r4hvbsGlQWxxpbO?=
 =?us-ascii?Q?7q6d58UkxSwXjTBS2qjAhOfPYs+FDAiR/0HRicXr761nfyjxF6DWlPZx0TPI?=
 =?us-ascii?Q?gwd9P4PQ4lv3ssVfHm9+EEd4Loqa3Ds0kmzrUk80h7afoAMrH5UZtUMkLNLP?=
 =?us-ascii?Q?zkLA+5ZlzyRwoy97TuY+y0QgHiAWGJ04cF1FJJmCz+tDi/8wfNp3wkWYQdg/?=
 =?us-ascii?Q?lDY7K8ME2E6/8Cpngq8FqQ21XwcowYxw5Bou8h8XPhcRHEDNPcSMRxFKhlWp?=
 =?us-ascii?Q?N8V6r5+CnL9fdUe9cTOidSILjXZyRIoGWK0JKwTPBvUMIqq/YJ7fTaDWRoda?=
 =?us-ascii?Q?ZTibXW79tLfhARJtV38Bt9WaCRrS/jy8slYIafiLXZgC6mxeUwUEj9c2Tsjr?=
 =?us-ascii?Q?2PqjmpzL99kuHNNKJaTBGtP16SEGSj0BktFOS7Eh5hLvgDHGqrQRC+zFbsg/?=
 =?us-ascii?Q?3YKgg8QZyPbiSjvy1cBK2wKd6Ww+k0frTdPYibVca4IyVqFhMW4ehrksH3vi?=
 =?us-ascii?Q?XX5NUhhVQyRtmoVCVmhoRv7/WWGSB4K/dfIBqSLAV3cpnTIeLftyVLc2d1YN?=
 =?us-ascii?Q?tYvCRXrYb7ArtKtXXAhO1wXK6ERr5YR1tKirEyr821tJg4WNOFujcYqD1p7S?=
 =?us-ascii?Q?tKx6gJNntvi+lwDw710OhYRtBxRbahF+730F03lVyYUWFI9GxkKuYElWVhBZ?=
X-MS-Exchange-AntiSpam-MessageData-1: YnghILQPudFQyA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d02608-2ae4-4e6e-1e74-08df4519dea3
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 02:15:52.2496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ka0jAdxFHd9eELV4S0y4t6QSlc4TJ31YoIWmJXS5S566F6v0pn2G2xnT8CC0/B5kY2pXpx+lvyXkiyZjeXFobg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB1942
X-purgate-ID: tlsNG-c1860d/1794968159-CCB7187B-3AB2617C/0/0
X-purgate-type: clean
X-purgate-size: 1387
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

There is no need to invalidate the cache entry because the CPU is the only
writer and the ITS is the only reader of this buffer, so it is guaranteed
that the cached data cannot be stale.

However, we still need to clean the cache line to be sure that ITS sees
the command written into memory.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Daisuke Nishimura <nishimura@valinux.co.jp>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
(cherry picked from commit fe7142bca56b5c8c8109f581444f89ae09b7544f xen-troops)

v2: Update the commit message.
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


