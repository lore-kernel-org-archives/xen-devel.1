Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7297C982DE
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 09:26:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427215.1649843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8aHn-0000Bc-Dq; Mon, 21 Sep 2026 09:26:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427215.1649843; Mon, 21 Sep 2026 09:26:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8aHn-0000BV-Az; Mon, 21 Sep 2026 09:26:07 +0000
Received: by outflank-mailman (input) for mailman id 1427215;
 Mon, 21 Sep 2026 09:26:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1x8aHm-0000BP-C4
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 09:26:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8aHl-000cyJ-8j
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 11:26:05 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ab0f827-2eae-0a2a0a5409dd-0a2a450a8ade-36
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 11:26:04 +0200
Received: from [40.107.200.31]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ab0f82b-f2d2-0a2a450a0019-286bc81f4d44-4
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 11:26:04 +0200
Received: from BN0PR04CA0189.namprd04.prod.outlook.com (2603:10b6:408:e9::14)
 by CY8PR12MB8297.namprd12.prod.outlook.com (2603:10b6:930:79::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 09:25:58 +0000
Received: from BN7PEPF0000009C.namprd04.prod.outlook.com
 (2603:10b6:408:e9:cafe::1f) by BN0PR04CA0189.outlook.office365.com
 (2603:10b6:408:e9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 09:25:58 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF0000009C.mail.protection.outlook.com (10.167.248.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 09:25:58 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 04:25:55 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYXUJf7ROEIPC9cdTJCqdCh6uZiTRSx233tw0ONufMntRQ/Z/rLSSvIlsNXcRrLOZ03JcMJtzCx/ZMlDS/TTiXtRV5Fa+x4MqW2HdjUPmKxtJ1EM886LFq4J4KZS0Q/mBV29zNW+MgoFvBv2gV7z/1xtQWz/UtzPWbqJDt6fK4Qil5iDH7yvQabkMiH1H5RRDyI/Z7FvgWZMvFS1gWnIiHqw43IbIhlo3eWF/ZUYrmBushz5HxqGhu9MTjpVca4W/MyBHY735QLBqX3d8gW6c3fcM7rMZ5lfC7nYLeyYTVSRni4DaHn56Q51cbz1rCWLxOQdoJHliWtyIL2yz3zfLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sgk6kE+hr6M+rgcsXPhKjfl2VOBlqviynvvQD3lGOLA=;
 b=PtJhh96/IirjzwsFLyHizmkO1X25m5M8HLuAGXN99rL1roFOeknmd3yysdCB2nzkgA4cOhkRy8WCOPbAbM5YR+A08ntQNOyKHqyGBj8OYFkYgZkChVlsAHJpDE6IG3xIxHCA/XSWeDjPXAjsKPiF2cdt13OhCEVUfaEGIpHzIJ8P9hSJ1LHhBqb8k0+5LwBxXPhEJEINPADFihlvkVpY85J1/iR97ipgosvJPZazpDzKcayHsdShhtBfzUpUJ6lqmgF/BXBCy8ZDTkrW4FccHQIJR+GDJ9kPc7rBgfTptLQ/TX9pe44YMFzZKpiRMnw2nK27DfErWZDgPmVhZeEMZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sgk6kE+hr6M+rgcsXPhKjfl2VOBlqviynvvQD3lGOLA=;
 b=CUQonjFXdWI2mtx/76UE79h+G8q9Ohm/y/CwD970d7YDldo9R3qf5ey99CtXqzGJYuKsqpRm/hciZDkJOeXbHWvH8JKYIORsq3I5t3qgNUtY8gbq+nrVSV72i+WKhT4fj8V8eh/8O8M4mWPAsREM4SPI8xlwz3N71sLgGV3oVgI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH] x86emul: Cache the amd_like() output on x86_emulate() entry
Date: Mon, 21 Sep 2026 11:25:44 +0200
Message-ID: <20260921092545.37148-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009C:EE_|CY8PR12MB8297:EE_
X-MS-Office365-Filtering-Correlation-Id: 38b0c500-7f0d-4e80-0e12-08df17c25850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|30052699003|1800799024|36860700016|18002099003|56012099006|5023799004|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	TmDWdj6uDgGkSiCiEagNEhTHaoN+ajIsVPfTZpD0G+LCwkwv4xnbT/Y50qJg6vcYMeNwYep/9ixKMjZfYk4IKDz9tzNt/wQJQzB9Q6EL3sRKEweQQ0Nwq0fo9chgzeIv6oOooMrj7CA1vIujnPdGcMKDPvijFVP0NG2EvS6Hzj/yIvYOM6xoRauRuBhifGyexM1zzCtklwVG7vXXB6CZNqLiz4oT92ckH4pq0B9UmMhr6sHU6ARDRfozTBZxh1o7xUWSRqit4UQyUtNWNECfO9zRRYlNVI2FTP+4mYlOob8htVkKpsdTy725/UlhY17c6JRPD0q8XTRzlj+bPbLNJIXPH3Gmwrx/FRBXMH3TmiBrHyEomFN3k/U3/O0jsIC0KWibThHI+xInH8iKERYZgjABd9NR5llq1At+8LRGcMrExshTUXDy+9ZKAa5A37aqmhHj6bOrLD742Ofz+J3Cl9jsU5A4pIZWixmo6X+Y5+/oB7K6e9ZwUc3owEq+Ll3QLgSgR5wADJd/xUvSnNx4M5iQ09ttmdKgzK8zHRm0jtxBAjAVelmQaAP2biEJfocUh3e+pOlFHMP3UjcNg6MkO6RnN/wGp1loMzs7DWuc6H07g/7qGOilCiK5desyPBchKNbr9bOdS8f8lv2+AZHJ1gj4ChjIy0zzzQQnpPOK9g0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(30052699003)(1800799024)(36860700016)(18002099003)(56012099006)(5023799004)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p6NGicflLDJqW+Q9J3sQ+19P8FZiNRDmxisftiSBHc0nvpKPr64QTo9FV5ehE/ACPlev43M05w1MYsPqXH8dd4IeIUvGBCNQaDrcinJRWBjPc7TFnbcYaveXgyw16vAIyBHgpdiKED68paFxi5VoXIpIOnEggWqNMq0AQzulsDzSfAOV4+Vc87HoK6KkSukDSpPYC2vNKh+Rf2YWe7aUHH84/PcttvYE/fnF7z+NAifgIh+/4TnGfbuW3UFuXmByMHnp1e1xJZEnVl6kUXeoZNdBrYUYauefPR1aUURDDQ+9awoU8MwZPgDmnKiHQddPyR9YdnrwzpSfLyUL+x3/8WEkx99b88nGOoUUu+AsZTJSkt09sPi5ClFipSxlr9NXh2sUEJcmcQiEqHMgU1nxlMcmDRlo5nDylMF3SUfPRt3WUmCFucEVtbkHQ7IuPj+R
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 09:25:58.2195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b0c500-7f0d-4e80-0e12-08df17c25850
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF0000009C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8297
X-purgate-ID: tlsNG-4011c0/1789982764-593C4CFC-33ED520E/0/0
X-purgate-type: clean
X-purgate-size: 5983

The current code instantiates amd_like() way too many times, leading to
codegen explosion. Unconditionally call it early on, and use that
variable everywhere. This shrinks the emulator by ~3KiB.

No a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/2860748404
          (it's red because of an caching issue and personal branch name
           conventions it's just arm. x86 passes in full)

bloat-o-meter before-after patch.

add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-3366 (-3366)
Function                                     old     new   delta
x86_emulate                               209351  205985   -3366
Total: Before=3617694, After=3614328, chg -0.09%
---
 xen/arch/x86/x86_emulate/x86_emulate.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 89c37fea2c..c69ef0781e 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -363,7 +363,7 @@ do {                                                                    \
 #define jmp_rel(rel)                                                    \
 do {                                                                    \
     unsigned long ip = _regs.r(ip) + (int)(rel);                        \
-    if ( op_bytes == 2 && (amd_like(ctxt) || !mode_64bit()) )           \
+    if ( op_bytes == 2 && (is_amd_like || !mode_64bit()) )              \
         ip = (uint16_t)ip;                                              \
     else if ( !mode_64bit() )                                           \
         ip = (uint32_t)ip;                                              \
@@ -576,7 +576,7 @@ static inline void put_loop_count(
          * zero extend relevant registers first when using 32-bit       \
          * addressing in 64-bit mode.                                   \
          */                                                             \
-        if ( !amd_like(ctxt) && mode_64bit() && ad_bytes == 4 )         \
+        if ( !is_amd_like && mode_64bit() && ad_bytes == 4 )            \
         {                                                               \
             _regs.r(cx) = 0;                                            \
             if ( extend_si ) _regs.r(si) = (uint32_t)_regs.r(si);       \
@@ -1310,6 +1310,7 @@ x86_emulate(
     /* Shadow copy of register state. Committed on successful emulation. */
     struct cpu_user_regs _regs = *ctxt->regs;
     const struct cpu_policy *__maybe_unused cp = ctxt->cpu_policy;
+    bool is_amd_like = amd_like(ctxt);
     struct x86_emulate_state state;
     int rc;
     uint8_t b, d, *opc = NULL;
@@ -1810,7 +1811,7 @@ x86_emulate(
             if ( ea.type == OP_REG )
                 src.val = *ea.reg;
             else if ( (rc = read_ulong(ea.mem.seg, ea.mem.off, &src.val,
-                                       (op_bytes == 2 && !amd_like(ctxt)
+                                       (op_bytes == 2 && !is_amd_like
                                         ? 2 : 4),
                                        ctxt, ops)) )
                 goto done;
@@ -2356,7 +2357,7 @@ x86_emulate(
 
     case 0xc2: /* ret imm16 (near) */
     case 0xc3: /* ret (near) */
-        op_bytes = (op_bytes == 4 || !amd_like(ctxt)) && mode_64bit()
+        op_bytes = (op_bytes == 4 || !is_amd_like) && mode_64bit()
                    ? 8 : op_bytes;
         if ( (rc = read_ulong(x86_seg_ss, sp_post_inc(op_bytes + src.val),
                               &dst.val, op_bytes, ctxt, ops)) != 0 ||
@@ -3089,7 +3090,7 @@ x86_emulate(
         if ( (rc = ops->read_msr(MSR_EFER, &msr_val, ctxt)) != X86EMUL_OKAY )
             goto done;
         generate_exception_if((msr_val & EFER_SCE) == 0, X86_EXC_UD);
-        generate_exception_if(!amd_like(ctxt) && !mode_64bit(), X86_EXC_UD);
+        generate_exception_if(!is_amd_like && !mode_64bit(), X86_EXC_UD);
 
         if ( (rc = ops->read_msr(MSR_STAR, &msr_val, ctxt)) != X86EMUL_OKAY )
             goto done;
@@ -3174,7 +3175,7 @@ x86_emulate(
         if ( (rc = ops->read_msr(MSR_EFER, &msr_val, ctxt)) != X86EMUL_OKAY )
             goto done;
         generate_exception_if(!(msr_val & EFER_SCE), X86_EXC_UD);
-        generate_exception_if(!amd_like(ctxt) && !mode_64bit(), X86_EXC_UD);
+        generate_exception_if(!is_amd_like && !mode_64bit(), X86_EXC_UD);
         generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
         generate_exception_if(!in_protmode(ctxt, ops), X86_EXC_GP, 0);
 #ifdef __x86_64__
@@ -3200,7 +3201,7 @@ x86_emulate(
         sreg.attr = 0xcf3; /* G+DB+P+DPL3+S+Data */
 
         /* Only the selector part of SS gets updated by AMD and alike. */
-        if ( amd_like(ctxt) )
+        if ( is_amd_like )
         {
             fail_if(!ops->read_segment);
             if ( (rc = ops->read_segment(x86_seg_ss, &sreg,
@@ -3924,7 +3925,7 @@ x86_emulate(
 
     case X86EMUL_OPC(0x0f, 0x34): /* sysenter */
         vcpu_must_have(sep);
-        generate_exception_if(amd_like(ctxt) && ctxt->lma, X86_EXC_UD);
+        generate_exception_if(is_amd_like && ctxt->lma, X86_EXC_UD);
         generate_exception_if(!in_protmode(ctxt, ops), X86_EXC_GP, 0);
 
         fail_if(ops->read_msr == NULL);
@@ -3973,7 +3974,7 @@ x86_emulate(
 
     case X86EMUL_OPC(0x0f, 0x35): /* sysexit */
         vcpu_must_have(sep);
-        generate_exception_if(amd_like(ctxt) && ctxt->lma, X86_EXC_UD);
+        generate_exception_if(is_amd_like && ctxt->lma, X86_EXC_UD);
         generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
         generate_exception_if(!in_protmode(ctxt, ops), X86_EXC_GP, 0);
 

base-commit: adbbbd47a1fad8e3bc1ab65c555f11d831fd6681
-- 
2.43.0


