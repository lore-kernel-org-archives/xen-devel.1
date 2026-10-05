Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE194CA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 20:50:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441169.1658760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDpdG-0000jH-UK; Mon, 05 Oct 2026 20:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441169.1658760; Mon, 05 Oct 2026 20:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDpdG-0000jA-Qv; Mon, 05 Oct 2026 20:49:58 +0000
Received: by outflank-mailman (input) for mailman id 1441169;
 Mon, 05 Oct 2026 20:49:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xDpdE-0000j4-PE
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 20:49:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDpdD-003q6h-Ui
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 22:49:55 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ac40d60-e002-0a2a0a5209dd-0a2a450b89ec-16
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 22:49:55 +0200
Received: from [52.101.85.53]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ac40d71-b7e8-0a2a450b0019-34655535cd90-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 22:49:55 +0200
Received: from DS7PR03CA0111.namprd03.prod.outlook.com (2603:10b6:5:3b7::26)
 by CH3PR12MB9098.namprd12.prod.outlook.com (2603:10b6:610:19e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 20:49:48 +0000
Received: from CY5PEPF00000E78.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::ac) by DS7PR03CA0111.outlook.office365.com
 (2603:10b6:5:3b7::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 20:49:47 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY5PEPF00000E78.mail.protection.outlook.com (10.167.247.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Mon, 5 Oct 2026 20:49:46 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 15:49:45 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 5 Oct 2026 15:49:44 -0500
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
 b=lO4it2AeDYd395LjRRcoHqOhuC/iZzKEsQ8mrQWG2Bt3s+3LcBLuwWqLuVz9tMrTedHyRh0N2+pp37E/mF5wQDB5rHE4WdBSfhOGJb2PzNmu7ZZmM7xdHhyNiQo1xAPIkgoDYBreo2OPEt90tnO1zTBmzF4Qy8SMCcjF2LJThS1InlsKBi5ZhfHkaelOlFHqwod+6tBWYEuUdWpPlvdZOrjWj969yp3zyAo2jcgh+7XdQSab7WuTaridSJewMUFNvTrHhttJnzyCkfnwMbjjxXr1/AUs9RwPTEDQnWTPG2UNP0EpLiyon82SisuO9aefg6MYvu9pCgaWccxwCl4PkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0w6jWtdINVHVmzdvgqip4QyD9f4egVMf1ySpBZhIwew=;
 b=e8x20l53JG+82wcibhoaTZZVeNf/Pl71yuDNYIonHAAZcpBZtyx29C0pW4LsvTQ87BF0OSBO54OrD1vT6D1qb5aoknBAJiFeCssCdr9CfkBJX4Ot5mTJ2zv9F0MjuG/FiJiIk6RKewHEFnArnHP6HJEP5ICAMikyqdG5y6p4PBftW9/UOCVgOnX1gv6E8gyGa8mimPDrAH8zFAvxmnNpP07DAAHUEG5vEanS+ad3d3z8e06dIso86QjPksdyEOg8egplib9NRrnm7cSe6PfElo7lBEcbwddoWkiWsiGK8zJGjncieRfDRU3anOiJnoEohVuaH1YWbzbum/jlYoWLnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0w6jWtdINVHVmzdvgqip4QyD9f4egVMf1ySpBZhIwew=;
 b=FbPLkEheSWnoIO2xFk+TYYIEenLGw89RCkG4WapeCVcwQldraEY3Lf/aYnsWf7jNAfJfdXP7/xZYetN4UHUuVxqCsD6crZXvkTMvWgjy1lAmpKsYE4uZ11V4kd8PeOz7l92/k2Xp2yvLMvHeepa3n0rhk5jdAoNnzLWmIz4mo90=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <e3bbade6-da37-45f0-a6ec-19aebbc6c2a7@amd.com>
Date: Mon, 5 Oct 2026 16:49:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libxenstat: don't lose all VIFs when dom0 has no
 Linux bridge
To: Olivier Lambert <olivier.lambert@vates.tech>,
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>
References: <1791011886.8631fc262581453bbf619ec5b2062170.1a100a0936a0003f66@vates.tech>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <1791011886.8631fc262581453bbf619ec5b2062170.1a100a0936a0003f66@vates.tech>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E78:EE_|CH3PR12MB9098:EE_
X-MS-Office365-Filtering-Correlation-Id: 81595711-af40-4391-ac9c-08df23223114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|6133799003|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	UC0rchkfklUgGyLDx2Eh3z9KwwvyKU+Cmt9P+K6gKZ9loMnXmhs9/QO9v3H1yP2kL9KX/mawuw9/VWtdOFfbMBvDQ87QIUauiw6+44MrPKQ4h+h6Z9T+5AWkV9+ivY2Z+sw2+5519VhLHVtrEzWLT92YOsdc21Lb7UoVBin3XHv2zZsLKZE+m1z+WY3Z+zu/9aDPPtlLbEi2hSV/hlvkDDBM6TMQ+2RPR7rpdypWLZfo3XJo4HLVQAXIp/S+1C6VNdJlgeD/VzdtZIybiHRNBYNrcQu1NaIY6PJ6by2JPwsR5wdr1ayh3jkGUudda9FxWD6b9MVLvHmjbWLcBkjLb0/NqjqZSV6AqBk+LPfdj+B0WWKv8gWUdIwd6WsxzfNrqhuFJ9oUk1PoF43mBQp+5I9c4LghhChl2vBRQennRfMl9eoumQDRU0dGPB1su+YLhYANgTRqvkOHgDEFcXE2rWMdVTm+s+fU5+d+d63B77OktcM48lJr4XE/zSlCcv08RBNfzEz6uMJbhqV7J4ks+YALvAyv4n1kLq15XH/dWR4+VRWv66HWpI8Mm35FVpwQo/Ufr0Yo0VVr/jeCgCVnAy4zOSfIGS0gWRMJR9LvkNMHNWCxM175U5z1fCyiMW6BZhzQwMR/qwEzTdjBkXdBMbXaTCiDNR0Z2xhic9izGTtL4Ox3LsxkTGdkIXJf4/D9hh/4Ig5QYlfRkqL5QdOjfw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(6133799003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BEQdeC3KJXDIW/JAy2ABu9AcH28QbJL+6rNFxa7i8OOhfYsTvSUNHbk4vL68UgX5jUQrYDc5z105HINUrE+ijjdaA0zv5qLgargwp+6LmaxwGcQPFgnFeAfutKDgo2zSNmhZt5zMRteUc7L3YR+MxT/dHvw+bUk664fqKuYHL8EYj43B67GVe2aDfNBe/XTyl+tvjTkX7PKkBmECemjlhX5/o4MoTRkNsW0FDp1qzeXql2J2Dz4QMCYdgqjhiGZBbjqfnn4LZAX1oKSTe87ZCRxHWwVGSxLcVuEudVqb10iWiYLcsO8askJgZhlGKmH2sUC3GIDrp0p5nN+4TJeE1Ts4mX03pxKf2vX1MYnAou2Kr1pKfI4qfwF0wMsOdmMe0HHGxZ9y78YSTh3B0PoooQi5bjoqGYQXirjLCRaw9urW3jegVhFDrN86Jb9flWJ0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 20:49:46.8307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81595711-af40-4391-ac9c-08df23223114
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9098
X-purgate-ID: tlsNG-42698a/1791233395-AAEDE9EA-02639D54/0/0
X-purgate-type: clean
X-purgate-size: 1934

On 2026-10-03 03:17, Olivier Lambert wrote:
> xenstat_collect_networks() looks for a Linux bridge (a
> /sys/class/net/*/bridge directory) so that, with bonding, dom0 can be
> given the bridge's counters. When there is none, as on hosts using Open
> vSwitch (the XCP-ng default), routed networking or only libvirt's
> virbr0 (which is excluded on purpose), getBridge() leaves devBridge
> empty. strstr(iface, "") then matches every interface, and devNoBridge
> is just "p", so every VIF with a standard name (vifN.M, vifN.M-emu)
> takes the bridge branch instead of being attached to its domain. Every
> domain ends up with zero networks, and xentop shows NETS 0.
> 
> Only take the bridge branch when a bridge was actually found.
> 
> Fixes: 1fd93d4f8cb8 ("xenstat: Linux dom0 statistics for case we use network bonding")
> Assisted-by: Claude-Code:claude-opus-5-5
> Signed-off-by: Olivier Lambert <olivier.lambert@vates.tech>

Tested-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

> ---
>   tools/libs/stat/xenstat_linux.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_linux.c
> index b60e3fdcab..2a7d2f1a96 100644
> --- a/tools/libs/stat/xenstat_linux.c
> +++ b/tools/libs/stat/xenstat_linux.c
> @@ -322,7 +322,8 @@ int xenstat_collect_networks(xenstat_node * node)
>   
>   		/* If the device parsed is network bridge and both tx & rx packets are zero, we are most */
>   		/* likely using bonding so we alter the configuration for dom0 to have bridge stats */
> -		if ((strstr(iface, devBridge) != NULL) &&
> +		if ((devBridge[0] != '\0') &&
> +		    (strstr(iface, devBridge) != NULL) &&
>   		    (strstr(iface, devNoBridge) == NULL) &&
>   		    ((domain = xenstat_node_domain(node, 0)) != NULL)) {
>   			for (i = 0; i < domain->num_networks; i++) {


