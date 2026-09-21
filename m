Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87ABC982EE
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 12:49:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427456.1650153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8dSk-0003av-5E; Mon, 21 Sep 2026 12:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427456.1650153; Mon, 21 Sep 2026 12:49:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8dSk-0003ao-1g; Mon, 21 Sep 2026 12:49:38 +0000
Received: by outflank-mailman (input) for mailman id 1427456;
 Mon, 21 Sep 2026 12:49:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x8dSi-0003ai-TT
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 12:49:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8dSg-002NU5-IX
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 14:49:34 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab127d6-8faa-0a2a0a5109dd-0a2a4507e26a-20
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 14:49:34 +0200
Received: from [52.101.85.1]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab127dc-b4ea-0a2a45070019-346555017df9-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 14:49:34 +0200
Received: from DM6PR01CA0002.prod.exchangelabs.com (2603:10b6:5:296::7) by
 PH8PR12MB7304.namprd12.prod.outlook.com (2603:10b6:510:217::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 12:49:28 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:5:296:cafe::a7) by DM6PR01CA0002.outlook.office365.com
 (2603:10b6:5:296::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 12:49:28 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Mon, 21 Sep 2026 12:49:28 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 07:49:28 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 21 Sep 2026 07:49:24 -0500
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
 b=seVw+26CtGkeTeR3xtAy/OJSAad8OvIM2ZK+5j8gyXpQhzeNkTzVNgWrQc19iaAMKiOG+bprcPXtjS9s8qxT0gpfHBkRN9D6kVH2QbW7JyeigORM47BOafFuF4UPXYHJoIoTJEEyZFd3psbs7bX2uaIyjuxZDXGcFveqjdEEdglzRirieAiuKHSXpnPhIBVhc8OgQbkv+U1xJdrEpEJN5cLSccFUxr7ZnXszf00gluw1tukpnBPYSFwoc2MSBRxPVLSI+Lb8glWWL2U+Ayd8NfKeZtV6Z5KKFSa7ADRBM3nk2CPlFJq89/e3fEfgiNBNau8jZ3uteVT7pKTbH4lHcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aol8pHVSNyj5hhGBucXXZZ6eSC02o6zs3duNNyjmY0=;
 b=pVScH2JN794U7cdBJo7HShwX3tQ54V2qPqGsfy7ShQTp1XIwN0riJeXis+CpSgq1VmHSgQQPWya+vk4GHGO9s7bC6sMefe9XCRXNJ8ukK/dgFdmJB2Gsm8xYEDGK3Ne+JqQJgdZB2dVoqR23sfHYbnVqGMkQtFNO4AQ5XjuzFRaD58f3Yqdf8QedYxIoR/+zsffxFSUer6WV3za0S3EMvExSIN4Onzzv+tJb8y7MT3RqYlPn+zJOR5hfjdJyZpr071mf6dCBxu3i/+FmsPh9Oco7kDFhBZKICxfIq1LQVtX1SkMaQe7BijS8Q2SrsW2BZlPA2ksDfSH/bd51/BLLiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aol8pHVSNyj5hhGBucXXZZ6eSC02o6zs3duNNyjmY0=;
 b=Z8HLHCfhVHkozhv5AIEefRG+yrZOHihz+ddha9czhmIRYXZvEdznYFm3L/2eAA2wwH89CfQwVD7gsWOhHnKSJFXa2TTilKOa82Icu3Mg6EHBedNUQGbeRASAg5wV5lENdnG56B/tTMJu31mNk2dcqjk4UyMg3Yte2p6ibXBo6AU=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <b4122eea-c8b3-4b3d-9aa7-9fd5989e39b0@amd.com>
Date: Mon, 21 Sep 2026 14:49:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] tools/arm: choose GIC version explicitly instead
 of relying on GIC_NATIVE
To: Anthony PERARD <anthony.perard@vates.tech>
CC: Julian Vetter <julian.vetter@vates.tech>,
	<xen-devel@lists.xenproject.org>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>, Guillaume Thouvenin
	<guillaume.thouvenin@vates.tech>, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Teddy Astie
	<teddy.astie@vates.tech>
References: <1789130592.8631fc262581453bbf619ec5b2062170.1a0907e5286000c4f3@vates.tech>
 <1789130863.8631fc262581453bbf619ec5b2062170.1a090827272000c4f3@vates.tech>
 <3c3c203d-7951-4340-a926-67b92224d531@amd.com>
 <1789994596.8631fc262581453bbf619ec5b2062170.1a0c3fdfa2c00072c4@vates.tech>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1789994596.8631fc262581453bbf619ec5b2062170.1a0c3fdfa2c00072c4@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|PH8PR12MB7304:EE_
X-MS-Office365-Filtering-Correlation-Id: de17b262-c201-4a7c-eab6-08df17dec62e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|82310400026|1800799024|10067099003|6133799003|11063799006|5023799004|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	7RuzCGGuw3oZ/uB/FTfQ/iiTjEYtzYhGB5lWSp6Daqy87mRBabL9vNfAkM8fAo0XpbLQ24mwt4XKO9yzBj/o+MO+IQOQT/mPHHJk/W1ukOrjJB06pPaJF3RLKZFxR2LVBaUPHGaCpIbVxIN1hqh+dOOW36xs/grwshxSblYShH69Ef66bINCRfrsZJ6skRBriNUVMjkaYBlSW3zGbPV7YRJTSXq8b4z0KW3mUWIlbsGFTRMOjqLa2a/CcVMjHDZkeDQ1L8N4zkAiKTJ8Vz7GaRnxbN0YEMDjvZUHDA3I5NR7LoDwqaq4DX+OxQunmQ7PFRSmghxNLrtG3FFeXWhHBFwpFH3rf8zu7Q65TC9pl2H+fV8MIG+aHt6MhficIMPj7pLBD9i3Fq/ESBEjJGI2fd2sGjtaFNwRKDXqX/D48VvIFf8SaaZUs4R09nsXwjHeo2t7uQuYuaOoa165VJlkLauog28iuHPevNLZ7vVJ7NymNtvBQGGgBlKwuzacwAYN20aP/sGJoANJgKZkBIgdxFQeKFSXjdRMjwVT3AKM1exF4CiuUOqbbRH3xFQ8rrQ3afCBZC+oX4Fmq68twhbvXx7E6VFmLxf/tAtILIpj5MFPpBJzPAG7yh13GAc6xauofj6Re1wuQRUYdPOCkOTRf9KbIAGD0VUahExLaw7buMmPYtDcAq1hANPK465ky8MMQoV8cpmEu5SLWrZ6Th8YBg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(82310400026)(1800799024)(10067099003)(6133799003)(11063799006)(5023799004)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uSHZDT/yg1beeJQa3NxkGMZcs4h0pkWcV7vgFry25dejUCHrsHDpJshmTalYJamHktmXkr9oWLSEVUxJhn/w+IC0HRAOOMK1NErxSHlxNSfPcc+Mfei8B1XK3ifq/qAwQEIlMz0iYH7flBCp7fhykRueCJ7wIS8QWdA0x+OV8w3DRSl81kz2vhssWhe9yo5KSCXfEbHBzq0igDxJTpk5x5qMdB9aG6TbnzNYnNHMsTRK3JQmrfF3cePIZi7KMNfAv+ermOFjV6YLqM5qwrHQniGeszt5B7WifJb2FGXV2ZjL4G7DjmEa0xP0l3aqP6aiTjakNihfBltOrguYPMS+/AiFVQa16WwHYMM+2uIblgzZ+rhh8moDoU0MDfqqYQ+ULkyFkd5fFiTBUXjsE6OoSCXcjped1U2Mx9EcOpqqoR2ncf6WReTe2FDUuS5dHsgX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 12:49:28.4490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de17b262-c201-4a7c-eab6-08df17dec62e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7304
X-purgate-ID: tlsNG-ef75cf/1789994974-A6AD8AE4-1A9F3886/0/0
X-purgate-type: clean
X-purgate-size: 3780



On 21-Sep-26 14:43, Anthony PERARD wrote:
> On Wed, Sep 16, 2026 at 03:08:13PM +0200, Orzel, Michal wrote:
>>
>>
>> On 11-Sep-26 14:47, Julian Vetter wrote:
>>> XEN_DOMCTL_CONFIG_GIC_NATIVE lets the toolstack ask Xen to silently
>>> resolve the domain's GIC version to whatever the host hardware has. Xen
>>> then writes the resolved value back into the same in/out
>>> xen_arch_domainconfig the toolstack used as input, which is the kind of
>>> API abuse we're trying to get rid of. The struct passed to createdomain
>>> should only be an input parameter.
>>>
>>> Move the "pick the best available GIC version" decision to the
>>> toolstack, using the XEN_SYSCTL_PHYSCAP_ARM_GIC_V2/V3 capability bits
>>> already exposed via XEN_SYSCTL_physinfo:
>>>
>>>  * libxl__arch_domain_build_info_setdefault() resolves the GIC version
>>>    against those bits before the config is built. An unspecified version
>>>    becomes v3 if available, else v2, else fails. An explicitly requested
>>>    v2/v3 is validated against the same bits, so a version the host
>>>    cannot provide is directly rejected in the toolstack.
>>>  * The Python xc.domain_create() binding does the same via a call to
>>>    xc_physinfo().
>>>  * libxl__arch_domain_prepare_config() therefore only ever sees a
>>>    concrete v2/v3 request and just validates it. The GIC_NATIVE case is
>>>    dropped since setdefault() always resolves it first.
>>>
>>> The LIBXL_GIC_VERSION enum value 0 is renamed from DEFAULT to NONE to
>>> reflect that it now only means "the user did not pick a version".
>>> setdefault() resolves it before anything else can observe it, so there
>>> is no longer a "default" left in the config. The xl.cfg(5) gic_version
>>> documentation is updated to match.
>>>
>>> This guarantees no toolstack path can still produce
>>> XEN_DOMCTL_CONFIG_GIC_NATIVE, in preparation for removing it from the
>>> Xen side and from the ABI entirely.
>>>
>>> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
>>> ---
>>> Changes in v5:
>>> - Go back to the initial per-version arch_capabilities_arm_gic_{v2,v3}()
>>>   helpers instead of a generic arch_capabilities_arm_has(caps, mask)
>>> - Validate an explicitly requested GIC version against the host
>>>   capabilities, not just resolve an unspecified one
>>> - Rename LIBXL_GIC_VERSION_DEFAULT to LIBXL_GIC_VERSION_NONE
>> This one is on me. I just realized that libxl compares user provided string with
>> the IDL types, so a xl.cfg file specifying "default" would fail now. This would
>> be wrong given that libxl API is stable. Let's keep the DEFAULT as it was (for
> 
> Yes please :-) "default" is fine. That option could even be removed from
> the config file, and only allow users to choose between v2 and v3
> option, or remove the option from the config file to let the tool stack
> decide. We could simply document both v2 and v3, and say that if the
> config option isn't given, libxl will try v3, then v2. (and probably
> keep the gic_version=default working, so that existing config don't
> break as there isn't a need to break them.)
> 
> "none" is definitely wrong, because it should mean start without any
> GIC.
> 
> I need to review the rest of the change now.
> 
>> NONE you would also need to change the golang bindings). With that changed:
>> Acked-by: Michal Orzel <michal.orzel@amd.com>
>>
>> You will still need Rb from Anthony as toolstack maintainer.
> 
> FYI, it's the other way around, you need at least an Acked-by from a
> maintainer, and you should supply a Reviewed-by instead for part of the
> code you don't maintained. ;-)  That's documented in the MAINTAINERS.
Yes :) I definitely meant Ab but somehow ended up writing Rb.

~Michal


