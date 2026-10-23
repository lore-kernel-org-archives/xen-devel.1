Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E15606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 10:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SKasQy6B
Received: from list by lists.xenproject.org with outflank-mailman.1459111.1671186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKCsM-0003Ig-Vk; Fri, 23 Oct 2026 10:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459111.1671186; Fri, 23 Oct 2026 10:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKCsM-0003IZ-SG; Fri, 23 Oct 2026 10:51:54 +0000
Received: by outflank-mailman (input) for mailman id 1459111;
 Fri, 23 Oct 2026 10:51:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xKCsL-0003IJ-7x
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 10:51:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKCsK-009pkX-Dr
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 12:51:52 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6adb3c3a-8faa-0a2a0a5109dd-0a2a45028090-24
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 12:51:52 +0200
Received: from [40.107.209.10]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6adb3c46-6ca4-0a2a45020019-286bd10a5679-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 12:51:51 +0200
Received: from BN9PR03CA0955.namprd03.prod.outlook.com (2603:10b6:408:108::30)
 by IA0PPFAF883AE17.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::be1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 10:51:46 +0000
Received: from BN6PEPF00000073.namprd03.prod.outlook.com
 (2603:10b6:408:108:cafe::81) by BN9PR03CA0955.outlook.office365.com
 (2603:10b6:408:108::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 23
 Oct 2026 10:51:46 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN6PEPF00000073.mail.protection.outlook.com (10.167.248.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 10:51:46 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 23 Oct
 2026 05:51:46 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 23 Oct
 2026 05:51:45 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 23 Oct 2026 05:51:44 -0500
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHDagjJxmbznCIZO3ZbPQRIe4/B9rM2roMwlYT+DzzFLkH0y6xooCuOVSiygVp1/80H/2Nm8IJw33HubYl7gfQp/Kl5TvzQRPaqAL+qL9s/M9AqUbqdDnZSzx9mNXRkda6jY8ytR5HoTmbN2F7UiX2PufgaMY9IsOlgjMqvh3x9abynEX/i8J0KVNCXYWSyaWZQo5jqZyFEXPi3fl1YqF3fH7jTpsiuC3uUXfK2lbzE0JUZG1NHSIbmkF6QDGw/3VsSba4a4s7H6NmvYf1hCxAbr7xcq94YRSGP6xYJPGbATivW1sjltVvnepaBmNwECEOhlnT7XAMpBH3qXzXBbaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAiXEQCjExiPtPM1a9kg9wHyqKh1FfG7IwLrLQIB2zQ=;
 b=IzyT8+t7Q7/QSRLMMfO/mYTYi5WnHlslqBWYfk9uiMComzGamoFS2amLtsj6KheZFFdHIOcVoq8mRWHDTmKfnyx03S04sjAbq98v50yfoSdD0MUWteIupcuqM4Y8qBhCUSTqnEcXajn0pOac9F1DLJQ1dUwyGv+XoDN8blElDd6z4om6jmsQZySMH0bFprWCMbkz44k+s/6B5WZbxrY4/cGb1qXCZczjG2TNAL1re3PEcGCgir/ZkN1a0FF49BaADP6qi2iLREKaYiAskEGg/Lfx0X9XFNOlAtiymVSu1XNjNocId2Y1BIrR00MJDhpeKpIVbCj8mmBgn2t7FlvnRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAiXEQCjExiPtPM1a9kg9wHyqKh1FfG7IwLrLQIB2zQ=;
 b=SKasQy6BA1QMCN2PuB0Vz4V+LfAvH85sApmfPPmQRJtBSJniIMYNkiaBgq/lBWCgRwZkynEhMtvlPIZP5buy9qMXmmAwrg0Y05j9nXvmoAXPSCLvm8dxrR1G2iT+DfTRJE3GHtDAqz8geqyB9aKT8hwLsURqfghUWmtlq3vLDEk=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <121e0d73-34f2-41ea-8535-c465933884dd@amd.com>
Date: Fri, 23 Oct 2026 12:51:44 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] xen/arm: its: separate ITS and host LPI quirk
 scopes
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <cover.1790707009.git.mykola_kvach@epam.com>
 <8f586eb079dc00fb2f4612349bf55d84bf52d105.1790707009.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <8f586eb079dc00fb2f4612349bf55d84bf52d105.1790707009.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000073:EE_|IA0PPFAF883AE17:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f4603a6-e24f-42e5-aace-08df30f3a1fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|10067099003|261022075727099003|3023799007|261021121427099003|11063799006|56012099006|4143699003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Lj894qtMzAl2vnJnLHJu9hjvkGPftbeWIWC1q8yPIN49NMB6julgNKABCfSjTz0lKr2NepnZ9ZYD84kT2PPBLfG4cyqPfBuyf3tKMCXTOPW+lg7TFQjeKvhPgOfjm91q6UjXTKP6iTerr6J1heU8+CLkHs+noK8TSb1nxlOnLoq/lM39Qjc2OtviLgWhkX7oBKsqHHDSGU9Dtmni8nMduBRk3gmqHOz99YSM2xEkjs3TC4GjOvfJPoju4Ielyo35DpmEhZ1M/KFgOZYXn/K7SCLFE8k1aBZye5jMzoqxnzQAIHZe1eIxkZHTimU0lX+qedqcM/jHcjtvAKnjTGWwoSXFh4ANzDFiGb3Nb4wR5dnAuyauLLnv9YC62by4RKI5p2jMDlocCHxgfFQqum4XdU9soTUFNA+EWKr7hJKEeGxRvhmBGNIAE7Ma1Rq3wuTyK0RvbBf95v9c/kAWylXMgGU+6B4WDVyj6VjVA2aJ062YBisOIH2julv8084CLucL/L+P31IHajfcKgTmAUM3GBcgEjhhnm/QrpKbo23jkV4my+OKi3m36dqQrH5URqf8yJ3mG43m7rx6hzXSRvbzjwGDbhO03B3wGs4KqFTvhQz04yb7vZe2pfG1A2O5geHu6OVGs6FCyD/2Brf5BMro/qLLLNHoguL79MKAAxB7vj3byvt+LwDXyV8jwq0JWQB6U1O9osjtxmo/1Lj74p+E4g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(10067099003)(261022075727099003)(3023799007)(261021121427099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KnUjdEYKR7Cj78Q1GBEcPa7QKrpXcHl47jeTFxpz8+FuoxVbmoxDDtlfb6hEmXIl71ipWdQlapbtO2ahm2MOd/UoT1oqp1ke7T+LIQiarJ0keYcDvsMflR/g7lMYMN8KlovGrEQ9RlL3tIQMlb3/7McMlbqgysmH01DTDji57ZEdo7hc8OFWC64Pyh365jGF2paPRWaTUXIbD6vNRgcqg5MZkq51Jw2qoavGytdNwWZPU9AFvoq6pRTLRkeZL9WBDY+QKX4zMuBMxNP2lAfgiv/PK5HL+ZKX8aeMRBzaeU5nQ9Wxbbm3Wq4TGhWK7n4gGsUtp6lXrwnq3HBMuzdbsK0kY/LoKRLEyCDG1AU8V4H6JvnWO3YGThsRGhseulOxlpCksXfafT/2KJD+P+Dex12Uk/+mIhBd8YBSD67vcIKmuZvqIvfC99zn7PqFBFuf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 10:51:46.2383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4603a6-e24f-42e5-aace-08df30f3a1fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000073.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFAF883AE17
X-purgate-ID: tlsNG-720697/1792752712-31BC82AC-CBA2F3F1/0/0
X-purgate-type: clean
X-purgate-size: 1589
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 29-Sep-26 21:02, Mykola Kvach wrote:
> ITS quirks can impose restrictions on memory accessed by the ITS itself
> and on shared host LPI/Redistributor state. These scopes are not
> identical, so a single global ITS quirk state makes the host LPI policy
> depend implicitly on the quirks seen while initializing host ITSes.
> 
> Add per-ITS quirk_flags to struct host_its and keep a separate
> host_lpi_flags state in the LPI code. The quirk table now records the
> ITS-private and host LPI scopes explicitly through its_flags and
> lpi_flags. The R-Car Gen4 quirk applies the same memory restrictions to
> both scopes, preserving the existing R-Car memory policy without relying
> on an implicit aggregation step.
> 
> This also removes the assumption that all host ITSes must expose the
> same quirk state. ITS-derived host LPI restrictions are accumulated only
> from quirk entries that explicitly set lpi_flags.
> 
> Use per-ITS quirk_flags for GITS_CBASER, GITS_BASER<n>, and ITT
> allocations. Use host_lpi_flags when allocating the property and pending
> tables and when programming GICR_PROPBASER and GICR_PENDBASER.
> Memory-related quirk bits are named GICV3_QUIRK_MEM_* and are translated
> by shared gicv3_mem_get_*() helpers.
> 
> Collect both scopes during the ITS preparation pass, before host LPI
> state is allocated. Keep init-only annotations and includes in the
> implementation files rather than the public header.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


