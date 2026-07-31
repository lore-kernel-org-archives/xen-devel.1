Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7E4C54F54
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 07:49:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378813.1623861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wphzm-0002L0-TM; Fri, 31 Jul 2026 07:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378813.1623861; Fri, 31 Jul 2026 07:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wphzm-0002Kt-Qk; Fri, 31 Jul 2026 07:49:30 +0000
Received: by outflank-mailman (input) for mailman id 1378813;
 Fri, 31 Jul 2026 07:49:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wphzl-0002Kn-Mg
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 07:49:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wphzj-00BJ5j-W9
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 09:49:28 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a6c5372-5cb7-0a2a0a5109dd-0a2a4501e508-38
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 09:49:27 +0200
Received: from [52.101.85.35]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a6c5380-5984-0a2a45010019-34655523d069-3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 09:49:22 +0200
Received: from BN9P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::14)
 by MW4PR12MB7483.namprd12.prod.outlook.com (2603:10b6:303:212::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 07:49:15 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:408:13e:cafe::55) by BN9P220CA0009.outlook.office365.com
 (2603:10b6:408:13e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Fri,
 31 Jul 2026 07:49:14 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 07:49:14 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 02:49:13 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 02:49:12 -0500
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
 b=wj1ovunjkgu+Eh1LesLqNhaB9crt2YjopPsLPDRl+rYisSXYxC7OBD8azhjrxYrWyuJMfsvJ7Dv05+WGbLbk89/H/FBHt+oKxs6n7NBZFxQYyFbUZCcPnn0tJTV0fo4lYDcqqFhYOT1RQdf57js3nBK+YMsvozvl5B6ABHwrsiVJFEQ2iIW3wP5vPeaahHg2ycM5LMnPUQjQkNfxHtliuHNaMUQ8Nln/Fm/RsBV4pXk96/fFl1fe7I/mxkFJg213PpAQjEAQq0uMudIs31uJ6K3QKglALqBKdM3luoWxNHN0/SlojiTvtz9LxyZPjFrLP/3x90zgXNwObYdnp4tq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BWJ7WrPWZmO47oVWsQSnUiYy1NbVK6P8zPGXR7TTuo=;
 b=o7QIATKyankAHXh8DXAmW2zzU1Q+vXu9sn49YDOyptHH6/SSqprFhu5yN/r20Nmo4vOT6MZSheuAZ0Bh64GonabC2Gy0hMRV47K9Q7r5TiFAFgDITapSJ7se16pRXH+gWglu2Obw/UvuGKI/aGBhNI1+fm78/g2LgkxFy/SEQ1F5PsOHXebXID8uXgu6tWOanuGvNH5+YDVfnnS4MFk/NYn7pf9kNQkhFgsuvVY9Bmbyz3kLauGsVc+mGh0P78cZ+KbcyAWXNCP2t+/8gL0+bOPBzIvJpUx6Dobgn2JPGvoFDbuZMnq4R6V5hPYJ6j9IDBOfD84pA0WoiVaerY+O6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/BWJ7WrPWZmO47oVWsQSnUiYy1NbVK6P8zPGXR7TTuo=;
 b=tt+Gl5nu/9gnT2qh0Qpf/JzHiAwF8bqK/hXitNF00HDT4D4x5JQouiqfrIiX9Wktzb+s47PQbXUYq/IW5/eSXscxuxZ07hAV2mgJUGJT5zi8rEtfU36WFULo3pdCWD7RL843Nwo2G9x9oZitiFEdeO3sRpvjm80tY0UmEiSonzY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <f213f189-02d2-4edb-ab4e-591cedd11455@amd.com>
Date: Fri, 31 Jul 2026 09:49:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] xen/arm: propagate secondary GIC initialization
 failures
From: "Orzel, Michal" <michal.orzel@amd.com>
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <9fd0d0eacf061cc2a32f440e3438c084fa9ca79c.1783678619.git.mykola_kvach@epam.com>
 <acb504c2-f66d-4c69-9fa0-db36030631bb@amd.com>
Content-Language: en-US
In-Reply-To: <acb504c2-f66d-4c69-9fa0-db36030631bb@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004689:EE_|MW4PR12MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ee4b17-076b-4e77-e051-08deeed8376c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|11063799006|56012099006|10067099003|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0Rk587fKMkBGP5oE8GmGId0o9a+umWhiyj+dsdfvrVKIcrlufIUwFWzFpppgQf4ILFT9rl9bZdFKIFifgqKbn//H3Ynh0uUs49C+IjnTFCDRINu+V6V+TpzLqZUHz3yQWYQsmHCAKnb38L11ed1CkxUrG9bdzH5DflhbMBiRNHimphpA+j8/hTwdr9Wy6hZ5CV01u5Kcz2+M3I4qJYc5G1a+Ijq2StW6nU3KfP4LdhkE3upTTV+dP2NPzmxkcXPWe3echzUboAVqgqsTuyiG4g7bSRVFtz2tRPMLnj3grexvwSYm5qYh+eGTvhSCm1aubMA2PyFlc7I7A4nMUdvy/owjTEFdjTGjqHaJ2xTMjIIlYSta8LXD4/BhpPQJY06n0FNa9Bppd8khNbcGAPdNqGfDUJDVmTlziOamf1XWKSAVaz8zDxCtw00bsE2bxgY92Z4UgkS8mSXmnEi0OYJOzHtqxO+Yo9RMlAdd0J24KbIzwv9xipVHKFAVHBFQAbR0wuUGLgUQ6VBlVPItGtef+aaQsNB5Zl7UHxaHOIxDx1l0debwTYZdFdKsZ25U11KHLdsdizIhrzO85YxOOTYW8MiIylUyF65V24eSoOQjRtcWa0JO6vmQPINycO8sB72x10A33Qti/J/5dhYxMVw0UNml3jT5UG6FaLaeGrFv8UtHzFNzltr+A3WRDH1tJKHp+VKooW7F9L0ixacVDZOT2Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(11063799006)(56012099006)(10067099003)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	48SIyMBU/vZqQxHx0/dTotOEN6nsFsbphlC0hKOWzvW7HN3dYgqFsGnTSmeutECvy+61TYtdA00m+RLidVWqz1HkNhO8Rcj3kSC9G7kzCLlqsSjDtoMggTDLhugEFvJk+SxyBJa5q529wqDDcrzM4F47aKIc0ySRauWKovb6TEWatanG6NQqB1FjRtvmhbIG5HjUPFXVjQPV9ur9tz/U/4hdCAkohZoY+reeoLsY6jX59ArpWLXT7hf3Pw5mK5ENbCCgM67i2YKuZZF4HUJ85bKmP86akHp8CVDuRseR8SMSg4YJ0KlFtTAIOikBtU+xpUHHMUzvpO/uyEpXLlT8wZZjXJdjvM4mC094q0sQnD8J3I94O/1b0pwuX8cVcu6Bx5JK9XdIZjOPaW0G1d0M2tCfFplE7c6n5maXECxNSbGSZeCe1fmtYNG5iRYsslz5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 07:49:14.2990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ee4b17-076b-4e77-e051-08deeed8376c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7483
X-purgate-ID: tlsNG-d62444/1785484167-BF262757-48C027DA/0/0
X-purgate-type: clean
X-purgate-size: 3550



On 22-Jul-26 13:04, Orzel, Michal wrote:
> 
> 
> On 10-Jul-26 12:20, Mykola Kvach wrote:
>> The GICv3 secondary_init() callback can fail while discovering or
>> waking a Redistributor, enabling LPIs, or setting up an ITS collection.
>> gic_init_secondary_cpu() currently discards that status. start_secondary()
>> then marks the CPU online even though its per-CPU GIC interface may be
>> unusable.
>>
>> Return the callback status through the common GIC layer. Have
>> start_secondary() report the failure and stop the affected CPU before it
>> is added to cpu_online_map.
>>
>> Fixes: bc183a0235e0 ("xen/arm: Add support for GIC v3")
>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>> ---
>>  xen/arch/arm/gic.c             | 10 ++++++++--
>>  xen/arch/arm/include/asm/gic.h |  2 +-
>>  xen/arch/arm/smpboot.c         |  9 ++++++++-
>>  3 files changed, 17 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>> index ee75258fc3..078049e741 100644
>> --- a/xen/arch/arm/gic.c
>> +++ b/xen/arch/arm/gic.c
>> @@ -282,11 +282,17 @@ void smp_send_state_dump(unsigned int cpu)
>>  }
>>  
>>  /* Set up the per-CPU parts of the GIC for a secondary CPU */
>> -void gic_init_secondary_cpu(void)
>> +int gic_init_secondary_cpu(void)
>>  {
>> -    gic_hw_ops->secondary_init();
>> +    int rc = gic_hw_ops->secondary_init();
>> +
>> +    if ( rc )
>> +        return rc;
>> +
>>      /* Clear LR mask for secondary cpus */
>>      clear_cpu_lr_mask();
>> +
>> +    return 0;
>>  }
>>  
>>  /* Shut down the per-CPU GIC interface */
>> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
>> index ff22dea40d..ee2c26adb4 100644
>> --- a/xen/arch/arm/include/asm/gic.h
>> +++ b/xen/arch/arm/include/asm/gic.h
>> @@ -291,7 +291,7 @@ extern void gic_preinit(void);
>>  /* Bring up the interrupt controller, and report # cpus attached */
>>  extern void gic_init(void);
>>  /* Bring up a secondary CPU's per-CPU GIC interface */
>> -extern void gic_init_secondary_cpu(void);
>> +extern int gic_init_secondary_cpu(void);
>>  /* Take down a CPU's per-CPU GIC interface */
>>  extern void gic_disable_cpu(void);
>>  /* setup the gic virtual interface for a guest */
>> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
>> index ba5fd2dd52..5e23b0b6a9 100644
>> --- a/xen/arch/arm/smpboot.c
>> +++ b/xen/arch/arm/smpboot.c
>> @@ -319,6 +319,7 @@ smp_prepare_cpus(void)
>>  void asmlinkage noreturn start_secondary(void)
>>  {
>>      unsigned int cpuid = init_data.cpuid;
>> +    int rc;
>>  
>>      memset(get_cpu_info(), 0, sizeof (struct cpu_info));
>>  
>> @@ -373,7 +374,13 @@ void asmlinkage noreturn start_secondary(void)
>>       */
>>      update_system_features(&current_cpu_data);
>>  
>> -    gic_init_secondary_cpu();
>> +    rc = gic_init_secondary_cpu();
>> +    if ( rc )
>> +    {
>> +        printk(XENLOG_ERR "CPU%u: Failed to initialize the GIC: %d\n",
>> +               cpuid, rc);
> NIT: While functionally identical, for consistency with the neighbouring
> messages you may want to use smp_processor_id() here instead of cpuid. I can
> change on commit.
> 
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
I was about to commit this patch when I realized that it should be moved above
update_system_features() as the comment above it suggests i.e. we should update
system features only if we do not stop the core. Please send a v2 with remarks
addressed.

~Michal


