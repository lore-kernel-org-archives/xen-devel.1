Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26510C61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 14:32:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400680.1636287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9e-00067K-2E; Thu, 27 Aug 2026 14:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400680.1636287; Thu, 27 Aug 2026 14:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9d-000670-VA; Thu, 27 Aug 2026 14:32:33 +0000
Received: by outflank-mailman (input) for mailman id 1400680;
 Thu, 27 Aug 2026 14:32:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wzb9c-0005jW-3o
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 14:32:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzb9b-009cRM-GL
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 16:32:31 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a78-bab6-0a2a0a5309dd-0a2a450ca9d8-18
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:31 +0200
Received: from [52.101.84.113]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a7f-f479-0a2a450c0019-346554711170-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:31 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB6742.eurprd03.prod.outlook.com (2603:10a6:20b:295::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 14:32:29 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 14:32:29 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fn8rMzGfE4ZLUVHQ0I2IpZZe5UKUl5UJEVo78oVJDS5FYAmqUhwAl/Jfdhh66J27gPt9lDH35ngDaHvba6MokcaSg1f+58LR1oWzdavas95yj+n41cE1Q9ASmZJup3h/8YItIcT1hdznWEk0i5cZGxoo17mLCQHMelYEaP2LDjHDZdqWEcXk/44BSMvOND49yAJX7XSZlB/7QUKXfN6j1++MFDfL+WjmvJ60JsD8xHMBA1fbeHsSjfxENheHb4sqsDRJAzXIUzLxVvIcZxqVz8cXgXYiP30V3uimfmqxRUvVnpkVxE/gt/skRJrmese/1Vos80xvaIsLUdXAa2CSJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnPckwdgpBUr+17cYI0AaPCAdJVEhHccUrVHQZ13anc=;
 b=Ypvvo1HoA5/q5hl9L17oXDuZyKC+M+GEHBO6zmHkNXggiOIXIWo55gS+sXPp3BoS39kvsiX7n5aHj1f6qNCeDd99KoGZeOhBquodJGQil5PJoi1RT8HooxbgDlKnbY9ayWHSaTl3c8tBcUzpXv8B+n8iic4IGkD2z6xLQBaMgZr/Y6/tvbV7Y1zEY5j33+Q/Qg24dA43fDDmexWkP+7dLDaZlib2x0gbwyB0LZFwL/QfxO2loYQjxadGTpfCf4M8cQWlwrfroIos8sMJHBqJ9VQNL69/NfQM6WWGAwlbKDrlyZJAc2sj/7BtB3G4e+ttPwFhogr3r4z0TQ9SGi1GVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnPckwdgpBUr+17cYI0AaPCAdJVEhHccUrVHQZ13anc=;
 b=iBpcHWBE5Lm65ugVx2tKzi7IkTC0gQ4Zs8D/WMjxOVFZOoYgT8MBx8E+4xEpjGgHFkv7aa5IStfQjnBl8yhMejjZovBgnD8y86OKsMRYyrjmVS63es6ws93rixVi3QqnUvYfN/GpaYXz1n4smGoa8RpatpRfeh7RRGx6l53l/WSxsVmjajalnzoMMqVQTZIzC4LFd03tUK0nQ2Q+SNMxLVu+RVA3wruNjMI3YJ5nFkaU7gcB/ip2wKD5rZ/1+8JLnWR+dnopdbNR91LsFxEzMQGAGylKl7BQXEhLtqxHEmRezBWfZQ35UvwNnbDl74PeCdciNcTSiSw0+6M4PSusEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jens Wiklander <jenswi@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v12 07/13] xen/arm: ffa: fix notification SRI across CPU hotplug/suspend
Date: Thu, 27 Aug 2026 17:31:55 +0300
Message-ID: <cc10888f34e887f739d66312aa871a6df4196204.1787838455.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787838455.git.mykola_kvach@epam.com>
References: <cover.1787838455.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::15) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AS8PR03MB6742:EE_
X-MS-Office365-Filtering-Correlation-Id: 635f6972-d062-43c8-e4be-08df04480617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	YTxdvptslBbperyDASZj4ZMhQxFzzBDxxcotiyaVQhr1mCLt3MuHXRgCK0JIZV01IyJ2CDqSln76kST/cZTaS2CZKBJ/t4AjIKXXbwY9t2913JFvtwMHIXnIXitFiPFm/JQ7wRZKmRSCP3A0owUUt0YBdUKgzG6vFD25qD9RI0wk4ZiioQh8gRgi36PXSHeNz1DDt1Zy5jDeeCGVkKS1+ltHrr3TF+7WkePUcXiQYkYlD02bLfHYhQKsBo4sKH13r9lQybV7NBJNAQl0yD+DUhMVop7oHak/b6RD1kg9Fr+tHJp+4Xk/MA6e8MS9nDL/BNrhi2/fivD6cWVn2ANLcNii3fdOBzgtAyhbP/jKscvPuBSFLVEv4FdZZ90XVNy9A6g/OmUxojlVYLuePTFgRTI1omnwFGTpu25aPSWFEPnO44narNsl18oxdNaNLJ3BeLRes7CEgxZvljjLlLNyOAN9ySZ396upkOysqkSRQP744nkQmm7KjcouDy6H2qqnkG4MDh6L77Ra5KehxZxDhxB54OIzyO8O7OvvE4pvoVUySxvactlM20NINsutJYh2P5W1MlU9QILNT00YL0RUf5zk+Sf853664PwWl5h1FZKyFC5xmnnkD8kQscjBIumBqpJHDXSt73+75vfKpiV1UCgksNFApwt2gjF049ZKRtg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?84dF9ur3RfK7p6uyW3uUg2b8/lQCqtaZBn/VmjJzU39hPVMWYkcNpFq4nOz1?=
 =?us-ascii?Q?Q5AY27KmjyijsQihZojjnNG7ezavH5I3WRAjNM0AdM8X+hvM/UDlfAVMJ7s0?=
 =?us-ascii?Q?7HXWCVOLtuGnTA98kBPfpiJAsJzhH1XZDqyC4ZqFtGND1MLv14m8Fa+tgS0q?=
 =?us-ascii?Q?t+75YpVfnO9+3PjqyiNCdqgEb4epnIkmLiX3NTxexe0aaEKs99mARcJvrwMT?=
 =?us-ascii?Q?F2Q1SejyVWWLwUGLHVpTa2sZnMC4F978xVfp6Eb2VsHND/gq0lIr0QzU/54w?=
 =?us-ascii?Q?oQ5JgH7qrsz/uV7YquMY+kyt8CsV6w8R99ODG395QP93S/ooqEhAH4MhF3v9?=
 =?us-ascii?Q?YX8mKPoyvwU9LVxniAWllmATKAma3SGOl9xEIsv9cdcPMgBuCmJJElGUbL9v?=
 =?us-ascii?Q?e0fNFSKI/HjYm0Jiu9XyTjD4SLwr85jPSYIwPlGExKAhoCCzjRsE+ESi+rn7?=
 =?us-ascii?Q?TFg6gsrqM6BmRXeez4t0k/jWzHq9tqSKbdlW66YLkMRfzXYw2d+S9I/Zum2x?=
 =?us-ascii?Q?Bj2YVjR/CJ3yKsaF6millApJFlmrXELyrbqt+TwjijGEcz64v090B3DG7VZq?=
 =?us-ascii?Q?eKsZjpUKY92wAHOPF8UY940UR+TnS6qiWwLDGvQj0qFYD89NCCspzC9FUg8D?=
 =?us-ascii?Q?29FkQ6V8nWoJQtYHs40U+guj/3aHhAgVM6RGEeVZnBfJjGPepSNsO6TDze4j?=
 =?us-ascii?Q?I7oNpZ3STT3DEBLgj2JyWuGTSXFwoMbHnpVQSolBMrfyFEDYodf23W5K11zC?=
 =?us-ascii?Q?UFqXJ46ID0QwcfBb5+9nX94dtOGWq1913GPMOSPkVNZD6akYIcc2hCmqVnkD?=
 =?us-ascii?Q?J4BvXWxryriD4pRDYJMnB9UBQy513a1OAOUuDYel3BDclDXpzOVVBZlU8jT3?=
 =?us-ascii?Q?Da5BoMQ2GTG+kMezgc75zgAAOJ1IDgAcnUqIEos1C93F73cO5+cw7rqwY70e?=
 =?us-ascii?Q?wPTauDVVrNWpQPG501uv4kaQrS0SjC+zxcxTc/JU++215dYpfMkuVlMFSNjD?=
 =?us-ascii?Q?WoympmBawApi7/bAWTQjFJUvPtM4U8QNahF1CpCwX2nKrLtEpJYhzGUQ2uQ6?=
 =?us-ascii?Q?3ab10zX/a7BcdUpoC8XmwWcxYWX0Rd+QWaln94cs3DOxYs+ZZdiRjHTnH+EZ?=
 =?us-ascii?Q?Fxddt1YQCFAmsDW2U4dsPcwY7w3+96Bud7/FEDT5+ohXNTu7xDnc32szo/M0?=
 =?us-ascii?Q?5qU33nDeUE+LcPVcUPuSRARpExQDzcPfvO5XQBJOXUtR6vu4lv3kU+gIA1EY?=
 =?us-ascii?Q?3UFjswcQPmuyJbxFBi2bumrs3ATGk0Hm3m61yO84f0bS+Zr7Ws3uJ/wvNMeR?=
 =?us-ascii?Q?mj3nLCTs/Xd6woGqCT3TWDzQgWqfGM6wXD1HhfFflwiTnM0hb+LLaCmvSP/E?=
 =?us-ascii?Q?K4xZMwd96A5FE073kIAGb5EoqqH/QCtcuKOIcVLS8hT3Ee6MYVWzuTDW8DhB?=
 =?us-ascii?Q?dzFk4R4Rp4B8S3wRWFADfLb5N0W6ubgNZMvUni3Tap8zJSJHquI42s0nSoEw?=
 =?us-ascii?Q?K/0v1TOXcMCads8aeqoXiFD/YD/FzC6XhXbezxSgUSXjds0OQsILvZv6789W?=
 =?us-ascii?Q?ON/JlJOuI075WnuREnFMfOF/gSAPiRBUq9lPZ9wg5h4byD4oBwPYtCRzPJhU?=
 =?us-ascii?Q?oNy2P9rFb960aLcHTeptjvyV+vi0yRtha0j6xT6bkSL1rlaYeGl6YOVsQIDc?=
 =?us-ascii?Q?45nF1J6wApO2xrNvbQDCoB1OC31sH3Itn0FnOpPeplo7iNBAxcUThFZVJOgg?=
 =?us-ascii?Q?rifIbZOZKA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 635f6972-d062-43c8-e4be-08df04480617
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 14:32:29.7852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7hrGfMHFvG02mSF/lrmphulIlH2F8a4IRaCIvH0oM8oqiYA/e1e8hhDfjOYjbgGers83Eh4RGRflFVP02NZeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6742
X-purgate-ID: tlsNG-d25034/1787841151-50B3DA5B-A687D26B/0/0
X-purgate-type: clean
X-purgate-size: 3654

The FF-A notification SRI interrupt handler was not correctly tied to
CPU hotplug and suspend/resume. As a result, CPUs going offline and
back online could end up with stale or missing handlers, breaking
delivery of FF-A notifications.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa_notif.c | 63 ++++++++++++++++++++++++++++--------
 1 file changed, 50 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index 186e726412..513c399594 100644
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
+    sri_action->free_on_release = 0;
+
+    ret = setup_irq(notif_sri_irq, 0, sri_action);
+    if ( ret )
+        printk(XENLOG_ERR "ffa: setup_irq irq %u failed: error %d\n",
+               notif_sri_irq, ret);
 
+    return ret;
+}
+
+void ffa_notif_init_interrupt(void)
+{
     if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI )
     {
         /*
@@ -376,14 +394,36 @@ void ffa_notif_init_interrupt(void)
          * pending, while the SPMC in the secure world will not notice that
          * the interrupt was lost.
          */
-        ret = request_irq(notif_sri_irq, 0, notif_irq_handler, "FF-A notif",
-                          NULL);
-        if ( ret )
-            printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\n",
-                   notif_sri_irq, ret);
+        request_sri_irq();
     }
 }
 
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
+        break;
+    }
+
+    return NOTIFY_DONE;
+}
+
+static struct notifier_block cpu_ffa_notif_nfb = {
+    .notifier_call = cpu_ffa_notif_callback,
+};
+
 void ffa_notif_init(void)
 {
     const struct arm_smccc_1_2_regs arg = {
@@ -392,7 +432,6 @@ void ffa_notif_init(void)
     };
     struct arm_smccc_1_2_regs resp;
     unsigned int irq;
-    int ret;
 
     /* Only enable fw notification if all ABIs we need are supported */
     if ( ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_CREATE) &&
@@ -408,13 +447,11 @@ void ffa_notif_init(void)
         notif_sri_irq = irq;
         if ( irq >= NR_GIC_SGI )
             irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
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
2.43.0


