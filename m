Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF8F606A7F0
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NlBAKukB
Received: from list by lists.xenproject.org with outflank-mailman.1472109.1680127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOcl3-0001vj-CP; Wed, 04 Nov 2026 15:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472109.1680127; Wed, 04 Nov 2026 15:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOcl3-0001vc-9q; Wed, 04 Nov 2026 15:18:37 +0000
Received: by outflank-mailman (input) for mailman id 1472109;
 Wed, 04 Nov 2026 15:18:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Yazen.Ghannam@amd.com>) id 1xOcl1-0001vW-2n
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 15:18:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOcl0-00BD7M-9m
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 16:18:34 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Yazen.Ghannam@amd.com>)
 id 6aeb4cbd-e002-0a2a0a5209dd-0a2a4505c562-14
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 16:18:33 +0100
Received: from [40.93.196.43]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Yazen.Ghannam@amd.com>)
 id 6aeb4cc7-4cb1-0a2a45050019-285dc42b83ea-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 16:18:33 +0100
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 SA3PR12MB8024.namprd12.prod.outlook.com (2603:10b6:806:312::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 15:18:29 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 15:18:29 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivtVQsckVY/Ug2gDv3HWA8A4T3+mysyRF+ZUaThjFmgXOZs2tWerQ2eR6XIY+VTZHQn5UlsUDHjWAKXUcfdkCXuDQ94RkOwvA11JUomcPcNIx4w7YbZAQK6PXccWGcK251YYdLeLD1CbtvoaHgeV7y+D0nW+MrFPctDxC+yCUYY+jRntPNp9kCt1NAeDUkcLF5vwOblFyezEW9TXQrUBop/UgAc1LeHnKqSwGbM1x62qYtr6TPEVk8+/cjj5//w/pcyMuCtxjXE2rf+j/OgaDKS2F4aaJKaXEQmTgAuQgppK894J5oxUp7w8Z7dbfqQBiq/h5g0v7UVBRsGxsv01jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85b4qb0k5l+wxRsvgF3PPoa9EpZeNI2UjIuR5x0lcTI=;
 b=qTRDazYoFLR8itJp0M84kEqSfFBfXrSEcd+ymeoihTggUdYG5MIaRVb160KRXcrADQsgf7WPRuogEyotlbFokh5eaQols4EG+HE+CyNho/Sa2TBVXzAyQWev9SZmBcTlAKw+L9EXALLSVami2ziORKF06NCO10SYtoBBiEMm+is6/KQ2B9oJtYhv4HOBHIeY6j50Hp5Cnh7BUYDFmjcWgSqKSbiD78DkDBeQPi+W3nRtoqTDI2R+vW3DYetQW3nJSZQMoH/jaEck/Ny2PLX3gf/iBY/+hJZrx7faJ/jcA/gHpynJkUhrGzeSP6JxPGywpOZa11wAWE6AbMQvBGGAMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85b4qb0k5l+wxRsvgF3PPoa9EpZeNI2UjIuR5x0lcTI=;
 b=NlBAKukBI1RHl2BBbAwm1L3NKzNuBH8QVTqUsNNdox5maGKiKWfdor+YiobAvlLLPTz5Jtj8/vY7gZh8NcwkUZDYIe421+1O6A+TnaNQiSxP9ErWRurbkmm7ZfSEv2VWKymeYLi8drNY0+aS9XjTNytNxmjVpST16hbPpiLpuFg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 4 Nov 2026 10:18:20 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	xen-devel@lists.xenproject.org,
	Ariadne Conill <ariadne@ariadne.space>,
	Sean Christopherson <seanjc@google.com>,
	Juergen Gross <jgross@suse.com>, stable@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/CPU/AMD: Don't print reset reason in VMs
Message-ID: <20261104151820.GA716491@yaz-khff2.amd.com>
References: <20261104013026.185392-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104013026.185392-1-jason.andryuk@amd.com>
X-ClientProxiedBy: BL1P222CA0026.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::31) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|SA3PR12MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: 4438fe91-8b9b-4d76-1a14-08df3a86e140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|260925022911599003|260925021911599003|260925021311599003|5023799004|11063799006|56012099006|261021121427099003|261009223027099003|261021123027099003|261026121527099003|261022105027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NG8Zcjr3DlrYJxWdftLf/y3xgxeNkk7BQUqr749vA/LCUfgy5h8aLYSuShhfedQK0nwyi4WcEtPUpOUurIUml39IWtDwivou3lxDSJzWllcAcOSBOJnnhvqviowR1rKlrZBUM9Nmt1TWl6nsT2pcqASWc/MPWHtkZPL+NK1JIOTSFJ6I9VoDKGLcDQjh2o7qedPq0prrm4LB4FL9e9zEFRJ8DkkL28j9v1wo3vILII6zm1FCuRTDal7pCKjvrRJ7mqUYRQPMCeBfwC8cZsNSbGVjjrNIz2AWGUrZK/TJ9nMu1H1AaumGzRqciN3L86iHyHanj2CzVDEYncgbCZMRS8zAeynCmMAHB2sZp7VvRIFH3gT1lpcu9ABcwTFchEBKzJxqA4DBpgWyMYFXLbwN62nm42nQMQe5KuDhQUcrF7o5/cZ14kk0XQLReKcTnvIFbhUaFF4yDgN2F33QgWQq8b4QO4pwiAYY3oaIUrwWByewCCy0U2I8iMg0+lpJbmuNioIsHfQNCKV12Q/y62ABqnmViKuqzEmGH1nJhCvgGCyh1HmBebIXTvaBhYOOfzsEA6LQmA3Bx3RrXfq3gzc6qvPdhZ1HeP6naHJsa4vzTHqjTg84J4GRSYN0Z2gITlqp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(260925022911599003)(260925021911599003)(260925021311599003)(5023799004)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261021123027099003)(261026121527099003)(261022105027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3MDBuWWJLJGXBrgI7+auT3MsPGkkA8FjIHqKBQYnVdz4Gb4Dz1ePvjt/Gd7w?=
 =?us-ascii?Q?P1k930asaXEo3pstXTLx75ifsu02gSF4CvwhMn/XGbbhZ4y/LKXIDIjdXREB?=
 =?us-ascii?Q?QfD4kHp7S1wiwKwXqWjcAsMu2sORNcvQc2XxM0EDtGpAgUk5UT4zhfa/MwN/?=
 =?us-ascii?Q?sygPalz13gB6haoG4znhWcg/cp0yHqFgccFdplu/3CQEY2/uKatwQxAQ2vg2?=
 =?us-ascii?Q?brttvUsmxfpOOAPYR+VP3yT3/Ayq1ONqZjq/J2ybaD7Q6yEcyJpgBrcCWNeW?=
 =?us-ascii?Q?G+Br3OhcV8LM8cg80qz6Gzim/8tL6osjQJUQPCsbWLmzlZw3wYEk0MvgWdYJ?=
 =?us-ascii?Q?o1BOOx/49iSTsg4zFQfz5bFnLjkPZTQpy/V1B/fOEaYBTkwaVXSLEOhSJacu?=
 =?us-ascii?Q?aOFi7ZFRBFHA3rTZBsBF+xKm4Q9A7GZU3SqcHTf12izSNSmnuolFuZKOPtl1?=
 =?us-ascii?Q?vrl243SBtA5ophqrhDsfJDmRkKDSMtK2BR+VbSlxUNHZbJC+73UbVhferoJP?=
 =?us-ascii?Q?nDHPSBp8LZnuijbPHOVmPyGBfiZM4gXTURPeUrr9HttxFu5gYki7V8eshb9Y?=
 =?us-ascii?Q?atYzKUSPfA20eP/cGN78mvC1wahRLT8YX/afi6DDXzVFyHgSsE+RRW3d8xD4?=
 =?us-ascii?Q?zxdae3lHk85b0Q1YwFOlesIUJOgU1fNfj1lj6EYIwSe1bByGPwa+207j4W0O?=
 =?us-ascii?Q?LJRpZzQdJFnBeHl0qnQRzTt9ieuSITUGzxvxWrb8T78h7V8HTBuduvCO7ZkK?=
 =?us-ascii?Q?kDnh7n+L4D8OBezLvcmlOIWrFidjZ2AJHxqoWdhQwAh5m44qWYCvP0wrRHbU?=
 =?us-ascii?Q?4S1C4EAGe0MUKtbOSvBUog7MoT7xYVsYkQqEVf5nRM0bITHBiGg/+0oWZY9d?=
 =?us-ascii?Q?MLdKdho/0s85VJTZMpl2tzz1i0RftRN0Zxd9OyK8vHaPdVBPlPXWw/32Jz4c?=
 =?us-ascii?Q?iYJXk3chPMo55bkgya4l9dSKrtgGDydvhObF0YLpkd729nc3LDxZBleppBhx?=
 =?us-ascii?Q?eSl/VE9oAeRhgl5xO5c6JKXSCT3HdR/bXYQbYu/SNRfrI89OkdSow8oOckPo?=
 =?us-ascii?Q?eoOlJi2bGyg3BFMAKWLX+w1ayNXB3KV1qyxZ74JI5l4we6OHaz6O/KCaKNJH?=
 =?us-ascii?Q?Pw6xef5Ys/Osb1+xKN09mQhMMxTY1RvZf2u4/l1nKUY51Yy1sc65P8LmGQ6k?=
 =?us-ascii?Q?W5GIK5AWowSTl0Osxzlpd6oVj1suNamLI2VZq+WukXSYlbBOlLc7+eEftA8V?=
 =?us-ascii?Q?m+i+UDVy9kewxNVQY0UAAAZXYdsb9wP3azc7OVqUemvSCKoaTEsUXHC8Ubds?=
 =?us-ascii?Q?P7d/uQtdj4hVSjx0yVFpBn7acHHX/v6J0hJa++p41tZqSZCD+xzkAEYk4PWI?=
 =?us-ascii?Q?A4m7OaC1oKwBjiSbY+kPD90JqwCgRE58fFsaR/nbOuqsjZ7P6L41dOb55o3c?=
 =?us-ascii?Q?7qHm+xT5eF9G9FjvBGtEDJ7vDBtMRj8U/g8uIivj7BcPqBEV1A4TjmX624iG?=
 =?us-ascii?Q?ujlxo/TJR5txNXOfyojC/1KAMVFFkTSvKav8xJUXd+oSKz6kxVbiCLLTumt+?=
 =?us-ascii?Q?FMHXYVsIPbHpkeHeBP/mKymPrYxaKWSR1+tH00ia94e62eJs1Oz1pSkRJq4Y?=
 =?us-ascii?Q?jWUx8BcT2ChDYCXcUIeXR8pmgT5JGV5QrsWnPZmn7h8mTopy+i8vZnf42m9v?=
 =?us-ascii?Q?fSGXPl2STDKO8Jdox+YYhkdq6z/qH+zofZUQJyR5Wlmg/fSbsNeW9dL1q4Vq?=
 =?us-ascii?Q?Im0X5buSLQ=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4438fe91-8b9b-4d76-1a14-08df3a86e140
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 15:18:29.1360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TwwsL6Tcf3AXpqaPorpMG7ITn5VaGJOIMHt0mlryfOeownrBXNepE4ArkvpmTD1AC2xZvTkB70sGy0ywmKyQjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024
X-purgate-ID: tlsNG-c201ff/1793805513-718AE2A1-DB97C8B0/0/0
X-purgate-type: clean
X-purgate-size: 2467
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 08:30:25PM -0500, Jason Andryuk wrote:
> print_s5_reset_status_mmio() expects to read FCH MMIO on baremetal.  VMs
> don't have emulated FCH registers, so there is nothing to check.  Add an
> early exit when running on a hypervisor.
> 
> The real motivation is Xen PV domUs can't boot on Zen CPUs.  PV domUs
> PTE contain system physical addresses - they don't have concept of guest
> physical addresses.  domUs can only map physical addresses they are
> assigned, so a domU fails to map the FCH MMIO addresses.  However
> set_pte() does not return failure, so ioremap() returns a pointer while
> the PTEs are unpopulated.  print_s5_reset_status_mmio() faults when
> reading through the pointer, breaking the boot.  This change fixes Xen
> PV domUs booting on Zen CPUs.
> 
> dom0 can map the FCH MMIO, but it has X86_FEATURE_HYPERVISOR set.  With
> this change, it no longer prints the reset reason.
> 
> Fixes: ab8131028710 ("x86/CPU/AMD: Print the reason for the last reset")
> Cc: stable@vger.kernel.org
> Suggested-by: Borislav Petkov <bp@alien8.de>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> dom0 could work, but that would require a xen_initial_domain() check.
> 
> I've wondered about a different approach:  We can't directly check for a
> device for the FCH_PM_BASE memory, but maybe we could check for a PCI
> ISA Bridge with PCI_VENDOR_ID_AMD.  That might be close enough to
> indicate real hardware?  But it would still be a heuristic, so I'm not
> sure how much better that would be.

Maybe, I had an older version that used the smbus device / i2c driver.
https://lore.kernel.org/all/20230407203720.18184-1-yazen.ghannam@amd.com/

Is this available in dom0?

> ---
>  arch/x86/kernel/cpu/amd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
> index 40463bad1078..580ccc2ce5fc 100644
> --- a/arch/x86/kernel/cpu/amd.c
> +++ b/arch/x86/kernel/cpu/amd.c
> @@ -1357,7 +1357,8 @@ static __init int print_s5_reset_status_mmio(void)
>  	u32 value;
>  	int i;
>  
> -	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
> +	if (!cpu_feature_enabled(X86_FEATURE_ZEN) ||
> +	    cpu_feature_enabled(X86_FEATURE_HYPERVISOR))
>  		return 0;
>  
>  	addr = ioremap(FCH_PM_BASE + FCH_PM_S5_RESET_STATUS, sizeof(value));
> -- 

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen

