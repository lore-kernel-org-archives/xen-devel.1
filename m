Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A27606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 11:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dvdCG35R
Received: from list by lists.xenproject.org with outflank-mailman.1465554.1676066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMkQE-0000y8-6b; Fri, 30 Oct 2026 11:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465554.1676066; Fri, 30 Oct 2026 11:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMkQE-0000y1-3c; Fri, 30 Oct 2026 11:05:22 +0000
Received: by outflank-mailman (input) for mailman id 1465554;
 Fri, 30 Oct 2026 11:05:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xMkQD-0000xv-CI
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 11:05:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMkQC-00GVjB-IA
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 12:05:20 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ae479ed-e002-0a2a0a5209dd-0a2a4509884c-22
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 12:05:20 +0100
Received: from [52.101.56.13]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ae479e9-be1a-0a2a45090019-3465380d9239-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 12:05:14 +0100
Received: from BN9P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::32)
 by PH7PR12MB6441.namprd12.prod.outlook.com (2603:10b6:510:1fb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 11:05:07 +0000
Received: from BN3PEPF00022BC1.namprd04.prod.outlook.com
 (2603:10b6:408:10a:cafe::1d) by BN9P221CA0020.outlook.office365.com
 (2603:10b6:408:10a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.7 via Frontend Transport; Fri, 30
 Oct 2026 11:05:07 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BC1.mail.protection.outlook.com (10.167.248.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 11:05:07 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 06:05:05 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 06:05:05 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 30 Oct 2026 06:05:03 -0500
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
 b=V/haRyWrQI/TsXQmqnJRydgIR+Y9UF8fLV0YWMTgMxSYs+8Zdv8qJLMG6ViG5H/ZbV0WDKjSuWsJ8jDcmm7O2e8fXwak/NZ6VN/vvoVnqoBhauVPtcN19aVJgrtWL+6elHpCeYzZbp1kU6L9eRIZM6cIK7eOAgU2GLrLgR/CtxrqqmgLRttUtVck7diTgpZuT2p+TdVA4RoRlGUPw6jGkU7gsApLqRGaRBTEg35uwlgW2V5/mxbX3jXB34S/8Bnab3jRgqoylV8QsEcBHlhIchLNo0yZw7xPa2SKrA+//g9AJYzUKJvz+qJQCI/24gofm7Ejd2OQ0qsYi7rFFjk/cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgGSe5eZc8SlUXO4dgxVFymdQe2k8NNy8kYwGxCq9/I=;
 b=tIeV/2cAf1lc935jso1Tnj/ZFMfS+y7QwtiFabc5/TmZtXJ4tpMVRNuWW1HEt34stiD60fxpfVaMYDDDhANujhTYXn/7EuS4jr+KDEHnHeny/Mp5K4pYBKZc7OMZRoEB3hhDLpsabYzHiCnr6Rm5R3i4r+ZTvRF3+m7FCa79npHBVkNa7nr1Cr66MMvwdo+EXqAIgmKNcdqOJJI10znr/xHyvuFPGNFb/PcsWszuE4DDvOicNy90+2JaULrv7XtEUCSlrIsO5JNMzd1srWSj1v3UEgHU/XaUNWeQ8lYK3QfmBKynFWmpHFgBhHtXYXAZN7wUs+HUCj8N1rzzn9zy7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgGSe5eZc8SlUXO4dgxVFymdQe2k8NNy8kYwGxCq9/I=;
 b=dvdCG35Rdcf2ckSGFpxKGCBmPRaPip0ptBdJSOwByGM+278MGdMXa+0sWFnO3TB9nVin0u+6VqPZOK8hGL1+/kWumA03S7g8XGhZJb7Az72Hqd5Xr2zBaaIrscdkCNIsVAt+wHKWlMMMxQn6uYbckooPfi99XSt2kTiO5lAktIk=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <d25a667b-5126-4c57-b379-c31c4e7645c6@amd.com>
Date: Fri, 30 Oct 2026 12:04:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/dt: Skip non-RAM reserved-memory regions in
 make_memory_node()
To: Kuan-Wei Chiu <visitorckw@gmail.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<marscheng@google.com>, <jserv@ccns.ncku.edu.tw>, <eleanor15x@gmail.com>
References: <20261028211737.17629-1-visitorckw@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261028211737.17629-1-visitorckw@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC1:EE_|PH7PR12MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: d4db8161-aafd-4f89-1c4d-08df3675a857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|22082099003|18002099003|56012099006|11063799006|261028144727099003|261021123027099003|261021121427099003|261026121527099003|261009223027099003|261022105027099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	yYthCAqnN2LbsIMIpo4iQ3Q+CgaloQIva15oQIiH8BFBVzEjCmIQRpnSwD4SAmCAVR+R06GPO4ur2Vd/FU5AAU5ttpN5a95EoJmNa29jMyYF64DgFPBDE6WJwMf43i4h5yuc9GA9/Ypv98NZtN2Vuv0r0Zl0/4labHQNu1DK3LFz0TTqDqETjlMrPLzSFl1YirRfTqHIslTC4Kje3ratNmzIe81fsBFyUCRT7G12MiiJKazBfxNWv5BmbtQF8d9TYqqk2liobAMP37xUns/APYF+76IQr/srvuLybAONqZA+g/GfiuG85F2af0aJPAGeoZxWcJ/lbfWYJquJ+2jEqCZr8nlbLgTcUm/Cdz/n0a+tT3Afo6x7GXrIND1/rsV5OiWTEKDDRA3T2GYFRh1wBMalp54tKOc0muOXiZLBg2iJxd4kyh0l0rQWJhGZZBm0QuVc0FhRXB1iY7lyw+rX79xDXzqeQgmINiiWSGrwVi7i1+CibbWwpZZkLWYC0sZlCxeWzJqoUdNCAtj6PtH5PYMUAGlrVrlNAnjbCQLEzvNKC7Y08gBPCY0595a3219Cg1OqqVt8y0CuujVjDqJXwznhOBdiNsU/EnIZJ10b6WssP0hJF0ZeA1fXJkMKIQ5S5etLEfOBTBXa4ky8tnpPsJaqe0F4tVxC1+knTGIaWjSHtrjp5a26VU4I9Z4COo+tOI3SbTnrgD2VkF9Yn/v8Lw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(261028144727099003)(261021123027099003)(261021121427099003)(261026121527099003)(261009223027099003)(261022105027099003)(261026140227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QJA1s32+LzoGY7uQIZRhmfa5CYPwAAblWw0mS653o4d9/dPp3yonBpqjsFFAlPqeGit5AzFxS3nZophDZyaHX3OSdBqDw4+KBqAvlFpT1HE72JEaS3ogQKSY1vR9EvBm8OOSnw7jR00XnCSy+b6IVIBzlaBoWtQlBwqSM5RJtBCxQsvGDz5F4Cx6hg8tw4vJkFq4lt4c4BvqPSfKEcxsUdn6J1DhTEil4osYEAB9BSUNcBK6RGCZwFMoZi/VtAl/CbMhc5/4NXmL03wo+IS6ApypqtHszz2tua5d+n+jx7Xa2YJD5qHYXmLDkLX4hzSgW1uXm+5bgcq4C8m0J53eGyT3ghWn89EX8wn3rcPR7ShczC4RMen82W5NyFqW3PAdA4+AJ7/GXQRP4hxhTyt/4B6QgYo29TGjeJ6BtxAfwBmVtqi4rBb7B2/fhJcMDSx6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 11:05:07.2836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4db8161-aafd-4f89-1c4d-08df3675a857
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6441
X-purgate-ID: tlsNG-bad1c0/1793358319-BC6CA034-A67FE3A5/0/0
X-purgate-type: clean
X-purgate-size: 3913
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 28-Oct-26 22:17, Kuan-Wei Chiu wrote:
> Xen creates a second /memory node for Dom0 from
> bootinfo_get_reserved_mem() without checking whether those regions
> belong to host RAM. However, /reserved-memory can also describe
> on-chip SRAM or firmware regions outside system RAM. Listing them in a
> /memory node causes Dom0 to register non-RAM addresses as system RAM,
> conflicting with device MMIO mappings.
Hmm, I always thought that /reserved-memory is to exclude regions from memory
described under /memory. That's what Xen assumes too. map_range_to_domain() for
example does not call iomem_permit_access() for such regions because we assume
it's RAM. Can you provide more details of your board e.g. the device tree? Is
there any documentation I could use to confirm that "reserved-memory can also
describe on-chip SRAM or firmware regions outside system RAM"?

~Michal

> 
> Skip reserved-memory banks outside the host RAM banks reported by
> bootinfo_get_mem() in make_memory_node().
> 
> Fixes: 248faa637d2f ("xen/arm: add reserved-memory regions to the dom0 memory node")
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> Found while trying to bring up Xen on new hardware.
> Tested on real silicon.
> 
>  xen/common/device-tree/domain-build.c | 42 +++++++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
> index 30a59abfa7..33baf150a6 100644
> --- a/xen/common/device-tree/domain-build.c
> +++ b/xen/common/device-tree/domain-build.c
> @@ -504,6 +504,34 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
>      return res;
>  }
>  
> +static bool __init is_in_host_ram(const struct membank *bank)
> +{
> +    const struct membanks *ram = bootinfo_get_mem();
> +    paddr_t start = bank->start;
> +    paddr_t end = start + bank->size;
> +    unsigned int i;
> +
> +    if ( !bank->size || end < start )
> +        return false;
> +
> +    for ( i = 0; i < ram->nr_banks; i++ )
> +    {
> +        paddr_t ram_start = ram->bank[i].start;
> +        paddr_t ram_end = ram_start + ram->bank[i].size;
> +
> +        if ( start < ram_start )
> +            return false;
> +
> +        if ( end <= ram_end )
> +            return true;
> +
> +        if ( start < ram_end )
> +            start = ram_end;
> +    }
> +
> +    return false;
> +}
> +
>  int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
>                              int sizecells, const struct membanks *mem)
>  {
> @@ -513,14 +541,20 @@ int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
>      int nr_cells = 0;
>      __be32 reg[DT_MEM_NODE_REG_RANGE_SIZE];
>      __be32 *cells;
> +    bool is_resv = (mem == bootinfo_get_reserved_mem());
>  
>      if ( mem->nr_banks == 0 )
>          return -ENOENT;
>  
>      /* find the first memory range that is reserved for device (or firmware) */
> -    for ( i = 0; i < mem->nr_banks &&
> -                 (mem->bank[i].type != MEMBANK_DEFAULT); i++ )
> -        ;
> +    for ( i = 0; i < mem->nr_banks; i++ )
> +    {
> +        if ( mem->bank[i].type != MEMBANK_DEFAULT )
> +            continue;
> +        if ( is_resv && !is_in_host_ram(&mem->bank[i]) )
> +            continue;
> +        break;
> +    }
>  
>      if ( i == mem->nr_banks )
>          return 0;
> @@ -544,6 +578,8 @@ int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
>          if ( (mem->bank[i].type == MEMBANK_STATIC_DOMAIN) ||
>               (mem->bank[i].type == MEMBANK_FDT_RESVMEM) )
>              continue;
> +        if ( is_resv && !is_in_host_ram(&mem->bank[i]) )
> +            continue;
>  
>          nr_cells += reg_size;
>          BUG_ON(nr_cells > ARRAY_SIZE(reg));


