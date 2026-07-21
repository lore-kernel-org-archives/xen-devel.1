Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01E9C4451C
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 13:11:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367804.1617475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmAFR-00017r-St; Tue, 21 Jul 2026 13:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367804.1617475; Tue, 21 Jul 2026 13:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmAFR-00017k-QA; Tue, 21 Jul 2026 13:11:01 +0000
Received: by outflank-mailman (input) for mailman id 1367804;
 Tue, 21 Jul 2026 13:11:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1wmAFQ-00017d-0l
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 13:11:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmAFP-002YKJ-3Z
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 15:10:59 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a5f6fdc-5cb7-0a2a0a5109dd-0a2a450a93b8-22
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 15:10:58 +0200
Received: from [52.101.43.14]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a5f6fe0-f2d2-0a2a450a0019-34652b0edc2e-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 15:10:58 +0200
Received: from BL1PR13CA0086.namprd13.prod.outlook.com (2603:10b6:208:2b8::31)
 by SJ2PR12MB8874.namprd12.prod.outlook.com (2603:10b6:a03:540::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 13:10:52 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:208:2b8:cafe::46) by BL1PR13CA0086.outlook.office365.com
 (2603:10b6:208:2b8::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 13:10:51 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 13:10:51 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 21 Jul
 2026 08:10:50 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 21 Jul
 2026 08:10:50 -0500
Received: from [10.71.198.170] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 21 Jul 2026 08:10:49 -0500
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
 b=BOm4ppStJGQm5Ye7HnZcaDNJilrNVOKfwEEEw4wbmVlwSYFaBqHBZIsz1kahRHAW/LwkeG1BiWXMoVOFa6nTFQzwHKE8F/by6ECDhn1YSp+sTIa9no2Aa2FPpVJWzCzF/dLcWLgzYAycQ1svtblJsi0ms4/4H3oiLS1pnK9MxXBuJCxnzt/H+eFBpDOxktOW1uZ8LSPkXfsakwDuEoV25ZVXazXgRh6yX7wNoZgsj7jL5IVkhF8UQW+DURWp82YLn5N2RjRB1S7jDm1oSlr0AHKohuWMBJPG/8YDCwskvpeAtnlFpxClxhfStBoVLU2eISAvLGnaGOpF5lEDb4FCFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZppEHMLD2CgtVy5TMRbwaYUtF0MWVB25EPVSEqiIHO0=;
 b=weSGsK19E/4qG2JzbVEkf67tdILT+3isPR4nditdrUHGQZGbxUeZ3PVegU/9Mu9VQXm2vkWbiWV4cz2/e4PK1FT3g9d4aq+9tsVfzA5mAkjX/u006+mdTkrAJ/Ro4GvUCh3prM1j3ZHhLXHkZJ5P/C/8p6C7+oamLu55NPVWMpZuft1r4u+0GpjRp34dHTsR/bTZzHzS0/3H8OVxO/1uo0/SZa5EmJzHXbvGaTcSthflESNMmVZGz0Quk30lK8AUfNbpwx+X0RbfjSRYQ+UJN2J/yDVVcbCcLxO2b98gRjZ0zZEWoJ2Zh6kpZfm4K58rW+egERulSc6Sbyw/e32Zfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZppEHMLD2CgtVy5TMRbwaYUtF0MWVB25EPVSEqiIHO0=;
 b=HMZPtL0PU18tCw3/z6W249bBMFQDIIvyAzBYJ1KiBeg7JLeSCqSld2yjDLN8GKGfXnrQbTovOgf3aujzKeMupQW3UrJeo6AWrgMsMrcbLA077plS0g1RaMoJQV5fpPw7MS1Eo3z7pbydSCRUPQKPoGCd9Y1WhP8tSio+RlQYn84=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <dfc8e230-d4de-48fe-b5e5-aff5c21b5e2d@amd.com>
Date: Tue, 21 Jul 2026 14:10:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 1/2] docs/fusa: add coverage_gap.rst tabulating
 vGICv3 LCOV exclusions
To: Jan Beulich <jbeulich@suse.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Artem
 Mygaiev <artem_mygaiev@epam.com>, <matthew.l.weber3@boeing.com>,
	<harunobu.kurokawa.dn@renesas.com>, <xen-devel@lists.xenproject.org>
References: <20260721124729.868630-1-ayan.kumar.halder@amd.com>
 <20260721124729.868630-2-ayan.kumar.halder@amd.com>
 <ed40f4f0-f26e-469f-95de-5077cb4218f0@suse.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <ed40f4f0-f26e-469f-95de-5077cb4218f0@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|SJ2PR12MB8874:EE_
X-MS-Office365-Filtering-Correlation-Id: ab245388-37f2-404f-6a22-08dee7297d36
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|13003099007|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
 vpxXpY2s8wJLglXNUk+Xwrb0Ed/NPeoiA8ObJW1lJiKXaOlkxw0dH6OWdLGC8OkrgaQrpB5Ru2xp+aE8PYxxuX2J6EbZYIWFjtDPsP47WCWR/1Wyb7QvP9Y0s4E6k/fy2CqoyppYzI9urJqNbOVC1F7me6OThwKjRPlM4tC70//dNCdGnU/cCql6+aJZq1ATXJGoitx5uf22RIX11DGyWaL3IKhIT/5+vKa/BN3sv+4R948SfkxF5V/eXyZoJdolSJzwnIVMnNXuO9da6xo+K+112mg6BVpMAB+cCV+W2tIR+D1wKi/qQTu3N4zhQOGKnDJa+mbPZ0VPPOCbioNLqJAKG8Tu7XO+Y9mCefKXmohR3Qf3Sd914lBYOF2z7D2KjGZNu1+Xdl2HO2cHxdbL6yYP3licwrRz3rZ1dCFk8XS68ukYHft4xgBMaHnznpGx5buWskSOLzbRZ/4cFoFzPlIXVTJW3H8jisjycNJTRjpB6PtjWMdTQShbLmovZzXOuvS3oK9EyaUQK8P4wKqPy8/5E7J7froZ/rCxjS0a+La80jJA+dKZTs8Nt1RtmD2zioiUTBp6rGEr019BRKW8R/5S08OjgdkdypYgQX2WeuJMaOiIX1CgwK2sWsoAvXwJtJfYOZAZRP/Xs38r2VLoS/fCHY076zq3eO/dxOkkghlh4j95aneYWX58z9CmaeEBWMv3n/6T2LZqmY+MjaP/wA==
X-Forefront-Antispam-Report:
 CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(13003099007)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 ZmvtmmaTO1yahJQlGKgUZ/8tAhw0LKNTGDIpak+x1aIY2ysldsuGWmD8mkfSqhyb2fRb17EIsPiUPR38ChQd6C1dN4cCJsVwZJZ6mZgHdHMoz73gVQTZ4MFjl5Pmqw5/36lm2wQJt6Qob0QcimzuxWdtdtPHGnDIUV4ScPtLsHs56fkbrFuyVR0V2EgJ/lgbimC/QT33ALHkkgFlV9QFqOZt0OqxiRsDlwExlRDU+Zs53mefDMPwU5O07u+dUksMrzjaDVOy8byaayJYn8ioJ/gLaHpXrzPBkJLq8bRR40Ol8r5HIgq5Ke6LzCRPDrppKB04cYdRZrQvKMIFqjB5azQGeZjp56X4D3fFNrvJJE/DyehllxGQmUn6GpyfeX7sYmpoo8b0mbwlZthauUzWq3jn1WVPaS5Kf3hzszNovP/kooTdmrhhl5U2cwqaC/zJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 13:10:51.3152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab245388-37f2-404f-6a22-08dee7297d36
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8874
X-purgate-ID: tlsNG-4011c0/1784639458-587CACFC-76CDCFC2/0/0
X-purgate-type: clean
X-purgate-size: 2365

Hi Jan,

On 21/07/2026 14:00, Jan Beulich wrote:
> On 21.07.2026 14:47, Ayan Kumar Halder wrote:
>> --- /dev/null
>> +++ b/docs/fusa/coverage_gap.rst
>> @@ -0,0 +1,41 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Coverage gaps
>> +=============
>> +
>> +This table documents the ``LCOV_EXCL`` regions in the Xen source. Each excluded
>> +region is tagged in the source with a ``COV-GAP-<COMPONENT>-NNN`` marker that
>> +matches an entry below. A region is excluded from the coverage report only when
>> +it is unreachable by design, so it can never be reported as covered.
>> +
>> +.. list-table::
>> +   :header-rows: 1
>> +   :widths: 15 25 10 12 38
>> +
>> +   * - coverage_gap_id
>> +     - file
>> +     - line numbers
>> +     - SHA
> What specific algorithm? Or wait, this isn't a hash of the file, but a commit
> hash. This imo wants clarifying.
It is a commit hash.
>
>> +     - justification
>> +   * - COV-GAP-VGICV3-001
>> +     - xen/arch/arm/vgic-v3.c
>> +     - L796-L800
>> +     - 351d41e8aecc3f7566a0baa7b4066d06dedd7113
>> +     - Both callers select the register offset with their own ``switch`` and
>> +       forward only offsets the handler has an explicit ``case`` for, so no
>> +       forwarded offset can fall through to ``default:``. (The SGI_base-frame
>> +       ``GICR_*`` offsets one caller forwards are numerically equal to the
>> +       ``GICD_*`` offsets the handler cases on.) The ``default:`` is kept as
>> +       defensive programming; it becomes reachable only if a caller is
>> +       modified to forward an offset the handler has no ``case`` for, at
>> +       which point this exclusion must be removed.
> All of this is liable to go stale. Once it has gone stale, this information
> is pretty much useless aiui. And it may well be worse than that, if the
> "must be removed" isn't actually followed (perhaps simply because there's
> no link from the source to here). How's all of this going to be helpful
> longer term?

Using SPDX SBOM, you can link a document to a piece of code to a commit 
SHA. This was something that linux kernel has recently developed and 
upstreamed.

https://docs.kernel.org/tools/sbom/sbom.html . Zephyr project has 
developed this as well.

harunobu.kurokawa.dn@renesas.com is investigating this for Xen.

- Ayan

>
> Jan

