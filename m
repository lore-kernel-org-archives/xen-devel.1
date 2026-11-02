Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CB6606A329
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 13:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Bds4Tp96
Received: from list by lists.xenproject.org with outflank-mailman.1468193.1677284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNrgF-0001Ds-Qv; Mon, 02 Nov 2026 13:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468193.1677284; Mon, 02 Nov 2026 13:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNrgF-0001Dl-Nf; Mon, 02 Nov 2026 13:02:31 +0000
Received: by outflank-mailman (input) for mailman id 1468193;
 Mon, 02 Nov 2026 13:02:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xNrgE-0001Dd-Et
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 13:02:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNrgD-00Aqm6-KR
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:02:29 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ae889e1-2eae-0a2a0a5409dd-0a2a4508b208-10
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 14:02:29 +0100
Received: from [52.101.53.13]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ae889e3-f659-0a2a45080019-3465350d5578-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 14:02:28 +0100
Received: from BY3PR03CA0010.namprd03.prod.outlook.com (2603:10b6:a03:39a::15)
 by DS7PR12MB5838.namprd12.prod.outlook.com (2603:10b6:8:79::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 13:02:23 +0000
Received: from MW1PEPF0001888E.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::48) by BY3PR03CA0010.outlook.office365.com
 (2603:10b6:a03:39a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 13:02:22 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF0001888E.mail.protection.outlook.com (10.167.249.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 13:02:22 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 07:02:22 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 07:02:21 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 2 Nov 2026 07:02:20 -0600
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
 b=dGZMh781YpO+p+rjl0CESq5J8DRMPdfHi3ep7sAkBlzLo3aNRVZpJJ1UIwN8EH+BtknLm+LNZ25USJeX/VcFCC4IXtyOnXq4AfK68mGIH79pgTH+dQPXnhFusdntyfBvMLwtfJn6bpezinlBdGO/+V2yAmao3aFEOekJBQHnW2/fC7Db8ThpqQFxp3f35sGDpY8ZeMGm4b59PfIC6udzjdWbr3jUczGLOE4jVq4C23Qm+Kj2WdM5V10+bZkpAchdudu7fruoSOnkpoXFTe/9vVz7igW4WJe8vmRW15ClwmPJ6hpOTUuCYWofJ3Jo3C6ZJ2GWxh15CjiyW6YXiWwUVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32BuSs5L8vGAATNxTflFEpKUKCC8aF6a+5MfmF2suLA=;
 b=mzlZbvOzjHoMzfi/dwEEJR9FgR7TnkwiMcgPSH7q9ReSfouCNLWeDFtx7hQEnFD9uNAGPAlfhyMqVh9aljdHCmGamxfpRan6JyPhrAdKeavPe2wXha/MZvgyjnNLgNEoe4VAw6PjAmnEXA18zdElXXBq4d0dYwy1u9R8z2fJHUaGrGv6G5Ifs491XuWplliHkKdhnQWxkLKFGHNFSLgLyw27QwGoGwBkJQNkDKgFZwvV5Vxqei8o61nSTbfr5pIehGs5OYUG/b0j0mGIdu6BO1CHDl+DO2y7KvtBo9F1DYcLjo1U3zrGRLJMPDBMU8MGSH7faJOj0Gk7x+fTF1A2CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32BuSs5L8vGAATNxTflFEpKUKCC8aF6a+5MfmF2suLA=;
 b=Bds4Tp96fDlAyZkJuRKPWuZVREOi+gn71dKlLiciD8W5+h6ln25XiHsrXhbPuXgg5mz/xRiKUnwue1H3LG/ijQEyUovl4mQ/Es65RIuGO2Jwa2/I/myNg8Eu+iwn3HhFa89leeexsFm4iOSmByriHjX/gZ0KuBQzy/E8ThpdCNc=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <10bc93f8-5ac4-4804-864e-d83a5fbf7108@amd.com>
Date: Mon, 2 Nov 2026 14:02:20 +0100
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
X-MS-TrafficTypeDiagnostic: MW1PEPF0001888E:EE_|DS7PR12MB5838:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e24c150-ea77-4a4b-03f8-08df38e188e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|10067099003|22082099003|18002099003|56012099006|11063799006|261021121427099003|261021123027099003|261022105027099003|261022075727099003|261026140227099003|261026121527099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	+sqvm85o2s5h6O61tl/42+WroESLw9neSTEaq+wxKwpC7CyARUIAAXwn8IgsACVs6bNrGCobm954mVRvbCEql0Pk6KSwid7alXQQQRaaZMltY7O4sDxTk+9NnHrOpv3Kbgyx9rGzkA5J5lj+6Q/SRMJJyGnVJTbITQA4aYr550NP0ox4brqyhnxVtH64705La8iNZRQae7VSwypvJ3nKo0zTlrYPYxemjNuCVvQZt4RJp/plSC2I2yK4GVOTMyyYiGhlB1fAEqzEJcUFGFtUTb6mkwG8jLpTSLAaxnVsr8r2H/NjdoZq1OklvWqXeKG6Nje4Z7eEEW8ZzNuYVTTYZsAWjSOPuFSGXonXFeu8E/qEhNCJ3doac8J8KNd2siu4yADG9xuXkcbDpFAkRcxN45dfC/fZXkL1S9P7QABi5w1lH8WuHIkzrYjGDXhlnXUVJq2gbiwlickrVfaLUe2XiGzli/fCIrRUxw/XO5OqAqXjtYDxtPj/s6dqDHeZaFPXC3+aGpRSjxK3FbSGRVFlZhhKf7lreTdYo33E5NivJj4VfmqNnRAqKmRoYlZAKvYZI1OBGdWF8rOPCmOQfJ6qw8vbcxroO4+Ot6CDBltXVFPD9gSjXLqywSY1rAA6115esKTXMS/ndh3+oyXnNWuuVxB73ptKHsPNnBc9h2Cc7KdDcX9ZX2G5Iim6edhmUxVLr5xCm6OAoISsz7kOGhnV8w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(261026140227099003)(261026121527099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/AXsZARWIdB85mjNuYyFjJqhqQLMM7dtQq4nYPBGRp6bMnxwa0u49b98tRFa+HHMII4i+g3TgNqgLTT/bO9te0/270N6QgfcisRpNVK6VqTfHpIKaefbK0lixmJsTG1+UrS1SA6j6Nnn6qFleECcrvgYNTDSSTubmot1+ESg0qAOVC248q2j7z+3xSY22/GSW3TDYydcYwOCIPYkr2AWqTdZnw64mEo1Qn36+67gZETPX24JR4NWY6ChYQAFDSyAvJoKf/UTi4YJJJwxYFUt4fylYPHpIHvl8/4G862RezH/Oqo7+bkUQM6I4kjQsjszlvTO8P8yCkfFIB4vpv4YVfjHHuwcMJJFStoBSE/mmEoJmr/LTy9c+K/5PWnVbNnriTkTxJLpzuMPw84dym6hvaMMYCRIgTeGHZuWkvgZ+fT0gbLMJEzZy3phlwFqMT2N
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 13:02:22.3792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e24c150-ea77-4a4b-03f8-08df38e188e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001888E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5838
X-purgate-ID: tlsNG-c1860d/1793624549-CF95A87B-8FE77F20/0/0
X-purgate-type: clean
X-purgate-size: 4182
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
It's worth adding a reference to Linux binding for nvmem-rmem as an example (the
only one so far?) of /reserved-memory describing non RAM. Please also mention
Linux comment at early_init_dt_reserve_memory().

> 
> Skip reserved-memory banks outside the host RAM banks reported by
> bootinfo_get_mem() in make_memory_node().
Have you considered EFI boot? There we don't use /memory and bootinfo_get_mem()
contains usable memory. IOW I think it does not contain reserved memory. In such
scenario, we would skip the reserved regions because they are not described in
memory membank. So it would be a regression in behavior.

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
You can omit the empty check. Empty banks are not added to membanks.

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
This filter (MEMBANK_DEFAULT and your check) is now duplicated in two places.
Please add a helper for it. Also adjust the now stale comment.

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

~Michal


