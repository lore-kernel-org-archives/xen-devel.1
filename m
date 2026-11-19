Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF75606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 07:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qpNX4Gl8
Received: from list by lists.xenproject.org with outflank-mailman.1495828.1694548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTwBb-0007xd-Bv; Thu, 19 Nov 2026 07:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495828.1694548; Thu, 19 Nov 2026 07:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTwBb-0007xV-57; Thu, 19 Nov 2026 07:03:59 +0000
Received: by outflank-mailman (input) for mailman id 1495828;
 Thu, 19 Nov 2026 07:03:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xTwBZ-0007xP-TU
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 07:03:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTwBZ-0070Fa-4o
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 08:03:57 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6afe9f5c-bab6-0a2a0a5309dd-0a2a45098d6c-0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 08:03:56 +0100
Received: from [52.101.57.50]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6afe9f5b-be1a-0a2a45090019-34653932c599-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 08:03:56 +0100
Received: from CY5PR15CA0101.namprd15.prod.outlook.com (2603:10b6:930:7::22)
 by BL4PR12MB9721.namprd12.prod.outlook.com (2603:10b6:208:4ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 07:02:22 +0000
Received: from CY5PEPF00000E88.namprd05.prod.outlook.com
 (2603:10b6:930:7:cafe::23) by CY5PR15CA0101.outlook.office365.com
 (2603:10b6:930:7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 19
 Nov 2026 07:02:22 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY5PEPF00000E88.mail.protection.outlook.com (10.167.247.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 07:02:21 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 01:02:21 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 01:02:21 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 01:02:20 -0600
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
 b=D4hrc/fDVQ+oAFiajZCXO9lsJ50ye9htF2+XqnAA1sZSPjIEGen+dFE5701sqLh9iscYDpr2oaPJ0IGZ3mTNqf/tksolpgHcf+73IpYSHDnaI+MKpClVnyqHtTtmhWGy33yYiHpEj/lPwgjjTV6warZOSxTriY9f0Sy8fBuPnUeELAhjT/51FeuYpL5NQ48sxCut/pJ3VAwoFyvbeSqFtaB09gUfl6weIxSsNNGWXKInWumOYuSmEoRiO5V4Us30tF6QvjbdwN8l43NBSdiL7U217raWHoRou4c7etd+BM0QSj9RFqp3mFvaMZH11D8pW9Ksj2VPAajg/EFEBs9wlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwGOAXKjehA1QK0wGawX0XmZstVngm3Q7ntBrntyWH0=;
 b=lKDJwd6tgwGdnkgRMKsanI7WNXOScIYZqFRDC0BodmhDoNrZq7jdwyA5Yv1tC3x79Oga3eeXfvFOC6GxwQytA/HKqUYMcB5/rQwt0TOCRCZU2Wr7SUNbt1DnbhKbNKveFeUo6N4gSiPuS+PzVitZSclb2AS/ovYeUU6mRPQ4E6gcEPrieOQbOtaeHQ19fi+h8VGfXsgKWkGuEVT2oz1ESB9SsU2RG/32g7RtmCyh+1Chg2OO0q+pUPtN6Nt81hsNzLVjT/1wW+lvaIHUFV49spyFdm1oVklp6aaWmGW9xIjlgLMMCznYrTy4A+XA37oHe93xTjzXfvykyyQ/vnahGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwGOAXKjehA1QK0wGawX0XmZstVngm3Q7ntBrntyWH0=;
 b=qpNX4Gl8O9nR0jSDY5BRV0pHNmHuuR0nKwCHhSXcyRyArrn6UGL/1keist73/whvxt7xGLumgs8M0LpYrlpL92z0ftrC76z89aEKzG2rmkdcrZob+l7M1/v39WQHXtr7uOaKktQDTOOjZFyt1XaioBLjHuqiG5sTyNL9euw/E3Q=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <3f48a79f-1fd0-4adb-83c6-f38ae5b21517@amd.com>
Date: Thu, 19 Nov 2026 08:02:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] xen/arm: guest_walk: refuse an address outside
 both halves of the range
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1794962603.git.stefano.stabellini@amd.com>
 <9ec26a7839aa586343f6c566e07dde208f781a3f.1794962603.git.stefano.stabellini@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <9ec26a7839aa586343f6c566e07dde208f781a3f.1794962603.git.stefano.stabellini@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E88:EE_|BL4PR12MB9721:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f90bcb-18e2-4c28-ba35-08df460b0ee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|18002099003|22082099003|4143699003|11063799006|10067099003|56012099006|261026140227099003|261022105027099003|261026121527099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	f53gPUVidctU7w5CDwKPsgWEoUmRlYU6NvqEDbN61lg5eICNCg3qd2deMk3Rdy86Dk8cUu5GezciWL5hRH/Bp+3FKbXrHEEFUWkCFFKRvVhxHYeutB/UmQF25A7KYrNl4Uc23ga/vpWCrn2kcn836Lq2ln7B5y/4I/forTUFOtWnDjDwEn3mLMZRQjI5JX/gVg+eKNsImiO/ntNejx50jRiaPKakuT3FYkRPmmj8uCi6PGo8KEVTxtsGHmj4bCf96EUIOqQ5JUe8OPY5/QF9YkvpvEHKOegMIcU/DS1h1wI6i5j7IRtzqzNjSsEgAmRoIvJlDLovG7NktvWmtKKcOde6aTmDWfKs/Lq5c7dKdQHD+V0WIPLN1JdJfo7yo0O2kAjmo2MzQUdTHuduifrfVBc/oVRduDWrSSb+UvvwTi0Il8aiDjI5M23Kfh52MYC5hnum6syrM8mHkvuCWDH+L86VjxNrfCtYgsRg/5IyRP9Ld+kjDTeMgG6cb/ap2/CbFrYUpFfVOZT5FLtecJI1Eg1E9bgPXThy7hYAZLlI4X5O3Ug/LId6/Gq/BbIWv5nC/l+UOyjkdIPpr0NfghsRCJ6rQEZVobRCqL7aab4NqywtoMK8idlnErnM5kgnUx/EQ2dCppJH5b7oNZOJwaldNqilGIMKbnxbKxqBwVVE/JQUMw3/uUrN/W1eRvMLXOzz+/nlO+M/OQiKQLQ8DdZmLQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(10067099003)(56012099006)(261026140227099003)(261022105027099003)(261026121527099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Uhz/8RkI9AYEQzxVoh6bpk8NTmIejr4nXh+9mRNzi90VgKWYEQUTuNr5kWu5h2cUoHhvr7pX9Lfh39hZInB0v+7tn4+Bd3gWl7otB8tUZFNI1jchCoSt9VgyqEKQa7bXbmtA4eG1hmMi8yzbQ6gJrIMApjoccqYMjV4Z6+PgxdJgJ+kW5/iva4O5G3DgRZIdG/r7xNxhWpzsKotP4bFb7gyS15dY/hAJw8sv1I6Gu2buIuijpXPQmDDb5Y/hsI2aBs/5TDl7L1Pf9bH/eAWGS+aICBqqYK7sULB/TCk+j6NakqCxkUIClbJYBz9KDKCK4N4jN9Ht6XbNLN4qWSlWs3aLgkn7Pr/2byNSpCESrWqMSvJbciSJHatCzQTDhe07e1hDGLERm0Dpxqa1BoXV9BFtqOYN+fR2o0rrTd+21EurdwZ+vbDR3eZ1UCJFnL0M
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 07:02:21.7726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f90bcb-18e2-4c28-ba35-08df460b0ee8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E88.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9721
X-purgate-ID: tlsNG-bad1c0/1795071836-BF2DC034-9883A3EC/0/0
X-purgate-type: clean
X-purgate-size: 639
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 18-Nov-26 01:59, Stefano Stabellini wrote:
> The bits of an input address from its top bit (bit 63, or bit 55 with
> the top byte ignored) down to the input address size must be all 0 for
> TTBR0 and all 1 for TTBR1, else the walk faults (ARM DDI 0487 M.d
> D8.2.4, AArch64.VAIsOutOfRange()). guest_walk_ld() chose the base from
> the top bit alone and translated such an address. Refuse it before
> reading any table.
> 
> Fixes: 7d623b358a45 ("arm/mem_access: Add long-descriptor based gpt")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


