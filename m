Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06282C982DA
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 13:49:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425438.1649384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7YxM-0004n1-Pw; Fri, 18 Sep 2026 13:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425438.1649384; Fri, 18 Sep 2026 13:48:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7YxM-0004mu-NL; Fri, 18 Sep 2026 13:48:48 +0000
Received: by outflank-mailman (input) for mailman id 1425438;
 Fri, 18 Sep 2026 13:48:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x7YxK-0004mo-Hj
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 13:48:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7YxJ-00EgV6-4q
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 15:48:45 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aad4134-8faa-0a2a0a5109dd-0a2a4508e680-8
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 15:48:45 +0200
Received: from [40.107.201.46]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aad413b-f659-0a2a45080019-286bc92e158b-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 15:48:44 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by PH0PR03MB989304.namprd03.prod.outlook.com (2603:10b6:510:3c0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 13:48:41 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 13:48:41 +0000
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
 b=fYi63ZaEttOFVb2RmS1acD1WLf9u2N2dGQ5EWgQJzHdgXSAzRPq8Owpm3YTSbLXKfkbhioap5D11FyjX+B93EI3EzmJMIjj1PzTLo+a3xaXWbOYEKYgEU/ZLxn0Axr9POM6OtLweq9yAHcy71euQ4ENVqRMejwbyHyUyXBvypDKeGQKWAnNAVRr5djqr6AAdPA9sAzPu9LbTQSLq0hfl293cfjmysSZD9PXHKPiyp3tzyOf8CJPa8LuRF1+4MSOikKvntV06k9AXdBsKSqIJiR7rjsUii1XIXIWNAln31KzKpCFf+FgjbSxSNWhZsCzaEvzTM/1wiJx2vqRWT4POGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSvoD2QhDS7LRDfKxNZb6FGqDEVd/0RqYV2zQj9z1YU=;
 b=l3DKRq2D34QFWU5SzXTzr18IrCHUZbW3/dfGn8AcRfFMREjUYxI7Ca/M3fcDNoL2SPQpU/jv1ddgIeBoJagfteL3TfwnbBFASmcjxrgJITmcQYxLt/i1R2dXdpKaiHpnRxEStGmqi16+eJzXeWFoJACLfAz7giywR9IObGBiP0KUk29yjGkNYSIib0GbvWNArmxwVjZG3DzdpogkcJmOX2kxFnYZdCx8gSK59d2q5ZOtoBWXw7MjdXMM+8Hyn8WERYdaYVZuWUbr3OFKeBMaWBIUmxAE+v2Vd7mXgi69dXy6uU+NdJ3fu6reOOGh1m2SzZ/Ztot3VQB/xoWEv5+T3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSvoD2QhDS7LRDfKxNZb6FGqDEVd/0RqYV2zQj9z1YU=;
 b=0J8ZXumleJzWpJJ93ohnBSIuS/FhkX5bY/k8hQL75dytUWNvsmSG53TA7iSGOvhbtYMl29mhswPdvjqUWocEEGE3X1R0kjw8leINiQAbT/9LC6y7bIdtEeBIVtP6PxsiM4uAmoiHKPNCXaWpEwYTqVq7N5qKsSg25EoW93SI/8w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <aacfb18a-d445-4623-938f-09bdbea83219@citrix.com>
Date: Fri, 18 Sep 2026 14:48:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 3/5] x86: Track vcpu context switches and introduce
 needs_tlb_flush field
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <1785509179.8631fc262581453bbf619ec5b2062170.19fb8a3efe8000e099@vates.tech>
 <1785509308.8631fc262581453bbf619ec5b2062170.19fb8a5e798000e099@vates.tech>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <1785509308.8631fc262581453bbf619ec5b2062170.19fb8a5e798000e099@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0373.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::18) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|PH0PR03MB989304:EE_
X-MS-Office365-Filtering-Correlation-Id: 161f2922-103d-4618-be69-08df158b8c90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|11063799006|4143699003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	fILLBlzrG/7Pma2jRIrh195S7wpWksHaKqSiTiGknAWQdC2YnoFUHuAmwlvNPCWWngeGoDN3DarpbcLhM4qRg6/OqG323CBCsvsP4E3/lR97KR6o1PSGgyhB1nl83Bteh6dssYVgXNOv4ShGgqMUg7XnDZZIL24PEAurecO3JFiOVKbk43tkh9jPt2ZqeHTsvff/heeRWgM1RojT4d16QA9CUQE7UqMFBXvSf8+j3slkG9zmjU64W6Ym+DhJj5qY6Ack4vHJHrujhCWcpEWOR5n6wp6iRpSEpT8RCHq3S0s5X+801/tDaJiC7DpV1KZVVZ8PK8dY5LYmpY8bvBFtYTNa9AlhpZoLTWBFmdyL4DZ8tNLgMYtQB1R4X9NxBNAUUMd70uqd1hOu8oT6mQmjjOyrnp0JERFoLMZVRpUHtdilxE6Yek0kfkNEbXMgtUXlWYmIdmCunQsWViCa8BIf1UzdgAlTpM/3N6GEGZ0dXu5rS2jt07z2BP0l+1m/r0hMrgjW+YRDbaGk46aS2FYNFJFtWj8CwEOCv3e68BeSLhZoETT9VVlmsCOYyQbGorLMnUgWatgv91Q2W4K0JlbRfQRDviAQU4kQNq5t/QNQK+7xa4ouQ5sUoLZdE9cq4mIe+UUDUcdVh9sogpGTxCmjWg1GPwAFCDddj24JQz3J66w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU1lMlFNaGVFRjI1STFnTW4zR01kcVRNK1RReEE2QzIrZVlJckI3WExqN01G?=
 =?utf-8?B?V2VweDZxTkdjenBoc2gyTmFlRzhJQUI0R2U3ckRaQm1jR09DQmc1a0hySHJ2?=
 =?utf-8?B?VzQrRXp2VTE1cWlPVTNEWVNVUU9uMlR3dlpHZTZZQm52NlFSbEYzejVOZmFz?=
 =?utf-8?B?cm9pd0I1ejJuMXpuR244NVlhdmFlZndLeFFFemNxR1RWRWJEZTdoTHE0SlVu?=
 =?utf-8?B?M0xLOHorUGJhTUdKdlU0NjFDays4d2JISXJaeFU1SWZBSVZRZXM4ejNmRXo4?=
 =?utf-8?B?OHZ6a1ZBdWNhbGU4TURxM2pENmc3ZStkSTYrZGMxT0hKTks5TEtnRkhzU3hW?=
 =?utf-8?B?K3JybCtZR01mQ2ZTMkk5OUJIYU5DSUZ2UmtOVVlqeGNOZFM0eVFEWk9aU2I2?=
 =?utf-8?B?Z2tBaXpESnpMVytHY3d3MUpXeXVTamFSRmFOSG5xbVRuNGFmN1BwS216Sk1R?=
 =?utf-8?B?bGdEUWhVMCs0MHJqcXAyVE1QMzYxZzR6LzBNNlRmSEhGVzYvL3BJOHpjUEdZ?=
 =?utf-8?B?YmFsbWNrb3dkOElud3Z6bGU0TGxBUUFUNzNqUHJqaFA1azBmRHJNRFBJWFMy?=
 =?utf-8?B?ZzRlOVFtaExNNktJK0laUlpsUGQ4UkVUY3VUZjJ6QnFKNmw5WURQSEJXb3Yv?=
 =?utf-8?B?Z1V1SGgwdks4UWlpUmRQVy85Rnd2Mk9iS1lvaTZSeUg4Rk9BT09FeXM1N2p5?=
 =?utf-8?B?aEgwUVFyWEx1YVR4VCtOVlBaU0ZnQlRQV25tOS90REVydk9TcE9QVnpsZ0sv?=
 =?utf-8?B?Z1JGdTEvcndMeUplQ2hDN2FHZnYvckR2UEcrcjBCRXdyY09uSXRCTU5JK1B3?=
 =?utf-8?B?RzdJTDlxdkhXK1U3T1BlUEYyOStDQWJUT1hRaXBlTDNnYndlWklwd0pkRjhF?=
 =?utf-8?B?bnVPTXhacm80MmZZbXB2NStLcE5STjhpdzYvcUU4UTlVR3N1bWtEM083QWRa?=
 =?utf-8?B?ZEVRSlc0WkVJTFBwcUxlT01SZFlZRDdQb3pLNU54N3QyUlY0ekhXakpxR1Vw?=
 =?utf-8?B?MlN0TG1JQ011UXVCSVJVSVk0Z2Q2SFRZOUNrQlk4YXpJdGxJeU1UdVREcEZR?=
 =?utf-8?B?dCtIbmJCc2cwZ2xjZi9VN1M3NXYrcDk1aTJSU043NFVtUFRleWxHK3N0Z1JT?=
 =?utf-8?B?Q3JZNmhmSmJ0N3dEdmlLRXdRekdLdGRWczVGSnRqNVcxRWF5ai9pcTZsUDlJ?=
 =?utf-8?B?SFFtNTBlT21ha3dVa1ZmVkNJUUFFYjVSS3prVUl2TFNzMzFiS2NZVmVXZ1k3?=
 =?utf-8?B?UHhqRnhSWloyYmZidGw2RDFNNS84aXloSEh2djVpYlRLRjlmc1VzdVVENkRa?=
 =?utf-8?B?NkVmZjhoS3piM000NkhPenBkcXRWb1R1eGpjaFFHVWNzWVNYMWE0S2ZsT0wy?=
 =?utf-8?B?QkdZUHRnaUJmR3dBWllIK05RdEhIdE5rN2JMSlhmTzZvNjNOV2FqR0dMMlVm?=
 =?utf-8?B?Smg5T2hsdWNBQkU1S2ZTSFVuUEkyM04zY3BGS2VkM0lycDFrQmdHNGwxQW9l?=
 =?utf-8?B?U2VGT20wVGhWbFgrSkxmV2s4VEplZGJRNEJpeVR3UUVYNXNyN1RJZkhhUnhw?=
 =?utf-8?B?S1FBdmZjSUJDV1FkY2Q5RElOS0ZNREU3bVJYSTEwQzJ2T1ZGb0l2aUtGUG83?=
 =?utf-8?B?NmdMcEJWcHFkbk5BbVJjenpWWHg4eU56dTBtc3RJZ25MdGt2Q0dCUmdYdWpK?=
 =?utf-8?B?bENtT09Qc21WTXd5cEFiQjJBSC8xbDVVSWdZVTR0Y0cyNkxMdk05QlhxaEtq?=
 =?utf-8?B?dHQwdm1VekJlSnZ1aXJzcm9EWjQwWkx5enpzRHorR05mSW81TFFFWjdsanpk?=
 =?utf-8?B?VDJ6MytFTHJEOUNKYzVGRktVS3dZa3pFbFpJYUhWUnlDOS9md0tabnR0ODFs?=
 =?utf-8?B?OU1EY0cxbm1YVDVuU0I0STYrRUd1NkI1UTZNdlBrNDA3Rk1HdDVMRnB4UVc1?=
 =?utf-8?B?REFITENyVm5vWXBrTnlsQWIrUzZCTXg1N0JFREJkVVNVWlc5dnBoTm1lOU12?=
 =?utf-8?B?SnN4aHZYWW4rVG5CMW1pWnAzMzA4SmpCTytNVDlXRG4rRFR6TUNvdlNvRXFt?=
 =?utf-8?B?N3lDVnhac0JQaW5nR3puOXBYMC8zVCs2dXdtQ1hXNSs4b0twV0ZqTGRPTmhJ?=
 =?utf-8?B?NDNRWFJ3L0VYdWxtK3NYQ3c4VWp3UDl3RUo1Y1pLcjNmL2dydHdhOG8yMitz?=
 =?utf-8?B?bG80aTAyeEEyMlplblBaeUwvTm1vMXk1VUFDMUthMTJ4LzBPU01uMUNIYmxi?=
 =?utf-8?B?ODRzQVg3djNjTUdxOWdha1dlRTQveWc5RG9pRXlIanMvVVZJZEF0SG95WHBY?=
 =?utf-8?B?QXgyTmtXeHRLSFZxZ1FjUCtVUnJuMjAvTXFSYU9hNUp2WnpHb21VdnNsNG9T?=
 =?utf-8?Q?bME6bR2NRG4b6mlc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 161f2922-103d-4618-be69-08df158b8c90
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 13:48:41.5097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTtLgh5IyyXGglv8L++adRCeOshStmcBPd+HOlOZmCWUl46iRFc6p9LPnqbVoDOtujOFYi2+ilcwVWqHNZCDGjbcZEMxuIA8Ds7rYVaqnjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB989304
X-purgate-ID: tlsNG-c1860d/1789739325-D755C87B-A84A6015/0/0
X-purgate-type: clean
X-purgate-size: 2179

On 7/31/26 3:46 PM, Teddy Astie wrote:
> Introduce needs_tlb_flush that indicate that the vCPU related TLB
> needs to be flushed before entering this domain. This is intended
> to be used later for using the same ASID for all vCPU of a domain.
> 
> Also track vCPU context switch to determine :
>   - per vcpu "latest_cpu" that tracks which pCPU last ran this vCPU,
>     this is used to know whether our current TLB (of our pCPU) state
>     is stale.
>     Schedule a TLB flush if the vCPU ran on another pCPU previously.
>   - per pCPU "latest_vcpu" (per domain) that tracks which vCPU the
>     TLB+ASID/VPID is holding onto.
>     Schedule a TLB flush if this pCPU hasn't ran this vCPU previously
>     (which can happen if we context-switch multiples vCPUs of a same
>     domain on a same pCPU).
> 
> If ASID use is disabled, unconditionnaly perform a TLB flush.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> v2: Merge several patches into one, move logic to context_switch(),
>      move fields to arch_vcpu/arch_domain, consider !asid_enabled case.
> ---
>   xen/arch/x86/domain.c             | 26 ++++++++++++++++++++++++++
>   xen/arch/x86/include/asm/domain.h |  6 ++++++
>   2 files changed, 32 insertions(+)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 996b50af7a..27155546ca 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -38,6 +38,7 @@
>   #include <xen/smp.h>
>   #include <xen/softirq.h>
>   #include <xen/wait.h>
> +#include <xen/xvmalloc.h>
>   
>   #include <asm/amd.h>
>   #include <asm/cpu-policy.h>
> @@ -874,6 +875,13 @@ int arch_domain_create(struct domain *d,
>   
>       spec_ctrl_init_domain(d);
>   
> +    rc = -ENOMEM;
> +    d->arch.latest_vcpu = xvmalloc_array(int, nr_cpu_ids);

Does this work with pCPU hotplug or do you need to use NR_CPUS?

> +    if ( !d->arch.latest_vcpu )
> +        goto fail;
> +    for (unsigned int i = 0; i < nr_cpu_ids; i++)
> +        d->arch.latest_vcpu[i] = -1;
> +

The other arches define INVALID_VCPU_ID to be MAX_VIRT_CPUS. Not sure if it is
worth doing the same for x86?

Ross

