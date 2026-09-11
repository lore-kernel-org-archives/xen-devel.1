Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4D5C88E4C
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 09:52:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416206.1645368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xvD-00042G-Pk; Fri, 11 Sep 2026 09:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416206.1645368; Fri, 11 Sep 2026 09:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xvD-000429-N2; Fri, 11 Sep 2026 09:51:51 +0000
Received: by outflank-mailman (input) for mailman id 1416206;
 Fri, 11 Sep 2026 09:51:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x4xvC-000423-22
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:51:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4xvB-00DQ4e-B4
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 11:51:49 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa3cf33-e002-0a2a0a5209dd-0a2a450397a8-12
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:51:49 +0200
Received: from [40.107.200.68]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa3cf33-fae8-0a2a45030019-286bc844e73b-4
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:51:48 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by LV0PR03MB989274.namprd03.prod.outlook.com (2603:10b6:408:398::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Fri, 11 Sep
 2026 09:51:46 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 09:51:45 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWaP277UbuKa9WiTaDN5HG4Vdx2OjUrHm56OlzDsBz5AOsVO+X6MndLO4yrjJeUk07ydBrte3PNp4jurC+ETp7iheIiNidIjURkC3UKRqFn7SmR1AD/hAF+anMA/WJW0VXnGpxxu2jBQ6WFi2+jN8oDagYAhEigxLLSiK6A9kP+OiwWiF59zHgrPEelxPtxRvNVJbb/eAuzmYytH0fYBLnIkgDJbQoWyHEqrND7UaYByJO7InvSON+yPLVtGUIXanpgtH2bli5wU7rzQT+dlJEjMKqAinexAxYrHYS8ZMJSCIvszM3RYA5aC99JwklkD8J8SN39osCJ+fIfDUkubEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjaI9Uk5mCz6KQLOPUZ9qtLmEVJa2tm6Xki0qc363Uk=;
 b=yjuRgyVHYSLXBnWFYOLhu0d6lCGG7U8a4b8wpBDEIl4GiD4tE9rsK8i7M9kMZ0kNButfu0jyGxinOJr0H4cOhV+Zbv6lfkIFi4Za3XfvvJr1VEz4jX64wnA1wsAz7i71QoHGR29enFms96GisIXNoMDk9Ps4mB1Vl/HLTmiY/baiCuKA9ylahV6RZ1e9U61pEMUihT2vi5eYwmziac2C+P1FN02qZUDgwaz0Npp/8wdUxQ15X7svP5fGS6xGdWcUusLrCXTpnMb+FglZ0tVUQbyoBeI2wq7gcWgY1+Zw7e9CTuUI7ua5f0lvSNa6W77HZ0Lds6/M+Ir3X5BNQDvF2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjaI9Uk5mCz6KQLOPUZ9qtLmEVJa2tm6Xki0qc363Uk=;
 b=i38BzSPeNhi17TvcFebQt5xwu0KOYMOoGINMKtBf5ycq1i238K4Egya2+5sai86VPSHDDF3sss9O6RBnpdKXUI0gaCccpdvNOfvDilcM5XYUjMstUdHraMWhBVJ3wzWUlorOKH6hwatjSRpP+Y5Rw9V+sIvnvxUCwCvAXKJxvjw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3] x86/svm: Intercept CR0 writes selectively
Date: Fri, 11 Sep 2026 10:51:21 +0100
Message-ID: <20260911095121.1177503-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0056.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::7) To DS0PR03MB8272.namprd03.prod.outlook.com
 (2603:10b6:8:28f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|LV0PR03MB989274:EE_
X-MS-Office365-Filtering-Correlation-Id: bc60e828-14ec-46ca-84d0-08df0fea4a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	ae77ry2Rhsfp/xdW5wb8jiZyO71m6THtxJiGybAehL8Vku8O5lTi1q0gwBgEQyZPA4ilstTW9bSG8DGipON7a2lQpHLWxc1pZyaHrJZmyX4f58Q3koVnUndAGJTn1aINVF9fyJ8uV2mNT2vVaHN5kxyaHZSEw3tUEDkLAJ1m4vEoc+AaYUkGUyB8WdFDlOS1MTyUuhcQDp7jO4MIJf7DxcAjhpEeC8t7f28srTnjPPhcqyCcCjEX5+1D3Q55RMnOJCAQtORlab5SzkN2/6W95bLJU1cgailDNbPgmTGic6ZUalnSBen1yzLdVM0EtsybSv8lqUTy53CV129KyTkAtQedDkLPRBT8nS5VmiwTb1vNKg/ZCtDDZShep9WypA3xYhB9WUP3GxKRho9yj+Cm/nNqMZ/qvS+J7vm8OU3oNGsIUWZhSqcwdtYzL29X5tR0ufrOGpfYjvFEmxJiJsUVusICVu/biutrZ01p58DkqbM+/7WAniQFewELg8caViIfNF9MZNazWNU8BCGq6dgF1mewiO0hxkvPmMEpAE2BEBBe9xqkLnIhH5hR3tPQtXnQH3Pp9B2DubtwH1ezcSL1J7CdzT8Unx7bNAzGDTMGzjnsZI0GvV2u55rrU/k27Xa7U5QrEAzhzbVDt2Mw+00G+ibGkXGp6Q1oG+gG+eZg1Q4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MkspuFhECQPFgXULxTFPBMfmEfzTWmCkCqJX58KPYEOL27ZXA6+gz8jJjdbK?=
 =?us-ascii?Q?qhhhbKwdlR7d6hnWakczf09KdZYpMs3+DJp36C6Y0vdGGPwPg52vT2gdmAEz?=
 =?us-ascii?Q?zb9rllO37QO88rO2jgXJE4PBjF/hHSV9k74+I8OGEmmN6Q4CII7/PCzkomvu?=
 =?us-ascii?Q?3Ikik+duz3+Doh/UvUDxVaPInQOWCtbQUVFNURE9wTFr6hL3+bK7eU3Jq1/W?=
 =?us-ascii?Q?+bAQRj9vG3/fEBgDwIXXpLBZ+/P9u2JRw4OMymLg9hkKL0Iw5o73zUluKHFG?=
 =?us-ascii?Q?r1cQIILyZsrRxkuXuDDNqPzC30psUCZYd/eGtiMNw3uNqIhrjsTCZrRd9mD0?=
 =?us-ascii?Q?CUp/Z6kOSiiZR2rfhEpC3OVCA3ON7kMFkFQueeUPx+8iDl8ClNo+26u2xGBw?=
 =?us-ascii?Q?yAYOCeqBKUzuoKcr+HaNUELGYOAKSL6ZCQI307+Atz/6dMOVcn2/CpIrbaV/?=
 =?us-ascii?Q?G5I57JZHNVSPSG7GYaDVFFsJcaWzgV9hdTpzckDHBJMM6yP/nTJPGGZkOgsa?=
 =?us-ascii?Q?6iEFyyflEmnUWFJnG0HZ+zpsAiZGLI/CUVn6JD+xMSx4w8uiQ1XxVGmDmdAA?=
 =?us-ascii?Q?OE0P+GPblz/eGwzdVVHgfAwBmD8IfC/+Juh7EdS6xqlW0W3QqiV+ZAMjLxfl?=
 =?us-ascii?Q?5iaw7VNjzaTKgfYgFWA8Bw0NOcs/tju7sZyCZsvV9QrIr9MGDusTIiSsDrA0?=
 =?us-ascii?Q?zWASWlJsCO5yjqeX0QnYbR82OZK09YGg8w93RQXl0Vv2ZDMMK53WaRZf3mvp?=
 =?us-ascii?Q?/uzhHQJjFJ7sE4d6srTCVRW9a1TkzoSmRA101LwPyO2763Od4A/UTGbq1/GF?=
 =?us-ascii?Q?lO8bKBD+kml20BpdHP6D4TvPac5GrQS0l1tU3zONR5OklWEf1QMDrF/DVhRy?=
 =?us-ascii?Q?uQppFkxMSoaQQ7IqF2C5NGsPcPe3vLf1I/jcjW6bt7A/c4e9Ck09YbnfW4VE?=
 =?us-ascii?Q?mGxLp6mrag3wf+XEvDP2S799DuFzMfYGTgrdy+LEOZnlwwifkTVL6oW+ywgC?=
 =?us-ascii?Q?cW5mvIdPvr355iRIC65aodfcKbjPt0Ay2RphFLfvyDf+17BAl1jJSAfzqDDy?=
 =?us-ascii?Q?/taCLVLt48V1eEkGVruvrkVSr8Zetdo/t1jFfEoM6Qf3Gv7v9HN+Yr5A/VN3?=
 =?us-ascii?Q?q+VGmvXIiIfxchZNW1Qnigr2oi2P1sjqlZIrtUI8XOYPXQu/ZEHGgfy6Beos?=
 =?us-ascii?Q?xSZTsOxpEIjj8oxpBbbpP6mO51zHcvuzxoSekjIvr21tkjqhSsizpucau8/b?=
 =?us-ascii?Q?+3XkcyHuuNhpSmxmSMRLzuW1G3Z4V8AWUqAYwxiBzpa6k2nimzD94McpkUAC?=
 =?us-ascii?Q?8f5xxUU5FR7CaPO20bn1a5/rppLQ1KsWW9ku3/TDouhivElnUr9D3q0rbPjl?=
 =?us-ascii?Q?ZPdHUeKzg125lmjQQhjbQq8sAOLVzPzyvdKDFTzRkBFCeTdzT31EMgmPHiNJ?=
 =?us-ascii?Q?YYL41/EqkvTgZJypNVdxp1dK51Tr+tQ9i/VoJF1b8Yr0XmI80qvL155cQWqM?=
 =?us-ascii?Q?bCcTw7N3QwaDE82A485qEfaetKoTfWg7+8UXtOb5UYymPANGkK2bQtwkQvvd?=
 =?us-ascii?Q?E9Co+hq/3itSCxr/CqPEDVRpsnT8cDRgQn8k5zbcbiOvQTZR/BTi7axquK+w?=
 =?us-ascii?Q?yCbJBlQ0h5+8+IZXPaBV/hVqiZY9uiqpF7E3WhEv9D9jsONYSP8t+M62CgP4?=
 =?us-ascii?Q?gGbI9pPzN+rfh9lWcpSTXfJJmGEQbQxrM5AtK3EYlFe2m2KupsLy773ctzBs?=
 =?us-ascii?Q?yUCLJTd2BmM28Zl3Fzj3LQivhz9ZyVM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc60e828-14ec-46ca-84d0-08df0fea4a55
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB8272.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 09:51:45.6452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhL1xy/3xXtQpI8Q6uFRoCqtV6FoSJluI/vBMkxiUpuFkoywDe6qA9XP+ypyXmYHttucsFJJdpV6zLbJi6D9y9KBKf4OcWiMFUlnD3zyzAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR03MB989274
X-purgate-ID: tlsNG-33051d/1789120308-74C884E9-E574EC40/0/0
X-purgate-type: clean
X-purgate-size: 3082

Since 3356d685dbda ("x86/svm: Remove lazy FPU support"), Xen does not
need to track when the TS or MP bits change so opt to intercept CR0
writes selectively. Aside from potentially reducing a few VMEXITs, this
fixes a nested virt bug where L1 intercepts CR0_SEL_WRITE and L0
intercepts CR0_WRITE. The hardware prioritizes CR0_WRITE and so L1 never
sees any CR0 writes.

Since CR0 TS/MP bits may now change behind Xen's back, sync CR0 on
VMEXIT so that the emulator sees the correct values.

Shadow mode continues to use the full CR0_WRITE intercept since with
Shadow the CR0 in the VMCB is not the same as the value Xen tracks on
behalf of the guest and allowing the guest to change one of them
directly would be fragile.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

In v3: Change HAP only, not Shadow

 xen/arch/x86/hvm/svm/svm.c  | 7 ++++++-
 xen/arch/x86/hvm/svm/vmcb.c | 7 +++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 5f5d903d872d..4e0f3282251f 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1640,7 +1640,8 @@ static void svm_vmexit_do_cr_access(
 {
     int gp, cr, dir, rc;
 
-    cr = vmcb->exitcode - VMEXIT_CR0_READ;
+    cr = (vmcb->exitcode == VMEXIT_CR0_SEL_WRITE)
+         ? 16 : (vmcb->exitcode - VMEXIT_CR0_READ);
     dir = (cr > 15);
     cr &= 0xf;
     gp = vmcb->ei.mov_cr.gpr;
@@ -2519,7 +2520,10 @@ void asmlinkage svm_vmexit_handler(void)
 
     v->arch.hvm.guest_cr[2] = vmcb_get_cr2(vmcb);
     if ( paging_mode_hap(v->domain) )
+    {
+        v->arch.hvm.guest_cr[0] = vmcb_get_cr0(vmcb);
         v->arch.hvm.guest_cr[3] = v->arch.hvm.hw_cr[3] = vmcb_get_cr3(vmcb);
+    }
 
     if ( nestedhvm_enabled(v->domain) && nestedhvm_vcpu_in_guestmode(v) )
         vcpu_guestmode = 1;
@@ -2883,6 +2887,7 @@ void asmlinkage svm_vmexit_handler(void)
 
     case VMEXIT_CR0_READ ... VMEXIT_CR15_READ:
     case VMEXIT_CR0_WRITE ... VMEXIT_CR15_WRITE:
+    case VMEXIT_CR0_SEL_WRITE:
         if ( cpu_has_svm_decode && vmcb->ei.mov_cr.mov_insn )
             svm_vmexit_do_cr_access(vmcb, regs);
         else if ( !hvm_emulate_one_insn(x86_insn_is_cr_access, "CR access") )
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 975a1eaef806..d069280a4da8 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -154,6 +154,13 @@ static int construct_vmcb(struct vcpu *v)
         vmcb->_cr_intercepts &=
             ~(CR_INTERCEPT_CR3_READ|CR_INTERCEPT_CR3_WRITE);
 
+        /*
+         * Xen is not interested in changes to the MP and TS bits so use
+         * CR0_SEL_WRITE to avoid unnecessary intercepts.
+         */
+        vmcb->_cr_intercepts &= ~CR_INTERCEPT_CR0_WRITE;
+        vmcb->_general1_intercepts |= GENERAL1_INTERCEPT_CR0_SEL_WRITE;
+
         /*
          * No point in intercepting INVLPG if we don't have shadow pagetables
          * that need to be fixed up.
-- 
2.53.0


