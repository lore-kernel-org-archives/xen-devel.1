Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA00C5DF80
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 09:18:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393793.1632612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFxi-0001WJ-9I; Tue, 18 Aug 2026 09:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393793.1632612; Tue, 18 Aug 2026 09:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFxi-0001VW-6j; Tue, 18 Aug 2026 09:18:26 +0000
Received: by outflank-mailman (input) for mailman id 1393793;
 Tue, 18 Aug 2026 09:18:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wwFxg-0001Uq-J6
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 09:18:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwFxf-00B445-JD
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 11:18:23 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a842350-8faa-0a2a0a5109dd-0a2a450cdbea-36
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 11:18:22 +0200
Received: from [52.101.43.27]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a84235d-f479-0a2a450c0019-34652b1b1f1c-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 11:18:22 +0200
Received: from CH0PR03CA0199.namprd03.prod.outlook.com (2603:10b6:610:e4::24)
 by SJ0PR12MB7066.namprd12.prod.outlook.com (2603:10b6:a03:4ae::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 09:18:16 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::66) by CH0PR03CA0199.outlook.office365.com
 (2603:10b6:610:e4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Tue, 18
 Aug 2026 09:18:16 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Tue, 18 Aug 2026 09:18:16 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 04:18:15 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Tue, 18 Aug 2026 04:18:14 -0500
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
 b=UllfezdwrDQlvbG+nayyye0gZVZhEhvQuJy1eX2lLDr60IaIGDOhpC6dJCprnrVaEjkwGC6gqzQkvQixe/u99Prq35t3hXb1vKIDTzCLVKRtZK3FXgo9e0+YL5OLTgeW4DpbubvCVUAo1Pr0mIpeBbaSe8oN9NN5WbqOtDwfjs4mT9HwpE+IG0VgyXxgXifY8spp5NxgA9kW7iMk2/2uWHS3WobEHPiNs29dD0V7loCC88KHrT9V5sR05jcjyqVq5wuF5kcFIRv2FoSJLqXO+SkSfGX55PW3RfdhIC482C+/np7dr0foQdH+0Lqlg4RfQh/yR0VqEtNrUFeN5EPRlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZqpulfjTWkOhIsoGZ4e0pAvqoxKQjA10qGlLQTjhQg=;
 b=f9+qOkl0K7Y0tspR8rRcX0hSz+BU+50b9oIFm3ls09GHN+Cl3iPJ1EQirRSk0mI0421GGlINWhUY6X64A5NQ7Vy9m7MKxrx+ueLe/1hTZo14dNR8CdK0nbaoDnTi212W5FfqncruAY5Wtx/CodjyrGN590UVZkLmT/vwr5B6YIqE9R+lotH3CWbGXT0Qsa5MDOjJZVR+1sLGkOfMpzilgjGnowkbM7wXktzmjN6Hdzo1m5RPAr01fOTfc39VPeIOwLra/EIGnb4UlGS7Tam7fs1qi1jS6ARxBRJJsS/ttDKQyiXGgR1haDUqaHPwpz2jqLYUYT/TZzciQoi/zH4LIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=valinux.co.jp smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZqpulfjTWkOhIsoGZ4e0pAvqoxKQjA10qGlLQTjhQg=;
 b=uKpy0LJX3vb4cpAincOvPRmKDsEsBxJ0vs0BcXGsP8fmzDzMWIDsWmdTlYkmrMbPXw29YEITrQLL6IsVQ/0kuoYGgvEx8T7946V6H/fTRGbdUOOYBl43/WVP8FhaujFM2sUzu2h4EDwbqPlBEv8p5WOUlCy0P0tOFYab/5xuxzU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <5f9c4266-e808-4478-a339-53b16a53b32a@amd.com>
Date: Tue, 18 Aug 2026 11:18:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: Hide PMU registers from the guest, when the
 vPMU feature is disabled.
To: Hirokazu Takahashi <taka@valinux.co.jp>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260813032938.3946-1-taka@valinux.co.jp>
 <37b2d119-7ff9-4862-9bcd-acb0b7ff4c9d@amd.com>
 <OS9P286MB722234CE96BB22DD89AC65B082A62@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <OS9P286MB722234CE96BB22DD89AC65B082A62@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|SJ0PR12MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: c34ee783-4851-435c-e6b8-08defd09a2ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|18002099003|22082099003|56012099006|13003099007|6133799003|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	3DMzfPgNtBGaaLE7tqKr0TK88GTX0VTSi/Al0eaCERjIUSC5l84+dB1gf9vwLeR2pFnSutCP34nIIauVYvyIxP6wxCEDKGQwVjx0i5NVVuxS37j0dsoih15pPHVwMEwcOX1pJy1yXkXA8Rwl27Hu4mL9LPqgkN+H7lJ2jlcHGIenkyI8/liXi76/c9+KFSKr56rtuRwiQ4H+h7o3WNz+i0z7Z25V5qrYoZ56EMnGB2LOcdKdAeTUY0mZPWY9DBtlm1JRke1NyWyTNraJ8pljmeza1jPJWIajm1o1aQc9DulsrjId/jdpkjUL9PtgKdveeqJhLDRqWXxHmykhwae1EjYw3DobeYfEPjNsD8dl/uMVsadf7e1qBIYE3toqfsv2C9EzNtbMQrrU3HMEhPSRGB1QT2hqgQDpVfQypvkJogjoIYT6PZGiX00HxX/8AOZSrpZvcFLW2v0JPknKGQq2/PcZt6ysQYtG3bskDafqR1or+ourViBEsUvoq6OkvLNh5hi81EtpW35LSK5hGiIFQkhNHzQ2eu+SatwME/NLqyFB3Z94f/EVBbS2wIFvUYrij5scSgld/+M5Qfi+VoC9yAyTUFZJLD6/xbFJzyLwzg7VkUdT6gZAdIDYEgieZNgbgRVEI2v6NGq2l3uS97VIwC5fGVE4XDriwAoLAiOPaFEhEJQhVpG47FWWBGHo18lyrUMJh245Z3zrnutNw/QaEA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(18002099003)(22082099003)(56012099006)(13003099007)(6133799003)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	M4y+vJDk8PhKX+WhiX2ZzlEAPBvi4/2PsjnQ14xJoJp3LeiHdn0rDb6xmHUrQbkYJqvhi8fBwnFB2oVK93x9kNKhun/etTWhbFXwcS++uokLGQyA7E+bRnR2EJZD0U4E8BYmuV4BJh3whFbS8xgIts3hOoVvTanM1PhfBmzbAWff5diWlfuVoJNq4j1qHbcQta9tP9dBQAH7sXtWFHoUUzIv5L2cTunnVarijhOdkblP77wLpZfDPVGOEOKyLjNqSAtXgsfQgjdNNHwHMTartVQNv48PePXBvBNDh2jfXqfRwtbh8dxyl6BsQtxjnlvL9v+eJc0TOhk2fVtVHYvKP7Hy+spWntfl3LGeych2QZdjSZtpam0IkVeJvr4ch4fRYdhCkl/Zx2FEvwN2giP117JCiM6IWSSUZVHHWbVTVlduQx/zYrItjg1mM3GeyeRo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 09:18:16.2745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c34ee783-4851-435c-e6b8-08defd09a2ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7066
X-purgate-ID: tlsNG-d25034/1787044702-00CCBA5B-F4689333/0/0
X-purgate-type: clean
X-purgate-size: 5696



On 18-Aug-26 10:50, Hirokazu Takahashi wrote:
> Hello,
> 
> Thanks for the comments.
> 
>>> On ARMv8.4-A and newer platforms, booting Dom0 Linux with ACPI enabled
>>> causes the domain to probe advanced PMU feature based on system ID
>>> register ID_AA64DFR0_EL1.During this probe, Linux accesses PMMIR_EL1,
>>> which causes unhandled register traps and crashes the domain.
>>>
>>> To address this issue, I implement the following:
>> Please use the imperative mood
> 
> Okay.
> 
>>> - Hide PMU registers from a guest domain when its vPMU feature is
>>>   disabled.
>>> - Proactively make SPE, TRBE, BRBE, and Trace Extensions inaccessible
>>>   to guest domains, as they could potentially cause similar issues.
>>> - Add emulation for PMMIR_EL1 register accesses performed by a guest
>>>   domain when vPMU is enabled. However, similar to reads from other
>> When vPMU is enabled, there is no trap/emulation
> 
> Understood.
> 
>>>   PMU registers, the read value returns zero (note that this is a
>>>   temporary implementation).
>>> - Emulation for PMSS (PMU Snapshot) register accesses is not yet
>>>   implemented, because PMSS support is not available in
>>>   qemu-system-aarch64 and could not be verified.
>>>
>>> Fixes: 07b9acea116e "xen/arm: Add handler for ID registers on arm64"
>>> Fixes: 3669a1cb9598 "xen/arm: create a cpuinfo structure for guest"
>> Fixes commit title needs to be in brackets ()
> 
> Okay.
> 
>>> --- a/xen/arch/arm/arm64/vsysreg.c
>>> +++ b/xen/arch/arm/arm64/vsysreg.c
>>> @@ -229,6 +229,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>       */
>>>      case HSR_SYSREG_PMINTENSET_EL1:
>>>      case HSR_SYSREG_PMINTENCLR_EL1:
>>> +    case HSR_SYSREG_PMMIR_EL1:
>> What about AArch32 PMMIR?
> 
> Okay, I will add a trap handler entry for AArch32 PMMIR register accesses.
> 
>>> @@ -306,7 +307,6 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>      GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
>>>      GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
>>>      GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
>>> -    GENERATE_TID3_INFO(ID_DFR0_EL1, dbg32, 0)
>>>      GENERATE_TID3_INFO(ID_DFR1_EL1, dbg32, 1)
>>>      GENERATE_TID3_INFO(ID_AFR0_EL1, aux32, 0)
>>>      GENERATE_TID3_INFO(ID_MMFR0_EL1, mm32, 0)
>>> @@ -326,6 +326,18 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>      GENERATE_TID3_INFO(MVFR1_EL1, mvfr, 1)
>>>      GENERATE_TID3_INFO(MVFR2_EL1, mvfr, 2)
>>>
>>> +    case HSR_SYSREG_ID_DFR0_EL1:
>> You only cover AArch64. What about AArch32 DFR0?
> 
> Okay, I will also add a trap handler entry for it.
>  
>>> +    {
>>> +        struct domain *d = current->domain;
>> Use v->domain instead like the surrounding code
> 
> Okay.
>  
>>> +        union cpuinfo_dbg32 info_dbg32 = domain_cpuinfo.dbg32;
>>> +
>>> +        if ( !(d->options & XEN_DOMCTL_CDF_vpmu) )
>>> +            info_dbg32.perfmon = 0;
>>> +
>>> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
>>> +                                  info_dbg32.bits[0]);
>>> +    }
>>> +
>>>      case HSR_SYSREG_ID_AA64PFR0_EL1:
>>>      {
>>>          register_t guest_reg_value = domain_cpuinfo.pfr64.bits[0];
>>> @@ -348,7 +360,6 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>      }
>>>
>>>      GENERATE_TID3_INFO(ID_AA64PFR1_EL1, pfr64, 1)
>>> -    GENERATE_TID3_INFO(ID_AA64DFR0_EL1, dbg64, 0)
>>>      GENERATE_TID3_INFO(ID_AA64DFR1_EL1, dbg64, 1)
>> What about DFR1 fields like PMICNTR? They suffer from the same problem.
> 
> Okay, I will fix it.
>  
>>>      GENERATE_TID3_INFO(ID_AA64ISAR0_EL1, isa64, 0)
>>>      GENERATE_TID3_INFO(ID_AA64ISAR1_EL1, isa64, 1)
>>> @@ -358,6 +369,22 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>      GENERATE_TID3_INFO(ID_AA64AFR0_EL1, aux64, 0)
>>>      GENERATE_TID3_INFO(ID_AA64AFR1_EL1, aux64, 1)
>>>
>>> +    case HSR_SYSREG_ID_AA64DFR0_EL1:
>> Please adhere to the order in which the cases were originally placed
> 
> Okay.
> 
>>> +    {
>>> +        struct domain *d = current->domain;
>>> +        union cpuinfo_dbg64 info_dbg64 = domain_cpuinfo.dbg64;
>>> +
>>> +        if ( !(d->options & XEN_DOMCTL_CDF_vpmu) )
>> To avoid duplication, please introduce is_vpmu_domain
> 
> Okay, I will.
> 
>>> +        {
>>> +            info_dbg64.pmu_ver = 0;
>>> +            info_dbg64.mtpmu = 0;
>>> +            info_dbg64.pmss = 0;
>>> +        }
>>> +
>>> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
>>> +                                  info_dbg64.bits[0]);
>>> +    }
>>> +
> 
>>> @@ -216,16 +216,18 @@ struct cpuinfo_arm {
>>>              unsigned long trace_ver:4;
>>>              unsigned long pmu_ver:4;
>>>              unsigned long brps:4;
>>> -            unsigned long __res0:4;
>>> +            unsigned long pmss:4;
>>>              unsigned long wrps:4;
>>> -            unsigned long __res1:4;
>>> +            unsigned long sebep:4;
>> Where did you take this field from? I can't see it in the latest Arm ARM:
>> https://support.arm.com/documentation/ddi0487/mc/-Part-D-The-AArch64
>> -System-Level-Architecture/-Chapter-D24-AArch64-System-Register-Descri
>> ptions/-D24-2-General-system-control-registers/-D24-2-79-ID-AA64DFR0-
>> EL1--AArch64-Debug-Feature-Register-0?lang=en
> 
> In a slightly older Architecture Reference Manual, there was a SEBEP field
> in ID_AA64DFR0_EL1. Has it been removed from the spec?
I can see it's been added since Armv9.3. I'd recommend leaving it as RES given
that you do not use it anyway in this patch. We usually do the update looking at
the latest Armv8-A spec.

~Michal



