Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA13606A31D
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 06:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=cI4RnVfA
Received: from list by lists.xenproject.org with outflank-mailman.1464209.1674951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMJcr-0006I1-Uy; Thu, 29 Oct 2026 06:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464209.1674951; Thu, 29 Oct 2026 06:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMJcr-0006Ht-Rb; Thu, 29 Oct 2026 06:28:37 +0000
Received: by outflank-mailman (input) for mailman id 1464209;
 Thu, 29 Oct 2026 06:28:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xMJcq-0006Ei-OK
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 06:28:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMJcq-005898-5N
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 07:28:36 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae2e77f-2eae-0a2a0a5409dd-0a2a45058b36-18
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 07:28:36 +0100
Received: from [40.107.208.37]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae2e792-4cb1-0a2a45050019-286bd025bd8b-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 07:28:35 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by CH5PR03MB7814.namprd03.prod.outlook.com
 (2603:10b6:610:213::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 06:28:33 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 06:28:33 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+BdljvVprzlpfiTe0CLc6hcWq8lLQyYibGbQAVdKWexQF05GBwIPyEKt6wiGMVKm0hCQHrKVtEQLLRffL6iHK9uMo5pvZxmgAIJU4p/wh6NcrCitm3BxOhSO8KjgazJFXViHiXrDid9xtVTucSkMMc0DNMIkFVaoci9vf97WQvQYcYRBXY8QYwx47aaiJeEdqOQO2LaHgAArSbZ4NCl1CzkGGmjdUMZGPCMGWNz/qyl2HaPRL8WHa5lL4bcThJx48IquLRRKF9SNCxN1hj7yZUI57aCSNODoCSqTHlsgMJtbKc+qFHNivehZOgWjWVeeuW5NGx4sMgPXTJg+xg/eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cy/UyqDtdWpV9UIv+XFXeIi53yw8IbZ1xohIkknhFmU=;
 b=jtPYIGoNfxJ3i902nOLK9prJ7vS9pghuU/jSmkIjB0frXh9jZAKS98YRw1pmZvFjUpzltTCwZvbuo1zHAZ1iNr1vIyO/wHsWvl77k2IMCYtOPsQyz/ULR1KnnJYLIISefTKaRUM+ID9ekSQuUWARoeTmeg7wASREw1wesEXrfNlKrKfDFFPhtmeoJTmW0AlPaveMzRVPesJnxlV0qbl/LXVjWv24JEHV6tFn+r6h6P2ZrXZbP0ale6X8cyPvoLXK3JpuxCWpUuxblmqC5y6McNuQq3Caqv0rK+QICSGbQUNsWTpi+hjj+iOrLe+sxhdxnXCPl8Hb0cIRsmMl+Jc+Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cy/UyqDtdWpV9UIv+XFXeIi53yw8IbZ1xohIkknhFmU=;
 b=cI4RnVfAqvu3XLAcfHVBq1jufZPpc3ZdX8f0Oxi+b97I3FesrZDwf2XvDVO/o4QNssWZdD10799b9gAgaVulEAetf8bFTIcsFIoAC9M+O/ECl6DOo7FA3rjC2+jFLm5DZ3WiCrB8pM+/KNvtXxIYEqZaoN5utMWCMNfs134fg6Y=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger@xenproject.org,
	sstabellini@kernel.org,
	dpsmith@apertussolutions.com,
	Stephen.Cheng@citrix.com,
	Chunjie Zhu <chunjie.zhu@citrix.com>
Subject: [PATCH v2 6/7] x86/nestedhap: Retry nested page fault if the np2m changes during walk
Date: Thu, 29 Oct 2026 14:26:58 +0800
Message-Id: <df4c35ef6c5d306798e57100036c2df4baa86ded.1793254779.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793254779.git.chunjie.zhu@citrix.com>
References: <cover.1793254779.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JN3P275CA0077.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:c9::19)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|CH5PR03MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: acec0372-01fb-4224-3df4-08df3585dae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|56012099006|261009223027099003|261022075727099003|261026121527099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|261021123027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lOzQ72l8y5FupyukloAXjKwIHLXYRO3+3x+tbz7YPlDg/bKRpxuw8NmhVMghPa95ip7nJHkQ4mKXE+wFCrAgcK6Bw5iwf02cujDR7Gx6sPQEB2uTTI4fvRy8Zp2fSHqaVK5xDy1n4Rn0Yvkd1wKjrF4IH5sSkwAsK1K3YeItHqZKUGivn1UMRkJqmI7VCnxp22Cvez73g9ckRiyQpPij7IMj4Toow7Qw66c+rT81oIdHDsYvyt4DDSV/URIUmIIDWltPr8cp0SQ/oqBw1FtpCfaeYlfyIGUheKILZw8hy39NwHswsTTND8nR9SSXfSxLBCooXpi/TlKx89SNjAkI065zJ2W7Y5qy6k0EbwvnFVUicYQsbNOgX1Ly2khoKeEQ4xiqbnAAot7LPCWiGILDW+CmzJC5FJyW4qgWZKZq0uaQbZf7cd1C5Jda14bU2p6sGGY2UUCqWZ5+LOCvlKEjoSAK4BaRJZW6teEbjzIs46m+9j6IF69gZYZyM2C3DPE0yUeskIa/4MvOitQQbtcvYTPA1MJIURlRmk3Y+Ow9racZzdu4uQrh1LajJnTvuQsbdkMASKXUnY4cWRzrqV7hBa2rMX9n59e6QPhCuk94oRKqqprCiyF4SxqQLM8TLGDLmevgjdCnxW6ZaKuWBurjnv4GzJAkdu13VpyCCbqdii8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(261021123027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AAtBAlQ/wiW5UiG83arWR9h2VP/m50ewR7tUt0khL9MoE1M+c38pwxaMKm4u?=
 =?us-ascii?Q?rkc9hZ0kIotbLX7S1AuSUYjTFeMUPm0xWpAXwUtXxxsXaVxeiAtwJHDPh3PN?=
 =?us-ascii?Q?JKbhAaLX6U7FZUonLnRPEFsjsOR21wgHkcFsIDlrZUiiqW3q5Vispb9ZMedg?=
 =?us-ascii?Q?fWcJaLeOlsxEOtYYTk4ax/AfeQz7pwKu7u/zxPcO6+vyTWUL4suuIDuXJFSM?=
 =?us-ascii?Q?lANUupe4bb+VRt6vaDUpCJJgIKm6MPeRRtPqiqABaZBU3u/04yrF5mCvXc3L?=
 =?us-ascii?Q?OxG3LHgntv9AZsm86ali4A+HehoxUuCeyFbgOkThTDXkjNt1u2yj7WB70BRv?=
 =?us-ascii?Q?0yKIQRvf0m6PN9gjjKOz48Z0JCatVteMENWSWPfk/lsg7Tqr5Onh++/CdC8O?=
 =?us-ascii?Q?mYcUSNCU1a9Ue7aU14l3pZlLHhnv+2LXzoksuw7CvFR4xY8UVkaIvIJpzMaj?=
 =?us-ascii?Q?ZBPc4wdbj8Gy395MUIfPx76Me1CrZhdIgBye6GZHuZg1mVy5rKvs6DsY67u3?=
 =?us-ascii?Q?gWsTp/GbIAUncmmPGLHY68bLJ3OlpzCPio5ke8t5ls4mb6GwdbYGnJBOrcWq?=
 =?us-ascii?Q?Pn0NGbrpJ5xEhGQ7QcHGIhr/Bhj5tk3WxWeh2eic7hrZZ/vEynuOh4XbqTPa?=
 =?us-ascii?Q?sRROavei7rDfWHwUC1sYrYOOumwDuIsz5I6oShAM8cWxOpIU/Q2CR/QMyku6?=
 =?us-ascii?Q?6MNREen3pu6em3dlGDjQ8BxZUffzghawS/ZoOgDozi0Au5vS17Dk7spHdmiR?=
 =?us-ascii?Q?yZTbgFcsvmsngs9uiJrAe2TwtmGcJsVilY1FxWb2A/UtFaYphHUgpWGENfaY?=
 =?us-ascii?Q?pe3kJNSTcxNWQbKIjXe3x5l3xvhr2kdKi8zw8TUGEL/UGVPUyn73TvHRaYml?=
 =?us-ascii?Q?uOMq8koxFIt97ytpyqoAwiU+wmKFvKugOE33eMGL33941nVk6djitumyaXFw?=
 =?us-ascii?Q?nWYxwIEEMYWfTHrteL+UjVkZbxUmOSSpTzlj5/HWC1aKEIPfbDkvI0f6dnnx?=
 =?us-ascii?Q?yoM8T0eYZlbn2vnE7yg0NIZQ45fAU2DTO8AaqswcA6m6n2+mGKub2v+n4Q/4?=
 =?us-ascii?Q?ze9m+QY6NibgBx+9SG+Dx7qM1qy60vNHcPMmLFh1H1mqUl9QQoKcKKgRCP84?=
 =?us-ascii?Q?x6lAzfVAzb+PgEt+9Z3s6ILKh5hhha67aoHmRwGU7fx3NBbBUr319m64NkSg?=
 =?us-ascii?Q?LVBAqFAznssXszncJJ9fHV+XeXMhmWV6m1moC7kBRhOT+wSMYHYiDOFhv074?=
 =?us-ascii?Q?07ABSj/PnuongOiWGldjZXHpIjRldGIam8mCuYvFV4+qSLMm0Uf9LLNSLG00?=
 =?us-ascii?Q?8MlVNXT/T4P2cX9Vlt4scl87oXlnZNq4SOaj0ksAA4ioNXruzugFNJp7m/ER?=
 =?us-ascii?Q?cLEcJf2kYk3b9HhA4DewZxVo9mILqf0dlUyf0fuEloJBQZU8M0PB+k1qrAzn?=
 =?us-ascii?Q?G+puC/lorqBtktlEoSQrrh8MpHgp/+0ybZr4DqHNuwPdIDqDtrOtGwtTVXgA?=
 =?us-ascii?Q?tt7kJka5U8Py046hS0PtKmCPaTTke7Tn7RY1opUjIiR9hibYmggaA5y8kkcM?=
 =?us-ascii?Q?NiBxhCPi7B5Mju12BNo6aMI/xQGWlx/ibchDk2r3cLLgzaDfRq09yh1fiUbw?=
 =?us-ascii?Q?wQaqgPRkufWxnlJEcbm+65szGU00gYjHSJj158b72hO2TBq/LzL7cV4T3hSZ?=
 =?us-ascii?Q?2ve8axmJwQGAz8glAYTcZXFbUwPQYr0bbDYrN0GelnSMFIFwduS5ZWlzwddF?=
 =?us-ascii?Q?B4nf0X/fTA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acec0372-01fb-4224-3df4-08df3585dae3
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 06:28:33.2863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zeNss385swAhxGWONBQuGESEpTyKiA7FoCVnFlVo2J/WQR5ZT3GkSBWBoVBYqmmEb/ZTIKliX8swc7NAXRFBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7814
X-purgate-ID: tlsNG-c201ff/1793255316-726B52A1-5C2F51D4/0/0
X-purgate-type: clean
X-purgate-size: 3840
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

nestedhvm_hap_nested_page_fault() walks the L1 and L0 p2m tables without
holding the nested p2m lock, and only afterwards looks up the np2m with
p2m_get_nestedp2m_locked() to install the result.  If L1 changes its
EPT/NPT base or the np2m is flushed or reassigned during the walk
(np2m_base / np2m_generation change), the translation computed from
the old tables may be installed into a np2m that now represents a
different L2 address space, leaving a stale or wrong mapping.

Snapshot np2m_base and np2m_generation before the walk, and re-check
them after each walk step (L1 and L0) via the new nestedhap_np2m_changed()
helper.  Re-check them again, together with the np2m identity, once the
np2m lock is retaken for nestedhap_fix_p2m(). On any mismatch, drop
the lock and retry the whole fault from the start.

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
 xen/arch/x86/mm/hap/nested_hap.c | 40 +++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/hap/nested_hap.c b/xen/arch/x86/mm/hap/nested_hap.c
index ceabf31ec0ab..3db3eb259d3e 100644
--- a/xen/arch/x86/mm/hap/nested_hap.c
+++ b/xen/arch/x86/mm/hap/nested_hap.c
@@ -101,6 +101,19 @@ nestedhap_fix_p2m(struct vcpu *v, struct p2m_domain *p2m,
     }
 }
 
+static bool nestedhap_np2m_changed(struct p2m_domain *p2m,
+                                   uint64_t base, uint64_t generation)
+{
+    bool changed;
+
+    p2m_lock(p2m);
+    changed = p2m->np2m_base != base ||
+              p2m->np2m_generation != generation;
+    p2m_unlock(p2m);
+
+    return changed;
+}
+
 /* This function uses L1_gpa to walk the P2M table in L0 hypervisor. If the
  * walk is successful, the translated value is returned in L0_gpa. The return 
  * value tells the upper level what to do.
@@ -168,13 +181,23 @@ int nestedhvm_hap_nested_page_fault(
     p2m_type_t p2mt_10;
     p2m_access_t p2ma_10 = p2m_access_rwx;
     uint8_t p2ma_21 = p2m_access_rwx;
+    uint64_t np2m_base, np2m_generation;
 
     p2m = p2m_get_hostp2m(d); /* L0 p2m */
 
+retry:
+    nested_p2m = p2m_get_nestedp2m_locked(v);
+    np2m_base = nested_p2m->np2m_base;
+    np2m_generation = nested_p2m->np2m_generation;
+    p2m_unlock(nested_p2m);
+
     /* walk the L1 P2M table */
     rv = nhvm_hap_walk_L1_p2m(v, *L2_gpa, &L1_gpa, &page_order_21, &p2ma_21,
                               npfec);
 
+    if ( nestedhap_np2m_changed(nested_p2m, np2m_base, np2m_generation) )
+        goto retry;
+
     /* let caller to handle these two cases */
     switch (rv) {
     case NESTEDHVM_PAGEFAULT_INJECT:
@@ -192,6 +215,9 @@ int nestedhvm_hap_nested_page_fault(
     rv = nestedhap_walk_L0_p2m(p2m, L1_gpa, &L0_gpa, &p2mt_10, &p2ma_10,
                                &page_order_10, npfec);
 
+    if ( nestedhap_np2m_changed(nested_p2m, np2m_base, np2m_generation) )
+        goto retry;
+
     /* let upper level caller to handle these two cases */
     switch (rv) {
     case NESTEDHVM_PAGEFAULT_INJECT:
@@ -238,7 +264,19 @@ int nestedhvm_hap_nested_page_fault(
     p2ma_10 &= (p2m_access_t)p2ma_21;
 
     /* fix p2m_get_pagetable(nested_p2m) */
-    nested_p2m = p2m_get_nestedp2m_locked(v);
+    {
+        struct p2m_domain *current_p2m = p2m_get_nestedp2m_locked(v);
+
+        if ( current_p2m != nested_p2m ||
+             current_p2m->np2m_base != np2m_base ||
+             current_p2m->np2m_generation != np2m_generation )
+        {
+            p2m_unlock(current_p2m);
+            goto retry;
+        }
+
+        nested_p2m = current_p2m;
+    }
     nestedhap_fix_p2m(v, nested_p2m, *L2_gpa, L0_gpa, page_order_20,
         p2mt_10, p2ma_10);
     p2m_unlock(nested_p2m);
-- 
2.34.1


