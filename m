Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C35C624DE
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 12:24:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408428.1641019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2SxJ-0004V3-QB; Fri, 04 Sep 2026 12:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408428.1641019; Fri, 04 Sep 2026 12:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2SxJ-0004Uw-NY; Fri, 04 Sep 2026 12:23:41 +0000
Received: by outflank-mailman (input) for mailman id 1408428;
 Fri, 04 Sep 2026 12:23:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x2SxI-0004Uk-E8
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 12:23:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2SxH-005oUu-Qv
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 14:23:39 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a9ab847-bab6-0a2a0a5309dd-0a2a4502a944-10
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 14:23:39 +0200
Received: from [52.101.57.4]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a9ab84a-6ca4-0a2a45020019-34653904b760-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 14:23:39 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CH0PR03MB6132.namprd03.prod.outlook.com (2603:10b6:610:bb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 12:23:36 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 12:23:36 +0000
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
 b=eAEyNIF36GAao7yiNM5UBaR9BNUlcS0+YrlkWpaE+2caj9pB10pG+1rxNKacvpCY7wy9pwsfkFLhk1BqLqD6ycdsfrWsMz9WS+qVjjd+k5dhxF7Hn6WUvt9sB9ohr+Ihx1UNwR5sMexc/jmoMpX2mOmV3jDd4+aiJ08LUs1cfN6XdbVEKAS+uaDnEFAWietCwLgB9Vq+TH4KZKK9nr3DNEW7/n8cFyOmS5h+kclNw6fWAYWyu1FCdrgqFowji1za1XjcyeX7jDbZTBaKidu/IqSe9gffFLQVbHnnNwlbl2NNIpCca56dVO4V9Drk74C502bofrzsS/Ju/Zi2+M6uFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4y200znicxFhtMBf6+UXpmow9OhWujlHMUqpd7k5kz0=;
 b=D1oX7EYwjGOlUEeMNnX2yu8MpwkYkznWdRvwjjlJ2C4cbb9uWK52O/gOBw5q+pCREie9d7LqVml6ImfKxbFrCCNcb+bTQFptL1spSD0dFB3Rgc+b/H9BxBVaPLk2lTqTTuikuyALI1lHAV1gP8KmH9r2d+hXYcSrv1xhxV+84k/lK7zwNt37cfIri30G6kkcEyaXTkv869iLi6TTFRBkq7McGlQbF7BZIfxKR8AmHQjgTOA+rG7c2u46f4VjkVQZnlNImwedhFKCDlCZcfY5nQeeLSJqOmel/Zp06Q38vTzc26HIwS5ENsBykFCWUChAkOQy9X622HImptbsc1L9OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4y200znicxFhtMBf6+UXpmow9OhWujlHMUqpd7k5kz0=;
 b=wpGA3YLvjnsPUYBPLArmKTM18McBCBQHymAhIiAErNh9YjVEIoNABb2MeaOjLwgV8sEZeXLJ731Rv2LIdu6sjpnidQ9+8V93Qs3AkxlUTR78TpHYsSLsh5P39kNT/iqDJFDuvtKyPClDmnOKv/TJRo2AMk1t2HRJ8jCd0kLC0fw=
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
Subject: [PATCH v2] x86/svm: Intercept CR0 writes selectively
Date: Fri,  4 Sep 2026 13:23:30 +0100
Message-ID: <20260904122330.306936-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0080.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::10) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CH0PR03MB6132:EE_
X-MS-Office365-Filtering-Correlation-Id: b39606a7-1045-46e5-0034-08df0a7f582e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	vJI5ym4ODozw1dwXlczsu+yoHM9c2B2qLCyL2/sAxLEJbEUV4BPXmZraNocB1lQCzcaGwI7xZ3eoHN5YJeEUbqXfo7EwgC0hnjqFxb6ZFlvDO7b6zD0Ex30nyqFD7FkGCDxpF4biuRaRKSjBkB17X6bq6DoaDqpTMgN+pYJheGSRy/nvNdKFFoJmMwvfeHOV9XZ8ESkUcCZDJxDXgMK9mI9hWVNjyGzIA3GTEegItIdADNPAzV2s85zq0FBENS84PCqiZRLlObNhM7kutoZKiE7pUrAKH8Zai9v5eekoS7YG7QcRS0JjC+S+ZyoKkEgJvSPhNrYWztljpJwDcUNzkGjxfr1WVGtOR5bZRMGfb/IbDwb8oIAlswbOEmQDuNH3K8d/ev1ajM3eqMXLPnwUU98QH8gGo+DdwlpjDxUMG2RXCrIKKDwCxZmlGUUIqBw2eqifpcV1k0oeT3vCnx6arpiS+XSpX8N2b/DBOEEQN6I/lsXhi2f5S26ad/iQAvzraOwVy8KL3HiuHk+EdKqNf7NaMl/gT3+QBIWGuuaKxhruRJ/ark5xUY1R/92DnkRmSh57qdOR3ELuoPQMDOAxpYIFS1WY1PMa1/GxsiTJex1tIraWiQP/d324w6ouOJ+FrFZz4dzt/nMqxxnZ8kICSc5deX/Am15T4UebQ7hKO1Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sV0psjFrkhi21v0VxXa98LE7miQzS1ybiGB43gdnYjDTw1y9krQK2+DCb3+b?=
 =?us-ascii?Q?JD9WJJFb3+syWxdtL2hpWBqGw2sx5Pr3wzWJMWbryuWQiI9aNNLRRFV7BkRA?=
 =?us-ascii?Q?lM0xv0g+I64DJtZkw44yogsbaIn8jZoqKu/EpP9hFfsyuKNzIyqqABkWaP9i?=
 =?us-ascii?Q?x2ux3WqwFvVoor53ZXvPzHsx06nIpM20e+0Z7Ct84teqkQDNxsNjcJV5DWAH?=
 =?us-ascii?Q?FyR1sGo3XxDz2NHWh6tMEN8aq0YT8zbHgGWeeyrJI7fnDHNILQkMO+GYxzj/?=
 =?us-ascii?Q?l76v9MvNe1rQjKPle/2wd4Y7PboqNhWSqmErtl2wZvcEfTV+fjBXowluga80?=
 =?us-ascii?Q?Mx22ss8i49JWOTf3Pn+lJZ8K97jFAbuKLpUJMtn21bFPNFL87JOfp+zcZAgh?=
 =?us-ascii?Q?9Y9Xbi38fVodo2WGQ2iN+ARQvEYgbWJLjKSFNpiqTeHA9f7MkW1HMemftxBz?=
 =?us-ascii?Q?FHyCpxOcaMh5tcAu4M2P98gcki57KCPngiHGt+WRcAlp3+sfwoEIlF64UlLu?=
 =?us-ascii?Q?TYlGaAnURerx9ySd4zy7AL4HtoO1Mk92d5ztuktMZmb3bb9kOV55wHeEeS90?=
 =?us-ascii?Q?MylNF/KfAlml/y6jyk/Z7puntaNK8tm5nFdLIyY+WHFN/w1EEVNfPQaK1Mi9?=
 =?us-ascii?Q?KxEg3ZU5jhEIU9zTD4dLYp4jO0BrJRMEMPofTeX0dJgy+2hLOp5a4z2Byn2r?=
 =?us-ascii?Q?aSm6BjHF6xvV0A1SNKIia0l9t63zNCKVeXMlvrZlAEtOHuXFJiQKJlt5caZ9?=
 =?us-ascii?Q?ZGBOrOGHhT7eSMi10911tlyVlWIoqXKxGV/UNmgw6OcOtq9yEFtcCCRiBxyc?=
 =?us-ascii?Q?cbiDBDZ3cX8+fK2hN7m1VZ01FmQA0i5FcDjEqbP2W/i4Iy3mhyPkseOknzKx?=
 =?us-ascii?Q?ArhNuRDlAZEAkEtj1VlvK4y38+45qLoH/on1z+6/wTq3kD+AlsnysfNirMVv?=
 =?us-ascii?Q?5Gtqay2BNvdRJXte0IGkYbegykihEhA0ESDlaDOcE0AYUD1CWzEPgXUob40Z?=
 =?us-ascii?Q?cKZUL/hhow45Y+hs4kit7Voxv+P3otz4cYqwRSjhTxDXMQ8wK1FUbyIpEGMx?=
 =?us-ascii?Q?0WXt6bX4rH8v31LdEQJM8rgT/Jk9GFGAMM4dTnFoQirA/GPu7BG3KGmbLeRw?=
 =?us-ascii?Q?MacTrb01GggQl+TE71LV1k4qUSHaonm0P2PhcBWzt5+jW7AjMkSFVad7Zaix?=
 =?us-ascii?Q?zU+itnBXX7jlwu4xOHi0pDd9+Y95rfnqrvFiM/PCXg5j3ZTvWeWwjxuJPdI3?=
 =?us-ascii?Q?7p8QMIzzw4JRQC2GXdkOcO9ZkJwrQLtlS7cWSB5ddGsTs39PaiMPTW4ZCDKU?=
 =?us-ascii?Q?EYoyIh2u5Q1IXcRZxrrfzLicX5uvWIAO2oeW+RlnsQ3CZ+M1Z7ysSrwcyGT9?=
 =?us-ascii?Q?MSUoCbG4YWdBgLLAdbOFksVdusItHZPhHJ/JP2v2+4RC88indqeBqiA4odRn?=
 =?us-ascii?Q?wI25TnkkLpYJ3YF8GiJ4p//wiIgGREdFqW3wW6hqm//HW/K2Cq2Ca+UxGz9O?=
 =?us-ascii?Q?DpqmwwbbMXqHomWSfxRhvThw/6xS8W+oLnZo3qG3i5swZOOCdlESUe6EBNcj?=
 =?us-ascii?Q?AICbJMMaVnjI8dk3aIJJX8vaexyiyQPztRsi9gI0expprnzQGG15MWsnEY2m?=
 =?us-ascii?Q?xSs7gu5ekYPIWutT3cbb0tdRbgFBbhpO1QUL6rWLmI4EJZkbsEQi9i1RNiHo?=
 =?us-ascii?Q?Fj3afqiyBoHmHIsrCPPk69i9iesApkCQRJ1oy+dYp/o1RsyE2KN3MNivO9zp?=
 =?us-ascii?Q?YnwhmvoXsyquhB4tUPYyrNmvriHx9Z4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b39606a7-1045-46e5-0034-08df0a7f582e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 12:23:36.7416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: woaGYtEbb+gcjOEY3p2cEAUPLvM6t8ncqxzTz6HEJHGIYoujHJW3jHk+pNl6vXZCB0qhWVnMbhdFlUI4fO9yaszvkZMaCuKUOG2c0dCQPYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6132
X-purgate-ID: tlsNG-720697/1788524619-67CBA2AC-C72A0A28/0/0
X-purgate-type: clean
X-purgate-size: 4443

Since 3356d685dbda ("x86/svm: Remove lazy FPU support"), Xen does not
need to track when the TS or MP bits change so opt to intercept CR0
writes selectively. Aside from potentially reducing a few VMEXITs, this
fixes a nested virt bug where L1 intercepts CR0_SEL_WRITE and L0
intercepts CR0_WRITE. The hardware prioritizes CR0_WRITE and so L1 never
sees any CR0 writes.

Since CR0 may now change behind Xen's back, sync it on VMEXIT so that
the emulator sees the correct value.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

In v2:
* Keep case VMEXIT_CR0_WRITE for consistency with other not-intercepted
  CRx VMEXITs.
* Tweak commit message, comments, and formatting.

 xen/arch/x86/hvm/svm/svm.c  |  5 ++++-
 xen/arch/x86/hvm/svm/vmcb.c | 22 +++++++++++++---------
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 5f5d903d872d..ddc35e31506e 100644
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
@@ -2517,6 +2518,7 @@ void asmlinkage svm_vmexit_handler(void)
     hvm_sanitize_regs_fields(
         regs, !(vmcb_get_efer(vmcb) & EFER_LMA) || !(vmcb->cs.l));
 
+    v->arch.hvm.guest_cr[0] = vmcb_get_cr0(vmcb);
     v->arch.hvm.guest_cr[2] = vmcb_get_cr2(vmcb);
     if ( paging_mode_hap(v->domain) )
         v->arch.hvm.guest_cr[3] = v->arch.hvm.hw_cr[3] = vmcb_get_cr3(vmcb);
@@ -2883,6 +2885,7 @@ void asmlinkage svm_vmexit_handler(void)
 
     case VMEXIT_CR0_READ ... VMEXIT_CR15_READ:
     case VMEXIT_CR0_WRITE ... VMEXIT_CR15_WRITE:
+    case VMEXIT_CR0_SEL_WRITE:
         if ( cpu_has_svm_decode && vmcb->ei.mov_cr.mov_insn )
             svm_vmexit_do_cr_access(vmcb, regs);
         else if ( !hvm_emulate_one_insn(x86_insn_is_cr_access, "CR access") )
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 975a1eaef806..f7e86c68b521 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -50,13 +50,13 @@ static int construct_vmcb(struct vcpu *v)
     struct vmcb_struct *vmcb = svm->vmcb;
 
     vmcb->_general1_intercepts =
-        GENERAL1_INTERCEPT_INTR        | GENERAL1_INTERCEPT_NMI         |
-        GENERAL1_INTERCEPT_SMI         | GENERAL1_INTERCEPT_INIT        |
-        GENERAL1_INTERCEPT_CPUID       | GENERAL1_INTERCEPT_INVD        |
-        GENERAL1_INTERCEPT_HLT         | GENERAL1_INTERCEPT_INVLPG      |
-        GENERAL1_INTERCEPT_INVLPGA     | GENERAL1_INTERCEPT_IOIO_PROT   |
-        GENERAL1_INTERCEPT_MSR_PROT    | GENERAL1_INTERCEPT_SHUTDOWN_EVT|
-        GENERAL1_INTERCEPT_TASK_SWITCH;
+        GENERAL1_INTERCEPT_INTR          | GENERAL1_INTERCEPT_NMI           |
+        GENERAL1_INTERCEPT_SMI           | GENERAL1_INTERCEPT_INIT          |
+        GENERAL1_INTERCEPT_CR0_SEL_WRITE | GENERAL1_INTERCEPT_CPUID         |
+        GENERAL1_INTERCEPT_INVD          | GENERAL1_INTERCEPT_HLT           |
+        GENERAL1_INTERCEPT_INVLPG        | GENERAL1_INTERCEPT_INVLPGA       |
+        GENERAL1_INTERCEPT_IOIO_PROT     | GENERAL1_INTERCEPT_MSR_PROT      |
+        GENERAL1_INTERCEPT_TASK_SWITCH   | GENERAL1_INTERCEPT_SHUTDOWN_EVT;
     vmcb->_general2_intercepts =
         GENERAL2_INTERCEPT_VMRUN       | GENERAL2_INTERCEPT_VMMCALL     |
         GENERAL2_INTERCEPT_VMLOAD      | GENERAL2_INTERCEPT_VMSAVE      |
@@ -76,8 +76,12 @@ static int construct_vmcb(struct vcpu *v)
     /* Intercept all debug-register writes. */
     vmcb->_dr_intercepts = ~0u;
 
-    /* Intercept all control-register accesses except for CR2 and CR8. */
-    vmcb->_cr_intercepts = ~(CR_INTERCEPT_CR2_READ |
+    /*
+     * Intercept all control-register accesses except for CR0 writes (use
+     * selective write instead), and CR2 and CR8 reads/writes.
+     */
+    vmcb->_cr_intercepts = ~(CR_INTERCEPT_CR0_WRITE |
+                             CR_INTERCEPT_CR2_READ |
                              CR_INTERCEPT_CR2_WRITE |
                              CR_INTERCEPT_CR8_READ |
                              CR_INTERCEPT_CR8_WRITE);
-- 
2.53.0


