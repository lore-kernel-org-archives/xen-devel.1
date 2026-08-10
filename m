Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0FDC5B567
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 19:42:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387809.1629032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtVso-0007so-Bu; Mon, 10 Aug 2026 19:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387809.1629032; Mon, 10 Aug 2026 19:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtVso-0007sh-8z; Mon, 10 Aug 2026 19:42:02 +0000
Received: by outflank-mailman (input) for mailman id 1387809;
 Mon, 10 Aug 2026 19:42:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wtVsn-0007sb-Jh
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 19:42:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtVsm-000bnd-EF
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 21:42:00 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a7a2982-8faa-0a2a0a5109dd-0a2a45049c04-6
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 21:42:00 +0200
Received: from [52.101.70.87]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a7a2988-b57f-0a2a45040019-3465465768d9-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 21:42:00 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB6901.eurprd03.prod.outlook.com (2603:10a6:20b:29e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 19:41:55 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 19:41:55 +0000
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
 b=DyRoJ0slfhLhBnD/C01HVwB1Amckmscdtnld0bBqdZUPM4Jd/NOsk6Mx0/mDCe3OaYtxwzYVM4oZ9wK4sEInPdcqLNyv0Grt2ixgF52mCW2Kfcen1ZMXNLqStoIsCvC6vMhldIsu6OAqKnhXlpHHTqlFx+7KJ1Pg4N5/EPxyL65dTBnirMPFglCf6j0wWiTGCif1RAQgbjbL0sf+d2THxCSqkxPrflXOMv2Fyc6adR5NynZ60pYKn2yNKcNhmkvxscLXiRhnmYH2sHVB03wjatg5cif2IszxfA8tU5ghma57QonxSPeHOTOaNdhlhwlehYy2eIWLRDKBNjdTFcAJxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LP5CLyeqsdAsHC0O/sJbyotX1Vuz1Ex1qdpiNH22STg=;
 b=Y+YbO3f/VE15piHY6niaa4TTfTNdGvOInKLunk9Uj8mmkjYTIrub2o5U693SY/pLoj4S3pp9sIjlV48n1a/qP0WFLM7/OkA+YbSzvqk/4P/7I2ITkRZgZEA5wqF3FfM2Sd+Rlt78HJRHEwuV2HZhmMNMcKPnv+ftpeFTW7gxALEHGFhrgZc+AY+lZxBgSxqayZW9mOf0FCFrB8G7cp9hp61vARd6n6woNDNGkVg78UwcJ5oWtOQ/IDH0Zg+89I9tz6wQF5c1y70CVqNM0N8So7JCs/23LAWJUjFZVTBnv2kJXNM696a9mMflAta1hK1UU3YpkyqkYIfNCyPOCPWNRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LP5CLyeqsdAsHC0O/sJbyotX1Vuz1Ex1qdpiNH22STg=;
 b=Zj1FrnnlqpW+C51VCWKJqpdFY3PrLNsi6DFRur7EPRh8O9+F8nc8kj9GjzbyW2iiiTN9cUC61KdwZF6PAnp0uQLANuxKR9d1OCbUfsfWPbdBVCcaEsTDHp8CFIZ0brU4FLTL0pX9qbBQObH78U2mL6wIWIGEFSoJJ/Naj0ezp8w5UZF6vSSmJi6xcXFg41H/fTZE+CW+vAEH6D/HXxWKbJDHKrDher6Nq+zsufw6C5lmEUMnzLDX4iqc3Im9uGlyDAtiKvpJ1mpOcxSKISNMfFx35Eb0eO29Al5Ra2UEJGvhSLUCM2DNnjCOChmeDu4saaSJaeD5D5x3XPGfy0bOcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: propagate secondary GIC initialization failures
Date: Mon, 10 Aug 2026 22:41:46 +0300
Message-ID: <58b886c992ea72210bb2f32afc392b458efe02f2.1786389451.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::28) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AS8PR03MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: d2149e82-dcc5-4920-b7b8-08def7176ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	XDEoBbYfVDE92b4IKB+Y6ZvhzR5ZFgDwzgQ31TFj+4sP95qhZ02ngzxbGwgAhTMDdDYOw2liFHRlicM++P1xkFRcBIukMhsjiiOvBIGjX19RqA+bwnGEVHfRR21ksFFgPsRfCb0ton+1W6fIpNz4xZ90zIPe3NKs6YNaFTxNefddbL0mZZaLVxQRO/fOtcJxpjF6twTMEG9m7Zpg4oLOkyB8Lt70oFyoYIo9b7rEF0SCHMS1hpkE2igy9xmKnLmv+3HnsVQa6yfFEVIA+xTvKIeCr0/BipA0epgCx6NvfVpT+2jVgQZk5zt4v2bb4NvelL5MhrqBoHcoYnek/ol0Ja17vOEQe6CHQqq5WEm5WKUufp0U/bXBwe2q6NI/9hpJAB6qYomx1uHFnZaS/lawb8jSHooLdF7NKyNOVc0fRftW5meFaS6GY2ETRZt1GDmXX4WTN4AxrqTT9HWUDuKcCeH0SkMSFWZPS/+I3fD4vyi2n7Q8AKAUpEfIlW5gzM1Bq0YwXUgzd2y7xV4YUmnNzFM39tRFsU72USHZv5ZCDxC2F1jcIpK6rpo5u9yvcCEtndgkSCYhcYnhB3MeOrMPhEv2q4ty6hqe/jaty4GXjk4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S4/HplGdZu1sGamQb3PJAAuKXHwm7XuPrJb8miFEejizCZzZjpejMp4D2x8g?=
 =?us-ascii?Q?V9zgAx9tD+ZuoGSTNdepK4P/nyeQvrCoSW/beD/OuUd1Y5BzsJfoYfCd2Cgg?=
 =?us-ascii?Q?xbl+5vaE4SE2UmFZp4E6folsQnPWozQ4ZK3fx9eSbtbeHqEJW37j3k0ozTMQ?=
 =?us-ascii?Q?5851IIkKZciWeOAPG9Js6/rjTcs0s7xchX13dAyI+ZsMalbOVxtq2FHextdM?=
 =?us-ascii?Q?F3jmIdt3yaCSNJ3LrrrxSx7rcN4y41AsZYd7ErvVpA25e1ViknLHKHprGoQO?=
 =?us-ascii?Q?e39igN6uzPeF5UYE/0jUleCP1OOYByTB8hL2vKxMnspxJ339QjPiiZA3cZYZ?=
 =?us-ascii?Q?zbIPmBuB3KtF38KtAjVSHKtjm6C8r96OL/xL8DPvpTgFwxNP40yi0saXwIf/?=
 =?us-ascii?Q?KVdCFrRzYsRh9omp2O7mXNyk7GZWOY8HEj+q5k9yhuv1oPLAS6B+exVs4mw/?=
 =?us-ascii?Q?Pt0/Su9fkwIZbK3gtOOHWLvCvKQlS+VgpCU6pton1rDKwhvYm89lZWHz7O48?=
 =?us-ascii?Q?23EGf2jVepojj6R5gzgvXD+K0npkb/vkr+pgPp3T/zBqjSkCs6By6D2gHE2R?=
 =?us-ascii?Q?cdqDdqYtq97/fefuI9DAxjH46uG7VLXjov3uuUeVOCLHq359ityJNfU5GipC?=
 =?us-ascii?Q?AL0MknKs3Bbm0ot+hDhtU7F3ePXuzMXdKSwMzPGQ716MIq9iJVZjWQabscSP?=
 =?us-ascii?Q?uTiStnw8B4dpWgbAMOVZT16PPqBlvnvYvtVsc+CdQVRalB7LIRDWZpPX/rmo?=
 =?us-ascii?Q?uKXCPnELeKzYzVhJH/9WKrs8rCoqrPXdqoQSA3a+KYAGSohxTTjGr06IIiHZ?=
 =?us-ascii?Q?/l66EG0Kzz4mRBymZ6+dgyBihCx/aV1pRqWw4hy8066gtvoW6gw6Js8oGTDy?=
 =?us-ascii?Q?Ao/Ry39K2OZsCxAuTDulC4F/bbyLOx5Q+p766z8B4mPRgnQZM+TWEPPrUKRz?=
 =?us-ascii?Q?Yk6xvrjFfPpmZRxRGXlhVqsfBGceV5hO5kESlv7VgofADtypR5O2bH7SUTUC?=
 =?us-ascii?Q?ZO66wZueEFMA5T89tKBuSLcKBp41pMfDKQw2mWVS9ICG2lSiqiJ68ICmshng?=
 =?us-ascii?Q?8WIWK9BypMQp8qTPef4hTKVPJCzcfP4O/UGSMW39DQUfdc/6fHCTEGjZl+3Z?=
 =?us-ascii?Q?B/sYoPQ8DpLaQ98nHusUt7aM1ws/Jgfsp6HlFI4iqHmdjuvMH5vwdm2XH5hi?=
 =?us-ascii?Q?oc48QSNwisPKeEmsjDP8g0UMSkz1m4HAU0nZExP0g5CuzHMi2acWh9MU+9Zc?=
 =?us-ascii?Q?OsyuDumJPKoPtGik/uRZAGd8IIQXALRaAuRAJbKbmf0ecKuJn69vxKoExR89?=
 =?us-ascii?Q?dzMnlNlLKfg1ixaghzPvN+fhgLfm0TdTE+pIIzMuus09iHs97l+HbN9S6olu?=
 =?us-ascii?Q?0m97tRxpmQUFxE8la5beiVQTUi3BpSVc9gYKRuQbdD/2b3HTqT/eFOmzCmuH?=
 =?us-ascii?Q?GjZUOTlJYE8EubawQp1wiY0YcTnVM75zfUaLQp1QaqpaJO3q8brsndneNT3r?=
 =?us-ascii?Q?1xPgpp8Z5IqStbwyAgOrB0sgZ3+10pOUU3g3RQ4SbzPReRXt1GEK4ZDGuRN2?=
 =?us-ascii?Q?QyRnlun2bhC3fwUF3nVP3YxWhZvBV0MrwMKVEpMLV3IERcI0XzNXe3pebCpC?=
 =?us-ascii?Q?L/cfu9xAKKSF2KMtB2vX1WlEkVTpeHOa6olzbrxiQneTB1DpZFXpRp5vBkgV?=
 =?us-ascii?Q?FEDDpqaBqk8RQFeO1EURMdx72NXFczOktvDz7P/mq0llAsyCb4ZGIQxlIfBf?=
 =?us-ascii?Q?PC3eME5o9A=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2149e82-dcc5-4920-b7b8-08def7176ef9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 19:41:55.4162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3yhIAX6o/AGyXFQALfeUEiqxSQEQ6oCLWk/ScN11Di0zr1N2IY9I889xEi1UEYPTBlDBbTXXeOjWZ1qeB8HlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6901
X-purgate-ID: tlsNG-ebf023/1786390920-C24CBB50-6216521B/0/0
X-purgate-type: clean
X-purgate-size: 3453

The GICv3 secondary_init() callback can fail while discovering or
waking a Redistributor, enabling LPIs, or setting up an ITS collection.
gic_init_secondary_cpu() currently discards that status. start_secondary()
then marks the CPU online even though its per-CPU GIC interface may be
unusable.

Return the callback status through the common GIC layer. Have
start_secondary() report the failure and stop the affected CPU before it
updates system features or is added to cpu_online_map.

Fixes: bc183a0235e0 ("xen/arm: Add support for GIC v3")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v2:
- Move secondary GIC initialization before updating system features.
- Use smp_processor_id() in the failure message.
- Target master instead of the 4.22 release.

v1: https://patchew.org/Xen/9fd0d0eacf061cc2a32f440e3438c084fa9ca79c.1783678619.git.mykola._5Fkvach@epam.com/
---
 xen/arch/arm/gic.c             | 10 ++++++++--
 xen/arch/arm/include/asm/gic.h |  2 +-
 xen/arch/arm/smpboot.c         | 11 +++++++++--
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index ee75258fc3..078049e741 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -282,11 +282,17 @@ void smp_send_state_dump(unsigned int cpu)
 }
 
 /* Set up the per-CPU parts of the GIC for a secondary CPU */
-void gic_init_secondary_cpu(void)
+int gic_init_secondary_cpu(void)
 {
-    gic_hw_ops->secondary_init();
+    int rc = gic_hw_ops->secondary_init();
+
+    if ( rc )
+        return rc;
+
     /* Clear LR mask for secondary cpus */
     clear_cpu_lr_mask();
+
+    return 0;
 }
 
 /* Shut down the per-CPU GIC interface */
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index ff22dea40d..ee2c26adb4 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -291,7 +291,7 @@ extern void gic_preinit(void);
 /* Bring up the interrupt controller, and report # cpus attached */
 extern void gic_init(void);
 /* Bring up a secondary CPU's per-CPU GIC interface */
-extern void gic_init_secondary_cpu(void);
+extern int gic_init_secondary_cpu(void);
 /* Take down a CPU's per-CPU GIC interface */
 extern void gic_disable_cpu(void);
 /* setup the gic virtual interface for a guest */
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index ba5fd2dd52..1806c47a08 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -319,6 +319,7 @@ smp_prepare_cpus(void)
 void asmlinkage noreturn start_secondary(void)
 {
     unsigned int cpuid = init_data.cpuid;
+    int rc;
 
     memset(get_cpu_info(), 0, sizeof (struct cpu_info));
 
@@ -366,6 +367,14 @@ void asmlinkage noreturn start_secondary(void)
         stop_cpu();
     }
 
+    rc = gic_init_secondary_cpu();
+    if ( rc )
+    {
+        printk(XENLOG_ERR "CPU%u: Failed to initialize the GIC: %d\n",
+               smp_processor_id(), rc);
+        stop_cpu();
+    }
+
     /*
      * system features must be updated only if we do not stop the core or
      * we might disable features due to a non used core (for example when
@@ -373,8 +382,6 @@ void asmlinkage noreturn start_secondary(void)
      */
     update_system_features(&current_cpu_data);
 
-    gic_init_secondary_cpu();
-
     set_current(idle_vcpu[cpuid]);
 
     /* Run local notifiers */
-- 
2.43.0


