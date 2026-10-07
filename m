Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0814CA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 12:01:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442266.1659844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEQKE-0003KQ-Eq; Wed, 07 Oct 2026 12:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442266.1659844; Wed, 07 Oct 2026 12:00:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEQKE-0003KJ-C1; Wed, 07 Oct 2026 12:00:46 +0000
Received: by outflank-mailman (input) for mailman id 1442266;
 Wed, 07 Oct 2026 12:00:46 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xEQKD-0003K7-ND
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 12:00:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEQKC-00CQri-Tp
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 14:00:45 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac63468-8faa-0a2a0a5109dd-0a2a450b9f62-4
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 14:00:44 +0200
Received: from [52.101.52.0]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac6346a-b7e8-0a2a450b0019-34653400b619-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 14:00:43 +0200
Received: from BN9PR03CA0066.namprd03.prod.outlook.com (2603:10b6:408:fc::11)
 by SJ2PR12MB8651.namprd12.prod.outlook.com (2603:10b6:a03:541::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 7 Oct
 2026 12:00:32 +0000
Received: from BN1PEPF0000468B.namprd05.prod.outlook.com
 (2603:10b6:408:fc:cafe::78) by BN9PR03CA0066.outlook.office365.com
 (2603:10b6:408:fc::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 12:00:31 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF0000468B.mail.protection.outlook.com (10.167.243.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 12:00:31 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 7 Oct
 2026 07:00:30 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 7 Oct
 2026 07:00:30 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 7 Oct 2026 07:00:29 -0500
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
 b=J1iqlmldR8VJ/EqSJD7OzL8gHOojJ1Fwp+KhAJCuZaF9gWuc/zarr8FyayvEcMhTSEgX5/vJFvtKB0jFM/x71Sd3HX6AhscZ0uWkqDoDmDpzpWKaUjELY13dK8X/v8ZZYB8gByLnI7CKoV+tiqAZ+KrtZeR8t0Mv12w589Er5fw/DY8Teb7L6YC+QBOS3dxUSNE7ZE/PQCgEErQivS+EifVS4i+gsZfKiRz2pApeHKAzwIYC9rQkIuPjP5nj0XrAnCAr5UlnqVhJvw+IdO9/QTcwCRddP11ApgqVK9jYwYW/0GC2mVg8htuAN8fAO6AdmdlC/M8q4NJ/CmvjuJkcvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/uCyFSvq0Vh8IMLf8yXpqJuRKqkn+sKLnhmNJT74LQ=;
 b=blTILmzI8TNadK+r/nrU7vWmYx3Vw0CHzQiHFjFa5G/NZoiYgvOfd77pNYTPJ46OAjkBbr3OQD/VxtGWsir/ell7/roJBCPdH7enZbWV5X4xIR1MAW/PAbxcHWqqB9f5acl2uB23SXKEaRzjI6S+fi+nOTOsL5P7rKlrSaYXy11pgjlZlkWpcskAQJceH1l45Gpd7HqUdTgM9XQgrlI+eUtUPI2ga6sQssY7ROYQUzMmLEBhdHSEUq2rjxsqn12ixv9J8VnRoqG+4bjaEUBT1WueacSnJgvxk0nhEkQnBDLwPNevLXQs6UYs5airDyb4/46vFv5P4Kj8jM+ONE9ARQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/uCyFSvq0Vh8IMLf8yXpqJuRKqkn+sKLnhmNJT74LQ=;
 b=tdvHiuUQOe4MxcfBgzTe6Nsds7k0RElGXRI0HH7A3hjU1Jnvb9r5IPOkEAUWK5ZQMr33xbZrqaoWEFWWvAfMvdrYD6+XDfM9CdJuo9yYj8uAxIddFRssYTPxe4PughB88I0cBOU/CH8CWBf4RQ3gEbkGKDuXhAi/IbClcs5JDPs=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <311e02a0-8935-464c-bfa1-ec4e6aa23462@amd.com>
Date: Wed, 7 Oct 2026 14:00:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/nospec: Make nospec helpers always_inline
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20261006103142.139422-1-alejandro.garciavallejo@amd.com>
 <f9c2cb00-e334-4dab-a173-4cbffff18d94@amd.com>
 <DLXR8CB96NCX.1ZRUEBZZG88GC@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <DLXR8CB96NCX.1ZRUEBZZG88GC@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468B:EE_|SJ2PR12MB8651:EE_
X-MS-Office365-Filtering-Correlation-Id: 6994c4eb-400f-425a-3921-08df246a9629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|18002099003|22082099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	6OSX1oWHutKT43wN1WwmJijeFYFiNPkSd84u7knanCu7xImWWr0/WlYCPUmZZjmg6pevcoGlNhMvzKVxzCi+VvS0HdnDLhwcwHKnaIoq6jcK85xo5ZFxt6B2bDSsMWqULAhSBG2XPiAgN2hoCIfgAolCK6gJL8Cma43L4IhmGIlrbd+IUkGrCs3zxbvNLTmb44f21DVmrui+ZBYNyH065ArCjrV0nUf2NILpTNAaN+ydmLLVD/ElNaWsrblNQAtjwOZg40P+OX+cP7XgnSrZrrZ6DB2iQ6PmWTYRZ3yjfIfO9anr81g6Jq4JuHy67/ljVo8sXdSxFOKp8Yj17uQkJgt14MsZpFnGy2PYo3b6EDw9mgnLiDozYWGhXy2knVBFZ7AVqNhLmvUsS2PHIcsvkWdfyq6Yn819VKy2WhryIqIxvK0LCe/XAVw/qs/37ujX4gytYpniv/i+OKhudps5afVjcGXaprcz/MSofqvadKfd73c3SA934ZQ9GYOrMEjI/j8Y/cajEM1GnCQBOvHkHX9DYZnzizYtffqrFXpbX4L2Yp2Nd4j/xs2aUHsEY2Xy4df7407dwVKUG0oxwbpPeDJELP+V/yX6nKHtiyjwmELp5TT/doo/Z72pGh06FmUB3fTsIhwnZQ4UrT9M2nQduxsvSPPI4fZCwYdOa9qioioFt1XD7H71G2jEAWAafUvlkSV9BnSv/LB3pd8aU5cL+w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kbQfIc1zeQrm+/9L+94+dicfDlVVKZEn9s8zfgSU+ha7NOXq5csXv2lHHqR94mNEfkv9oSw8EOHdP1XlbfOFlR5dfiGC1TMqo/3yeKFtG+P3T7p/lSA0VlJdITJBo/jkFe5BgmGZPT9TZucWinOSZvtson4CLnEuzh926JUj0Lp1rhOdqsvWBKLZzUksXs28YwYRnO7EJ9u4hK+9lleCpNL0zPrcM7vf76DWohE+OZiW9+avGSNhmM9MAQP9twoN1wP/Wt7s77x6vXTxmmjDY5Hf38lOZkN+2eFGq040I0hQRJT8NX/sixdVswwOTlTol4BQ6C5oynUgjoNO0ZrqUCEiwNc6aP3/y1Lfza0Eo2fXXjj7y+aZN+kKdaTIczZoBcnbLnoITHpK2nPNSl1/HOUsPAyZ9+0J9e1PzYY0ATxgem2zY07GPolXwpEkJI2+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 12:00:31.3919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6994c4eb-400f-425a-3921-08df246a9629
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8651
X-purgate-ID: tlsNG-42698a/1791374444-A8ECE9EA-95DDC85B/0/0
X-purgate-type: clean
X-purgate-size: 947



On 06-Oct-26 14:29, Alejandro Vallejo wrote:
> On Tue Oct 6, 2026 at 12:45 PM CEST, Orzel, Michal wrote:
>>
>>
>> On 06-Oct-26 12:31, Alejandro Vallejo wrote:
>>> While today they don't implement fencing in a way that would block
>>> speculation, once/if they do they'll absolutely need to be inlined, even
>>> if -fno-inline or -fno-early-inlining are passed.
>>>
>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
>> but this should be done for Arm, RISCV and PPC at once in which case you can
>> keep my tag for v2 # for Arm.
> 
> Neither RISCV nor PPC implement nospec.h today. Should I considered the
> R-by just settled for this patch?
I'm not sure I understand. You wrote that they don't implement the header
whereas I can see:
arch/riscv/include/asm/nospec.h
arch/ppc/include/asm/nospec.h
hence my remark to fix all at once.

~Michal


