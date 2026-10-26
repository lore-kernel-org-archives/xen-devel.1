Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E0A606A31E
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 07:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=ZuJSp850
Received: from list by lists.xenproject.org with outflank-mailman.1460796.1671661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLEym-0004wq-JQ; Mon, 26 Oct 2026 07:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460796.1671661; Mon, 26 Oct 2026 07:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLEym-0004vm-EP; Mon, 26 Oct 2026 07:18:48 +0000
Received: by outflank-mailman (input) for mailman id 1460796;
 Mon, 26 Oct 2026 07:18:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xLEyk-0004pP-RB
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 07:18:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLEyk-00FZ5v-7b
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 08:18:46 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6adefeca-8faa-0a2a0a5109dd-0a2a4502b5b0-42
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:18:46 +0100
Received: from [40.107.201.50]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6adefed4-6ca4-0a2a45020019-286bc93271f9-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:18:46 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by MN6PR03MB7549.namprd03.prod.outlook.com
 (2603:10b6:208:4ff::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 07:18:42 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 07:18:42 +0000
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
 b=saGmxlO/jijHtQxfsdP0nnqaWw2U0j0xnwwZnjwtC+gzRkaz1r3Ja9fCey2cSwT79WuJnGYKi5DD0gcSJgqGzU1qWMia9F08jTko8aCdrKw+I0pLonkVlyMzIF6+yceuip/vffaNptCb5oLdO/NUvg4OkDqQmc520siHSWCq0sKHjn84dW6y4cGWoRIt5NED0GYTYkER5Vyk0Bz5VmjxEliYb/5QsZYGwLD1qeNTeYOx5Rfk+TSKHHteTEwf6clDh6/LVzspgewieyrySuFOXwtEpBOLXkppvhVH2nNJLD/4y8XmlROO4K1baQApDA9dmO5Z9L3SsXfKVRAJ8VezyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Qm6MOAPPFM5h91qqxn9EYsE3cBuyr47YCYET4IV7cU=;
 b=d0wQ3QqQ5g/S7uMZf658oWfRYeUJSs7/vKWo4nTBgxQsxYYTGwQ0NXzS6j4yZaT8yFlqCuqHSmsZZGR/E9uFHU3CyolyDyVdRSKcRTeoFpuVR3Opm/JYsURpmcoa1TzMuKILIwr3mcdMkLnH0RaE5QuHZ+BPSTPBPACnbMK/mVkUEW5Wy33PoEf3nubMeFFQ22Z+HEHwGZzmlYuBkKSH4C9suV+01Sy9UMh6J7QgkslJK40gJKy44YnZ+7tNj4WsX4PM07c6HdhMg6Xhyo+lb6Tp5lIT2Cs7A7Sf510rgjWe/OoAbLa6gxfPwNsArFED808YeG6c1oSSMCQ8L+U/qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Qm6MOAPPFM5h91qqxn9EYsE3cBuyr47YCYET4IV7cU=;
 b=ZuJSp850ft+NREVzdl4QUktV+cFJtK2NOlPu0+UQzXvCZ1AOkJ1lm8q3wBGxzVS5xnBFD1eOURjHmLbgXmp/VW/DARTpfDUF3iWUXpwwr0SIy2rGmaEcYrZlgbcJJ44mmUfYlHLrolysMkjFcj2jWRiAQvYOxA2nzs70a7ovRog=
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
	Chunjie Zhu <chunjie.zhu@citrix.com>
Subject: [PATCH V1 4/8] x86/nestedvmx: Reflect EPT holes hit during L2 emulation to L1
Date: Mon, 26 Oct 2026 15:17:50 +0800
Message-Id: <a43e139655fe243a56e6973c30c935ed255244b5.1792997742.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792997742.git.chunjie.zhu@citrix.com>
References: <cover.1792997742.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0212.apcprd04.prod.outlook.com
 (2603:1096:4:187::8) To LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|MN6PR03MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aeb2e05-d079-49ea-4ad6-08df33315d1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|11063799006|56012099006|261021121427099003|261021123027099003|261022105027099003|261022075727099003|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ihXSyr5M3WE8fkRh9Ix9XOOj8ejOkei9Dl0wxB5Yrqh0HisvudE1Rrcy84S0vJDufkcDBA1WXA+ZjXBGQBhLVZhQeuF0i8POqme5vj3hURwAGsWsrcoLy/uCXX6CFjU/NSDn2E2gu6HQADQ7a6ZXJXPfF+KMM069QtMzNHYtX3gfR+JTpcVlZSUjjOCi9wuvWgIUN2m0L+hHw4mj9NbpbjOhSjWIxdozzzpAfdrKH9b6gPuvzHi02IRrd1IeePNsFFQoFP+pcUWpnvUAUIExN1HLq3j1V6LqWR+518m14bugPStrw1D12pR877QQn7tV9z8Z4kktCwFKy8+PsYz62LlBS0+e1AHx/YMgHiPm0mU+kmmOMPjf3gp/nEXEDJ92ofL8VIGkRk+TYiLmqG2FThZzIAPZXKeO/ixLnDwKWEO1eizdVgH6fqzKItR8H/5tQBGzRk3Pn9vh7gAwyyXzRsx5Unt01Ewrv+7uwXBtNYVVTftuvdiKXLCC89ncbvJKRBWY+rNbGjvA8RMwd1IThnl2BMot79lbPeizmoRC8Ju18NYEZXfvCHLVZ2g2+hHRYGIOHHMnl4GAQSHdHA6y3caySFDfixmmM+yJsMi6o9j/kMn6yozTTg5HMC3rG3NJVf6I7aIPJrB1JP8mgodi2CGnY7Dtvk04h4gsl+P2TFw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uyGE8AEcHqhFNwDBbn4si4A8WfzOSJ5TZBRKrxk6jIUQGy0QRGJRALZ3lRKy?=
 =?us-ascii?Q?jHysNMDZW4DLl7RO5ZSji2CSI/IQd6/QolXqCPn2MwbesAvib4hgqNSr780I?=
 =?us-ascii?Q?RYptBG//LVLktabTWMWvxUdq+XjeCZCqO8fi61TKJlWffsuGh/FL0Nbh1ca8?=
 =?us-ascii?Q?z3PeSP2BCGd7yBYMCewZ7mDYh2xAJw5HQtBGzCNMlnhMkCzOhoz/dSghLaxk?=
 =?us-ascii?Q?upywpdH15qsyr7E9euZ5ZbYy3Bjtpvvj01iIXXP4gwk6mbMXETi8Z3USt3KW?=
 =?us-ascii?Q?zV9gXSfafkzIZULodB7YgLDz+bbDG8extK5UWPZ2ONKClA8L+U4EWry8Zn96?=
 =?us-ascii?Q?mA+Elw9Vmb7nRbIkCJZjG1GJaVy821QWA4KkNhzM3fQXopGE6EXgCO573ilm?=
 =?us-ascii?Q?/UgUtYn3PpVeoO2ght/JZpmcEjs8IT+1BqeUgoGQSaT7kO+XoXyQb16qQKZL?=
 =?us-ascii?Q?nE0y9+g3O/6qHuHD86iLNPHBN7z8tNIT1L06BF21oNXjgQOSDdfJzl+Q2z8R?=
 =?us-ascii?Q?UCi91dsUITFblz+q2bSJG1iGGanl2+OiSOOBFgr/o+XrE5AvJvZ2YjczmD/u?=
 =?us-ascii?Q?CzBgyyZjBZIqtP+rPb3Sw6m4KWHogI4OFX7qCJKT2ForEYeLyWe5rJ2G5ZL2?=
 =?us-ascii?Q?9iXhNT4dT4cnDVfPf1ok1WHncWbPRII0j817ZKpx/yD7Cvic1LwqJ1/yTmT5?=
 =?us-ascii?Q?TKs2rUfkb53+mtQ014qdsdKN0MbgfFntkO1yeeEj5eUt7g5gs7JKTV+9BFWS?=
 =?us-ascii?Q?MCrW73r5JuNOPyiAZW9BDnAr5e6GJ/bZluXT2k++TM87vQuhc9st6ev/RyGw?=
 =?us-ascii?Q?lQfTi8ccMkPS26hnt8sZX0c9zSDOjOGWpMQC1Ymkgdmw8CbfAXuTnnQ+dQi9?=
 =?us-ascii?Q?fiO+DJ+vG6zbHEASdairQacj2qWSiXOAH8eMfE63sikiHstzkHUose+C1y7d?=
 =?us-ascii?Q?nkZMBfsKX+WFnPAZJp3pNURmbj0wSsXAcUy8qRnkiwg+q+QM//VZ49x4eEjR?=
 =?us-ascii?Q?wOSNTY+G7v5Dg3pHYl38u+zcelqkJ7m2cYjFS2V53H6gNUTausMIlSbOzssY?=
 =?us-ascii?Q?TukgRvUuITApLrOf16X/ONNAnLIqvJZBGy6s81/jhAnNPYKzesOyegA4F9R+?=
 =?us-ascii?Q?b/xhFDKrhio8vWQad6DravwsRyDx++zEhXtjKKmgKJAs2Jn0rVicqTeQOlmq?=
 =?us-ascii?Q?NyPBLkXp7HSpvjn/rUWJS6fU45FJE8JhPK905C5Bj/fCKlFPx8XLSg2iUheK?=
 =?us-ascii?Q?UjTitWaj+rjE5yuw8/A4IOQ9dJOKXJFlSTODyJIed4zjyvzZcQbDv0JHa6vj?=
 =?us-ascii?Q?R1yZrKP/wKmSyaCecuCMiEulFFJxXyulV1AGlqrK/QtB5B+XU5XQjuAGWkgR?=
 =?us-ascii?Q?oOE4m3kmGTDkmkEXnernyye4bI4+nL+trkk5kdnzMmFYJXC21FVk5bLThqmr?=
 =?us-ascii?Q?apsxJ6OgkuTOdL/mK4H+oIA5lSCDAO/Mc7hkgWGmMaIR4pnh7qQaj2IIJl9o?=
 =?us-ascii?Q?RK4ibYYa4gcGa0V5SwK6mIPgwWu7FUprvuscS26AoMFbE3Ic/jmMXYrKLIl2?=
 =?us-ascii?Q?jl8xiJh+V921c7IjhzCo+ngibDX6GI67KYx6nJodw96/RbxUnBsESc40LM7J?=
 =?us-ascii?Q?MeMEY2tFj8rCX+XKBwt9OmK35sWLUsjhm6nNW2sxxo4JL+CRhq5aMGECaaHN?=
 =?us-ascii?Q?aztFWuu6IgeC6r2xSuTJB7D7qXz1LniVJWvHs5dy+806088oWOkWtOKCjgvX?=
 =?us-ascii?Q?3G0YkVGAxg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aeb2e05-d079-49ea-4ad6-08df33315d1b
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 07:18:42.1032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LeMCafmupSBSrLGO27tCtWC2tT+4uD4zHkn3JkPvRAzSdrJjOdb27/uyF+XfFKOgP+j4ubsiBT1rWr5OSvSCKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7549
X-purgate-ID: tlsNG-720697/1792999126-30FCE2AC-BB5D2974/0/0
X-purgate-type: clean
X-purgate-size: 5932
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

When L0 emulates an L2 instruction, e.g. a `movs` from MMIO, it
translates the other operand with paging_gva_to_gfn().  For an n2 vCPU
this walks L2's pagetables and then L1's EPT.  If L1's EPT has no
mapping for the resulting L2 GPA, the walk returns
NESTEDHVM_PAGEFAULT_INJECT and paging_gva_to_gfn() returns INVALID_GFN.
The emulator then injects #PF into L2, although L2's own pagetables map
the address.  L2 is blamed for a fault that is L1's to handle.

Reflect the hole to L1 as an EPT violation instead:

 * paging_gva_to_gfn() calls nvmx_reflect_emul_ept_violation() on
   INJECT.  If the current L2 exit is an EPT violation, it records the
   missing GPA and sets nv_vmexit_pending.
 * sync_vvmcs_ro() reports that GPA to L1 as the guest-physical address
   of the violation, together with the exit qualification computed by
   the L1 EPT walk.
 * hvm_inject_event() drops events for L2 while a virtual vmexit to L1
   is pending, so the emulator's #PF does not stay in vmcs02.

L1 can then fix its EPT and resume L2, which re-executes the
instruction.

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
Assisted-by: Claude:claude-sonnet-5
---
 xen/arch/x86/hvm/hvm.c                  |  6 +++++
 xen/arch/x86/hvm/vmx/vvmx.c             | 30 +++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h |  4 ++++
 xen/arch/x86/mm/p2m.c                   |  6 ++++-
 4 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index ef9c7cd05777..b38f8dd68733 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1801,6 +1801,12 @@ void hvm_inject_event(const struct x86_event *event)
         }
     }
 
+    /* L2 is about to exit to L1; an event for L2 would only be lost. */
+    if ( nestedhvm_enabled(curr->domain) &&
+         nestedhvm_vcpu_in_guestmode(curr) &&
+         vcpu_nestedhvm(curr).nv_vmexit_pending )
+        return;
+
     alternative_vcall(hvm_funcs.inject_event, event);
 }
 
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 8d6e0c66f38e..dc8bcbeea033 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1290,7 +1290,12 @@ static void sync_vvmcs_ro(struct vcpu *v)
     {
         set_vvmcs(v, EXIT_QUALIFICATION, nvmx->ept.exit_qual);
         set_vvmcs(v, VM_EXIT_REASON, nvmx->ept.exit_reason);
+
+        if ( nvmx->ept.gpa_valid )
+            set_vvmcs(v, GUEST_PHYSICAL_ADDRESS, nvmx->ept.gpa);
     }
+
+    nvmx->ept.gpa_valid = false;
 }
 
 static void load_vvmcs_host_state(struct vcpu *v)
@@ -2384,6 +2389,31 @@ int cf_check nvmx_hap_walk_L1_p2m(
     return rc;
 }
 
+/*
+ * L0 is emulating an L2 instruction triggered by an EPT violation, and L1's
+ * EPT has a hole for another address the instruction accesses.  Report that
+ * hole to L1 as the EPT violation, instead of blaming L2 with a #PF.  Called
+ * after nvmx_hap_walk_L1_p2m() returned NESTEDHVM_PAGEFAULT_INJECT.
+ */
+bool nvmx_reflect_emul_ept_violation(struct vcpu *v, paddr_t L2_gpa)
+{
+    struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
+    unsigned long reason;
+
+    if ( v != current || !nestedhvm_vcpu_in_guestmode(v) )
+        return false;
+
+    __vmread(VM_EXIT_REASON, &reason);
+    if ( (uint16_t)reason != EXIT_REASON_EPT_VIOLATION )
+        return false;
+
+    nvmx->ept.gpa = L2_gpa;
+    nvmx->ept.gpa_valid = true;
+    vcpu_nestedhvm(v).nv_vmexit_pending = 1;
+
+    return true;
+}
+
 /*
  * As nvmx_hap_walk_L1_p2m(), for a walk of a specific nested p2m that is not
  * tied to a VM exit (e.g. L0 emulation reading L2's pagetables).  There is
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
index 2e0ac5798d5d..92c8a8144527 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
@@ -38,6 +38,9 @@ struct nestedvmx {
         bool     enabled;
         uint32_t exit_reason;
         uint32_t exit_qual;
+        /* Violation raised by L0's emulation, not by the L2 access itself */
+        bool     gpa_valid;
+        paddr_t  gpa;
     } ept;
     uint32_t guest_vpid;
     struct list_head launched_list;
@@ -94,6 +97,7 @@ struct p2m_domain;
 int cf_check nvmx_hap_walk_L1_p2m(
     struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
     uint8_t *p2m_acc, struct npfec npfec);
+bool nvmx_reflect_emul_ept_violation(struct vcpu *v, paddr_t L2_gpa);
 int cf_check nvmx_hap_walk_L1_p2m2(
     struct p2m_domain *nested_p2m, paddr_t L2_gpa, paddr_t *L1_gpa,
     unsigned int *page_order, uint8_t *p2m_acc, struct npfec npfec);
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 61b2d3fbd4df..ae13d36fdab7 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -25,6 +25,8 @@
 #include <asm/p2m.h>
 #include <asm/mem_sharing.h>
 #include <asm/hvm/nestedhvm.h>
+#include <asm/hvm/vmx/vmcs.h>
+#include <asm/hvm/vmx/vvmx.h>
 #include <asm/altp2m.h>
 #include <asm/vm_event.h>
 #include <xsm/xsm.h>
@@ -1675,7 +1677,7 @@ unsigned long paging_gva_to_gfn(struct vcpu *v,
             .write_access = *pfec & PFEC_write_access,
             .insn_fetch   = *pfec & PFEC_insn_fetch,
         };
-        int rv;
+        int rv = NESTEDHVM_PAGEFAULT_DONE;
         uint64_t base, gen;
 
         /* translate l2 guest va into l2 guest gfn */
@@ -1700,6 +1702,8 @@ unsigned long paging_gva_to_gfn(struct vcpu *v,
         {
             if ( base != p2m->np2m_base || gen != p2m->np2m_generation )
                 goto again;
+            if ( rv == NESTEDHVM_PAGEFAULT_INJECT && cpu_has_vmx )
+                nvmx_reflect_emul_ept_violation(v, pfn_to_paddr(l2_gfn));
             return gfn_x(INVALID_GFN);
         }
 
-- 
2.34.1


