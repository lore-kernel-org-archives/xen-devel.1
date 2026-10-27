Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28312606A31F
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 21:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=ld5hQz/4
Received: from list by lists.xenproject.org with outflank-mailman.1462576.1673577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNH-0005sV-Ij; Tue, 27 Oct 2026 21:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462576.1673577; Tue, 27 Oct 2026 21:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNH-0005sM-Ey; Tue, 27 Oct 2026 21:06:27 +0000
Received: by outflank-mailman (input) for mailman id 1462576;
 Tue, 27 Oct 2026 21:06:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xLoNF-0005ZP-PD
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 21:06:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLoNF-0005yu-6G
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 22:06:25 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11235-e002-0a2a0a5209dd-0a2a4506a068-10
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:25 +0100
Received: from [52.101.72.137]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11250-195a-0a2a45060019-346548894169-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:25 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by PAVPR03MB9573.eurprd03.prod.outlook.com
 (2603:10a6:102:302::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Tue, 27 Oct
 2026 21:06:23 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 21:06:23 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uj3M1Nr15jfBhNlUXlZcT/hHY+hH+1qAm7OYeIQlgdOxJ/DDzlZCCMZ636ark1ZPD8fQ3PWWIYSDEDpsxOeobvxeb6x7FPW8JI4deare2wxVl4/cP4rfLeyI32JmsOjqZPzQYksPKtMWm+LVQLUxbn7ZiFy2sAOKJVa7l/nJORRoBRIUYRQbT8CeVhSH6BTgm7juI7VOZqgxwoNEss6vMSvmELOFquKp899/Qu0DUQQ9xJOji9/3WTrgttwxFGSjI9QDjI4J0c++1Np7cpeM8+Ed+e5Zq8h8eXqQUIAp9oHvH/XFaNTsehMSsktT6I5anEJprG7/M8p9EGIz02cVzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMlcH0m+z/nxinRLh1GdlU1E0fMbGxX0okLxzqtnYz0=;
 b=EqyGatJ+K68akSN3ztrrLgSWvXdBWFCj8lu9dAYISwdYeKK7x4eToCi2ZVaA4UApY4uO1wj3xd3NVjoVND4enMndWnIRACFwgUz8lanwinEHFbtUgV2JeNoCi5mojUOAOEU1OMEzTkIY5gDYaBDbx2VRzL5NJSdNTf8bsGfKgZTWrUXcmCuuuzIKCCt3rIM+FlTirbaOd/M3plVExV4eMdFQyUQ46Dmq1O7o48r7GfxDZLw5RfAk4d/VHOVDswjpwkG4TAZ2ae5wE/taNT8SES5qicZT27ZDw1zrvHq/wDLbX9+Lj7U7ozyDOaLnciWQJvuXnlI6Kkn4J1aS82Zhtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMlcH0m+z/nxinRLh1GdlU1E0fMbGxX0okLxzqtnYz0=;
 b=ld5hQz/4OpDiSYglpYdlfUmU7TBghSpu2AjhpUtetLQ3H4K4n6rd/TXcS+a5U8puPtEGsmOvJqDnH+L7l28QqUz+f+0EDYtVf7pYAp2q15CaHQy0bYzo+z+FNsMO+ipAzJapFy1sfe8/f6K6hfMFvJv0xjjTw144vpJU2dBoAb8WKXY3oUQ/iJfPAxUP8CbGv9oAHFnKkqB/j6wb8gAVXZyKCqc8rGLYYs06juMvfZ4iQWseoS9PS6DU3yXCZ1bU5jFo4Z267qy/Fo7knM2GVDuTR3rGC/TSR1+QWvl8NMRv9BoyH30dtrT3djIQTAO6VbCKVgfZF1P9oFIauuaWmg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v13 06/14] xen/arm: gic-v3: add ITS suspend/resume support
Date: Tue, 27 Oct 2026 23:05:55 +0200
Message-ID: <02f04c5c50f87acbbb4d180f2f1dcacae60eadbd.1793129971.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793129971.git.mykola_kvach@epam.com>
References: <cover.1793129971.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0223.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::6) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|PAVPR03MB9573:EE_
X-MS-Office365-Filtering-Correlation-Id: 731656b3-f3ee-4a7a-7026-08df346e27d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|261026121527099003|260925021311599003|261022075727099003|260925021911599003|11063799006|56012099006|261009223027099003|261021135927099003|260925022911599003|261021123027099003|261021121427099003|261022105027099003|22082099003|18002099003|10067099003|3023799007|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	wKN0ZeMnUCDkqUjnTj6+glItLyTU51Ps+xxushBe/ZcleTpbOSP5SuRzh5YbZIZjuqz3o3OYSz0IciERd1tRXBSMIBAiJSv73A1fWXyg371T0pJnBG4Aw+mc7dKT0EAbxZ5d5k72FtdgvhgFTez+eXFMluSz4CNJAENJl+mowOiEOymr+A3a9ljqfDevxpkj3LpKbL/nqzoeS6FZF3WKOdm+YGAFSt5TxMKcFC2Tb4SCAXSt8DtTmMJvtLRViM6cWzNATGLkrWZn+HBXanigzoJsNMK+X+pPM5YVMUbwdXQQZJABSF8P6G4OdjSC99G5sOwjugJ2do1GnBsmbGyeFFccwNEAxCLGde64hONU7olwHwKHKhKAPwc6LFFcMVG5gWwPY91TX1WBH6Jg5VUWVYfCxU/kAvOsELtpJoWbmvEbdfGExQwy48tlMLqw6BUJUw4wT3MmhsW2WfdJFPB1GqEfaxZDtucHdvOz1bvvh2TWvcj3EyqPIBEyo8KJLWQQkIKveG5kEOALk0ayNYJ4jlvKOixSdb0WpRDrZzNPdZcmbmIQreFnEMPtqOvAXMt92MxOmRueWPyvkTlV0rjrzMyLKg9mbw7jNUhJwX3Oc538fg8sh6NvGqdI0MOryGcx2sAoyln6E4whPlsSdi8kWiCB86a5Q95nmL8qGb4VOKI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(261026121527099003)(260925021311599003)(261022075727099003)(260925021911599003)(11063799006)(56012099006)(261009223027099003)(261021135927099003)(260925022911599003)(261021123027099003)(261021121427099003)(261022105027099003)(22082099003)(18002099003)(10067099003)(3023799007)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q0TAZ6OZ3TfQCGfc6eoPCm41hCjy5S8yqt+Bzoke6OPE07MPfqG7wv6G4m2I?=
 =?us-ascii?Q?84FWyquxtfQptStWsIA2nUjcwBv+J+UUW0OKcdkpOPDkjsx6D4DUhalsleS1?=
 =?us-ascii?Q?uBP81wXMt4l5NNdafvcN8A0C3QacaemVIC9yhCUjcWcoRoU9t8SVqAFO1pGd?=
 =?us-ascii?Q?67TM7Mg9RfwjymWJ0xqNWiFKk/gEmVifJNkCTtYicTjGMdDh8sZ1SgZNlo+h?=
 =?us-ascii?Q?7aSb7FfYM63jH5GRSFNta5tMjTMssM0nGQ4H2c49NKxDH/RzvGpBjGL0XNOf?=
 =?us-ascii?Q?osjJNGk4ebMW+s/zierrTnUvZDTf3sNGkjfoZK3h8y+blTIGoAiiuagja5Mp?=
 =?us-ascii?Q?GT5/BLYyos0LG0X10eE2iuh38GQVPc4CcorBYCu0AJhjFv5ry4IS8KAfdbkr?=
 =?us-ascii?Q?nmcSApVjIFsMpeqE+jYIz3cw76rNT/6gZfe4y8BVu7K+HcnpOKZDfrfS9+h+?=
 =?us-ascii?Q?FtE38TWZKjPUoXJtN3KCVUbSMAauiby+v0Q65yiEPA0RPr3f3lVK/wM2taW7?=
 =?us-ascii?Q?iyNdCQrHJfP717HcF8tky1XNU+eIYfnMaXHk1xwIhT+enTOVsg3pzvSTlSRR?=
 =?us-ascii?Q?1etUkiMkcvl0a3zYLVumYXzGTxYcdqcNoV20pd+wyG9+p8iKoz0iwSsgnHc8?=
 =?us-ascii?Q?HnE9oLDXYcWfUskdQCba9RJtvGnHq33/TQhxSrNd0xiiEJKCjXf8vDblUoMU?=
 =?us-ascii?Q?hrc7NAkqy3rdSWcgvmg4/1ewUa49dypI6vtqOmqxpDOR4VV5C/LTZIuMQedL?=
 =?us-ascii?Q?IS6+webrlsyRfEojfi/cxgXFA++CZbDlAXj/R0e+bg302QtnP08D4/i52ulA?=
 =?us-ascii?Q?BxiIhXpiJXcCWcposPFzaTl28039A+H9rjeYn7bZl5iw4JylX1+eRHGtzZg2?=
 =?us-ascii?Q?LZb5khwKixh5GTipXwQagsnvtKQMfYJV7eD4O6IRLHceBN/Lk1vyDcEzCY73?=
 =?us-ascii?Q?E5iKvsDRVmqQcFYzGJsa1HOgT2+Ts7F5rQzExObIW3PiYtFG5/W/76hwrRPZ?=
 =?us-ascii?Q?zx8vlEt+XfRJDGZLa1P9fCKRKCK1MNoOhWRJRtwqFgwaxUhJW3axuNwGMSzJ?=
 =?us-ascii?Q?GuHymnSLwRe+BhEckU+0Ai6g9VDIQXPvtU0EuMCfJhCTi9QDsBZlVjjewbZz?=
 =?us-ascii?Q?oVwVKGCxrJelCnzfHlJqslZopyu1P0KzoEYnQvDTkgLOEEnLhRr8fvuVSHli?=
 =?us-ascii?Q?F79t1UshKG6wGnDAEONWe7WEkwW4ILkvxTd908iNZ0Wmcfvlwj0kCbbj0AQL?=
 =?us-ascii?Q?71B3hX67stHLS8XGcbG8tXVpeNXnOJ//SRofDVeTRj5cGqc+LIMVXvWqLxkj?=
 =?us-ascii?Q?kpbtikauuDo5vDR+l+SLBD5zvqu/o7d7/tDCB1VRJrTygqk6x6KO5xozvWm4?=
 =?us-ascii?Q?am/jzeFtEZQ58PmIECfPIZoF9g/daHDjGaOu8gJaqXmmAOVaW3Ezwp906cW6?=
 =?us-ascii?Q?nt+C7mq4jHdCpY+tM0RpznBnXF2kl4KkHIeIZBEZ4iWnc7YzgTGD1StgA9kD?=
 =?us-ascii?Q?kY23ZwsGHLHKxyo7Wxas2BHxBjdRGzzZyVHJPStN0iNQBHXDt+CTi28ny5/p?=
 =?us-ascii?Q?jjLDKlgCI2jzKCvdTwjryO9jpv6/fHfbAjxSAFlD+RkcVoYO2CtfeBk3Ujpl?=
 =?us-ascii?Q?PNQl6y/zQYCyw29L6HK6HB2f+ndMU9C4gjLl5xygkhFjIwXrN1i3S+kHF2ns?=
 =?us-ascii?Q?w2NEw+IdHLq0lBa0zBIwxPEZYaZvgEq4xVuBZyESE9dsGu4BtSb/UCVXIlD/?=
 =?us-ascii?Q?Lre9SHJ+Fg=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 731656b3-f3ee-4a7a-7026-08df346e27d1
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 21:06:23.0219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6qm7FwHhH1qziLYvAGqgOiYZbIwCd/ozChGNykI8BRF1c8BjZ7K5d0DpxOpufe34TtXC8O+13IS1HQRhCdzBlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9573
X-purgate-ID: tlsNG-16d1c6/1793135185-F72C677B-5E3BB557/0/0
X-purgate-type: clean
X-purgate-size: 11279
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Handle system suspend/resume for GICv3 with an ITS present so LPIs keep
working after firmware powers the GIC down.

Save and restore the ITS CTLR, CBASER and BASER registers. On resume,
re-establish the collection mapping only when the collection is held in
the ITS itself. Memory-backed collections are restored through the
restored GITS_BASER tables and must not be remapped unconditionally.

Add list_for_each_entry_continue_reverse() in list.h for the ITS suspend
error path that needs to roll back partially saved state.

Based on Linux commit dba0bc7b76dc:
"irqchip/gic-v3-its: Add ability to save/restore ITS state".
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com> # Arm code
---
Changes in V13:
- Cast GITS_CTLR_QUIESCENT to uint32_t before inverting the mask, so the
  operation matches the 32-bit CTLR value (MISRA Rule 10.3). No functional
  change.

Changes in V10:
- Replay MAPC on resume only for collections held in the ITS itself, as
  indicated by GITS_TYPER.HCC. Memory-backed collections are restored
  through GITS_BASER and are no longer remapped unconditionally.
- Make the current Xen col_id == cpu assumption explicit in the ITS
  resume path.
- Use "unpredictable" instead of "undefined" in the CBASER/BASER restore
  comment.

Changes in V9:
- fix the ITS suspend/resume coding-style nits;
- preserve the saved GITS_CTLR state while masking the read-only
  QUIESCENT bit.

Changes in V8:
- Reword the CBASER/CWRITER comment to match Xen and drop the stale Linux
  cmd_write reference.
- Clarify the list_for_each_entry_continue_reverse() comment.
- Factor out per-ITS helpers for collection setup and resume.
- Restore each ITS and re-establish its collection mapping in the same
  loop, so a failed ITS resume is not followed by MAPC/SYNC on that
  un-restored instance.
- panic in case when resume of an ITS failed
- cleanup baser cache during suspend
---
 xen/arch/arm/gic-v3-its.c             | 146 ++++++++++++++++++++++++--
 xen/arch/arm/gic-v3.c                 |  13 +++
 xen/arch/arm/include/asm/gic_v3_its.h |  28 +++++
 xen/include/xen/list.h                |  14 +++
 4 files changed, 192 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index f44ee21293..f214a52ad4 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -375,6 +375,22 @@ static int its_send_cmd_inv(struct host_its *its,
     return its_send_command(its, cmd);
 }
 
+static int gicv3_its_setup_collection_single(struct host_its *its,
+                                             unsigned int cpu)
+{
+    int ret;
+
+    ret = its_send_cmd_mapc(its, cpu, cpu);
+    if ( ret )
+        return ret;
+
+    ret = its_send_cmd_sync(its, cpu);
+    if ( ret )
+        return ret;
+
+    return gicv3_its_wait_commands(its);
+}
+
 /* Set up the (1:1) collection mapping for the given host CPU. */
 int gicv3_its_setup_collection(unsigned int cpu)
 {
@@ -383,15 +399,7 @@ int gicv3_its_setup_collection(unsigned int cpu)
 
     list_for_each_entry(its, &host_its_list, entry)
     {
-        ret = its_send_cmd_mapc(its, cpu, cpu);
-        if ( ret )
-            return ret;
-
-        ret = its_send_cmd_sync(its, cpu);
-        if ( ret )
-            return ret;
-
-        ret = gicv3_its_wait_commands(its);
+        ret = gicv3_its_setup_collection_single(its, cpu);
         if ( ret )
             return ret;
     }
@@ -1276,6 +1284,126 @@ int __init gicv3_its_init(unsigned int host_lpi_bits)
     return 0;
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+int gicv3_its_suspend(void)
+{
+    struct host_its *its;
+    int ret;
+
+    list_for_each_entry( its, &host_its_list, entry )
+    {
+        unsigned int i;
+        void __iomem *base = its->its_base;
+
+        /*
+         * By the time Xen reaches gic_suspend(), every domain is already in
+         * SHUTDOWN_suspend, so ITS-targeting interrupt sources are expected
+         * to have been quiesced by the owning OS before SYSTEM_SUSPEND.
+         */
+        /* Preserve saved GITS_CTLR state, excluding read-only QUIESCENT. */
+        its->suspend_ctx.ctlr = readl_relaxed(base + GITS_CTLR) &
+                                ~(uint32_t)GITS_CTLR_QUIESCENT;
+        ret = gicv3_disable_its(its);
+        if ( ret )
+        {
+            writel_relaxed(its->suspend_ctx.ctlr, base + GITS_CTLR);
+            goto err;
+        }
+
+        its->suspend_ctx.cbaser = readq_relaxed(base + GITS_CBASER);
+
+        for ( i = 0; i < GITS_BASER_NR_REGS; i++ )
+        {
+            uint64_t baser = readq_relaxed(base + GITS_BASER0 + i * 8);
+
+            its->suspend_ctx.baser[i] = 0;
+
+            if ( !(baser & GITS_VALID_BIT) )
+                continue;
+
+            its->suspend_ctx.baser[i] = baser;
+        }
+    }
+
+    return 0;
+
+ err:
+    list_for_each_entry_continue_reverse( its, &host_its_list, entry )
+        writel_relaxed(its->suspend_ctx.ctlr, its->its_base + GITS_CTLR);
+
+    return ret;
+}
+
+static int gicv3_its_resume_single(struct host_its *its, unsigned int cpu)
+{
+    void __iomem *base = its->its_base;
+    unsigned int i;
+    int ret;
+    uint64_t typer;
+    unsigned int col_id = cpu; /* Xen currently uses col_id == cpu. */
+
+    /*
+     * Make sure that the ITS is disabled. If it fails to quiesce,
+     * don't restore it since writing to CBASER or BASER<n>
+     * registers is unpredictable according to the GIC v3 ITS
+     * Specification.
+     */
+    WARN_ON(readl_relaxed(base + GITS_CTLR) & GITS_CTLR_ENABLE);
+    ret = gicv3_disable_its(its);
+    if ( ret )
+        return ret;
+
+    writeq_relaxed(its->suspend_ctx.cbaser, base + GITS_CBASER);
+
+    /*
+     * Writing CBASER resets CREADR to 0, so reset CWRITER to
+     * keep the command queue pointers aligned.
+     */
+    writeq_relaxed(0, base + GITS_CWRITER);
+
+    /* Restore GITS_BASER from the value cache. */
+    for ( i = 0; i < GITS_BASER_NR_REGS; i++ )
+    {
+        uint64_t baser = its->suspend_ctx.baser[i];
+
+        if ( !(baser & GITS_VALID_BIT) )
+            continue;
+
+        writeq_relaxed(baser, base + GITS_BASER0 + i * 8);
+    }
+
+    writel_relaxed(its->suspend_ctx.ctlr, base + GITS_CTLR);
+
+    typer = readq_relaxed(base + GITS_TYPER);
+
+    /*
+     * Only collections with IDs below HCC are held in the ITS itself
+     * and lose their state across an ITS reset/power loss. Memory-backed
+     * collections are restored by restoring GITS_BASER and must not be
+     * remapped here.
+     */
+    if ( col_id < GITS_TYPER_HCC(typer) )
+        return gicv3_its_setup_collection_single(its, cpu);
+
+    return 0;
+}
+
+void gicv3_its_resume(void)
+{
+    struct host_its *its;
+    unsigned int cpu = smp_processor_id();
+    int ret;
+
+    list_for_each_entry( its, &host_its_list, entry )
+    {
+        ret = gicv3_its_resume_single(its, cpu);
+        if ( ret )
+            panic("GICv3: ITS@%"PRIpaddr": failed to restore during resume: %d\n",
+                   its->addr, ret);
+    }
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index a653c5d14b..2708926929 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -2241,6 +2241,10 @@ static int gicv3_suspend(void)
 
     gicv3_disable_interface();
 
+    ret = gicv3_its_suspend();
+    if ( ret )
+        goto out_enable_iface;
+
     ret = gicv3_disable_redist();
     if ( ret )
     {
@@ -2289,6 +2293,13 @@ static int gicv3_suspend(void)
 #endif
 
     return 0;
+
+ out_enable_iface:
+    gicv3_hyp_enable(true);
+    WRITE_SYSREG(gicv3_ctx.cpu.grpen, ICC_IGRPEN1_EL1);
+    isb();
+
+    return ret;
 }
 
 static void gicv3_resume(void)
@@ -2406,6 +2417,8 @@ static void gicv3_resume(void)
 
     gicv3_redist_wait_for_rwp();
 
+    gicv3_its_resume();
+
     WRITE_SYSREG(gicv3_ctx.cpu.sre_el2, ICC_SRE_EL2);
     isb();
 
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
index edc002f187..cb730b3845 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -43,6 +43,11 @@
 #define GITS_CTLR_QUIESCENT             BIT(31, UL)
 #define GITS_CTLR_ENABLE                BIT(0, UL)
 
+#define GITS_TYPER_HCC_SHIFT            24
+#define GITS_TYPER_HCC_MASK             0xffUL
+#define GITS_TYPER_HCC(r)               (((r) >> GITS_TYPER_HCC_SHIFT) & \
+                                                 GITS_TYPER_HCC_MASK)
+
 #define GITS_TYPER_PTA                  BIT(19, UL)
 #define GITS_TYPER_DEVIDS_SHIFT         13
 #define GITS_TYPER_DEVIDS_MASK          (0x1fUL << GITS_TYPER_DEVIDS_SHIFT)
@@ -135,6 +140,13 @@ struct host_its {
      */
     uint32_t quirk_flags;
     unsigned int flags;
+#ifdef CONFIG_SYSTEM_SUSPEND
+    struct suspend_ctx {
+        uint32_t ctlr;
+        uint64_t cbaser;
+        uint64_t baser[GITS_BASER_NR_REGS];
+    } suspend_ctx;
+#endif
 };
 
 /* Map a collection for this host CPU to each host ITS. */
@@ -211,6 +223,11 @@ uint64_t gicv3_mem_get_cacheability(uint32_t flags);
 uint64_t gicv3_mem_get_shareability(uint32_t flags);
 unsigned int gicv3_mem_get_alloc_flags(uint32_t flags);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+int gicv3_its_suspend(void);
+void gicv3_its_resume(void);
+#endif
+
 #else
 
 #ifdef CONFIG_ACPI
@@ -273,6 +290,17 @@ static inline int gicv3_its_make_hwdom_dt_nodes(const struct domain *d,
     return 0;
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+static inline int gicv3_its_suspend(void)
+{
+    return 0;
+}
+
+static inline void gicv3_its_resume(void)
+{
+}
+#endif
+
 #endif /* CONFIG_HAS_ITS */
 
 #endif
diff --git a/xen/include/xen/list.h b/xen/include/xen/list.h
index 98d8482dab..2aab274157 100644
--- a/xen/include/xen/list.h
+++ b/xen/include/xen/list.h
@@ -535,6 +535,20 @@ static inline void list_splice_init(struct list_head *list,
          &(pos)->member != (head);                                        \
          (pos) = list_entry((pos)->member.next, typeof(*(pos)), member))
 
+/**
+ * list_for_each_entry_continue_reverse - iterate backwards from the given point
+ * @pos:    the type * to use as a loop cursor.
+ * @head:   the head for your list.
+ * @member: the name of the list_head within the struct.
+ *
+ * Iterate over list of given type backwards, starting from the element previous
+ * to the current one in list order.
+ */
+#define list_for_each_entry_continue_reverse(pos, head, member)           \
+    for ((pos) = list_entry((pos)->member.prev, typeof(*(pos)), member);  \
+         &(pos)->member != (head);                                        \
+         (pos) = list_entry((pos)->member.prev, typeof(*(pos)), member))
+
 /**
  * list_for_each_entry_from - iterate over list of given type from the
  *                            current point
-- 
2.53.0


