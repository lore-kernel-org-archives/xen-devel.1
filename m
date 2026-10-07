Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD66CCA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 14:12:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442390.1659944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xESNR-00025p-Ib; Wed, 07 Oct 2026 14:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442390.1659944; Wed, 07 Oct 2026 14:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xESNR-00025i-FX; Wed, 07 Oct 2026 14:12:13 +0000
Received: by outflank-mailman (input) for mailman id 1442390;
 Wed, 07 Oct 2026 14:12:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xESNQ-00025c-Pi
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 14:12:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xESNP-00Co7a-Ak
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 16:12:11 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac65331-8faa-0a2a0a5109dd-0a2a450ca94e-36
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 16:12:10 +0200
Received: from [52.101.193.18]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac65339-f479-0a2a450c0019-3465c112f82e-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 16:12:10 +0200
Received: from DS1P223CA0003.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:453::8) by
 CY5PR12MB6324.namprd12.prod.outlook.com (2603:10b6:930:f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.16; Wed, 7 Oct 2026 14:12:00 +0000
Received: from CH3PEPF00000016.namprd21.prod.outlook.com
 (2603:10b6:8:453:cafe::1e) by DS1P223CA0003.outlook.office365.com
 (2603:10b6:8:453::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 7
 Oct 2026 14:12:00 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000016.mail.protection.outlook.com (10.167.244.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.3 via Frontend Transport; Wed, 7 Oct 2026 14:11:59 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 7 Oct
 2026 09:11:58 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 7 Oct 2026 09:11:57 -0500
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
 b=cpY07SY9tIh+Bcgwk5D79c2tvGpEXvAwCX9qluXf8IrHDSqXi9NSEn+RizQl05219eOlsm8CtC5i6mJqMUPkUVXVEgBw7tl0srHJ0EX3JISu5szluJSNk0iy8BEYdLFoPAyea/7Zoou0TmzjOA+Yc2sEdeQ8RfsVRPFqmeh1kQP7O/FNp5h9No+D2oR0zTBQD0LwXAMOcDyNjG5k3YGugXX9ppdkm6zbmknzY0KPdpJE7IFqH5hhViwGArPv0tAsSLb03XspHHzWOwjtGgLJLUOsW9ntEsoMJRI9Vutz85NyX6xk9Id65zMsHE86463owpDFFRtBKLx9luqorIrX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8PJJt72r4MKUoSLSWYFAElI2DUq3ANtL5xCa9pcYcE=;
 b=otsDL7LfCJUQTZM6WaxYYV5mNnvhriZ3JPOFSoev7CeZa2zSazmfXavX4n0plmKpPFxiOgK426ty8MRRfgGTkZMIvZDAKQfrxJpFTY2q7U2k7b20pINOuhqtCrKman8acLG+fWFJHlSQeEpDs7tc17y/aBr6n4CZ2G/czsqIXUA8YE763yiCfcYBl/aertBnvHOwruqG/bh/BG7GI8GcGDocTclv2uMS2girFaO65HXFPA9xwkHBjdo3fjKprp3L4cnMLtA5Kz/GFdaB3qkdld2CLvoX3/OA3LcW3NvlfvEuMMnut7F3hp1Qm694XD/Hlf+LEKfEd0927fjd3ZQifQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8PJJt72r4MKUoSLSWYFAElI2DUq3ANtL5xCa9pcYcE=;
 b=zfIJUfS8nH7nquxw2aKjoYyLvCOiOHwWoBqOdafw345/8ZegDzdKhqvUKv7hS/8iqNtYnKPpnNWUfpLHK/9yk+vfRJNGf5IoBFlnwITyCLpZ5QNruiAbpmpYmdR8s/wI4hVZezpM1dCxBvXO9v8UMBqgyLOthYwLa8UGAytaNq4=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <45cb2679-c79e-4d67-abaf-a4fe8e5ddc51@amd.com>
Date: Wed, 7 Oct 2026 16:11:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Sanity test specified domain's memory for being
 a multiple of a page size
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>
References: <20261007124813.177940-1-michal.orzel@amd.com>
 <DLYNCSBJ3FOE.IQ4BMB5FFYGL@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <DLYNCSBJ3FOE.IQ4BMB5FFYGL@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000016:EE_|CY5PR12MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b9c1594-dfc8-4e16-0da9-08df247cf418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	+qx9XmRa/9YsXUp2iDdcB+/TbrH+UDPV+kMoliaCU1ijqp1HpeDB0dbYWFs8fgGVJ+W+qqgKXcSYPppMUsXSSxWlIm8rt39k076jhQAiOvB7D1OyHg9VuCRtmYnjplHFy2tXCPJlbc6CpC12acmmNL6pSGl9JVziGlIbKFRZUB0nAApMOTOJBj0CWxcW7l0EEScr/DNyUAX3Q4A3MFg5zao4KUPgItIYG3bciV7KQhEZs0f9cRtLFI1OxBe9MEkGPSCjYWxKMwj9LxIyhOqu8j/zj0t09rE7R+yf2iWM8VnRicyHWgouqdINDxKwiyyRSgN9Bh5dwDoKOKOPs4wOvXa/CLi2XMmjEYKlKzGjqR95aiVV6dNGIUR6DXUoULDIijQ2IkjCNoKsGt5iyo+02tnqEWjhKTQaPOh2LS7tfwEovG7t3E7yD7BsJ3oglm7RojRrKYQ91CGcnJlB4D9DAci/rMeYMisXhY8qyyz2CfLGRlFskbY7uncY9e0AkoOx1MQhnSRLlqg6E+f8SJ0HIIj1OZWXIh8LcjVVHMJuBxQ/FjwQnSIctn+NFnKARsnIoF25q2+Vdylae4b06JQNNAybysXPgih7st94lR8X798dPNF6L9hNEi+2Vv1r2TIX3gQ0MaW8lPmTw1vRXBr2DfoadcBw9bkCPNDKTs4JYgyeaQ8QyV6JL2Gk6K65pc7CByaD6/rKhfey3r54ZslH6A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kJhxgbg3pgex7K8CaxQALnkjeAOKW9437kmyxAqrYwqCA450v2p7CXS15hyF94MZ8ZBE02BF09u8ZfSyfrQELa+0YCCwg1xoxnoqz7k0AElAjWiWbHEVm3sChzeytkJdpOgQflCjbSLQKCKc8x52OgaagJQUe7rXORNws5PMQqKTKbExRbVeZKGn/Jtprdoptm6UlF33HmdNlGj2DTRRlcBn3eATZehKJKJxYu93fEk+fSYbsbz5JpW3xCH2FpeaxYOOl4oV63nhd1JtSra92T7LffzriTQcPfA9/1jUZXawn3e8WDBoQROhmE0kQvjMNHjl6GPtVzSX7PWa1SbdJL82a+eEcaKRoNROqnmeqVXTW4mDaw3nTzkzDsR5u/eV6Ua+hU2vtyUDnfdPu20vCW4Eadh5/1ei0ciKCCWGv29wZoj34P6qiVMZdzDX1RMQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 14:11:59.9090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b9c1594-dfc8-4e16-0da9-08df247cf418
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000016.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6324
X-purgate-ID: tlsNG-d25034/1791382330-026DEA5B-CA5EF5A4/0/0
X-purgate-type: clean
X-purgate-size: 5516



On 07-Oct-26 15:40, Alejandro Vallejo wrote:
> On Wed Oct 7, 2026 at 2:48 PM CEST, Michal Orzel wrote:
>> We require memory to allocate for a domain as RAM to be a multiple of a
>> page size. However, we neither document this nor sanity test. Specifying
>> memory size that does not conform to this requirement fails the domain
>> memory allocation in the non-obvious way that is difficult to parse for
>> the user (printing over-allocation messages followed by the panic that Xen
>> could not allocate the requested amount of memory).
>>
>> While there, fix indentation from tabs to spaces for "memory" parameter in
>> booting.txt.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>  docs/misc/arm/device-tree/booting.txt   | 4 ++--
>>  docs/misc/xen-command-line.pandoc       | 5 +++--
>>  xen/arch/arm/domain_build.c             | 6 ++++++
>>  xen/common/device-tree/dom0less-build.c | 7 +++++++
>>  4 files changed, 18 insertions(+), 4 deletions(-)
>>
>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
>> index bcb06bc796bf..7dfac2062a37 100644
>> --- a/docs/misc/arm/device-tree/booting.txt
>> +++ b/docs/misc/arm/device-tree/booting.txt
>> @@ -155,8 +155,8 @@ with the following properties:
>>  
>>  - memory
>>  
>> -	A 64-bit integer specifying the amount of kilobytes of RAM to
>> -    allocate to the guest.
>> +    A 64-bit integer specifying the amount of kilobytes of RAM to
>> +    allocate to the guest. Must be a multiple of 4KB (the page size).
> 
> nit: s/KB/KiB
Is it? I don't think it matters at all seeing the number of occurrences in the code.

> 
> But page size isn't always 4KiB on all ports. PowerPC has 64KiB pages.
> IMO, 4KB shouldn't be here or elsewhere in documentation.
This is Arm doc and on Arm we only support 4KB at the moment. User should not
need to dig into the code to check what is the page size. It's better imo to
give this information right away and change in the future when we add support
for 16 and 64KB pages on Arm.

> 
>>  
>>  - cpus
>>  
>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
>> index ea0e3368b1d6..d49db353d8a8 100644
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -1020,8 +1020,9 @@ and architecture-specific domain limits.
>>  > `= <size>`
>>  
>>  Set the amount of memory for the initial domain (dom0). It must be
>> -greater than zero. This parameter is required (and only used) when the initial
>> -domain is not described in the Device-Tree.
>> +greater than zero and a multiple of the page size (4KB). This parameter is
>> +required (and only used) when the initial domain is not described in the
>> +Device-Tree.
> 
> Same 4KB remark.
Still Arm only section and see my reasoning above.

> 
>>  
>>  ### dom0_mem (x86)
>>  > `= List of ( min:<sz> | max:<sz> | <sz> )`
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 72d531618045..bc3d1ebad1c4 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1881,6 +1881,12 @@ static int __init construct_dom0(struct domain *d)
>>          warning_add("PLEASE SPECIFY dom0_mem PARAMETER - USING 512M FOR NOW\n");
>>          dom0_mem = MB(512);
>>      }
>> +    else if ( dom0_mem % PAGE_SIZE )
>> +    {
>> +        printk("%pd: specified dom0_mem (%"PRIu64"B) is not a multiple of a page size\n",
>> +               d, dom0_mem);
>> +        return -EINVAL;
>> +    }
> 
> nit: XENLOG_WARNING?
I can use XENLOG_ERR.

> 
> Also, is this is meant to be self-healing? If so the return should just be:
> 
>     dom0_mem = round_pgdown(dom0_mem);
> 
> and continue. And if it isn't meant to be self-healing, why not just panic()?
1. It should not be self-healing. On Arm and in DT subsystem in general we chose
to follow the contract to bail out on unsatisfied user requests rather than
silently adjusting them.
2. I think it's always better to propagate the error to the caller if possible.
Sometimes you don't know where this function end up being used in the future. In
general if the function returns non-void I tend to leave the decision (here
panic will be executed anyway) to the caller. Printk explains why and the panic
follow. This also matches the existing paths nearby this code.

> 
>>  
>>      d->max_pages = dom0_mem >> PAGE_SHIFT;
>>  
>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
>> index fcbeb8adbd73..b3f24e5d555f 100644
>> --- a/xen/common/device-tree/dom0less-build.c
>> +++ b/xen/common/device-tree/dom0less-build.c
>> @@ -789,6 +789,13 @@ static int __init construct_domU(struct kernel_info *kinfo,
>>      }
>>      kinfo->unassigned_mem = (paddr_t)mem * SZ_1K;
>>  
>> +    if ( kinfo->unassigned_mem % PAGE_SIZE )
>> +    {
>> +        printk("%pd: specified \"memory\" (%"PRIu64"KB) is not a multiple of a page size\n",
> 
> Seeing how PowerPC has 64KiB it might be prudent to print PAGE_SIZE to
> avoid surprises later.
Yes, I can print page size here.

> 
> Same remark about panic() vs self-healing (either is fine. It's this
> middle ground that looks off).
> 
>> +               d, mem);
>> +        return -EINVAL;
>> +    }
>> +
>>      rc = domain_p2m_set_allocation(d, mem, node);
>>      if ( rc != 0 )
>>          return rc;
> 
> Cheers,
> Alejandro

~Michal


