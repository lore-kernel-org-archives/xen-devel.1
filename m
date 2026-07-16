Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51681C44501
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 09:20:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363664.1615219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkIGW-00012D-U6; Thu, 16 Jul 2026 09:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363664.1615219; Thu, 16 Jul 2026 09:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkIGW-000126-QY; Thu, 16 Jul 2026 09:20:24 +0000
Received: by outflank-mailman (input) for mailman id 1363664;
 Thu, 16 Jul 2026 09:20:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wkIGV-000120-UY
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 09:20:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkIGV-00G5aG-0f
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 11:20:23 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a58a24b-5cb7-0a2a0a5109dd-0a2a4507825e-16
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 11:20:22 +0200
Received: from [52.101.43.55]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a58a254-b4ea-0a2a45070019-34652b377641-4
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 11:20:22 +0200
Received: from BY5PR03CA0015.namprd03.prod.outlook.com (2603:10b6:a03:1e0::25)
 by DSWPR12MB999178.namprd12.prod.outlook.com (2603:10b6:8:36f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Thu, 16 Jul
 2026 09:20:14 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::53) by BY5PR03CA0015.outlook.office365.com
 (2603:10b6:a03:1e0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 09:20:14 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Thu, 16 Jul 2026 09:20:13 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 16 Jul
 2026 04:20:10 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 16 Jul 2026 04:20:09 -0500
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
 b=QxrRZ02YHJAMnxIBFaEcN8CN2ohsC/VFfAPx6pKPanlKdGfYIpqRWv89AdFT+P9lzUZ58fnUdgRis+5uXsNnqtrT1Xw2OKVLr3LpQiAiwVY8qcn1MjUsGoCpbXnA6G79zBW09b1JI8ZMM5O45PEWmwcR/2+UX42+fO8DN9Wzouumxgy9NgbpJaScsFBC/D6/+LkNXv9tCVjadhH6+i4QQO//6u3nhML85T4Rza07YmvTylWdUkE3xH+TV8n2ZjMHnjIpR33FraKKAUyL845mBbjd80W6r93yvw+JSCYZWZgJHENSEALoNU8iqUzm/qOf6vmzVYMGvhZUTbBWZYrtLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08/5St+qZY9PNHyHaWFHkwKnfSizJCt+ykJ+E4bi8z0=;
 b=QqKIML5aAN5cZAROpWF76iMb+jFyE3R+TjUIYFdAgObUd9zgYW//9fHaIj9xmB4nNPBJ6yOtFG2O+qBIrgUKcUW3AbJpy54rDSRRytxiJ8ZJ1TF8laY4dIRsiRPjK4OUkJRMB5N1ya/aHnEWGpIt2D4rJRPHOAWB7YDXXs/uMCEtu5d2Tk1JyqaBQuhsxm2uigOhcZXj7sQ0SnUDyweICospHzNJGTn5sDA3aIptC3Ze9iBS0O32iTtA8Pfi+J3ZzVa2l9Z/QrHOUMd6BIBlnCrde8u+NiiqRq1Dy9V1fhbmFYuHdRwwjhseLzgnFZ8VjUerGdufnGnKdXNSku/1Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08/5St+qZY9PNHyHaWFHkwKnfSizJCt+ykJ+E4bi8z0=;
 b=VQbQyqbBH9bV9VLcTVnq9vZHhPOePHLeArLB7uByBA8MqLAu8H2/ND8Zgoa1TlQEnd5zfaVV2TuBwf31CwEQfNg2h9MIrSlHm+dY9DNFYmbjVt6fUn2GfYv71XYERSW8L9XsRhz3xqVaI6/T87kQ6sFMHwWoqLMicF8xZhMgZL4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <6b345ba2-d31d-4317-ab79-aa64267ab283@amd.com>
Date: Thu, 16 Jul 2026 11:20:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 1/2] xen/arm: validate IRQs before descriptor
 lookup
To: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1783671887.git.mykola_kvach@epam.com>
 <1843da2e028635773638ef73ed10907c7ae7bb53.1783671887.git.mykola_kvach@epam.com>
 <e6468083-f901-4a1e-94d5-d347068fabf0@amd.com>
 <5gpmoe7cng53rxtxmldvjwe3dnbenoji6anyqy4uxado354hfp@tkdo7pmufaor>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <5gpmoe7cng53rxtxmldvjwe3dnbenoji6anyqy4uxado354hfp@tkdo7pmufaor>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|DSWPR12MB999178:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc13e8a-e49b-417e-b3db-08dee31b7156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lMOIqH550rBe9I6YpVJhFvBtvWCdywHPA/0kTHsR4BvrDxvfNlK0GlTCa+Cynyn15sFXHE8v2Qr8SgtZnf9Q2A9d3RmoWFgjSqJW1drVpJ65vnbccapICbqfy8KSnBTBKRP9WChaiiraAunq2Ketv5zBu+9NY4EnkFv5J/wbkWqNIbtYIs/y01g4Rx+JWd9Di9e6IeLoHr6rkJkb77qpubjHlNDUyFUenWPh7Vzx9OtoAbC7QYLUWPDmE4QfDADcNsb6mKDo5GdwaOu0On6kjfFGv3EN2ag2NlbIP7D4BkHdRvl4eqvxXR/1YNb2SetGfUZwweTL5e/h/n2VBrHMeVzhjYx0WoEoGJ6VSRwrZQ4koATVzcwEqQQQTBYCfpRr5O6KHtxYZia9+r7mdDE6LG/iYhVtAgAaxhMclD8uGXIGjQIe9bDWW7rGCwWTDfxZmcI7d8NUKROExCGmBunG+R1A1NIGvdOtYJts+YHL/YB5DYeYfutbc8NC5PrtXJGecaAhB7S6VdqmNYgmblctQlk6rddtpg0Ba+tXlB59kX1E2fM8iDjFpCQS+tgL2irp+QMTiHjV0xjU5QoGVD6NTiCMiMO55SP0q1cP3ljYWa5wPNLGv16/ndjgKUIh1pvG2hGEsxV6KZKHpU/lh87vcGTunH/6m49Y5xmSu36VQa69ADdLZGZ7mDkAlzGCPzYRHjHBouIyIv/wG+puTM5m/w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ruXCt1L0RlDmV/4ihpTw66ZH/Ri3DYGAXIqQ3mZrJl8iwV8unYEIUNpbmFgRZSGCy7fiwhEgjrttwbREPswp4UulXN4c7ouyfD2+P3SUXaiqpERa4BdnsAbfV0fZ+IeKwsVfEnBYcatZZl8nJDDESofYsC2wtqNnVrEXqHqnPbyPJX4arrOUv3FDL2lJz3RUpuQwTy4/G4kQWyrIgL3kuafXhYyYkHB0sxCfSfDpreC4/pASCQ+M1NQaz/Y7UazI7H2jQC0g4p3ORE1TwMInwEGBwyNIGcDtdH/34p2kVOwRQ0mjqnWVfDDiNb5Xcp8YcUuW+5oblSsTGDPNBb06kBHm2LQSkX6zxrLrrPBtL1gkSW3ng9b6Zb5BSHGUGo3GTbDAKZeJyybwk91Ejf7RjQyxRII5SJu1G5hT6ppXUuLw6ckJsfBvB7oZSi7+dhM6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 09:20:13.7043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc13e8a-e49b-417e-b3db-08dee31b7156
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR12MB999178
X-purgate-ID: tlsNG-ef75cf/1784193622-A4ECEAE4-5F08A689/0/0
X-purgate-type: clean
X-purgate-size: 2651



On 10-Jul-26 13:14, Mykola Kvach wrote:
> Hi Michal,
> 
> Thank you for the review.
> 
> On Fri, Jul 10, 2026 at 12:10:50PM +0200, Orzel, Michal wrote:
>>
>>
>> On 10-Jul-26 10:31, Mykola Kvach wrote:
>>> With GICv3 eSPI support, nr_irqs covers the architectural INTID
>>> namespace up to ESPI_MAX_INTID. That namespace is not backed by a
>>> single dense irq_desc[] array: regular SPIs use irq_desc[], eSPIs use
>>> espi_desc[], and the INTIDs in between must not be treated as
>>> descriptor indices.
>>>
>>> A firmware-provided interrupt in the sparse range can therefore pass
>>> checks based only on nr_irqs and reach irq_to_desc().
>> What are the possible consequences? You should explain it in the commit msg.
>> Also, what is your criteria behind protecting irq_to_desc()? There are other
>> places, where we have unprotected irq_to_desc(). Last but not least I think we
>> should have an ASSERT in __irq_to_desc() to prevent the indexing failure if we
>> end up there with a sparse IRQ accidentally.
> 
> I reproduced this on FVP by adding a fake DT interrupt with reserved
> INTID 3000. This was deliberately malformed fault injection. The only
> architecturally allocated interrupt class in the 1024-4095 gap is ePPI,
> which Xen does not currently support. The resulting out-of-bounds access
> to irq_desc[] may corrupt Xen memory or crash the hypervisor.
> 
> There is also a non-synthetic case with CONFIG_GICV3_ESPI=n. An
> architecturally valid eSPI described in DT reaches:
> 
>     platform_get_irq() -> irq_set_type() -> irq_set_spi_type()
> 
> Previously, irq_to_desc() was called before validation, while no
> espi_desc[] was compiled in. Moving the lookup after gic_is_spi() makes
> Xen reject the interrupt with -EINVAL instead.
It does not make much sense to me that is_espi() is protected in
__irq_to_desc(). I know this is because there is no espi_to_desc() if eSPI is
compiled out but providing a stub is easy. This causes the useful ASSERT inside
it to be unreachable. If is_espi() was meant to be called only under #ifdef, it
would not have the ASSERT and would not include #ifdef inside it. If we allowed
for that ASSERT, then ...

> 
> My criterion is to validate externally supplied IRQs at entry points
> which can return an error. The remaining callers use fixed,
> GIC-reported, or previously validated IRQs.
> 
> I will also add:
> 
>     ASSERT(irq < NR_IRQS);
... we would not need this one (the eSPI would also be more meaningful).

Given that we postponed the release, I'd be ok to take this series in,
provided it's in a correct shape.

~Michal


