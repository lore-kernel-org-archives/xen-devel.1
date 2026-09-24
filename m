Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA25C9830E
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 09:16:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1431921.1653583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9fYy-0001HZ-31; Thu, 24 Sep 2026 09:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1431921.1653583; Thu, 24 Sep 2026 09:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9fYy-0001HS-0B; Thu, 24 Sep 2026 09:16:20 +0000
Received: by outflank-mailman (input) for mailman id 1431921;
 Thu, 24 Sep 2026 09:16:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1x9fYw-0001GG-R5
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 09:16:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9fYv-00Fo0i-RL
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 11:16:17 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ab4ea5e-8faa-0a2a0a5109dd-0a2a4506e462-8
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 11:16:17 +0200
Received: from [52.101.52.67]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ab4ea60-195a-0a2a45060019-346534433711-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 11:16:17 +0200
Received: from LV3PR03MB7609.namprd03.prod.outlook.com (2603:10b6:408:283::12)
 by IA1PR03MB8061.namprd03.prod.outlook.com (2603:10b6:208:593::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 09:16:15 +0000
Received: from LV3PR03MB7609.namprd03.prod.outlook.com
 ([fe80::146d:1d33:b619:386c]) by LV3PR03MB7609.namprd03.prod.outlook.com
 ([fe80::146d:1d33:b619:386c%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 09:16:14 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTp6C8vpyy3xamkNduu2cvw8imDSuG5RrwViEnTxumxtU+rjldh4JkMMAQRlGRA6zd0hQeeOPFTqDz0DHtiBTGPw1yyNWLlUES5Sh1gNz9k+XFPFdiolMtj5ppLxEguVUe/fGr4OdqfKyg6UwZ0zkpUY+6elRQlwrzvASgo7YVFiM2ufPPS0+O/hzCiKQCPORZXHJ5cjXfkgRtrVQa5cvh8FxAi7IWt64Yw6cDJDTLUm8hhJ6sYqXWQ2+z1cS3Hp5NCN9DALeVX7K2Ru13KR+r2OvP+lqZaOjAvwLfiQR3iILuCpcvneEwvwVg8utfT8cHZgR56C3uLmolNFaR8C5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgZejzKnQXAFzK1QYGTgdyV99LB0FyifVC9VdCZo/m8=;
 b=Fh24FRyT/XqgOdtIem7mlRXc0ZP94EsghJPyk9vlHPmM8n63KbdRZY/RgUeLHfr2n5Djhts63IkcWOFdWvkgJ97b+2BICC2WTsuBHPlGiUwT2Xm0H1Rn+mBD9wtzniRvWqmFSJBxSaYXemTn22heeIHb/rbfQ0z82ZKBuIoAJOMFF6GWaNSHuCadkCP3SAhOiRw8IL2pKdFuGkmpyzSnQzNqE5eM0lbYC1k/X5nEXWDMKCkZtSlLMYDsDNIe4WVg75n3o/gozj85iE9o5j6NRE136MPaxHt2+7zNiCqC2omy0g1exMqg5J9nD9QxV2QQAJ+rVgFqLmC9B0d6UbcDuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgZejzKnQXAFzK1QYGTgdyV99LB0FyifVC9VdCZo/m8=;
 b=U3fnM6RAbzSHyzvDAhk+xz1/ezhgrpOk4AX/wNUrULJWvYhgMDKr1l3pVgK3NosCHiGhcYEgAjJwMyiXfQkJzfRIAjWRrvJDLlFyySy1Rc8aVHBEIBh/tVC7zzvGKR/zh41lTdlO80uUBhuEMHIBS4qEvye0GLhhpsXnFc09m2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: ross.lagerwall@citrix.com
Cc: andrew.cooper3@citrix.com,
	chunjie.zhu@citrix.com,
	jason.andryuk@amd.com,
	jbeulich@suse.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 5/5] x86/nestedsvm: fix up
Date: Thu, 24 Sep 2026 17:16:05 +0800
Message-Id: <20260924091605.344577-1-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com>
References: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KU2P306CA0037.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3c::19) To IA3PR03MB7596.namprd03.prod.outlook.com
 (2603:10b6:208:508::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR03MB7609:EE_|IA1PR03MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: 31ed2cb2-a365-4e57-0897-08df1a1c7b65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fagarlHb6eCpjIbTdDUdAbdvW+8M8Kg9xtQdGZWCveJOlhxGyABYprx870gBnJKuT8IxP+E2+iIzrw7ptol2dilNvLfEMbH2CmXZvbQ8vwX1j6sLQRogmLiXMmSHCjvc8y3xOQXvKYwUybe3g74IBDEgi0eqYX8lF7egGuLbvRF59rRWYS5CzblMFMXTWUnCiGYHRPyKBI7NMzKBMQ1bhbx5H2uW+ejvjSqd7FhytiOewpByLZNdZhCExiM3kH+Ur1DwveT5i6ZzcP0Y6cGGiQeQ5Lwuuuh8Zx+o9wgYOPiBgJbPiwHRUVJjsSZBCkTbkmLFhNxLUXN6YWUV0X56+5JIR9glaRGEvsi+pFpxAERvYDchHGaiN7+BOZxbpze+I36kD3zw+7rI9feH+DkHKgyDvkHhc0af6GdH8Nn8yFXDbq6KHQqHLVHkJwzeR20fY41Yb5G6E07xOoFcCXMAt2nX2uo3v8UDxONALvlzpG5Pa7rEXIb3Db37+H+vY4KIyFgrbOmMi7xEhucZE4dsOcX6Ga34U7y4UgMOsq8+G7li7ODruB4aDFzsT9Hr2kSzEubuMfP5kdCORyhzirpYmpxtx3+ifKSUd1NC050v5fYGQejsV6pMhwcQ3uIxOC6/FkjrMVx+JU7AYLGk5dyaW5tIPgQTIZMhE+GS+XiKu8I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7609.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uwvxQO2ZBVbb1U/KvZi6CGZr7p0ZSZAEdQ9h1exf4KTLSqLFIXYGTUaj6B7s?=
 =?us-ascii?Q?sRdlaYME7p1RteHWRsJh/YtQbp6FpC/7v1OBPOobatHsrDtzbVZG3mnWEJpS?=
 =?us-ascii?Q?t79xO8viEye1eAUUwROnvm3pHC3yEOk8iouuPvZ8OfZV1Gl5AMr8iPow1QiA?=
 =?us-ascii?Q?GFTQ7EMqc5AGxMx7X6BODydcok0gAV4FPKTZ9pi2+ipIWNfGlz9RtpgGSPhA?=
 =?us-ascii?Q?5xuLgxIW9LbuYFtXp09J58hGyLDmE+2BYezjha3/Ju24zQsKKzERo0b1m/mY?=
 =?us-ascii?Q?HuflsUUaJvYggPtOwE4Z3cxXL1Q3IALqW2cQSvFyGsCLWwyGOCb6vTTwVSiO?=
 =?us-ascii?Q?5FedP9DBHJG1O07sdsbIsJRQ6EDeAR3Y7XDQKW6pgyaWcjhNOdtPYWgv4anV?=
 =?us-ascii?Q?UWIERi7OV+iveubfHJCSXifZGhg5lqShMCnUUSIgyCeOdp3CEEfn5Pmb8qhl?=
 =?us-ascii?Q?EAupdYMCq3mMcsKiwCs4/ptnWiBtEu8yYwfquF5AoseeAUKNY368jU9/UDY0?=
 =?us-ascii?Q?8J3EdKL21BTN9kZIoStpF3c8ggIznJLNnT2GCMHbEqGcEQECANVo9lswXbdj?=
 =?us-ascii?Q?6LJk2eSj9x4GaUwGhNRsdYhT6Y8UNsA/iZN1v8YQACc8z8xgsz0z9mmf88fy?=
 =?us-ascii?Q?q4/SacsrPv4gim5IuqHvJtbr7focIEthzfQjHfB+KzivUsu9I8ZYKMXpAzB5?=
 =?us-ascii?Q?wjYQViF21JTX7vTbt5b03Tvnx/aOa8iRosVnbDHiFtNJPp0M5R6FGhsCUwqF?=
 =?us-ascii?Q?vKpwOCTVM61aOxUUnuhALUwgcHwjmq2UeN5gz50qdqpFxBn3+vS48ufgqYmE?=
 =?us-ascii?Q?zxdltT9FI59NcysXAzYUiARpAJLdorJLlGPtLjHkeiWBphYZE3At2Awmc0zs?=
 =?us-ascii?Q?yeVHTyTLQsWn5fiyBPVaiAOwSaH0CiwNO307nZzS6ERx1MgwerxpFQ1XcQPD?=
 =?us-ascii?Q?p3nynS+qCYB/CYYhqtQcbgCnE2WGtrUZAaQkh09rY7msG04SerLS3BU+a4tL?=
 =?us-ascii?Q?ZCfb5NCbrORb8RSRhJG4trk4QG4PCHUqsPviJz+es2yHB+s1SrBdVIAwU3Wb?=
 =?us-ascii?Q?iwKIlWifRc+axiD9GhOrTTat8Q5ZV0ENsLzPQr4u8JVWWjU3veQ6ELtzthFW?=
 =?us-ascii?Q?cFALUo2wUHun/2V9WSrOr9TPmDRVBKraNi6L1XlC7opq8c4UzNo2w6thxUGx?=
 =?us-ascii?Q?E88a//wUdvRO3OLiFTCSGulLs7kddSIjoF90K9Ej7GGF3jYSRWCJxde6AEoe?=
 =?us-ascii?Q?NLCa3QkmohJ/Jf5xxZh9Bxj9ynbe7yFpRAmxh8I3SSjLto2dzS5chpxGSN75?=
 =?us-ascii?Q?cbRSFAM1pu54rmgrXOOKs2DcYLKCMuY3FPmgNWqTVHxjhyPf2WnUqlAKfkLH?=
 =?us-ascii?Q?nfAX/beMp1lfA12R7xGxc/ydQIVAXl25xDebMpvtlOt6QzpyGmL1upcCu6ap?=
 =?us-ascii?Q?AUOjR6iOzJ9oZEO9loi5WBGVpuG1vZ3srQ9uB8F1gMJHj71DuWcMJNsnw6lq?=
 =?us-ascii?Q?uQw9j1hsAjQV2ulP4VOj9oWKkbP89uaT3M3if2A1PPBQGtd7tpwXGCMkq8/P?=
 =?us-ascii?Q?K8soinLh5wguZZwTxnSp4IFz+gn0Q4eX0dc0GMX5qiq5eotYonUlHtc/PS4s?=
 =?us-ascii?Q?wt1G7VBoWaujANr7ABtKawoBBoQZkibMw9gxB+iLYVi3yktkbevASNH7eVg8?=
 =?us-ascii?Q?6Pk11UcWhqYb2djn4TSfZjrrPh/4CTKZ+7zEpMvV7mJ8KWa0MG9X5wt2FFL6?=
 =?us-ascii?Q?OBLrAr+xHQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ed2cb2-a365-4e57-0897-08df1a1c7b65
X-MS-Exchange-CrossTenant-AuthSource: IA3PR03MB7596.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 09:16:14.8192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: saAX+Dpgo4VpyUf6SCJhoembzdMFzwJaLqEGKWYv0YpJxm2vFKLFPy4qjAkVyHmHYnvX8mLz65lMpEciIVZRjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8061
X-purgate-ID: tlsNG-16d1c6/1790241377-1F6C877B-ADD45FF9/0/0
X-purgate-type: clean
X-purgate-size: 4994

On Wed, Sep 23, 2026 at 10:55:41 AM, Ross Lagerwall <ross.lagerwall@citrix.com> wrote:

> On 9/23/26 10:42 AM, Ross Lagerwall wrote:
> > On 9/23/26 10:20 AM, chunjie.zhu@citrix.com wrote:
> >> From: Chunjie Zhu <chunjie.zhu@citrix.com>
> >>
> >> Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
> >> ---
> >>   xen/arch/x86/hvm/svm/nestedsvm.c | 19 ++++++++++++++++---
> >>   xen/arch/x86/hvm/svm/vmcb.c      |  9 +++++----
> >>   xen/arch/x86/mm/p2m.c            |  5 +++++
> >>   3 files changed, 26 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
> >> index 82e01e513e69..91872af8aa7b 100644
> >> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> >> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> >> @@ -355,7 +355,7 @@ static void nestedsvm_vmcb_set_nestedp2m(struct vcpu *v,
> >>       vcpu_nestedsvm(v).ns_vmcb_hostcr3 = vvmcb->_h_cr3;
> >>       p2m = p2m_get_nestedp2m(v);
> >> -    n2vmcb->_h_cr3 = pagetable_get_paddr(p2m_get_pagetable(p2m));
> >> +    vmcb_set_h_cr3(n2vmcb, pagetable_get_paddr(p2m_get_pagetable(p2m)));
> >>   }
> >>   void nsvm_vcpu_update_nestedp2m(struct vcpu *v)
> >> @@ -373,6 +373,7 @@ void nsvm_vcpu_update_nestedp2m(struct vcpu *v)
> >>           return;
> >>       p2m = p2m_get_nestedp2m(v);
> >> +    nv->stale_np2m = false;
> >>       /*
> >>        * This may happen if we've handled VMEXIT_NPF at the same time as a
> >> @@ -383,8 +384,6 @@ void nsvm_vcpu_update_nestedp2m(struct vcpu *v)
> >>            vmcb_get_h_cr3(nv->nv_n2vmcx) !=
> >>            pagetable_get_paddr(p2m_get_pagetable(p2m)) )
> >>           nestedsvm_vmcb_set_nestedp2m(v, nv->nv_vvmcx, nv->nv_n2vmcx);
> >> -
> >> -    nv->stale_np2m = false;
> >>   }
> >>   static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
> >> @@ -1024,6 +1023,20 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
> >>       struct vmcb_struct *ns_vmcb = nv->nv_vvmcx;
> >>       struct vmcb_struct *n2vmcb = nv->nv_n2vmcx;
> >> +    ASSERT(v == current);
> >> +
> >> +    /*
> >> +     * The physical VMCB fields covered by VMSAVE/VMLOAD may not be in sync
> >> +     * with v's vmcb if a context switch happened since the last VMLOAD.
> >> +     * VMSAVE below would otherwise capture stale/foreign register state
> >> +     * into the L1 shadow VMCB.
> >> +     */
> >> +    if ( v->arch.hvm.svm.vmcb_sync_state == vmcb_needs_vmload )
> >> +    {
> >> +        svm_vmload_pa(v->arch.hvm.svm.vmcb_pa);
> >> +        v->arch.hvm.svm.vmcb_sync_state = vmcb_in_sync;
> >> +    }
> >> +
> >>       svm_vmsave_pa(nv->nv_n1vmcx_pa);
> >>       /* Cache guest physical address of virtual vmcb
> >> diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
> >> index 5354c4f1b85f..2f7053ed7eec 100644
> >> --- a/xen/arch/x86/hvm/svm/vmcb.c
> >> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> >> @@ -357,10 +357,11 @@ bool svm_vmcb_isvalid(
> >>           PRINTF("CR0: bits [63:32] are not zero (%#"PRIx64")\n", cr0);
> >>       if ( (cr0 & X86_CR0_PG) &&
> >> -         ((cr3 & 7) ||
> >> -          ((!(cr4 & X86_CR4_PAE) || (efer & EFER_LMA)) && (cr3 & 0xfe0)) ||
> >> -          ((efer & EFER_LMA) &&
> >> -           (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr))) )
> >> +         ((!(cr4 & X86_CR4_PCIDE) &&
> >> +           ((cr3 & 7) ||
> >> +            ((!(cr4 & X86_CR4_PAE) || (efer & EFER_LMA)) &&
> >> +             (cr3 & 0xfe0)))) ||
> >> +          (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr)) )
> >>           PRINTF("CR3: MBZ bits are set (%#"PRIx64")\n", cr3);
> >>       valid = hvm_cr4_guest_valid_bits(v->domain);
> >> diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
> >> index 027b9ae69be3..d1fafc479c78 100644
> >> --- a/xen/arch/x86/mm/p2m.c
> >> +++ b/xen/arch/x86/mm/p2m.c
> >> @@ -1517,7 +1517,12 @@ p2m_get_nestedp2m_locked(struct vcpu *v)
> >>       np2m_base &= ~(0xfffULL);
> >>       if ( nv->nv_flushp2m && nv->nv_p2m )
> >> +    {
> >> +        p2m = nv->nv_p2m;
> >> +        if ( p2m )
> >> +            p2m_flush_table(p2m);
> >>           nv->nv_p2m = NULL;
> >> +    }
> >>       nestedp2m_lock(d);
> >>       p2m = nv->nv_p2m;
> > 
> > This seems to have combined several bug fixes from our internal patchqueue (I
> > know because I wrote some of them...), some of which have already been posted
> > to the list.
> > 
> > It's not clear why they were submitted as part of this series.
> > 
>
> Looking further, patches 1, 3, and 4 also contain seemingly unrelated patches
> from our internal patchqueue. Can you resubmit this series without these
> patches mixed in? Or if they really are required dependencies, (where they
> haven't already been posted to xen-devel previously) submit them as separate
> patches at the start of this series, maintaining authorship information.
>
> Ross

Sure. Will send the v2 series.

>
>


