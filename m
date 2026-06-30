Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBECBC43458
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2026 09:43:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1348619.1606339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weV05-0000VO-AF; Tue, 30 Jun 2026 09:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348619.1606339; Tue, 30 Jun 2026 09:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weV05-0000VH-7Q; Tue, 30 Jun 2026 09:43:29 +0000
Received: by outflank-mailman (input) for mailman id 1348619;
 Tue, 30 Jun 2026 09:43:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1weV04-0000VB-2p
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 09:43:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weV03-000LGg-7w
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 11:43:27 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a438fbc-e002-0a2a0a5209dd-0a2a450783c8-8
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 11:43:26 +0200
Received: from [52.101.61.63]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a438fbd-9c8e-0a2a45070019-34653d3f8ca8-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 11:43:26 +0200
Received: from PH0PR07CA0105.namprd07.prod.outlook.com (2603:10b6:510:4::20)
 by SJ5PPF4C62B9E70.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::991) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 09:43:20 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:510:4:cafe::5f) by PH0PR07CA0105.outlook.office365.com
 (2603:10b6:510:4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 09:43:20 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 09:43:20 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 04:43:20 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 04:43:19 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 30 Jun 2026 04:43:18 -0500
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
 b=oyDVeaOZL76u4dCvcGSTOpow5Hgj0l1SIUOK6Xvh88iAJqI1/oPSI2U2/VEldQteIwfb9wXAwdblo3/plZZDpJu69i73SjGnjrjv9nDlkrEtgKPPhSm8sJzQWRB2PbDLVi1YYmEbWSY3/qiBnc8R8p458x3ncS+8ZWT2/c94jxBjlR9JLEOvp4Beo2/GcJcRJj7ld0Qvy4POFhnkBrIQJC/k42BS7GBzD1nI6e93KMPENyM7x5NwvNtup1kEwQx2HwrEOS2PMojEvNr8LfT49r00M/EdoPd6DDbwfH2/Mu1EyXTvTErDh88YpuI2NwmHJ0cZ2Nv3llDn3AsiOReQkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmC41VZDSSKkR/nF7wXt4h4HOKsQ2FjHxiXrPsZ72B8=;
 b=nQjXWvtXEwxhQgBqstFllXY/jm3o9mYFSilezYu1C+AirErmcdxmgb0p7GSPrAOLS8fFP7/C1QV+wYVe2JuE6KmyCMUAyHw7dQwbAaooNb1A4M74m91sXVudaC+T7XCFAuwy3lSET3EEOWdTPNcq2oJ6zqJuicpJ29LtLDgXLPh14lppi42ydITe1+sUbmBb9XUzH7U7eICezY1rZcBaWsApK/+MlfOm5MgI/QeSx4fN2uF/MIKwg0uVRcmFQ6Za4Yj5VW1nSQjv7tERfCFyaw+VPlsG8kXnas8qwkd57SMQM2Ea0G1r1G9VF/GmI+LYoRagLiusxU5YAnYZVH5Skg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=valinux.co.jp smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmC41VZDSSKkR/nF7wXt4h4HOKsQ2FjHxiXrPsZ72B8=;
 b=LqefMkdPZQtUb+R/nJ22gvD3qDKOnG19CPpnlFZH3EtU5XDX5KOvKWkBid7LyEBBV+gyrHTvyZ56+huj/9Qqx4EGb3TiSrK+Ed9zuXv8poP/yS5XnL/watWz/eG2x/Z+MFDbeup6wquCTbWpEcjLHngMnaSQOceQrm6+nAS1mzU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <966af02d-ebc1-4395-9476-8722c2b967b4@amd.com>
Date: Tue, 30 Jun 2026 11:43:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] xen/arm: fix sparse cpu_possible_map calculation
 on SMP boot
To: Hirokazu Takahashi <taka@valinux.co.jp>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
	<jbeulich@suse.com>
References: <20260628225115.9337-1-taka@valinux.co.jp>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260628225115.9337-1-taka@valinux.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|SJ5PPF4C62B9E70:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e024b07-f442-4ae0-d947-08ded68c0542
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|23010399003|6133799003|22082099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	xkD8qZF+ENf4JEH8TMapf6XEqMNvZFRLNEUTmyts+e8eeJuc4sYxOeyGYB3RNcC8l0r8snq15bob+IJ/YGOXGOnyDzsm7lXdPsJRQkxKu80HRw6ZSc3W20o8FJ1g6KMrx2E9F4ReVyMzDTh0oWWDKKy5MVokN0931Yoh7ABPhhe50DBD5WrRVf05oCkqFTpkUHzF7znytGqV3yWIUpXqLB7dJm1zhXFrX8Wnwsnn4bW13e+ZB6jFO7cdCu+lE0eWHvfItiKwvA1kwscUWO1V9jGak3A7hNh6LbWCpmvNi9N3DYu62NE9w9o7g8cIfMMbMyadDm1BDqXKah1r+5r/sliE1JwLGEbQJV3hKMhbLrnzLQQJUlgvhIZ+koWM1hjEGOd9jo7CssO3g0g+oOvcAq4fwkARLdvcCOf5iTD1jBTZnYSYgXRezFDpP13afbfb4nmhYSblgG2tcYIeSd048n4DXaGKapFk2do7ZPRgbeFt3DSSRGyScB21Gvl6XHpr/up/TqsyDDTQ1Y+2ATUccgpaSzVUtC1OCSfjo6SMp2wCbD4ta0l/G9iCOSo/q6IgXsMKf/jNmnNIeLeTYFFweJqgeQ0EtTEzK5qw64C+gcgunHupJuH4MEYMS/EGwAXaVEVLKrTyjG9TCHeaPy5HhJ/saZN2p2qDZC6JsfOA0+5zCODV87DgYeTjFpmz7FO6cfCI+L8A7n9itjqBzTQSRg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(23010399003)(6133799003)(22082099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Qfh8PPy6Zbi4DY79jOd3dIFDaKKWcvJiMRpJBOUkKpTPMTnOAD+P+/Vglihy83rE64K/0FpBOFn+N+HIFRMgnTWTxPjwK7XOr818QuBDlaL3gkvGoL6KTEsSXzAX81XZxLe7qZzBlBnLuOCdFNPQxD7CbQ/f4o37FWVBtstZUJLP1J+To1g4PND1XljnEgT2ZpQwjDFYocqFlfX8GYz7f1/c/BBs6BWv7z1Yrq2vZnihydvw+hW45iTi0KuDRx1t7IaD7e74/CcB/K7RD7N3JOkdSviPpfrfbpFkzgGtOsybiswkoP9HFkYkw0G8HHkBf1oCNPp0SbVi+rYnX/aK6hWHc2gntjJyGunt+uQ1U8PPnOicV2bles65Fq2AtJZnanLg4ocLayRmBg+KsuFhx4KHUsz3993tArZMbiCKcjPNwQkoZTywy6K03FJow9eC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 09:43:20.4610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e024b07-f442-4ae0-d947-08ded68c0542
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4C62B9E70
X-purgate-ID: tlsNG-ef75cf/1782812606-FE12625E-CC5756BE/0/0
X-purgate-type: clean
X-purgate-size: 3808



On 29-Jun-26 00:51, Hirokazu Takahashi wrote:
> Currently, during ARM Xen's SMP initialization, if there is
> a Device Tree error (such as an invalid 'enable-method'),
> cpu_possible_map can end up being sparse.
> 
> The issue here is that nr_cpu_ids is calculated in a way that
> doesn't properly account for the maximum CPU ID when the map is
> sparse, causing a mismatch. For example, if cpu_possible_map is
> 0xff0f, nr_cpu_ids becomes 12, but the actual maximum CPU ID
> is 15. Xen's common code is built on the assumption that
> 'CPU ID < nr_cpu_ids', so this mismatch can break things.
> 
> To fix this, modify dt_smp_init_cpus() so that if the
> arch_cpu_init() call fails, we don't consume the CPU ID slot.
> 
> Changes in v2:
This should come after ---, not to be included in the final commit msg.

> Fix an issue where cpu_logical_map(0) is cleared when boot CPU
> initialization fails.
> 
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
This should have a Fixes tag (I traced to 4557c2292854).

> ---
>  xen/arch/arm/smpboot.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 7f3cfa812e..0ab9619398 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -191,6 +191,14 @@ static void __init dt_smp_init_cpus(void)
>              continue;
>          }
>  
> +        if ( hwid != mpidr && cpuidx >= NR_CPUS )
This should stay where it was with just i >= NR_CPUS. By moving it here, above a
duplicate filter, you are causing a regression. When the CPU list is full and it
hits a duplicate, instead of ignoring the duplicate and moving on, it stops
reading the list entirely (the boot CPU can be past that). Also, it makes the
diff smaller.

> +        {
> +            printk(XENLOG_WARNING
> +                   "DT /cpu %u node exceeds the max cores %u, capping them\n",
> +                   cpuidx, NR_CPUS);
> +            break;
> +        }
> +
>          /*
>           * Duplicate MPIDRs are a recipe for disaster. Scan all initialized
>           * entries and check for duplicates. If any found just skip the node.
> @@ -224,24 +232,19 @@ static void __init dt_smp_init_cpus(void)
>              bootcpu_valid = true;
>          }
>          else
> -            i = cpuidx++;
> -
> -        if ( cpuidx > NR_CPUS )
> -        {
> -            printk(XENLOG_WARNING
> -                   "DT /cpu %u node greater than max cores %u, capping them\n",
> -                   cpuidx, NR_CPUS);
> -            cpuidx = NR_CPUS;
> -            break;
> -        }
> +            i = cpuidx;
>  
>          if ( (rc = arch_cpu_init(i, cpu)) < 0 )
>          {
>              printk("cpu%d init failed (hwid %"PRIregister"): %d\n", i, hwid, rc);
> -            tmp_map[i] = MPIDR_INVALID;
>          }
>          else
> +        {
>              tmp_map[i] = hwid;
> +
> +            if ( i != 0 )
> +                cpuidx++;
> +        }
>      }
>  
>      if ( !bootcpu_valid )
> @@ -251,10 +254,8 @@ static void __init dt_smp_init_cpus(void)
>          return;
>      }
>  
> -    for ( i = 0; i < cpuidx; i++ )
> +    for ( i = 1; i < cpuidx; i++ )
Starting at index 1 is correct, since smp_prepare_boot_cpu() already
set cpu_possible_map bit 0 and cpu_logical_map(0). That reason lives in
a different function though, so please add a short comment here to make
clear index 0 is skipped on purpose.

>      {
> -        if ( tmp_map[i] == MPIDR_INVALID )
> -            continue;
>          cpumask_set_cpu(i, &cpu_possible_map);
>          cpu_logical_map(i) = tmp_map[i];
>      }

Other than that, this is a good fix, thanks.

~Michal


