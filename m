Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CECECA600B
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 10:51:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443173.1660583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEliI-0000dv-D0; Thu, 08 Oct 2026 10:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443173.1660583; Thu, 08 Oct 2026 10:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEliI-0000do-9m; Thu, 08 Oct 2026 10:51:02 +0000
Received: by outflank-mailman (input) for mailman id 1443173;
 Thu, 08 Oct 2026 10:51:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xEliG-0000dh-Px
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 10:51:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEliF-00FZXD-Hd
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 12:50:59 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac7758b-8faa-0a2a0a5109dd-0a2a45019448-34
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 12:50:59 +0200
Received: from [52.101.46.42]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac77591-5984-0a2a45010019-34652e2add0a-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 12:50:58 +0200
Received: from SJ0PR05CA0027.namprd05.prod.outlook.com (2603:10b6:a03:33b::32)
 by LV5PR12MB9803.namprd12.prod.outlook.com (2603:10b6:408:306::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 10:50:53 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:33b:cafe::6b) by SJ0PR05CA0027.outlook.office365.com
 (2603:10b6:a03:33b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Thu, 8
 Oct 2026 10:50:52 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 10:50:51 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 05:50:46 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 05:50:46 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 8 Oct 2026 05:50:45 -0500
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
 b=k1SRXK2wozQzq5LknsY0Txf+Qz/6fb/aK++S9hdCAtlfxC4kueHKTQHnNGKv34hHeRCVyfVcgkUJhM1fksVbPFp2vVf68EhZdGT6STbwa91QXDKq6yWaBTAqjlsaPPi0ZI5BahPZji7SviLjIJnDuja76DwFMXRnaDhCtGU/stybT/OSvxDq0KdjOCNJQ9vdBhjb9x9fDN1WcmMhCEZ+TKjDHW4RVOKIuWTGBMamM0zdRZaYG0ny2BBDYPUuo911WKgiW7hF6kPrOy4NfbdeQyaRNsqLRfaf54BfzX5PxsthHzBkkLvJPt1AY0TQt86VmzdDAHJBW61JrqhxIOC2ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itRferSoPV/YznOfLEimJZClMaBcIE/n/2WyuD6Dgls=;
 b=KqWa7rYa9M5sPzDiFZNMWOC2rhKE72w182fw1ONGhqTkhRwiXhzcLlVARBi9K9VSW7ocnQGMUct1plPK0QiYoHoX9ZdPsiQkn9zsv2erQuYQVhsyFlfO+IuZwJZ2CAp+0j3osA89vi411KIqfscbzUq0hLJpd0FGBmV2naMTg1X60Ta5IFFGaxpKTswlJwkEPw5N6GlXd0LP3LlL+Zq6VJOiHoG/PRpZI6aORG4Okgo03WV0+o92yiMN5uSrGM+1U+dRkSH1I4WG2+vqKmfMPVbw2ynmIqpaIxxXQF8ZMHYkU6//ST0l9JV9xYYr48g2kxBCwbLJ+AJd77Mo93m1KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itRferSoPV/YznOfLEimJZClMaBcIE/n/2WyuD6Dgls=;
 b=eITPl37UHwTVGDnZWQggNOSAGHU1SB6+kPivGHiv7JAvqY+68Rr9nqPQNrNR8JDEdapLOYURLeAuK2lPadPCIBdhrOhjF7RzLWVqkpZuarzEVtA6VLLrDj/FJU8pB3U2HY1PsUZtIGu/zRFN4kgjjmCuwrYoQqCIFvOz7jyyilk=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <9a4f56d4-4c2e-4d5a-8489-9300170729a3@amd.com>
Date: Thu, 8 Oct 2026 12:50:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Fix under-mapping in map_range_to_domain()
To: "Grall, Julien" <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20261007135848.220047-1-michal.orzel@amd.com>
 <055dc887-0cfd-4274-a5f6-e5afdd576746@xen.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <055dc887-0cfd-4274-a5f6-e5afdd576746@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|LV5PR12MB9803:EE_
X-MS-Office365-Filtering-Correlation-Id: c1a371bb-a2e2-4ba3-8040-08df252a0565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	lh5VxvjN1iieq2v+Z4Cw+k/UFgBXQ61nc143cU1YbK081L4g+XbVl8WDZnSvJaO8KubvDdAwDeQB+eoRbx4tGAEqoNRkMsn4KyWJN1g8fDnsmJm0jg/pCw8/jvRgz4ayHa5Tphud5obOLhmdWDzX0v/Us4x6ApdOs5cUMNDM2Hrplz3fTaa8zQYKnrGB+uLSLn3fzqPPmIJ+JzvNA6t3LibSEnoVUUqaK1Ta0x6s3Sb6cZV1TBMbpXdzi3rI0ePKYGTNrdoyHvG6XP7sKKEbZwIf/IO0MAbwSp4gsOl9d7YswGgyITzoMOyZvnRDHJbDNqLA/jP8RfqA5khKvrwe2NFFnlatKMR7Ck+Ru9XDwbNXzw0cuDIYV2Ro389VoK8Pf2g3rWJ39LWPgWm2OzoueRSU1n8EoWqlb8MYdgVT10QlG9U7c2NwrKOoSmn/WNVURN46o2+IDy7Yp3TOLBchP5m4GudTnPbXNoyotA7hMvC5iZQMD9KZpFWc9hhWbeClfJyBsDMG6BkC8BtQrMd9BIcyk7frmlIFXyx86Od+Z5tYmu45SK6EArpIoHc+qiWDn9BasK+7Ldu2ozcCeVlDO0/quk0HMzV60ASkLypDNNR2FNii22YJyFbWmo8xDh67+PGvte6NEf+NvJnRESjjkBhH5P1WaAHlWigHKhY/GndxEEhf8OmMdpDSkvYBoVcSXCET0COpU9zvX7gTCeWb6Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NTaX32knXQ8j3Bylg8BektLxlUBqANL9osIfaApblP3ZCUjEN27KvexvFgK3m8Cnd93A68gH+hsxJrsSmNflJ9o46ap6c64RLoVROBBfKGvJ/VXQNMIvEFd9ngkRq2sPd+ZD51EgRPIdT43yQhfsBoLSTuvnRs7Zv7kunsKw0H0Pno7wcgViHZcOKMJUJwV84E6fBI6bLVq/sjA8vVdLBa02N8w25FEDxTqRhWNKRJlIzy582MdcHvtKPeaBSuA8ImRoQvmKwEYzUK+W8Q1Xcb5/rL4iNQxZfh/X9rqdB2jhUsK1KEEASyJkKSiClU4/uvOIGoyhMoKTF8zLdKBxMrks0Ayv4+9pBo3ENTZAFJMA/2+XnqC82Tkzb6Ff9NS+/tOEDmWeaQIY4Rd1JF3M+/JG1me/m+pDUL06fuYH766Bcglr/a5+pBQvFuacXhUX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 10:50:51.7951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a371bb-a2e2-4ba3-8040-08df252a0565
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9803
X-purgate-ID: tlsNG-d62444/1791456659-BCD44757-28C80CD8/0/0
X-purgate-type: clean
X-purgate-size: 2368



On 07-Oct-26 22:20, Grall, Julien wrote:
> Hi Michal,
> 
> On 07/10/2026 15:58, Michal Orzel wrote:
>> If the memory region to be mapped does not start at the page boundary
>> and its end spans over the page boundary, map_range_to_domain() passes
>> a number of pages that is short by one to map_regions_p2mt(). Domain's
>> attempt to access memory within that page will fail. Fix it by calculating
>> the number of pages to be mapped taking into account the start offset.
> 
> Can you provide an example where the caller doesn't suitably align?
Sure. Example is handle_device() being called on the hwdom DTB creation time for
a node whose address is not page aligned i.e. /reserved-memory node or basically
any node, given that DT spec does not mention anything about memory region
alignment and there are existing DTs like that. With reg = <0x0 0x800 0x0
0x1000>, today we only map 0x0-0xfff and an access to 0x1000-0x17ff faults.

> 
>>
>> Fixes: 88c10b0d6eee ("arch/arm: let map_mmio_regions() use start and count")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> The fix LGTM in the current context. However given map_range_to_domain() 
> is now used in more places (e.g. overlay), I wonder whether this is the 
> right decision to allow map_range_to_domain() with non-aligned region.
> 
> Imagine a user say "I want to map 0x400 - 0x1000 to domain A and map 
> domain B "0x0 - 0x400". This could result to interesting behavior if the 
> user is not aware of the alignment (this would become even more 
> problematic if we decide to ever support different page granularity on Arm).
I agree this is not great, but this is not something introduced here:
iomem_permit_access() and the iomem_ranges rangeset already cover whole pages
and we already map the full first page. This patch only makes the p2m mapping
match what we already allow.

I don't think we can reject unaligned regions in map_range_to_domain()
though, as the host DT is not under our control and hwdom would fail to
boot on platforms with sub-page devices. I asked AI to look at the Linux boards
for Arm and Arm64 (140 boards in total with unaligned regions) and even the
boards we claim to support have nodes that would fail:
- RPI4: hdmi@7ef00700, <0x7ef01f00 0x400>
- IMX8QXP: clock-controller@5b290004, <0x5b290004 0x10000>

~Michal


