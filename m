Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4506606A320
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 16:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=I4I0Z+rB
Received: from list by lists.xenproject.org with outflank-mailman.1498334.1696146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xURas-0007LW-5k; Fri, 20 Nov 2026 16:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498334.1696146; Fri, 20 Nov 2026 16:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xURas-0007LP-2K; Fri, 20 Nov 2026 16:36:10 +0000
Received: by outflank-mailman (input) for mailman id 1498334;
 Fri, 20 Nov 2026 16:36:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xURaq-0007LD-ET
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 16:36:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xURap-009teX-Qq
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 17:36:07 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6b0076e9-e002-0a2a0a5209dd-0a2a4505dd3c-28
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 17:36:07 +0100
Received: from [52.101.57.68]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6b0076f5-4cb1-0a2a45050019-34653944a145-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 17:36:06 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SAAPR03MB282009.namprd03.prod.outlook.com (2603:10b6:802:301::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 16:35:30 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 16:35:30 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XlOrN7Kcp8XU9vWbbmeavx7nIDsAMmzMevGNQk6UP5vHx8xwV5KJEoJnJRWuZ8H24tND779rDkuE3vrHySvmJ4vZn1P4HrcqghHlMhSnoHqrLf/gGZ6SvED7bOdjJS2d3Upr29MFoZI3HsIx3j3cBKi1yNAEjY6rYrX8IaAU2c8xECumfFt39h2wYgcEjAGOKKZfjD4Bw2G23eYr0UqqI9gtx0HM5W0eDqDrzwKn3ZXQ7j1d93PCocuMpYRrIT/a15LJZcnlUJcTZUOE248QvwRWiQsYag5zgzS36CwCoHRaacSWkwkzzfF6lZZmuKo7FdHAeFp3KZL+Q+1JtcMZIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTeqJmnCBhEKJWbkrtvtJBnxbAcpt2zFU1Mn89XlmXw=;
 b=YyRWlgB95358Lgci9hzrVYbOV5OB9d9MkCzGerxCrROMhdbAwMTRvz5uwW9GnuWBLUPNhyu+M4gsji/xM1NSWhwka82/Pch9/b/nWytxAHmcWghclEiK+KSGzbF+bOukpPEJzyUTfEW396O35V2ARyAKi9WVdSfLQmaC31TX2xz1JrUrJBprOmR5OgW8BJFVb17tnzw804enqckK8O8N38nWnM5Ct+RPASMlRUgyZN9iR5/pf4uF7goXWRa6PreZUpLyzBOuPNsOxFVreCwJ04kIlM/wqHSNZt8mukS6jg1cev5W82XOibwlk72ZKLW6QTWW0ktitdQfHU0CQ2da3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTeqJmnCBhEKJWbkrtvtJBnxbAcpt2zFU1Mn89XlmXw=;
 b=I4I0Z+rBDpoO7XDEET+mBA7s9cLjnQlR9+/v9UYurxZNQr4cnoghzVCkP0hiApoV7SuSaabJpc8juodpfZa4EMlkK5HP32a/dsjQf6lcIWhSgxj4roFpSFg3eaOxmulCGcwd7zpJbp1zs0B4u5edUl5eX4yK7gPigJV2U/dVqCU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v1 1/2] x86/nestedsvm: Handle CR8 accesses with V_INTR_MASKING=0 correctly
Date: Fri, 20 Nov 2026 16:35:02 +0000
Message-ID: <20261120163503.1907256-2-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120163503.1907256-1-ross.lagerwall@citrix.com>
References: <20261120163503.1907256-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0210.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::13) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SAAPR03MB282009:EE_
X-MS-Office365-Filtering-Correlation-Id: d02ae264-fc3e-467c-54a4-08df47244a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261026121527099003|261021123027099003|261021121427099003|261022105027099003|261028144727099003|261026140227099003|261102123227099003|5023799004|11063799006|56012099006|10067099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7quLY40GGPxm1SUOQs7jxWpCuPGiWDNrxvjmhyR/OgjTS85n2bjrW2r2rXu+82hg4Pu3FSXSPgafg9OdYvLGdPEtWl0QO5uj9ifFSgxqBmAWWbjmhLryvtP1l62HXJiau5YGrJzwsYhY9Ih2L00pyw/IyyMrwAc1rND1d+oIZNUH2S/LEGs8RhRHygD5JFhFIl9t/GCnn7pyPsfdfqrPs3Izp8gXfmaOHFag8E9t9zIe6+JGGp18oigBta6bqUJ9ZGhKw+LlSyaOyjoiBSZ52gIheHsjzJ1iAwmqjrGb+n6o7PBehYkO98ah4Uz4APV98UohFAgpxsR5kuGvII+1lgcMwSIU3PNIdQ9qYQEN3YDiicU2xVJSzhEMS/2WXNFF+vaOJ/IygvZaZIUEGrCJTPXg4FprhK7Zxs0qm5ABUApG+LjeAnU4m5fSKo9IBMkDUmcKUTbVNswsP+tr7AtdaaKoeVaoJ+jkWQFNzwObqL3+sImrampo2Mz6yoYO2yvFB3/j5aFy/mqHbxRgM0EAwXxTrxmFjXg/vojcOdpFdN9LtzRUjvlnoos+HgQ9jCqC/2XlL4qWFzwrRkbdWZvHwdqg7OnjcvM0FVe+lD8g481Of4U8ZRjZzDeQrAXkCv5VkaZvGxJOx6t9nnAJ9WxrEL3PsOZFWnrZDLQoySTfjbw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026121527099003)(261021123027099003)(261021121427099003)(261022105027099003)(261028144727099003)(261026140227099003)(261102123227099003)(5023799004)(11063799006)(56012099006)(10067099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tu8d9KxoPjYGonC+n6UxBQvDU+oi1wMBYJ58Sw1PxvJocgiXx9RDvy6X7To0?=
 =?us-ascii?Q?V6eHXwD5rwPCZLh/sbGnAtl53ZE/PPSPdOe4QwnircRTgf54wbdxxZOjHUkC?=
 =?us-ascii?Q?C8AYnm+UzyRuUkM7WCRXqg5Zt14t+heLTF8iZBWAPF3Z+XsicAGgD3KtPVA5?=
 =?us-ascii?Q?HnlX9suGuh/LMs7EF0Qye2VMjCxrxitRJlqIQ004C4lYX6MY+c3utRp+yH//?=
 =?us-ascii?Q?w+cJgJDWooH8K2SbgWpDNxFTG8M65waF9EokNbennPi1uEripR1O/2ya1jFL?=
 =?us-ascii?Q?Pr2sD8LYyMBPrAOof+j9LRA42O6GzIRa6J+7/6j3DQYH05I0zYGqVUy+cqxL?=
 =?us-ascii?Q?hvNeSWWWqVOWgRwVJkCguPU4joNLKiptvHXS/Mgrtt4eC4pxiMNb8rhzHtsQ?=
 =?us-ascii?Q?TEljNlTWkIgY3nLg1mjnv10fZ+wQdgn4m9+tT48CNMVRpqEX5Q51ZztM2GD7?=
 =?us-ascii?Q?PLmkgdxXr3aatHPAEtBfYWY+3qOxCNKtYElZUqiloIY9tIgS+J+jzsH701b5?=
 =?us-ascii?Q?WuKBoI+0GZpRv0YbSOLAMQB8NyccL3S0/dwn4MBpptze3YeQ4LBjRFG4HCMT?=
 =?us-ascii?Q?G3778EiJvMGMBvX+LsIHuhGx4EEW1BZAIogDbTj5YuJMiMUrj8SuZpzqJArC?=
 =?us-ascii?Q?XxFHGbBNUC83+YC+x3sTnMwWV7GBllzr7ZrCt79NUdGZUUHMDgixH7dDD3pH?=
 =?us-ascii?Q?RIb2mcHBfZ7AMFwT4Gau0B5hYqLmmrFjnquSWaIBLv71BjEw6vc3ofW5BUUt?=
 =?us-ascii?Q?fn8lU2M3Q6KN1ak3lwzfU7b3xbUERqImBKrvnyR3zmmDQa5UehYTHsOui7jm?=
 =?us-ascii?Q?dQASlPjdWqlLo+lqY0aV3NeYSrvoAauTmclFb/RmBED3DlVpbnr9hwTzDoul?=
 =?us-ascii?Q?VqWrHnIO/gvJK7hdq9iuQSv2Ist9yQcbUU3MAa8Af+GPWnog6OEGvEQADOuV?=
 =?us-ascii?Q?QkxgdWMQ/PVHioxOejwx9hF3M84tSdXzLGmvUP4cK6ckWLFOWe7vIDQvbWyE?=
 =?us-ascii?Q?17SgFPsyWb3j5H814S3ofb1kMyF7pEZZQvvQi5uxuvfwuNGLR/fVa91ccb0t?=
 =?us-ascii?Q?xiLlTsDUOAiJayoXwIwrlu+jSyP3RkW0r29onP/Zcy6kqTlaDQSdqWYR035G?=
 =?us-ascii?Q?9wtZfQGGn463bxrXeny5sHicvfmgF3nW36zivanaBZM9rwSSahv3Jtu2u5Ap?=
 =?us-ascii?Q?CwbpaAy4WaUWiya95C2z9totob+sg0Nbh/MY5kwS1+8JH2knoOP9+7juq1kT?=
 =?us-ascii?Q?edrLybvsIOGuC4ZseJbh10agI9WTLM2qWcd3Qgn8vICww7e5oBZvkqYhxDuc?=
 =?us-ascii?Q?nS9ZLqPXDLSwuqftIz232GNFKeKM/rsv4lkCq9+XqUPo3OlrEPgKNyBpiyT+?=
 =?us-ascii?Q?qDATt3Cj92V7aByZVX5OfoIA36va/VN91Ky18dTAaS3SY22qefB4L/KZbmky?=
 =?us-ascii?Q?BlKh9ueKts6V/QuL6tAuUH+ZsFx46TwLQjKCo8aXyGlx+IUySVydnbj/kXgk?=
 =?us-ascii?Q?3McP7/NPvLh9KXXWFfXhPnks3RJS6nlmAxS3p6RjHAlBtbdB4V6DT7imUhCS?=
 =?us-ascii?Q?A4YISA7v8twzC1IzvXrAh2CPpIfyL2Tfmu75Ecc+rZtT5/qQFfEqSBuJOQTZ?=
 =?us-ascii?Q?ZOVTAfv+2rSQgXjt5xeTte/ElgAUC+UGlH8vP+W+5e05kbl5JkP0ZTPxouT+?=
 =?us-ascii?Q?eTwiMHncb6+H6sIvWBVfC1lq520ufj7moT0KDXsbdpD/aJPhSubndbO6McwF?=
 =?us-ascii?Q?+rLL7AmI2tnVeGjohhj3g/7hWbP2ZNg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d02ae264-fc3e-467c-54a4-08df47244a5d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 16:35:30.2601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYjhp3Oee/mrPI3EUR6PT8FX5bDAyQzjBV/rHjpK6Qbv5wY4YDSnJWz8u0c0pgUfFi47fnVC2ERT8/XALPWEGgFnAodAOZnv4oIqoOTc1xY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAAPR03MB282009
X-purgate-ID: tlsNG-c201ff/1795192566-F70B22A1-FD4BB644/0/0
X-purgate-type: clean
X-purgate-size: 4576
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When V_INTR_MASKING=0, reads return the value in the APIC TPR and writes
update the value in the APIC TPR and the V_TPR.

To implement this for Nested SVM, intercept reads and writes of CR8 when
V_INTR_MASKING=0. For reads, simply return the value in Xen's emulated
APIC. For writes, update the value in the emulated APIC as well as
VMCB(0-2)'s V_TPR.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/emulate.c       |  1 +
 xen/arch/x86/hvm/hvm.c           |  1 +
 xen/arch/x86/hvm/svm/nestedsvm.c |  3 +++
 xen/arch/x86/hvm/svm/svm.c       | 30 ++++++++++++++++++------------
 xen/arch/x86/hvm/vmx/vmx.c       |  4 ++++
 5 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index cd2831d34b44..57e1fa7e5a2a 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2376,6 +2376,7 @@ static int cf_check hvmemul_write_cr(
         }
 
         vlapic_set_reg(vcpu_vlapic(curr), APIC_TASKPRI, val << 4);
+        hvm_update_guest_cr(curr, 8);
         rc = X86EMUL_OKAY;
         break;
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4334ff678d34..6a2a76339be1 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2205,6 +2205,7 @@ int hvm_mov_to_cr(unsigned int cr, unsigned int gpr)
 
     case 8:
         vlapic_set_reg(vcpu_vlapic(curr), APIC_TASKPRI, ((val & 0x0f) << 4));
+        hvm_update_guest_cr(curr, cr);
         rc = X86EMUL_OKAY;
         break;
 
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 366178ff54a7..eeb9363dc061 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -394,6 +394,9 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
 
     n2vmcb->_cr_intercepts =
         n1vmcb->_cr_intercepts | ns_vmcb->_cr_intercepts;
+    if ( !svm->ns_hostflags.vintrmask )
+        n2vmcb->_cr_intercepts |=
+            CR_INTERCEPT_CR8_READ | CR_INTERCEPT_CR8_WRITE;
     n2vmcb->_dr_intercepts =
         n1vmcb->_dr_intercepts | ns_vmcb->_dr_intercepts;
     n2vmcb->_exception_intercepts =
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index bfca1eda4af5..1043f4a988a8 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -104,6 +104,15 @@ static void cf_check svm_cpu_down(void)
     write_efer(read_efer() & ~EFER_SVME);
 }
 
+static void svm_update_tpr(struct vmcb *vmcb, struct vlapic *vlapic)
+{
+    /* Reflect the vlapic's TPR in the hardware vtpr */
+    vintr_t intr = vmcb_get_vintr(vmcb);
+
+    intr.tpr = (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0xFF) >> 4;
+    vmcb_set_vintr(vmcb, intr);
+}
+
 static void cf_check svm_update_guest_cr(
     struct vcpu *v, unsigned int cr, unsigned int flags)
 {
@@ -170,6 +179,13 @@ static void cf_check svm_update_guest_cr(
 
         vmcb_set_cr4(vmcb, value);
         break;
+
+    case 8:
+        if ( nestedhvm_vcpu_in_guestmode(v) &&
+             !vcpu_nestedsvm(v).ns_hostflags.vintrmask )
+            svm_update_tpr(vmcb, vcpu_vlapic(v));
+        break;
+
     default:
         BUG();
     }
@@ -959,14 +975,7 @@ static void noreturn cf_check svm_do_resume(void)
     }
 
     if ( !vcpu_guestmode && !vlapic_hw_disabled(vlapic) )
-    {
-        vintr_t intr;
-
-        /* Reflect the vlapic's TPR in the hardware vtpr */
-        intr = vmcb_get_vintr(vmcb);
-        intr.tpr = (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0xFF) >> 4;
-        vmcb_set_vintr(vmcb, intr);
-    }
+        svm_update_tpr(vmcb, vlapic);
 
     hvm_do_resume(v);
 
@@ -3069,10 +3078,7 @@ void asmlinkage svm_vmexit_handler(void)
     if ( vcpu_guestmode || vlapic_hw_disabled(vlapic) )
         return;
 
-    /* The exit may have updated the TPR: reflect this in the hardware vtpr */
-    intr = vmcb_get_vintr(vmcb);
-    intr.tpr = (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0xFF) >> 4;
-    vmcb_set_vintr(vmcb, intr);
+    svm_update_tpr(vmcb, vlapic);
 }
 
 /*
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 3c7374a9ff42..53d50a1bb329 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1874,6 +1874,10 @@ static void cf_check vmx_update_guest_cr(
             hvm_asid_flush_vcpu(v);
         break;
 
+    case 8:
+        /* Nothing to do */
+        break;
+
     default:
         BUG();
     }
-- 
2.56.0


