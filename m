Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94988C55167
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 08:25:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378866.1623893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpiYD-0001Gn-Dn; Fri, 31 Jul 2026 08:25:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378866.1623893; Fri, 31 Jul 2026 08:25:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpiYD-0001Gf-9U; Fri, 31 Jul 2026 08:25:05 +0000
Received: by outflank-mailman (input) for mailman id 1378866;
 Fri, 31 Jul 2026 08:25:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wpiYB-0001GZ-DJ
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 08:25:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpiYA-00G6RK-Jr
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 10:25:02 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a6c5bcd-bab6-0a2a0a5309dd-0a2a450a9670-40
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 10:25:02 +0200
Received: from [40.93.196.30]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a6c5bdc-f2d2-0a2a450a0019-285dc41e77e2-3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 10:25:01 +0200
Received: from BLAPR03CA0022.namprd03.prod.outlook.com (2603:10b6:208:32b::27)
 by CY5PR12MB6648.namprd12.prod.outlook.com (2603:10b6:930:3e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 08:24:55 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:208:32b:cafe::4c) by BLAPR03CA0022.outlook.office365.com
 (2603:10b6:208:32b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Fri,
 31 Jul 2026 08:24:55 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.1 via Frontend Transport; Fri, 31 Jul 2026 08:24:55 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 03:24:54 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 03:24:53 -0500
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
 b=x9Tw29sux+kK0yTyO1OzEOjKJuQV2zyyCFVDrBv12fvzceILw7Tej4tSd7DTWPMl/OZHSRgadB32fbaLVdjrMP1a88CyYuHQW5FP6HwZ+W7iz+VTMPP9h42Ynp6TzBjiYGZI9ySk8ja3HoD3aLeKrat2Ea52LcS8VXHjz0X5lldHvCJhZQnuQtyMDhYIjAtbTzplMkwYPhGJVjsF7z8riWxhMfQOn+nmul9FT1eVpQDMSBbLG7JZMZAWTrpCoCLxxoqZO6ftO47W8R3xqNZmpYRNWdcAi1JysN+DJZhBSmxEWxZrtfkEKtxP7TsyE0QjGlMmHGEzcUbJjqMxiBOx4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6YXh1GsRJ6OGXBZGODLA+/0e0FUR/AkeyB+bVrj8KI=;
 b=WL9+0ZyR6LQ02+ClPqmsNp32tsbdJiz7AGken4GX0Awx+TE67jHylsbv5qz3K0qnDoZ6xaufwQbh9KHt92+EJopLez9hjjnU39LW+NJGp/X05NCP6zfjTUP2och4vn1zSg8k5fTNZH4AlE8lfW9WW9HjSCFZRCKOw2Y8R0BZK1XESrI9Qg/2CKx5uGgp/JllnErjF3lKU8VAC5Fz1CFNriPV0HRIl+lo/jGLDO1AbWJL0Xa68JJP6a9tFaeWKLCXfZiN2DGjLLIbh37aHLKj7Y9XAnnBRNirAObnkqVpUjMJHkmRAiSsb5ZzRASFEE0C9ZTXk/xPFX7neisx2vXMOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6YXh1GsRJ6OGXBZGODLA+/0e0FUR/AkeyB+bVrj8KI=;
 b=pG6u5bqEMghwIYcjGA5JEsJCoCIQpN5u6Ab81NNw2QXCuNXIXYQuD0kZoZjOsN7OJf8Oun4IrpPhjESBHbxJMhn1cMo8hGbOAZVHT3jVm+0FbvttR0pPL3Ezss+R8dYLt8kUUfztMNDN4skSbNgn1EgYvgHT96967ofj2Z181sc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <d66ed4a6-4f1c-4919-8d81-d59b13364434@amd.com>
Date: Fri, 31 Jul 2026 10:24:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] xen/arm: its: separate ITS and host LPI quirk
 scopes
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Luca Fancellu <luca.fancellu@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1779922874.git.mykola_kvach@epam.com>
 <5edcb9ec3e643133d115f009d0d942869ffb6955.1779922874.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <5edcb9ec3e643133d115f009d0d942869ffb6955.1779922874.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|CY5PR12MB6648:EE_
X-MS-Office365-Filtering-Correlation-Id: d9cf6f31-b56b-41ec-176c-08deeedd337d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|6133799003|3023799007|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	W9gctn0qXqvHMm3qvGhDii9tg+bPQWh9PsdrGJGc4wDhU/sKVA3ZyqRTbr9TqTM4eNHhjEAIlU/QEXhU1zE0xn1n3GXK4rZg49KBwdkMr26nUguc7kL8/cI9GZxopp/knkzwipW76LDKuMLkWuwtRsJLn+QnF4jz3mkaKt9lhwLaxFo0LN7b9ejEoQFA3y6JJgKeAeS4Jp/a8cTCvZlodbRbO+kTz1j9wudAJ2PejBtBVbvSyKURzyO9q4qwxy+MNI6UGtcXPl0zTTdt0+3AVojF7n6rClltMiqoVZNXAatXK6H8zE6/61xh4jQ7Z+nulJUiG+0kAb9H6maoOd7Asl+7C1Wk1QyhqL4j9yUYnibqk5ZovNqINFYYpw0o7V/M4EtpLWle9Jz3Gh5Aaj5Blo+Bgr1cwn342qofW4bHcDFrhG1PoXCMeqayZE9woPe73RElKw5U6X0pwWmIEgVRjDB7RC24vE6ZMYRLAYqgUlG6YfXfTK+w6Na9kT6Q43vle30oFQDwr3TXndBafACkTxfNv58Rbu7LNYqcstRMmim8CY5v0qyQAOPxACHNKxCucSEomEO6KDuB1m35Z9CY94OCX+nbpFUAEoVEtwAR6XxLoLzhfqhFLXpL7Zaw/clJfK9A8ILK8rAIHjUHsxdsO4Cu3m+TT80/wRiRBwEvqHNwDJVZL6Ql5MxBoRJ10UrtZD+KGif2jtUDkqQ9zzLM1A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(6133799003)(3023799007)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3IiUaUUOddJIjVZ/za24l0MBXc4ZJ4JGkoLR5uKb6C6JWDAwsFQWCKDBUQU0Kbnmm/lSVTUShPgqNKuk5NcnLIeQkYfWal1pO2of9bjdZzxgQqV5ziH9kfxUMx8kAFmzed8zjwMLH8lF9c4zUxHVMRkCjHu5tGHzdezjjh+Mrmiq5+KNDWhmDKVM9mmYAahmxWvwlccXPmMFIXHCfPW4vWknU5cor/ON4n9NP06rMMiQL6xdtHTJb3HDAHAPySFGPQZPFbAa482F2pKsJI/rBSPt54IUIvCYONcw5+S4tgFejti7OTkdjaASndct2tX0j5Tl20/0nUhF/iRhnJ9HQOmmtSD9+Hronq3SMo9/x73uEpzrz/Cp+zxtK94FMs9f0nzRtCH6V8ib1tAgHe5WPJt7Oxx+5XFpbnoFT+IahRKa7Cav7Ak52Xpg6NUSBhQH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 08:24:55.1773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9cf6f31-b56b-41ec-176c-08deeedd337d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6648
X-purgate-ID: tlsNG-4011c0/1785486302-536D6CFC-F2EAEBE2/0/0
X-purgate-type: clean
X-purgate-size: 2071



On 28-May-26 02:25, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> ITS quirks can impose restrictions on memory accessed by the ITS itself and
> on shared host LPI/Redistributor state. These scopes are not identical, so
> a single global ITS quirk state makes the host LPI policy depend implicitly
> on the quirks seen while initializing host ITSes.
> 
> Add per-ITS quirk_flags to struct host_its and keep a separate
> host_lpi_flags state in the LPI code. The quirk table now records the
> ITS-private and host LPI scopes explicitly through its_flags and lpi_flags.
> The R-Car Gen4 quirk applies the same memory-related restrictions to both
> scopes, preserving the existing behavior without relying on an implicit
> aggregation step.
> 
> This also removes the old assumption that all host ITSes must expose the
> same quirk state. Host LPI restrictions are accumulated only from quirk
> entries that explicitly set lpi_flags.
> 
> Use per-ITS quirk_flags for GITS_CBASER, GITS_BASER<n> and ITT allocations.
> Use host_lpi_flags directly in gic-v3-lpi.c for GICR_PROPBASER and
> GICR_PENDBASER setup. Memory-related quirk bits are named GICV3_QUIRK_MEM_*
> and are translated by shared gicv3_mem_get_*() helpers.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
I already gave R-b for this patch but noticed two issues:

[...]

>  
> -static void gicv3_its_enable_quirks(struct host_its *hw_its)
> +static void __init gicv3_its_collect_quirks(struct host_its *hw_its)
The only caller of gicv3_its_collect_quirks() is
gicv3_its_init_single_its(), which stays non-init until patch 4/4.
Please annotate the caller here as well.

[...]

> @@ -157,6 +164,7 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base);
>  /* Initialize the host structures for LPIs and the host ITSes. */
>  int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits);
>  int gicv3_its_init(void);
> +void __init gicv3_lpi_update_host_flags(uint32_t flags);
Please, do not add __init here for a prototype.

~Michal


