Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38626C44532
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2026 11:04:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1368354.1617763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmUkc-0004Tq-4A; Wed, 22 Jul 2026 11:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1368354.1617763; Wed, 22 Jul 2026 11:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmUkc-0004Tj-0d; Wed, 22 Jul 2026 11:04:34 +0000
Received: by outflank-mailman (input) for mailman id 1368354;
 Wed, 22 Jul 2026 11:04:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wmUka-0004Td-NA
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 11:04:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmUka-005JC2-3a
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 13:04:32 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a60a3aa-e002-0a2a0a5209dd-0a2a450297ac-24
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 13:04:31 +0200
Received: from [40.93.195.60]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a60a3b8-6ca4-0a2a45020019-285dc33cec6e-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 13:04:25 +0200
Received: from MN2PR20CA0054.namprd20.prod.outlook.com (2603:10b6:208:235::23)
 by IA1PR12MB6163.namprd12.prod.outlook.com (2603:10b6:208:3e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 11:04:15 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:208:235:cafe::65) by MN2PR20CA0054.outlook.office365.com
 (2603:10b6:208:235::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 11:04:15 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.0 via Frontend Transport; Wed, 22 Jul 2026 11:04:15 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 22 Jul
 2026 06:04:15 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 22 Jul
 2026 06:04:15 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 22 Jul 2026 06:04:13 -0500
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
 b=R/f6s3zHVaFaO/oOdxZGHM509gS1VRxkjbBcOXFr3+vBxeR6KyHxQfqMyqdHBP8WtuV4LTPhuiME2suV6F5ldQn1iWqxDr+qBaUNQl6Zg43mu5rN+KEAF+dU+hk2+u05I3WO+6xDrOmCeTJ1zaTUr1oifgC1A5GUqNcxjlaTMlKUoopog9QuWsxBYdVKwn2E0NALMfVqIoIa8ctVnLJzmuYY2Hd/13/3diQHOUjA3Bg/buhJjtfrRaiyhA1FcVpMdTXze4+caT/UhgWh9Sb3E7axfvAtWXPUIbtONoC5Uw+6zvKEs7WbuJAqO0hqcfpLmnVJSjZjKcwyv+1l9Lm1ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WNCsv4nb9ekc0dsE2nL1fq+jIbdmfN14R8x2NcR1Yo=;
 b=kDlA0Q5bVf1L/zolE9Wz+UVa41kbK3NuGaDDmPGZf17RK6PDKEUJVSPB6W3xTEx6cy9uRdYwGEqKWlHxzSMEJUR6JA/HnXNpcsIETWDxZ3YdPzKR7NhX0wWjT6OhJk4yWcyfDlGxyAwUH5W61HYpf7rr+f/jUzkpCnIMMRDSPhsLGgqAswdxkqZ/+9O2IYLTm0kv9fSb8t9PA5a3jRhnD3O538HpLxC46cH/YsuFm12N4Z7On8G21VzHnzjoC8tcf00wsT5cNbpeK1/imljw5DynjosgJdmn33wBSh9Cy3E5ra+CvNHI218mEsNDWnUa63M8YW0paUyIXv8JnUUE7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WNCsv4nb9ekc0dsE2nL1fq+jIbdmfN14R8x2NcR1Yo=;
 b=WxZSW+ObYqi3FzfHQVwWaWd3NmZ+t/rCp6Zq+gZQq+twbDO+nbhht1qqyap1mHLZ85Y8/X6xrvL17In5i/EXKtA7r204ksc+POlQpQPx4VR3xJJM+KkAY5GukOso4bScPMFvGMAhVy1MARRwEnFQtFTe5/s/m3CKVQxe1nXaNBE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <acb504c2-f66d-4c69-9fa0-db36030631bb@amd.com>
Date: Wed, 22 Jul 2026 13:04:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] xen/arm: propagate secondary GIC initialization
 failures
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <9fd0d0eacf061cc2a32f440e3438c084fa9ca79c.1783678619.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <9fd0d0eacf061cc2a32f440e3438c084fa9ca79c.1783678619.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|IA1PR12MB6163:EE_
X-MS-Office365-Filtering-Correlation-Id: 38d38dde-4e66-4889-6448-08dee7e0f83a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|22082099003|18002099003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	DAfxZO9p8g3Jc3Id7eqRpINpMBqugBGdGjVmXL72kAE8MEYdKK1AoY4jyVTL5I2W0ljH8rpTnzXqqvPVwfZBmyzlUqn+eUk7QGQalashhe7Dj8HhuoYYlbGPMQmIqZFBwcYEPJVLr8s1FRwVJ1eYzjcDbSBBeipXDl+C8z7/NQCcI6XkFg0+y2c4zsAUYTH2qFv/RMm9WoP3HUPbimfrARhHpgetRxPpP+ivWP0N/NykfH21mdv8Ke9TM0V7LSmwrf/EFR7ig6Ky5oc4zh1bCJYeeNl5SjDZ84/BJ30iE5SjH/ZWd/ovmUdNEAaYjnl7m3YIyeFijssDlEt2WnFbd5o/vKFPn8DrVmsE68Cup2TtweGrX6kHJtshCuqbdlWOddScoDzr1QjVFyrltmh+F+J/njgdgT4zMzV940S5DdcpUr+XkOKz82mlR2vIcqgx+BX+nOCWf7GQnY9yC0OuFGr19cITyRPdaPx/P4Mggf5Ucftf7wRR66NkWWynpFGNI5yomBerqaUTCetOyKqra+mOLIcuAEepw14y34s4gtVOwZ9xsSobL0WmRf07rKcbT8IF6Mk8J6Jay4UgGTAJI73SWcoRd3BWYLByJ66LhBxPnf++Y2xhzHRK/lqyAx/JuXbLTSAc25fSac0e6XD88VPRrPIC8MYxfrvM6rwyqasqnu/Jh+6JZrdGo9tEdptRmiDobV1dwJM1PCUunHNhLA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gFGrIPplmA3MW05wFIzkchiuGlP3XJ4v0Qd+Y/uiWDcVPKLoeB3ulDDCS3XLlFE77NlMGFB3JLkuZBh9kLu6c+pwZPJoqK/QbZpUuGiH/4/CD4Sv8NtNwI7RMbjUZVNF/Sq0MwZLeyzGLYAxUS6/q16uaD7dmZ8exkzAK5DPK1beM/MBuZYoKhlqz9zynCLOlNjZ655dFIlWI1EU44bn5yWoLi7enOV+Rpq1u3gegv76FCg7AjlWp0U3pszt91T1WVB3TlHmjYmg0BrIXG9SKAUavo9JjNGwM/5d9exIr+e0JkcY4vEQw+bxQpLpy2n6N3f+cXCJ35+P9jviW+Exd//D6NQNP5U+zUOWG1o0mdQSzbPteK1HU0ZVKp+nWsEFIR37GbaN/98nEbAcI6blqIFCfJ8+lMx5WgRq/CAerG1Lq9D8Vb6lvHJPBGhDqdk1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 11:04:15.6061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d38dde-4e66-4889-6448-08dee7e0f83a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6163
X-purgate-ID: tlsNG-720697/1784718265-31FD62AC-5DB64CDD/0/0
X-purgate-type: clean
X-purgate-size: 3161



On 10-Jul-26 12:20, Mykola Kvach wrote:
> The GICv3 secondary_init() callback can fail while discovering or
> waking a Redistributor, enabling LPIs, or setting up an ITS collection.
> gic_init_secondary_cpu() currently discards that status. start_secondary()
> then marks the CPU online even though its per-CPU GIC interface may be
> unusable.
> 
> Return the callback status through the common GIC layer. Have
> start_secondary() report the failure and stop the affected CPU before it
> is added to cpu_online_map.
> 
> Fixes: bc183a0235e0 ("xen/arm: Add support for GIC v3")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>  xen/arch/arm/gic.c             | 10 ++++++++--
>  xen/arch/arm/include/asm/gic.h |  2 +-
>  xen/arch/arm/smpboot.c         |  9 ++++++++-
>  3 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index ee75258fc3..078049e741 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -282,11 +282,17 @@ void smp_send_state_dump(unsigned int cpu)
>  }
>  
>  /* Set up the per-CPU parts of the GIC for a secondary CPU */
> -void gic_init_secondary_cpu(void)
> +int gic_init_secondary_cpu(void)
>  {
> -    gic_hw_ops->secondary_init();
> +    int rc = gic_hw_ops->secondary_init();
> +
> +    if ( rc )
> +        return rc;
> +
>      /* Clear LR mask for secondary cpus */
>      clear_cpu_lr_mask();
> +
> +    return 0;
>  }
>  
>  /* Shut down the per-CPU GIC interface */
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
> index ff22dea40d..ee2c26adb4 100644
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -291,7 +291,7 @@ extern void gic_preinit(void);
>  /* Bring up the interrupt controller, and report # cpus attached */
>  extern void gic_init(void);
>  /* Bring up a secondary CPU's per-CPU GIC interface */
> -extern void gic_init_secondary_cpu(void);
> +extern int gic_init_secondary_cpu(void);
>  /* Take down a CPU's per-CPU GIC interface */
>  extern void gic_disable_cpu(void);
>  /* setup the gic virtual interface for a guest */
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index ba5fd2dd52..5e23b0b6a9 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -319,6 +319,7 @@ smp_prepare_cpus(void)
>  void asmlinkage noreturn start_secondary(void)
>  {
>      unsigned int cpuid = init_data.cpuid;
> +    int rc;
>  
>      memset(get_cpu_info(), 0, sizeof (struct cpu_info));
>  
> @@ -373,7 +374,13 @@ void asmlinkage noreturn start_secondary(void)
>       */
>      update_system_features(&current_cpu_data);
>  
> -    gic_init_secondary_cpu();
> +    rc = gic_init_secondary_cpu();
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "CPU%u: Failed to initialize the GIC: %d\n",
> +               cpuid, rc);
NIT: While functionally identical, for consistency with the neighbouring
messages you may want to use smp_processor_id() here instead of cpuid. I can
change on commit.

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


