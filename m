Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAF1CD98E4
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2026 17:41:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1339550.1600765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZXnF-0002mT-0L; Tue, 16 Jun 2026 17:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339550.1600765; Tue, 16 Jun 2026 17:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZXnE-0002mL-TE; Tue, 16 Jun 2026 17:41:44 +0000
Received: by outflank-mailman (input) for mailman id 1339550;
 Tue, 16 Jun 2026 17:41:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wZXnC-0002m3-Rl
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 17:41:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZXnB-00CJiw-NN
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 19:41:41 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a318aaa-bab6-0a2a0a5309dd-0a2a4504a63e-46
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 19:41:41 +0200
Received: from [52.101.61.53]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a318ad3-1dec-0a2a45040019-34653d3572b5-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 19:41:41 +0200
Received: from BL0PR05CA0015.namprd05.prod.outlook.com (2603:10b6:208:91::25)
 by DM6PR12MB4073.namprd12.prod.outlook.com (2603:10b6:5:217::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Tue, 16 Jun
 2026 17:41:36 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::56) by BL0PR05CA0015.outlook.office365.com
 (2603:10b6:208:91::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Tue,
 16 Jun 2026 17:41:36 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 17:41:36 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 16 Jun
 2026 12:41:36 -0500
Received: from [172.21.53.33] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 16 Jun 2026 12:41:35 -0500
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
 b=sdKLOQdnASeuLXi6mSjQodGGQ/A7+A6E2GatJZzw5GwFsPCd75YYkRkYXrWqm2xZcjmSzGDs4KE2rnuyn1Uucx+JcAozD5biv9c6FUjXZlb++CDrNYR32YUGHYCxE4IlYSTy9I6fPwy0itrGiuNGjoJRI5PzQ78CFHJL84ufMCrb82m4yV+irXN0Ww3MKqg3Off8k/t5H3Wj+Ak/JfneKBR0U/0wtbx7wzdnaAExMxQREGy7CkKDkqOVkvRSXSBirAKBdO1a9wKCoLmrg2a5dmTMLT6vuQWLp4aK0QpVBEKyva1ClZWplDPaE+d7HIVrOQqboErX6EhUwz/7vVjGFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLY9g1BeIP97DS86fNlbhLTvbM4ybUvN0RDJ0n0tO9A=;
 b=EpLrsY/ZItZ1sXO7Z6DlK1HpX2k/y6mIiAd4oJZbxnxJbbMB+BdG4kReM79XcIkGvgjTtU1YI1yRwbOaTO98bVwPwQaeSFnbeVw99IN4ZLGMTQIMN88OpZBByCFBVNLKN//wWxokkbDfmFomjWy61TsMnhRfi+Hfnl59U9kI0Y7YwfyexdiWSGoBwD2yhrkvgmKfWNV+2jZhJaFTcuBPS+0fcIAoDZz8IIpaALMguspPQcqmGXoPrHZTV0/myAt1fP9i17Ua7wP3FtKXjcZk0Mnw1ScVUhXZ2yupZsFn7MDGOVJg/rZl/Vg0U9TrKmiJ4NWEMBZCXwHuR7gy1DUc7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLY9g1BeIP97DS86fNlbhLTvbM4ybUvN0RDJ0n0tO9A=;
 b=2MU/ghvyc/SZNDWzEUyFoXkuhHox6Fb11vYPzZ0V9aiRoYiiCAKbNF6hp2oNcQPjw5XzN1IsZ7OBwAe6ANZQRmlMxtoGxLlVmFNgpnhhbZ8+5wgbrxkVJoYUF28toMrFPfYtVUIxwe4jDOfDaWLp3GKK6FU0uNjwR7Z1QKce5vE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <a62aa5a3-c416-48d1-bfb1-78e6b16d9689@amd.com>
Date: Tue, 16 Jun 2026 13:41:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] non-x86: sync tidying logic at end of linking
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Alistair Francis <alistair.francis@wdc.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Timothy Pearson
	<tpearson@raptorengineering.com>
References: <c9109e8c-e471-4f4c-b58b-fdfe3cb044d2@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <c9109e8c-e471-4f4c-b58b-fdfe3cb044d2@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|DM6PR12MB4073:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b6d592-2cfc-49e6-1c33-08decbce83ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|82310400026|36860700016|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Qx/VlEK+f8bfzSFTt+fJNTqdZT/ZzuHH9o0uSRBcT/OerZt9AdWjeeIM5IXOq0o3HsdcQCUJaB4PZ2J5ONylmnvudDRYQji3fzWraFU/t2kL3wnzBTqwavwLQu9abivKxED5sJrqtQVsuzUhU9KtriVm5RiF7Ktfiwa2YBClrl0LVOaNyT7wTk3ofyXH6gABsAwyYN4q+W5mUgtWH2EkHJc7sU7k6BfG35BTq3JmthxptG9o8+KkcWE2rNfZ27Ecnn/VAMXlTbK3oyllr90fntE8drprxMTo2yRs34DhGKaTcy+V5KvCq6sRFeO6GKX7XrtnTZJjC9eWiLzyVFdnq0Oo7BlBHrLagvpTM7tQmEaE5WBI4OgpxZAoHGN8axhfbTOIodP2rKX4lRJuJnBk3sqZtAwFRtqebgy3+VGNFFIEDQ4+qOkN0kQ3fzzHT2RkNaQh5jvuNggaU0sGXzqGv1PbR5CoBbk32ylg1vB368H8wUagnJ/U6nhGqFUhIFcRne3GTHE5If415+j9u+PCe7D1L0zsRQW+9SRg4JgUiXi0SnAQHyTmZc3f52IxYNC6Dbu3HbAeMpysvT7jIKnGmMcAK9oSNQCI1xe8D+44gjyhUKsTbfeQfRA47TfH1S38QAt+VHKfSt1P7jPAqgdTKrqoXPkLYhoIPgHWVQ3HEXJ8cIpXITX6BSLJzPMVbZ+DagE1+qcvUkTuRGhvpTosPnXHIf20R9YN2bzmf+OdEj4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(82310400026)(36860700016)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5k15Kkmm6MsU4ALh+0DtATb8sZ6fKse88TgUN5xtoFBqV0SzrLOlxo4ikpL2g9c9PvHuYqhqIlOlaeAt6v/qyFxgXyE+4eG2GOkH7b+zlrYKwsFrwtT7jisJ5yfjOc3khlBOeCCW/J3mVw9Pj5bmdy7VE0UwzoLjZWMzLQONVBlQcsLGWh+4FrAh/nYauXip1XaNExh0cwYxJUCF6J08NeZEMgz0z3Ba4B+5UMo4UB3jnuT9THWuG+lFtrLijki/w9+JUAQBRiy9UyuQPKc3WAioKR+dh6BnYwSHra/Gan4D0G0sSuANmgHYx0JZXBnNX5CySkWuXFKTNkgRCDNRbV1gbr401JJqzO5jrlxG7f5Y4mG715AD2I+Wl3R7VP2ITSihqDKUg7TWWC7J2y4Ww1Yj7bEF+Wz+2WMSWwU+HTu1VyoO281S47agFNbOgwed
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 17:41:36.5636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b6d592-2cfc-49e6-1c33-08decbce83ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4073
X-purgate-ID: tlsNG-ebf023/1781631701-2997A3FF-A51B6EE9/0/0
X-purgate-type: clean
X-purgate-size: 320

On 2026-06-16 03:52, Jan Beulich wrote:
> Mirror what 761bb575ce97 ("x86: fix build race when generating temporary
> object files") did there to other ports: These ..*.cmd files aren't useful
> to have/keep.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

