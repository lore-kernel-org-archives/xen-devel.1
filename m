Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78B6C88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 15:13:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417353.1646233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52w5-0007W2-6F; Fri, 11 Sep 2026 15:13:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417353.1646233; Fri, 11 Sep 2026 15:13:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52w5-0007Vr-1o; Fri, 11 Sep 2026 15:13:05 +0000
Received: by outflank-mailman (input) for mailman id 1417353;
 Fri, 11 Sep 2026 15:13:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x52w3-0007SM-AK
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 15:13:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52w2-00EUk4-7s
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 17:13:02 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa41a6f-8faa-0a2a0a5109dd-0a2a4508b546-16
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 17:13:02 +0200
Received: from [52.101.193.13]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa41a7c-f659-0a2a45080019-3465c10d2421-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 17:13:01 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by MWHPR03MB989453.namprd03.prod.outlook.com (2603:10b6:303:2ab::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 15:12:57 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 15:12:57 +0000
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
 b=XACV1Dp/0OXidJjp7aDYt8AQSHc10Iz+JemK114FUHpsQGS4ddsuSWjlQ1J/u2jg7ytmkvMu9iB4vwphZV76TE9CEEMz2swcTtIhAv3MRPCHlZDPzzSr5C7C4lrvwH/Q3HTZCP6yz6g6gKBMokkNSDpREvFact6a1y4HucjMHQoN9Ux0zxJC8oGfDm/B0vRmC0IMv7JbKTGwP/ktW3AVW4sfdKe0uL68snj+kLX/eIIdff+nLE8y7FZ5ae6vFVGuWNpkwepnbpONys+OmuOTte4vf9F9cooREWDTS96CW70zSifTnMFvDPEhQ5fHNVo1+tEqP1DatBosr6mj8Y+kRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Qjj83BN1FMLCqIaOx3847RbdtvdTFxorGBeyNGoUOg=;
 b=fp6BQ9wXXfb5Sf8cmHho9sQMrl3TDWTvFlUZHnG8IU46F/1OzVAcPDywXQXoW0QEeRClkdWrC4JYkNyii4qki17+ToSb9/d6aO7Q0/xzXU627zUFPEfRvG5WhQzK9l2IYzY1NIfnHV4fVwm5gi22Tfe+Cm9vfCJ85ibFzJooffx3XRr8gctSNDxiM0LuS9DL8VplBc6PcGVFGX898EjzJpT6Hxa55YtE/mRsEjZHuA2ndjH0TSRtD4Wc4L4BbxBVCIwbBb4zJla23W9K08N0/M1cd5TYmeHHk9WCO7ASaf/hC3t9dqEp5C9XJJqjH+YF1uDe5PzZCD1+7as7pBkPtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Qjj83BN1FMLCqIaOx3847RbdtvdTFxorGBeyNGoUOg=;
 b=Ooum52/+jj2CZE0Q8gp13yfpRLFcYfOuwXIvMplWUlMXpKW6DwGwVYk4JmtPLP4hq6+RtGrU1IiqDe4VTaYUBbXUkxudpam0Pa/oijKvW/5aojiMeqnHnkyD0TaGjTATseo4mFq7NnihKI7abQOSpKSipxgikjjxouw4bcorefw=
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
Subject: [PATCH v1] x86/svm: Fix VMLOAD/VMSAVE state handling when using nested virt
Date: Fri, 11 Sep 2026 16:12:50 +0100
Message-ID: <20260911151250.1232332-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::7) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|MWHPR03MB989453:EE_
X-MS-Office365-Filtering-Correlation-Id: b6f31031-ffb8-4ac5-09a1-08df1017290d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	VaBuLAIJr0RXPGbd15g/7lBbO7HzWpYWlU3TPIn5SR4a7ZenI3kpzPznfLWq+Isnmrfl7V83QK2AxW6zanhiT6OfbPklvR4zOtlgAipO6a4inWQZ1gufhYJLFC8DluyvOC+RiSY/inEF1xhfLQ1IXlmQJlNZNwYBZwmQusadfEaNF6OT4xs7xD+9Y1FW+t2HBgTPYymJydlmw1wNQ9/yWZiRWftkk2gXlTHQtU8QHX9fEZ7jQpUw9l9hDVoA+tnnJqH9H0FclLogtoFduKeaWRo3E5W72Khzyzj3LD7158xVqm9R4AW8+l6yHUYlVq2x036nSKY6kUb8loEvUFK7ruPiH9uk7WfpJUm4rd1hx67aEnxTWZVzGBAxb6cMeSurdcuqMB9ZiJMpWyXfD4+we+xPjh0hktlWCBqddLED630rIPHmvKopTFBENXIVrWwleUhMp2ad1hxEZ+nXmTCG/kaaqr6u8C+s2vJppa8WZVw0RbTIIzlxlodSCn6+sFFLYMXPHbceHZdjkPO56XRDxOpQN0KY6iPyNr9G/fpaBf0AjRdUpLeRa1LfxecOzGLyPpqZ3OujEGWVsa4w4GkMdIhQE/4oanQigtMZOuSdP7Qb8pqqbssXeUBRvmqJbul98vCph9qlWzkJ9ZLMJZcZisFVRgLrtIUXS8AwHNCIh4g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UQ9iZnZ146qeWj7N5OE5LU5ocjpmpIce7gBonAPLSfDR2oApC9KbA5eva+Xd?=
 =?us-ascii?Q?XwRNZKxJh0JNMFsEFEOYobLB2jw2hEoIO8D+R456ieVYoIjx0sflerocMaAi?=
 =?us-ascii?Q?Mimlj4hMvrXPqs0YJr5QqmILWVy2XWQB2kQBz6Ummb1nKpYt0voWqaEDmMEH?=
 =?us-ascii?Q?l8HCqW9LVCtnkWGFWlcVZInSTa+W44WFuovs9YA/ZjRqzd9UwKlcaBkCoUhj?=
 =?us-ascii?Q?yhn5m8KTAEed0ajGTWCEX/6tzPrPlLc9kwAi06fJNAVnrggvoLBSPU+igNdu?=
 =?us-ascii?Q?3aNOxGp6B/PM3DHCMKMbSPdn7RxbmjbgoxQfrNCg+D/Pl4EYtHlwOh3EG1PK?=
 =?us-ascii?Q?Mj7Ctgq8+E/QDRMXUUEmKMTIVi68/unJyL0WWPkD1XT1hzavuWWXA8KBqTZz?=
 =?us-ascii?Q?cDi6ohuOz6Ofz97yaa0yeaC2z78rvfSaCjhpWf9VheHz/3Ot2GsuUMzSp5jD?=
 =?us-ascii?Q?aZdZyGlDNIIxVc85QdEgGohc9Yx0aT6v8h5y8m5fnDgvoGwp+HE7XfbBHzbz?=
 =?us-ascii?Q?4ffFAMgz4EWY3xXyXyOrjCstTa21JgcWl9bDl29ajXxv6vEJRUL0I4RQbyyu?=
 =?us-ascii?Q?ni/sZuLNrtTcsXsERIrLZMp6b/RMmnybhaTvpQrFxK0YzirOZMFWvN+ynz5i?=
 =?us-ascii?Q?hCoZLdPjacwGiXdQWWC+EnnpZTUzXCsRhmRoxMonLKIJoD0oyhMI+geiTrcd?=
 =?us-ascii?Q?NsUpwl3mTK1Idh9OxU9rJQwhy4QUEHOoQKcYo1oifRPL+gk6UEFXRoCDF6QW?=
 =?us-ascii?Q?cVjN8RFchiULERmg3LuhiMDNbuzGmzAgR67WnQ01Al7NRCPwXiZYuEahrG2/?=
 =?us-ascii?Q?3J9ZQEEK04vfDqfMOGu3IEWgwmYBtxUPCsrw/xLGbTdu31SAEDW4Um0BoxX3?=
 =?us-ascii?Q?0yFzk/eVoaOg172g7YX4nMa8C7dOtOOLzrHKotCMKZbDq44rwY2FrmyH8ieB?=
 =?us-ascii?Q?I+cWBcc+x8bdW0nTcMFjCCS9CbhJm+W4bOZPhDhd7QsvObngcRVcQfSLA88a?=
 =?us-ascii?Q?dtfEXbXwRVLrB6rS3TpYrUd9DU/FDQFE0FAsE/yKj55zlYzyht2QXgd4Qrh6?=
 =?us-ascii?Q?paLCx24pzQ33x0jFLv5vbo1bMqkYmE/he32qIXuLiwJQLs0WPIiWTTs2afnX?=
 =?us-ascii?Q?auye87miaHf8PqnVJ+Jj+TntEVrYFQBQCjgUpDWzsziIJxb55OaH7K1KqDMa?=
 =?us-ascii?Q?aSY3XgsulQxHSYuhBO4oCKAlfAUwtT6CpZULG7LTnbNMY0TPe9n3GMWMHLBd?=
 =?us-ascii?Q?3dHoDP4i8iluxfqKsROpMb14DU/ZQTVkD6PGXKSu6jugu+ceuiKlMYV92YRd?=
 =?us-ascii?Q?6+3+JTtAMjQz4mr3av6eeLe++3uJQVKnX5nR5KqVF1k5JHgm2VA2utDGoP1x?=
 =?us-ascii?Q?Q19/z3Xt73RA5CeP3Rdd6Bf/I3cMUtFzaaREL4QECNSoigItH8SxRb3v0Ngk?=
 =?us-ascii?Q?/V/Z31KcV12WZqWUHwGoU/3SZ9VySPwRhdNsSc8Vsp06a7E8YkcSz4yGttjR?=
 =?us-ascii?Q?+wQtZ335ATUSMWEjsmiDQ/YTlu5i1iNcGMXq1TPCK+a3W69WU8eMlc34A1Mj?=
 =?us-ascii?Q?xe3+qGASc38Bb56EQB26V40vXd3arYRQIxVe12Iq6ayXivfrBou5Nnl4gqds?=
 =?us-ascii?Q?NEBZyce64CdbfkTomuiwP8cnx9MYmIyDpEH0SvmX+xQZCPaUfGn7pKrZ1SLH?=
 =?us-ascii?Q?IHUcVfWjk1zF+kx3sbV47OfOIPCsyRGlIr9QkQt+1PjfafrwbQhaHxDv6M6E?=
 =?us-ascii?Q?74VdKcC7+UeUjG2et5O+rgkRgBwQBNU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f31031-ffb8-4ac5-09a1-08df1017290d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:12:56.9968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDHAQinmeCuL/EpaISjzfHCPIEzIcygQvo/jkImzJXvr/ZYzWVB9Rw8gxz7HiloQYq6YXsvMAmnNAA+z80XQ4HtjiRx3ZNeVjv1XNi/lZMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB989453
X-purgate-ID: tlsNG-c1860d/1789139582-D775B87B-322BD34C/0/0
X-purgate-type: clean
X-purgate-size: 16702

Currently, the SVM VMLOAD/VMSAVE state handling always uses the vCPU's
active VMCB to load/store the state. The active VMCB changes depending
on whether or not the vCPU is in guest mode yet the state is not
properly copied between VMCB(0-1) and VMCB(0-2) nor is the
vmcb_sync_state updated when switching active VMCB.

The most common way this fails is when context switching to a vCPU in
guest mode and immediately taking a VMEXIT (e.g. due to an interrupt for
L1 having arrived in the meantime). The code issues an unconditional
VMSAVE into VMCB(0-1) but the state has not yet been loaded since
context switching which results in garbage in VMCB(0-1). The garbage
state is then (re-)loaded from VMCB(0-1) shortly before VMRUN. This
results in frequent, random crashes in L2.

Since the state covered by VMLOAD/VMSAVE is a property of the vCPU and
is not affected by switches to and from guest mode, always use VMCB(0-1)
to store and retrieve it. This avoids the need to synchronize state
between VMCBs and fixes the random crashes. L1 itself is responsible for
using VMLOAD/VMSAVE to load/save the state from hardware into its own
VMCB(1-2) and this change does not affect that.

Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c |   7 --
 xen/arch/x86/hvm/svm/svm.c       | 107 +++++++++++++++++--------------
 xen/arch/x86/hvm/svm/vmcb.c      |  26 ++++----
 xen/arch/x86/hvm/svm/vmcb.h      |   3 +-
 4 files changed, 75 insertions(+), 68 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 5adb1bd72c4d..c2250b85cf28 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -198,11 +198,6 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
     ASSERT(n1vmcb != NULL);
     ASSERT(n2vmcb != NULL);
 
-    /*
-     * nsvm_vmcb_prepare4vmexit() already saved register values
-     * handled by VMSAVE/VMLOAD into n1vmcb directly.
-     */
-
     /* switch vmcb to l1 guest's vmcb */
     v->arch.hvm.svm.vmcb = n1vmcb;
     v->arch.hvm.svm.vmcb_pa = nv->nv_n1vmcx_pa;
@@ -969,8 +964,6 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     struct vmcb_struct *ns_vmcb = nv->nv_vvmcx;
     struct vmcb_struct *n2vmcb = nv->nv_n2vmcx;
 
-    svm_vmsave_pa(nv->nv_n1vmcx_pa);
-
     /* Cache guest physical address of virtual vmcb
      * for VMCB Cleanbit emulation.
      */
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 5f5d903d872d..50822eebd7cf 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -444,30 +444,30 @@ static int svm_vmcb_restore(struct vcpu *v, struct hvm_hw_cpu *c)
 
 static void svm_save_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *n1_vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
 
-    data->sysenter_cs      = vmcb->sysenter_cs;
-    data->sysenter_esp     = vmcb->sysenter_esp;
-    data->sysenter_eip     = vmcb->sysenter_eip;
-    data->shadow_gs        = vmcb->kerngsbase;
-    data->msr_lstar        = vmcb->lstar;
-    data->msr_star         = vmcb->star;
-    data->msr_cstar        = vmcb->cstar;
-    data->msr_syscall_mask = vmcb->sfmask;
+    data->sysenter_cs      = n1_vmcb->sysenter_cs;
+    data->sysenter_esp     = n1_vmcb->sysenter_esp;
+    data->sysenter_eip     = n1_vmcb->sysenter_eip;
+    data->shadow_gs        = n1_vmcb->kerngsbase;
+    data->msr_lstar        = n1_vmcb->lstar;
+    data->msr_star         = n1_vmcb->star;
+    data->msr_cstar        = n1_vmcb->cstar;
+    data->msr_syscall_mask = n1_vmcb->sfmask;
 }
 
 static void svm_load_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *n1_vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
 
-    vmcb->lstar        = data->msr_lstar;
-    vmcb->star         = data->msr_star;
-    vmcb->cstar        = data->msr_cstar;
-    vmcb->sfmask       = data->msr_syscall_mask;
-    vmcb->kerngsbase   = data->shadow_gs;
-    vmcb->sysenter_cs  = data->sysenter_cs;
-    vmcb->sysenter_esp = data->sysenter_esp;
-    vmcb->sysenter_eip = data->sysenter_eip;
+    n1_vmcb->lstar        = data->msr_lstar;
+    n1_vmcb->star         = data->msr_star;
+    n1_vmcb->cstar        = data->msr_cstar;
+    n1_vmcb->sfmask       = data->msr_syscall_mask;
+    n1_vmcb->kerngsbase   = data->shadow_gs;
+    n1_vmcb->sysenter_cs  = data->sysenter_cs;
+    n1_vmcb->sysenter_esp = data->sysenter_esp;
+    n1_vmcb->sysenter_eip = data->sysenter_eip;
     v->arch.hvm.guest_efer = data->msr_efer;
     svm_update_guest_efer(v);
 }
@@ -579,18 +579,19 @@ static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
 void svm_sync_vmcb(struct vcpu *v, enum vmcb_sync_state new_state)
 {
     struct svm_vcpu *svm = &v->arch.hvm.svm;
+    struct nestedvcpu *nv = &vcpu_nestedhvm(v);
 
     if ( new_state == vmcb_needs_vmsave )
     {
         if ( svm->vmcb_sync_state == vmcb_needs_vmload )
-            svm_vmload_pa(svm->vmcb_pa);
+            svm_vmload_pa(nv->nv_n1vmcx_pa);
 
         svm->vmcb_sync_state = new_state;
     }
     else
     {
         if ( svm->vmcb_sync_state == vmcb_needs_vmsave )
-            svm_vmsave_pa(svm->vmcb_pa);
+            svm_vmsave_pa(nv->nv_n1vmcx_pa);
 
         if ( svm->vmcb_sync_state != vmcb_needs_vmload )
             svm->vmcb_sync_state = new_state;
@@ -606,6 +607,7 @@ static void cf_check svm_get_segment_register(
     struct vcpu *v, enum x86_segment seg, struct segment_register *reg)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *n1_vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
 
     ASSERT((v == current) || !vcpu_runnable(v));
 
@@ -613,8 +615,9 @@ static void cf_check svm_get_segment_register(
     {
     case x86_seg_fs ... x86_seg_gs:
         svm_sync_vmcb(v, vmcb_in_sync);
+        *reg = n1_vmcb->sreg[seg];
+        break;
 
-        /* Fallthrough. */
     case x86_seg_es ... x86_seg_ds:
         *reg = vmcb->sreg[seg];
 
@@ -624,7 +627,7 @@ static void cf_check svm_get_segment_register(
 
     case x86_seg_tss:
         svm_sync_vmcb(v, vmcb_in_sync);
-        *reg = vmcb->tr;
+        *reg = n1_vmcb->tr;
         break;
 
     case x86_seg_gdt:
@@ -637,7 +640,7 @@ static void cf_check svm_get_segment_register(
 
     case x86_seg_ldt:
         svm_sync_vmcb(v, vmcb_in_sync);
-        *reg = vmcb->ldtr;
+        *reg = n1_vmcb->ldtr;
         break;
 
     default:
@@ -652,6 +655,7 @@ static void cf_check svm_set_segment_register(
     struct vcpu *v, enum x86_segment seg, struct segment_register *reg)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *n1_vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
 
     ASSERT((v == current) || !vcpu_runnable(v));
 
@@ -690,12 +694,16 @@ static void cf_check svm_set_segment_register(
 
         /* Fallthrough */
     case x86_seg_es ... x86_seg_cs:
-    case x86_seg_ds ... x86_seg_gs:
+    case x86_seg_ds:
         vmcb->sreg[seg] = *reg;
         break;
 
+    case x86_seg_fs ... x86_seg_gs:
+        n1_vmcb->sreg[seg] = *reg;
+        break;
+
     case x86_seg_tss:
-        vmcb->tr = *reg;
+        n1_vmcb->tr = *reg;
         break;
 
     case x86_seg_gdt:
@@ -709,7 +717,7 @@ static void cf_check svm_set_segment_register(
         break;
 
     case x86_seg_ldt:
-        vmcb->ldtr = *reg;
+        n1_vmcb->ldtr = *reg;
         break;
 
     case x86_seg_sys:
@@ -1665,6 +1673,7 @@ static int cf_check svm_msr_read_intercept(
     struct vcpu *v = current;
     const struct domain *d = v->domain;
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *n1_vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
     const struct nestedsvm *nsvm = &vcpu_nestedsvm(v);
     uint64_t tmp;
 
@@ -1687,43 +1696,43 @@ static int cf_check svm_msr_read_intercept(
     switch ( msr )
     {
     case MSR_IA32_SYSENTER_CS:
-        *msr_content = vmcb->sysenter_cs;
+        *msr_content = n1_vmcb->sysenter_cs;
         break;
 
     case MSR_IA32_SYSENTER_ESP:
-        *msr_content = vmcb->sysenter_esp;
+        *msr_content = n1_vmcb->sysenter_esp;
         break;
 
     case MSR_IA32_SYSENTER_EIP:
-        *msr_content = vmcb->sysenter_eip;
+        *msr_content = n1_vmcb->sysenter_eip;
         break;
 
     case MSR_STAR:
-        *msr_content = vmcb->star;
+        *msr_content = n1_vmcb->star;
         break;
 
     case MSR_LSTAR:
-        *msr_content = vmcb->lstar;
+        *msr_content = n1_vmcb->lstar;
         break;
 
     case MSR_CSTAR:
-        *msr_content = vmcb->cstar;
+        *msr_content = n1_vmcb->cstar;
         break;
 
     case MSR_SYSCALL_MASK:
-        *msr_content = vmcb->sfmask;
+        *msr_content = n1_vmcb->sfmask;
         break;
 
     case MSR_FS_BASE:
-        *msr_content = vmcb->fs.base;
+        *msr_content = n1_vmcb->fs.base;
         break;
 
     case MSR_GS_BASE:
-        *msr_content = vmcb->gs.base;
+        *msr_content = n1_vmcb->gs.base;
         break;
 
     case MSR_SHADOW_GS_BASE:
-        *msr_content = vmcb->kerngsbase;
+        *msr_content = n1_vmcb->kerngsbase;
         break;
 
     case MSR_IA32_MCx_MISC(4): /* Threshold register */
@@ -1856,6 +1865,7 @@ static int cf_check svm_msr_write_intercept(
     struct vcpu *v = current;
     struct domain *d = v->domain;
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *n1_vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
     struct nestedsvm *nsvm = &vcpu_nestedsvm(v);
 
     switch ( msr )
@@ -1889,45 +1899,45 @@ static int cf_check svm_msr_write_intercept(
         switch ( msr )
         {
         case MSR_IA32_SYSENTER_ESP:
-            vmcb->sysenter_esp = msr_content;
+            n1_vmcb->sysenter_esp = msr_content;
             break;
 
         case MSR_IA32_SYSENTER_EIP:
-            vmcb->sysenter_eip = msr_content;
+            n1_vmcb->sysenter_eip = msr_content;
             break;
 
         case MSR_LSTAR:
-            vmcb->lstar = msr_content;
+            n1_vmcb->lstar = msr_content;
             break;
 
         case MSR_CSTAR:
-            vmcb->cstar = msr_content;
+            n1_vmcb->cstar = msr_content;
             break;
 
         case MSR_FS_BASE:
-            vmcb->fs.base = msr_content;
+            n1_vmcb->fs.base = msr_content;
             break;
 
         case MSR_GS_BASE:
-            vmcb->gs.base = msr_content;
+            n1_vmcb->gs.base = msr_content;
             break;
 
         case MSR_SHADOW_GS_BASE:
-            vmcb->kerngsbase = msr_content;
+            n1_vmcb->kerngsbase = msr_content;
             break;
         }
         break;
 
     case MSR_IA32_SYSENTER_CS:
-        vmcb->sysenter_cs = msr_content;
+        n1_vmcb->sysenter_cs = msr_content;
         break;
 
     case MSR_STAR:
-        vmcb->star = msr_content;
+        n1_vmcb->star = msr_content;
         break;
 
     case MSR_SYSCALL_MASK:
-        vmcb->sfmask = msr_content;
+        n1_vmcb->sfmask = msr_content;
         break;
 
     case MSR_IA32_DEBUGCTLMSR:
@@ -2333,6 +2343,7 @@ static bool cf_check svm_get_pending_event(
 static uint64_t cf_check svm_get_reg(struct vcpu *v, unsigned int reg)
 {
     struct vcpu *curr = current;
+    struct vmcb_struct *n1_vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
     const struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     struct domain *d = v->domain;
 
@@ -2344,7 +2355,7 @@ static uint64_t cf_check svm_get_reg(struct vcpu *v, unsigned int reg)
     case MSR_SHADOW_GS_BASE:
         if ( v == curr )
             svm_sync_vmcb(v, vmcb_in_sync);
-        return vmcb->kerngsbase;
+        return n1_vmcb->kerngsbase;
 
     default:
         printk(XENLOG_G_ERR "%s(%pv, 0x%08x) Bad register\n",
@@ -2617,7 +2628,7 @@ void asmlinkage svm_vmexit_handler(void)
     if ( unlikely(exit_reason == VMEXIT_INVALID) )
     {
         gdprintk(XENLOG_ERR, "invalid VMCB state:\n");
-        svm_vmcb_dump(__func__, vmcb);
+        svm_vmcb_dump(__func__, v, vmcb);
         domain_crash(v->domain);
         goto out;
     }
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 975a1eaef806..6e2a45ff3c4b 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -243,16 +243,17 @@ static void svm_dump_sel(const char *name, const struct segment_register *s)
            name, s->sel, s->attr, s->limit, s->base);
 }
 
-void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
+void svm_vmcb_dump(const char *from, struct vcpu *v,
+                   const struct vmcb_struct *vmcb)
 {
-    struct vcpu *curr = current;
+    struct vmcb_struct *n1_vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
 
     /*
      * If we are dumping the VMCB currently in context, some guest state may
      * still be cached in hardware.  Retrieve it.
      */
-    if ( vmcb == curr->arch.hvm.svm.vmcb )
-        svm_sync_vmcb(curr, vmcb_in_sync);
+    if ( v == current )
+        svm_sync_vmcb(v, vmcb_in_sync);
 
     printk("Dumping guest's current state at %s...\n", from);
     printk("Size of VMCB = %zu, paddr = %"PRIpaddr", vaddr = %p\n",
@@ -286,7 +287,8 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
     printk("virtual vmload/vmsave = %d, virt_ext = %#"PRIx64"\n",
            vmcb->virt_ext.fields.vloadsave_enable, vmcb->virt_ext.bytes);
     printk("cpl = %d efer = %#"PRIx64" star = %#"PRIx64" lstar = %#"PRIx64"\n",
-           vmcb_get_cpl(vmcb), vmcb_get_efer(vmcb), vmcb->star, vmcb->lstar);
+           vmcb_get_cpl(vmcb), vmcb_get_efer(vmcb), n1_vmcb->star,
+           n1_vmcb->lstar);
     printk("CR0 = 0x%016"PRIx64" CR2 = 0x%016"PRIx64"\n",
            vmcb_get_cr0(vmcb), vmcb_get_cr2(vmcb));
     printk("CR3 = 0x%016"PRIx64" CR4 = 0x%016"PRIx64"\n",
@@ -298,9 +300,9 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
     printk("DR6 = 0x%016"PRIx64", DR7 = 0x%016"PRIx64"\n",
            vmcb_get_dr6(vmcb), vmcb_get_dr7(vmcb));
     printk("CSTAR = 0x%016"PRIx64" SFMask = 0x%016"PRIx64"\n",
-           vmcb->cstar, vmcb->sfmask);
+           n1_vmcb->cstar, n1_vmcb->sfmask);
     printk("KernGSBase = 0x%016"PRIx64" PAT = 0x%016"PRIx64"\n",
-           vmcb->kerngsbase, vmcb_get_g_pat(vmcb));
+           n1_vmcb->kerngsbase, vmcb_get_g_pat(vmcb));
     printk("SSP = 0x%016"PRIx64" S_CET = 0x%016"PRIx64" ISST = 0x%016"PRIx64"\n",
            vmcb->_ssp, vmcb->_msr_s_cet, vmcb->_msr_isst);
     printk("H_CR3 = 0x%016"PRIx64" CleanBits = %#x\n",
@@ -312,12 +314,12 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
     svm_dump_sel("  DS", &vmcb->ds);
     svm_dump_sel("  SS", &vmcb->ss);
     svm_dump_sel("  ES", &vmcb->es);
-    svm_dump_sel("  FS", &vmcb->fs);
-    svm_dump_sel("  GS", &vmcb->gs);
+    svm_dump_sel("  FS", &n1_vmcb->fs);
+    svm_dump_sel("  GS", &n1_vmcb->gs);
     svm_dump_sel("GDTR", &vmcb->gdtr);
-    svm_dump_sel("LDTR", &vmcb->ldtr);
+    svm_dump_sel("LDTR", &n1_vmcb->ldtr);
     svm_dump_sel("IDTR", &vmcb->idtr);
-    svm_dump_sel("  TR", &vmcb->tr);
+    svm_dump_sel("  TR", &n1_vmcb->tr);
 }
 
 bool svm_vmcb_isvalid(
@@ -418,7 +420,7 @@ static void cf_check vmcb_dump(unsigned char ch)
                 continue;
             }
             printk("\tVCPU %d\n", v->vcpu_id);
-            svm_vmcb_dump("key_handler", v->arch.hvm.svm.vmcb);
+            svm_vmcb_dump("key_handler", v, v->arch.hvm.svm.vmcb);
 
             process_pending_softirqs();
         }
diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index 3760f71a8625..2bae45e41971 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -563,7 +563,8 @@ int  svm_create_vmcb(struct vcpu *v);
 void svm_destroy_vmcb(struct vcpu *v);
 
 void setup_vmcb_dump(void);
-void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb);
+void svm_vmcb_dump(const char *from, struct vcpu *v,
+                   const struct vmcb_struct *vmcb);
 bool svm_vmcb_isvalid(const char *from, const struct vmcb_struct *vmcb,
                       const struct vcpu *v, bool verbose);
 
-- 
2.53.0


