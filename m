Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74740606A320
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 21:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=DZacm/pM
Received: from list by lists.xenproject.org with outflank-mailman.1462579.1673605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNK-0006a4-N9; Tue, 27 Oct 2026 21:06:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462579.1673605; Tue, 27 Oct 2026 21:06:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNK-0006ZD-GX; Tue, 27 Oct 2026 21:06:30 +0000
Received: by outflank-mailman (input) for mailman id 1462579;
 Tue, 27 Oct 2026 21:06:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xLoNI-0005xw-89
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 21:06:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLoNH-005OFk-KL
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 22:06:27 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11235-bab6-0a2a0a5309dd-0a2a4509d276-28
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:27 +0100
Received: from [40.107.130.136]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11253-be1a-0a2a45090019-286b82882d1a-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:27 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by PAVPR03MB9573.eurprd03.prod.outlook.com
 (2603:10a6:102:302::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Tue, 27 Oct
 2026 21:06:25 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 21:06:25 +0000
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
 b=SthwZoA+WXgTF4EabfrpjryhAm3eLNwGsjO0FPTKDKOCflwBauPFeqOou2MVwLb6t1e9m/yjhDh21RX6C+K1vMjj4nCu46TdPICyADzFBtZxufNWTq9MmiCC2r1rTY1De/m2hoVETKvGn0W+2C/FrJVdaJU3JLQ5lJsPQqg6/AYCvbsLz/jQIPVjuAj9i8LzxPQmkIy2nCawMvX2sOtCugwsiVfGbr2+uP4pW9zopNRDSVRGSkvRRm5JTLWWZRaf7SHQ0FCKJhOafPTldKPM33ZfkBgrSi5c1Q/NIgUjLxnhN032m4SJzvlGv/AO/yTirXLtOiOZDC+6qwI0HurFuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Et0H87hEBuDsVwPppgKnBp8dGaGZd5gonKbZ69I+lA=;
 b=kN8/6OXNmxpoxFnTI9ATTL9QA4He+oUT9eAP9HMP2nKwF2eWqHhX4Wi3jGcJbg6gH8ho/EHKF/Ey4keKsPieoQ2hSgI8gsasxm3cXP0puv/Cg/iAnR9Bemikd6HPNh15xkdXEKXYF5tMZyJYRRaHXAz2qYYv6PnBUTSFftcJfmmJEljCy5x46Kf/9Tan/COiVSF0o36KzjbjnlmTwxjiPCed30L06opxmtxFKqw93+pyz6V3i/HS8sf4cguLreQaop6iBE1P/LCOhSVIzLTNH6vt6imS2ZBmk9XhD0sKUf7JOjRHQM8veP+/OZwfnQKOpA0mm8lXzKZot4DU+qU1XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Et0H87hEBuDsVwPppgKnBp8dGaGZd5gonKbZ69I+lA=;
 b=DZacm/pMILoh0PCsWna9v5Y8+FtaTvh/ExSGye8aoJ/W6iWTpru89pHwiunEfMDcG2cyKGGstfCEkrOl640r2Dy1EP1hdoufi5oFFDhPmpb3RW6plGoSHz7OWTOttlUBVtUMcYk2FJe4pgnIj4El9+6j8N0Jl7KY5E7tiJbu5bQ1RMgXJUPPUBnk/R6Eg0fKtQOVC1LuWwkI/c4niqqFjWAxsgg6m5N4dhUv2lXeWIfOKei8ocydahI17NyKZwt2TECraTE4N3zkmtqBlyMJRm4KecQ/V10bfxWOYxwhiNVV0mLatp4rBqh6ZRzIxX+blaoc/ugwmYL5QXfYThTcgA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jens Wiklander <jenswi@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v13 08/14] xen/arm: ffa: fix notification SRI across CPU hotplug/suspend
Date: Tue, 27 Oct 2026 23:05:57 +0200
Message-ID: <4ed322025f241009d8c099369e6be39fce35a669.1793129971.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: 16faceb4-1dea-4624-87b9-08df346e296f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261026121527099003|11063799006|56012099006|261009223027099003|261021123027099003|261021121427099003|261022105027099003|22082099003|18002099003|10067099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	rtMKOT2z5hr9yfT+zQfaWF4f237dA5cn8MNAHLW4L7S/2ZIXQIGtaX7ngNzMkVIq66GCNyg9yM1o1aKQlXgS8FIo9bUqqLHjaoA/xh5A0Crvg4RO5+v2d8xqPVPnqtfr8eaSOxRCSS1zNyAYIU2K7JYqlPFEeZgXdqZrP/1IbSyT8SZMpNubKGKhe1GXI6CKa6uoTTv29ecgXCXx0D0FxxW/qrRudERqGuVbSQ75B026QjmICKGPh15YXuOOTs/j27XYiefPMPpWzW3HeFQiIl20xH2SJSCb6qIrc/6P8BmFNccbvAomfwS/98V++j/+gp3ca/Geo0A6iAd5I/sS0GpCoqcB+jBqnrYbW3O+rYC+4QRuJ9hIMze/eRJt9TPlpwyVk2dNi47MuKb5bqmAJ2Umu+E52lbcj8EQO+b1TUs9UwNmi0P5Q56CDB0zXa8vn2tX5ThvpOc7CsLdgfKuNyZGZNFI94xoNgFM2uAs++QD78/uoU6VRvG9Pgi9BjAHv+irArjr7CizPXKKreTOOXdsc+tDYBRrA3ce0wrxEW/tR8OCXOWld9aii0tXFCFL11MJnH16zuC5s5uEKCDYTbyKC4yNRRJFg1gRCT7uibCNHWrDumIbLVeyBFN+VM59nGs+fAzbGDhH/xd3MTDkyl+cVWsvGh0fwvAOX0fJ57Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261026121527099003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(261022105027099003)(22082099003)(18002099003)(10067099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ji4OEmZCcrfzyhH6Omo8ssnbQOdemisJE8wfdvjZxyGxlqitZWkVRz9lBnzd?=
 =?us-ascii?Q?gKtdvwOMb9+l3F+dIeedypNFRCN5Ip3lYwXvRyOw88WZwtVSDPZxX14NAZ2K?=
 =?us-ascii?Q?SywmQk72XcpizWop0Qi0mj/YkZE09EENKEG/3t1Z7HzG5VD5JAq7jhUx7NLZ?=
 =?us-ascii?Q?/kX7/YzHrHuOmgDL8MWoebFjkKl7b0N8DocJf1+PhRO/nocz3Z1DE4WUjucV?=
 =?us-ascii?Q?h260iGyv9qfiCXSibAZnoZc+x0qCmdkreJ4Ag6dNr1g1+YBfrAH/VZkOKukb?=
 =?us-ascii?Q?nDeWYmYKrCT9bTqYaaefsb3lGzVCptoSc8acLD+5tXTEPZ7usFXfjf2fqLwa?=
 =?us-ascii?Q?C28Yj/H2SoAHxyYluxENVCFZwd1RnxztV1cZAxQ1w0SB2TgK5wjCJpA9eyEE?=
 =?us-ascii?Q?595TVXhVxLR5w9fjmoet71JkN0vtu9RhZeJqNb+Aip7g/1bDw313u/VPe7aL?=
 =?us-ascii?Q?/Z1hBnXPal9/LwikACovvaSpiOGLHZVClP6kyM6N0DWm6t9VcEmMAUFFJpDo?=
 =?us-ascii?Q?4WaqzLI9Yt31MpXSL1UMg2mkrMPdp5Xvw6iFGS4k3BYgmmG4yXrobN5G81gb?=
 =?us-ascii?Q?s31mJrucKOv01+AwF0vvIQ9ybj68xAAWoKML+LRMXndGvF9Bui9nqfVI+FX4?=
 =?us-ascii?Q?hEtibtFhgd13oI967EVKxuFMo2NVmhemuI5ezSRROAAWT4BQx/rZ9XggC2He?=
 =?us-ascii?Q?m8+ZAu9eKR7bOTafJzuouUMGybhA/+9xHOsH84iueOn+XvlqIqbbJ0nmhaHx?=
 =?us-ascii?Q?ARIsVPmK3kqY2SvdQYZ57OzrjD+RzUp0kqqyWRbjFbLpJCSZRyEfYbz69RlX?=
 =?us-ascii?Q?/maVKubAz4tqT5ZE4y4koN0G0kPtNfmFZOaHFjckUBZjpTkPr0EehopKNv0N?=
 =?us-ascii?Q?kgNegyr4UpR/lRNIjthkkTMhnq9NvwVGOaVZvrZyqlogFOHez/Hc8jDpcqiE?=
 =?us-ascii?Q?7hc6+qnyk3CMdA+mESNo3qPzDFHBpfj/ob919Z8l4Vs02dfFrX2WmF+qFSRf?=
 =?us-ascii?Q?Wr5qM9tuvEYjwiEUmNZezP6RMLuy+4vkCszFf15kcVHKR+tlX9QgYUZnoRDg?=
 =?us-ascii?Q?dUybLR4k508d6peGHFeGX/eBGtLzjedxouIQQJv0G1d3g6CzKpMkQfqCB+UR?=
 =?us-ascii?Q?7r8fN3DvW7rlmfIJ9gO6qvf+SEeTlY8ub1n2PqV3SrwRW69DPjPwcRw1I4nM?=
 =?us-ascii?Q?vZYT/VyYiAdBhrc9/v288+mWdSxTgpiLa3tXCiktdCN7SLxxHz8wazTlGHUn?=
 =?us-ascii?Q?tQqmfMUPSeKP0bl6g//o03rGnFiQM2to4UjBNsW76bziIey7uouEyBjTVr89?=
 =?us-ascii?Q?4on4hbz3PwBF17YDdlH+vxzK5hlwzNYkz7kz1Re3XvIUvG1kjevkQwL+Wl2m?=
 =?us-ascii?Q?nxZKM5aW2hqiRAKIzdN3OyDxioImQe2s0Ubt4CtkrxgsuwHKHHV12CBvppaH?=
 =?us-ascii?Q?1222w6M59YCoF3eQqtBfAohiXcujZmZ1zfbD07DMovIE5R7J+Sf6wShC7CFU?=
 =?us-ascii?Q?om5rWxljfQkEuY4+9vHpewdm6aL19Y6j96UnmhazMvV3FQjX2Dn9/ATlfmuA?=
 =?us-ascii?Q?TtIlwg5Z1Jv+L0FQsnXNdC+tZJCXkw48HgEYihtY6x+qrXrl08ZF3/ZMNfm7?=
 =?us-ascii?Q?W/OzujnmZX2j4GPwsAcCER+KZ+sbKKP9Ccu86WIdg12vikPC8VLDkkMC+zfz?=
 =?us-ascii?Q?t8BJlalq+Ps/QlPeZSL579LMQkPz1yB1dQjtAfLiAk5m/hyFgS5Y+Lc04XMC?=
 =?us-ascii?Q?Sq6sx1Gl4w=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16faceb4-1dea-4624-87b9-08df346e296f
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 21:06:25.6972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4jJczvET56amPGzhu/26zUUgtYA251oCCcKVy5CiiqD+uoCLQ7HyeRc/fSqlnFOelQGBlyYZFh2MHz0yQIjnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9573
X-purgate-ID: tlsNG-bad1c0/1793135187-BEEDE034-89904F3B/0/0
X-purgate-type: clean
X-purgate-size: 3727
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The FF-A notification SRI interrupt handler was not correctly tied to
CPU hotplug and suspend/resume. As a result, CPUs going offline and
back online could end up with stale or missing handlers, breaking
delivery of FF-A notifications.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in V13:
- Use false for free_on_release (MISRA Rule 10.3). No functional change.
- Explicitly discard request_sri_irq()'s result on secondary CPUs. The
  helper logs errors, preserving the existing behavior (MISRA Rule 17.7).
  No functional change.
- Explain why the notifier ignores other CPU events (MISRA Rule 16.4). No
  functional change.
---
 xen/arch/arm/tee/ffa_notif.c | 63 +++++++++++++++++++++++++++++-------
 1 file changed, 51 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index c64bc39f03..1ec455d2ad 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -360,10 +360,28 @@ static int32_t ffa_notification_bitmap_destroy(uint16_t vm_id)
     return ffa_simple_call(FFA_NOTIFICATION_BITMAP_DESTROY, vm_id, 0, 0, 0);
 }
 
-void ffa_notif_init_interrupt(void)
+static DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, sri_irq);
+
+static int request_sri_irq(void)
 {
     int ret;
+    struct irqaction *sri_action = &this_cpu(sri_irq);
+
+    sri_action->name = "FF-A notif";
+    sri_action->handler = notif_irq_handler;
+    sri_action->dev_id = NULL;
+    sri_action->free_on_release = false;
+
+    ret = setup_irq(notif_sri_irq, 0, sri_action);
+    if ( ret )
+        printk(XENLOG_ERR "ffa: setup_irq irq %u failed: error %d\n",
+               notif_sri_irq, ret);
+
+    return ret;
+}
 
+void ffa_notif_init_interrupt(void)
+{
     if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI )
     {
         /*
@@ -376,14 +394,37 @@ void ffa_notif_init_interrupt(void)
          * pending, while the SPMC in the secure world will not notice that
          * the interrupt was lost.
          */
-        ret = request_irq(notif_sri_irq, 0, notif_irq_handler, "FF-A notif",
-                          NULL);
-        if ( ret )
-            printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\n",
-                   notif_sri_irq, ret);
+        (void)request_sri_irq();
+    }
+}
+
+static void deinit_ffa_notif_interrupt(void)
+{
+    if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI )
+        release_irq(notif_sri_irq, NULL);
+}
+
+static int cpu_ffa_notif_callback(struct notifier_block *nfb,
+                                  unsigned long action,
+                                  void *hcpu)
+{
+    switch ( action )
+    {
+    case CPU_DYING:
+        deinit_ffa_notif_interrupt();
+        break;
+    default:
+        /* Ignore other CPU events. */
+        break;
     }
+
+    return NOTIFY_DONE;
 }
 
+static struct notifier_block cpu_ffa_notif_nfb = {
+    .notifier_call = cpu_ffa_notif_callback,
+};
+
 void ffa_notif_init(void)
 {
     const struct arm_smccc_1_2_regs arg = {
@@ -416,13 +457,11 @@ void ffa_notif_init(void)
                 return;
             }
         }
-        ret = request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL);
-        if ( ret )
-        {
-            printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\n",
-                   irq, ret);
+
+        if ( request_sri_irq() )
             return;
-        }
+
+        register_cpu_notifier(&cpu_ffa_notif_nfb);
         fw_notif_enabled = true;
     }
 }
-- 
2.53.0


