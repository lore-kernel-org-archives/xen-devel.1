Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7988C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 14:37:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393046.1631949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvySf-0002lq-84; Mon, 17 Aug 2026 14:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393046.1631949; Mon, 17 Aug 2026 14:37:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvySf-0002lj-52; Mon, 17 Aug 2026 14:37:13 +0000
Received: by outflank-mailman (input) for mailman id 1393046;
 Mon, 17 Aug 2026 14:37:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wvySe-0002ld-7i
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 14:37:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvySc-008sg9-F2
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 16:37:10 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a831c76-bab6-0a2a0a5309dd-0a2a4506d440-48
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 16:37:09 +0200
Received: from [52.101.62.64]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a831c94-195a-0a2a45060019-34653e40437a-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 16:37:09 +0200
Received: from CH0PR03CA0367.namprd03.prod.outlook.com (2603:10b6:610:119::24)
 by CH2PR12MB9459.namprd12.prod.outlook.com (2603:10b6:610:27d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Mon, 17 Aug
 2026 14:37:00 +0000
Received: from DS2PEPF000061C2.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::36) by CH0PR03CA0367.outlook.office365.com
 (2603:10b6:610:119::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 14:37:00 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF000061C2.mail.protection.outlook.com (10.167.23.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Mon, 17 Aug 2026 14:37:00 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 17 Aug
 2026 09:37:00 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 17 Aug 2026 09:36:56 -0500
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
 b=tDHxkP/w+AyrmXX2AOBdAaSox41Yc893yH2OCzjyvlf9el+QdeMHAYNCZx83+20zJJNpZSg2Wi//bwtp6+KX4O63NZYJ84efa4I/m4q8yM8hCnZtTBWJH2/uqBMCGgGx01ZoGXQ6NhSydZDqlXOMgpZaVva7T+wHHEYsDJHRcPEfPwOym9dKrVf5qN5DR0HAWNrd73gTug2PZ7K4MiANDR/AveCDSpy2uJ711Fh2B2598hrmpLq3C7C1vD21CgfcFudzCUlx4Lq7l8nf3YJfHFTI0p1jH1HVJSaqYpk+OX4KxwteWCUfkdhl/lmbg6AepxJw5+QzZzBuybET1z+ZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NV2lAk3hJ3iJJZP8403qZOXtIotAkZzFnoFFkwdRvRY=;
 b=tQBDELk22V0u6hS4paVsU+/8lI1suVyfqIyb6OxeOV9y6vYgoaQfgVpesnTIHqx9pc/ikMD4ipJ7yG9dKTGXoKH5JPVLGwDsl5RbkZl1cF1RgdYjVZfghJqolaNN2roFvLXJR8BX/aimLqA05UAgr9/S99HYOoMQhgQla7Fv2VTAt2LuvjLMKYT10kfUxJeLv/Hlo9SdIHXo9k1OWzelczfm1C65q/S4Vh54yHawLecpm2sbiruj55sxqhL/sgan0aHdheEs3MoBoIk+4Xw3XUlag5vJ1yidPAH18uO2OrulhLDqxt2Tn6P6eARvj8YSYC+BMxGDXW6x/3F7OpeBkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NV2lAk3hJ3iJJZP8403qZOXtIotAkZzFnoFFkwdRvRY=;
 b=R0rTYGIkR5q/QIioyWR3QOsyZ1iEioYw8XOAgObwHSaEMd/u0LRUuYvptSaRVrUgUZV5GPdjBLp5BiK8UrdrCSFGtdeacsPUMU2oStfODPeJrs9fTQYdFOLd1WVlKu4xvSX4+a7LcbQOpZGiisog/06hpTykcq10Kx5quoXq0Zk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <1e53ea73-0f9e-48ca-978c-d22fb04c4d45@amd.com>
Date: Mon, 17 Aug 2026 16:36:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] ARM/sysctl: Expose the supported guest GIC modes
 in physinfo
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julian Vetter
	<julian.vetter@vates.tech>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, Andrii Sultanov
	<andriy.sultanov@vates.tech>, Guillaume Thouvenin
	<guillaume.thouvenin@vates.tech>, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, Teddy Astie <teddy.astie@vates.tech>
References: <1784210820.8631fc262581453bbf619ec5b2062170.19f6b408bba000edb5@vates.tech>
 <20260716141138.88265-1-julian.vetter@vates.tech>
 <1784211104.8631fc262581453bbf619ec5b2062170.19f6b44e427000edb5@vates.tech>
 <ee383990-f688-4244-b817-5df4c2f8decc@amd.com>
 <732ee2f6-0091-45d3-bf98-e8f21b70ca0d@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <732ee2f6-0091-45d3-bf98-e8f21b70ca0d@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C2:EE_|CH2PR12MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ecc2694-eeaf-4c03-3200-08defc6cff72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|7416014|376014|6133799003|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DPmMVHgP6ZY9h7+/TvQyXXoNe561MYqx0zYohWBurWIo1DdtxQ40iXqx+aVUKf33kGQWdDC1egu3AMYVJDDJaRbB++1mx42iZ0v8fGiBIbGUBKIsMLV85WsICHPGoTxqYZ7EkTDtAidKt6sGh+eBx15XpyBlFXTcsD3fKxep5aDiYZprhmY5baHNgcgqV5FwdhGZcuASrQW1Df5tJh450DRHQ22uvBptUoT+TPGtYbOHh8SE1wv+fPJGZa4YtgSBuSiH+3WAZLatHn0QagdkOWeyPyy/BRnxIFmbhYv56pOiIoZylbchSj6w8MnJrtZpGOHYqE+biBR2kOcpPR0fYlANhG1eRKxWPEC8fy7JcDLqbOsZnIZDg7GZhOL4T5zqaq2VTzOyfFZTZrJlEyKJXpWmb3IH/LTeJXg8Jl4d1jnpqPMaEBonc60Tm/vq42eW5LftK/L3wSys5HMZlIiqEJ3nUQjvZ/lnsdf92UkZaljz7RrzVxowwynElNfVm0aBrntKjK5rSC2pkQVi2ViHoHfmGFi1uIVKbfEWA77mFu+jAn6ueYBha4P8KTIHf6W4uvefagJLgUiE4BQocnts9lqGneWrnTfdtI0BlIf0r8fZ/7kbD9dI39UlRApAvxk9rNLcduqeQcDdTC9xFsUHMprM/EogTN1jypv5HVl264vjGSilLdd3p+96dtHS5HdICJCxfiVNUY8NtMZteyFPKw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(7416014)(376014)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G25AiOwmshJhW4lU2KrnVEXOwGNU+NfaGZEA4ek/oGgDfNLEd+1JcDriBhF0OaDsu9qDG+8LVw/+dHmHjdR7QZocNiApzBjpkNL5m935UDmQkvi1ZpC49AhzNEqsWkz75O5yyLd32Ywqou+Es6VdeOI2nxAKprx71kj0cmrbLtdH0gLWdbWe5dlg9t4M8TWXV2tV/LJ6neXrWIEReVN4FY0b6boNBeqI0gUf34tEhJMzwySMYrXUdFTQ44+XXzsDQHsRy8q2R4YygP3RuHX9hMfRhQjZ9mnoC3VDv2jTtfBNmP7zsFqJvjQ4Db4sSRR3SQgAcKcg2x7O/ZgJ72HPymD9wiphjNAw+ZNcNzedRsRdgWZPYM8AxsUFEeD3k+4nWjgWvQPqCDNg+Ne4b7JVIfAPAU0lc2ikk20QjNaIkf0cCHSFkx0eJ1300n6rBIzp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 14:37:00.4732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ecc2694-eeaf-4c03-3200-08defc6cff72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9459
X-purgate-ID: tlsNG-16d1c6/1786977429-F4A0477B-71B31ABA/0/0
X-purgate-type: clean
X-purgate-size: 1844



On 17-Aug-26 15:08, Andrew Cooper wrote:
> On 17/08/2026 1:39 pm, Orzel, Michal wrote:
>> On 16-Jul-26 16:11, Julian Vetter wrote:
>>> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
>>> index 32cab4feff..3b0edf4cec 100644
>>> --- a/xen/arch/arm/sysctl.c
>>> +++ b/xen/arch/arm/sysctl.c
>>> @@ -21,6 +24,29 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>>>  
>>>      pi->arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
>>>                                         XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
>>> +
>>> +    /*
>>> +     * The GIC version(s) we're happy creating guests with.  Right now for
>>> +     * simplicity it is tied to the active hardware version, but this will
>>> +     * cease to be the case if/when the compatbility modes are enabled.
>> s/compatbility/compatibility/
>>
>> GICv3 may support GICv2 and we support libxl guest requesting GICv2 on a GICv3
>> host. Why are we not exposing this information here?
> 
> Hmm.  That wasn't my reading of the logic at the time I wrote this.
> 
> Looking at it again, we probably should be advertising the result of
> vgic_v2_hw.enabled alongside the main GIC version.  (Plus whatever
> ifdefary is required to make this build.)
Yes.

~Michal

> 
> 
> The domain create side is even more wonky. 
> arch_sanitise_domain_config() takes the toolstack choice of vGIC
> versions and asks whether the number of CPUs is compatible, but it's
> midway through arch_domain_create() which first notices if the requested
> vGIC version isn't compatible with hardware.
> 
> There really wants to be an __ro_after_init supported_vgic_versions
> (name subject to improvement) which is filled in by the various GIC
> initialisation routines, rather than a set of backbacks into disjoint
> drivers.
> 
> ~Andrew


