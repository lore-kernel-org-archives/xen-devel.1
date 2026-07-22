Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAACC44536
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2026 11:56:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1368392.1617779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmVYx-0003Y7-NM; Wed, 22 Jul 2026 11:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1368392.1617779; Wed, 22 Jul 2026 11:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmVYx-0003Y0-Jy; Wed, 22 Jul 2026 11:56:35 +0000
Received: by outflank-mailman (input) for mailman id 1368392;
 Wed, 22 Jul 2026 11:56:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wmVYw-0003Xu-03
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 11:56:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmVYv-000Rf7-CX
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 13:56:33 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a60afe3-5cb7-0a2a0a5109dd-0a2a45079086-46
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 13:56:32 +0200
Received: from [52.101.48.22]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a60afee-b4ea-0a2a45070019-346530162bbf-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 13:56:32 +0200
Received: from SJ0PR03CA0237.namprd03.prod.outlook.com (2603:10b6:a03:39f::32)
 by LV0PR12MB999068.namprd12.prod.outlook.com (2603:10b6:408:32d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 11:56:27 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::4c) by SJ0PR03CA0237.outlook.office365.com
 (2603:10b6:a03:39f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 11:56:27 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 11:56:27 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 22 Jul
 2026 06:56:26 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 22 Jul 2026 06:56:24 -0500
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
 b=m6P+qN8Cid6s4tx0CO4CpovMuBjefUHWk3RpNtsJORgvUyObHQYjTD7SQM9fmZZ4LvIi/+nCtrQMF1LBUdiZNqhcr5nL7DYzAzk9EH7RoakNhlwxZQeW4+ghNi4JpFfA7Q031aHG3a6byaIVglln2lzIH6fKCjhxEh0RjylhDNd1gnvyIWQAe7GdRuVCTFPcbBvr7kA7nTXL7a0uYSn8b2ZZ8/EuufJGNnvC5PB00RkWWvG4gMMj6cRQskG9GBTZAxciBDn2b2XURdXFik6NBVM343dT+WaR1X9G6DbV2iGVnQAqCV3soupPHvQzmQp/bgLwees9j+7XXpEFy9+czA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxA7GjW9jlIdbzhagtnlPo7nhTEZoqt+Dj0efLRJRS0=;
 b=kM4jNIZ3hcJ4K4GWhD+xoPzeAtxA1Uryjysq6mMzKED7mXhDe3XbhU3Gnjao9KDdCUJBaCjfEr7T9+1xsQH3URthO8SJOosElXprCXbqk7ZFQ1OT6fdWsadZG2+IKLezTDtCS/77J8Fj/tpHEPQHmofcK68R1NbRzt8DcP0CSqly4PNLlRqBfkj8V/tZJrifW4CzrRFzmLuOSZBDag5t4S9oDDs2YenwVCSoU83bAJ9nxR9o0Lkn16KIFHN9+lGHTvsgc1v8Zwrh3MTTubI0o3+IPabPKVhGlSHCTLvfhGVpwc0PJTSWzUfPo3NUHTr32WlFOltABiFp3Yt1Wb5fWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxA7GjW9jlIdbzhagtnlPo7nhTEZoqt+Dj0efLRJRS0=;
 b=BLraPtPVjv5Ka5A6pnGSwQWxfN3Po3yhZDdqcfDpSiWZoBkDnqYLWAwO2MLUW0OvTTx2YBSrLptHzPBO/CMO4TeaIVCzKPhczG9YaJ+6ZHunN2gGIpDMWrwamA+qqNCCVRt/vOPLL768oL4qtv5SYO7SDqjmIvMXy8bb8vOkBIU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <3d7a6f21-e1bb-4e95-b4b8-9d07d5255da0@amd.com>
Date: Wed, 22 Jul 2026 13:56:24 +0200
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|LV0PR12MB999068:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ee7051a-2de2-480d-bd2a-08dee7e842f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|22082099003|18002099003|11063799006|4143699003|3023799007|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	CT4tMOfrBDcVIQQ1c48ANIfYAIt1zhxnxakPpkAK/f/mg47thg8oUkSOqagFJRqhraEZkgKHxWMzw4JfU7r83aRVYQzaUmj2aQF6zQOD5BxM/LpMddxXDPC6/UH/JGOLuXHhAIfrNAcnKHRFu/84kGYl7N/IhEhGWOJCNikMdnw19d/Wth2flosjnzFgaKmT8tGsM3rwoUPvfDwiHaK4mCJ+UR4i6YyHXkB6c+2M40J5W7lK9JEGTWKtaqWuUgj/3AJA4SVx3T8YRAPKUU93hGLFICa9wkAHggtlNX+DTYYhCXZ9qUNsQgwTEvh1IY7a3756OQgdepAF1sIhmv6fHVN9MHxJY0Vg+ZPKfMMcTWHJBcrmBqSkYQyA5pX2MPaAY/HmDMRhznTwJ1bjprlAuh186SdLs5OFSIaJ5QWPiKDWbuaqD9OIwK/Y7EB4ieJRpc/SRttkehZBf3R+eFBQe47Yiksp0r6UNIg+4acygvOwCQxYhPiv47GU01F1AL6281pp9e4sgUVz9RlSNeeIFdkY8Fe/cMJhNsU0OzIPBFQRZ6lfrvX8XlKudd1LSNr6uvZufL9Zu+z8raT+Lnc2lvDJV9Eu+FUJqEAW+N5AZKBG6VyrJqmvGsOp402lxa84GTmQROXtgw3QTj2qaZ5mfj4cbmZ1EgazwHpSt2OIJFEgp0kWXq8UuCLcXSgg33GK3ysBsjaUzOKiaCdu0qmatw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(3023799007)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EYcVYeCHMnP6t4zoVtTANcOsKuLfMlB/eIHgCRO0cf83XmjGIZRYOSesuYG4eUU2COzsQM4xeMpfGyNMXdNsCIHAuDYuFAw57mt6n7ApPC+QAaDfXAbQHDrQEPjNFegnE4GTxh2ApRpMroo6gUkFnJ00d0am5OFqFRM2cax8MYnk4v3gE2BtQO/RQ70sYWfGE4B9RofSo3Gajb4tJtT2Dos1L9wKZQBIzAOcv6bAzpRFghi8QbQFcqxCsAf1Bf53UatavZR0PYlOgwj7LsIhk2BY2nIjOjsVn1nMUVdbOOsLL6hyRArBgA1u2my+C+EpzrdUrBixCr581VJ8ai96sbVs0BdFdG8NZ3w1Ey85oMoPbwrUASQd2Ww1IHAch0/kbcpQ7rSZDqv19dX7GPOAsaoK/kLvDPjO0Xbl4KcRtW/5sZENZ4ZCGd9IdkS4B1S1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 11:56:27.3894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee7051a-2de2-480d-bd2a-08dee7e842f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999068
X-purgate-ID: tlsNG-ef75cf/1784721392-378D1AE4-7F72ABCB/0/0
X-purgate-type: clean
X-purgate-size: 1389



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
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


