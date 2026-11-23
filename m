Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CAC606AE41
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2026 08:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2wnKOrS4
Received: from list by lists.xenproject.org with outflank-mailman.1500272.1696498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVP5M-0000rp-Nx; Mon, 23 Nov 2026 08:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500272.1696498; Mon, 23 Nov 2026 08:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVP5M-0000ri-K6; Mon, 23 Nov 2026 08:07:36 +0000
Received: by outflank-mailman (input) for mailman id 1500272;
 Mon, 23 Nov 2026 08:07:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xVP5L-0000rc-4X
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 08:07:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVP5K-00HGm4-HH
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 09:07:34 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6b03f446-bab6-0a2a0a5309dd-0a2a4501d3f4-0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 09:07:34 +0100
Received: from [52.101.46.2]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6b03f444-5bcc-0a2a45010019-34652e02965a-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 09:07:33 +0100
Received: from DS1P223CA0024.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:44e::9) by
 CH3PR12MB7619.namprd12.prod.outlook.com (2603:10b6:610:14b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 08:07:29 +0000
Received: from DS8PEPF000000E3.namprd05.prod.outlook.com
 (2603:10b6:8:44e:cafe::ac) by DS1P223CA0024.outlook.office365.com
 (2603:10b6:8:44e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 08:07:29 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS8PEPF000000E3.mail.protection.outlook.com (10.167.23.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 08:07:29 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 02:07:29 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 23 Nov 2026 02:07:27 -0600
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
 b=E8szs+D9Ef0rCCquwepiPDmoKgJMnX8PbNtGRkVx1pndSbhgciSP2Dl6+bzkyRWXimLL3/QaLo1VGhp/2WdUDm3ZA/qDNano5x3d2iDXC7Vma30l413UiUqAjZkNp3Cyv/wESDXFaCNHz6eI0GEV3gjZo31f4oeP2pnhDF7e34CzvzfOF/KP2nYteV/x0ZM75Nk0mH1U0/mei5zLTgnV4zSmQN9mMUNMhclRwMshYdsGWrMZ2xdvV8bu1Kd426sX6fwhJR8xBQLJK24FADozgIioil17VQzR2cwGwzrG8C3lzrBp0UYvB7yhxoPIVJqLW/KNF+J6/B7v4dvNbkocvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFndhDOeQRUSnBpwSg7V7/qqPZ4+DrkIAGatwYtzl60=;
 b=F7iA7PxtIox74z9xBH8GGepEu8RT5mQLXq6WY6J4r9Mxddv8yPpQe7STeToLCB7hJ/dWoMRNlB7lWQYRmSkAD9dQJb4rFyqtc1THe6y6Z/UYXbmM7n/M7avYCJPCJm4fY7phMCksq90ndg+5GyUunn6M1ArDFZ/vyaZztn62cbtaDkZRWLx6KTM0X9henTjEXele1mcBMIjzpHQSJ34CuVhrXgkVz+Tz66xD2OoLMiE065mTh3jqLgQNwRbBd8Xhg/eO6U4EIHmX4CyactX+t7Jxu3W/dmiQ5C5lagwUBSSq+gmeMoVzSZox4Sr954Sxq3BUgolXATFTyLw7tliWRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFndhDOeQRUSnBpwSg7V7/qqPZ4+DrkIAGatwYtzl60=;
 b=2wnKOrS47j1/7j9SZAQSbtQxKl7t2G2gzDxA9j8RViuiiwSt5i+COVc+MJ5sVgPjZM6kbCL6ODMPja8+h3rSKhjhF8vktOxgfObyO/7VRY66mQ5oiByk8K/Pl7jT/Mx85ZNFh0ixVvlPowJuRYLxHvXnE+b6ib2kkVWBbPH1AFU=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <b37a23ef-2557-4b53-b175-9c1ff197d855@amd.com>
Date: Mon, 23 Nov 2026 09:07:26 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: its: unlink the guest device when mapping fails
To: Mykola Kvach <Mykola_Kvach@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20261120205205.398840-1-mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261120205205.398840-1-mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS8PEPF000000E3:EE_|CH3PR12MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: bcd0abe9-fac3-4b5c-0e39-08df4938d196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|261028144727099003|261102123227099003|261021135927099003|261021121427099003|261026140227099003|261026121527099003|261022113327099003|261022075727099003|261022105027099003|11063799006|56012099006|10067099003|18002099003|22082099003|6133799003|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	02LNlFXqe+Y7uDS0cGsk7Zksv3kHgP62uNvI9cZ7SWbVbaCBnH5CFq5rgsLdNahiRXVxrRmMGNo7+XtJ8OxR8UC3DhgqntExrjvy2Ul4y5wK9c758mNnWiYX5dGlT8qIBaY/p8C/a6CwBYwqnYuD23SOIUaVo4cTR8P1rNuKT3Ipkd2enLlz/mwYXs8WzoghEIVZfNiaKLiWaHXQrldkEkj7rkfdKukDnqhzVrahcOpkrA7xxtJHFsmvEGsfMK8Qb2lUa1ZYRj7Wi8ch3+4FfggGja4HGwY+rVkRraoOagmIKBgUYxf7o2q12TYSBPtwpd79iuasywZcsEWitpNIVjUZ/GsFq6LCOTFPy/KY0/FOLJqlaI/p7xgJWULjm6CzQQ+dYAcXmE69By27ISKql6j0ccpJWOh8JqmczVoBy96+Uv5qsufxnXr+scCkiXFYTrWgl1hqoCzRl3YWe6viZwJLWzroGMpBgUqFnyarNhMHUhVazdZk2sIFq3LmzK/EXhUsjv8727AKd7xEFcvftli2DmUK4avULtTie3ReI9HOQ40SHn30F8bBCk8e8T3+TPF3YpQF4wGza6xNYzN/qTIKw3GfBMInbl0bXHnO0BnJZiqkOTUFpYJlaQhrmDMlDlH9rnXoNMHhtFr5az63DRG+aGW91WiWjURZFGgFQRG7eKk+UfizGTQkyQAlJctKTKnxvQGDKcMmwFb+A95c8Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(261028144727099003)(261102123227099003)(261021135927099003)(261021121427099003)(261026140227099003)(261026121527099003)(261022113327099003)(261022075727099003)(261022105027099003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(261009223027099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9OAXLSGHGFhqfEXktBhNspX7xb65Nd/BzV595YY8Ry67lRp+tupJ1yOa5pS+V4tyKYDFTfHs4QHvpYLt8AoY4BRx05F/JvtWsviyD0D1J6TPWS5QNvv8dei75fsUmqSmcU8pDdpIztet3Cjg/4zwiM0Sor3OaEydnObHNBAkZEhxUeVYIOM0DMIKb8409M7svEXQDcv8I76FBoVAGTlYSQYYcuwMoEVaneOisDT5BmMuzC1xg5NHNj24OLkAXlAr1upvvaP693gEdCESPY//SjoHKGtSrOrWVlIs1++OpxZzbYceBRxs95A8UPk5qd+v7nRcZOjSL8fRChq86fhX1bw2gaWzYO7pnzqa9GR7a96v9ANzokD/bh5W42UBgnmSzYU5j4n8fk8H9Pbn13TiWTMmjolZQ5q/7yUy9c3Wa4iubK2i0g1As2+VhR/KW5TU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 08:07:29.2725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd0abe9-fac3-4b5c-0e39-08df4938d196
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS8PEPF000000E3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7619
X-purgate-ID: tlsNG-d62444/1795421253-4DF585FD-CB5CCB28/0/0
X-purgate-type: clean
X-purgate-size: 1039
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 20-Nov-26 21:52, Mykola Kvach wrote:
> gicv3_its_map_guest_device() adds the device to the domain's RB tree
> before it allocates the host LPIs for the device. If an allocation
> fails, the error path frees the device but leaves it in the tree.
> 
> A later lookup then walks into freed memory. The stale node corrupts
> the device tree, and remove_mapped_guest_device() frees the ITT pages
NIT: device tree reads as DT, not RB tree. Worth changing to: device RB tree.
Can be fixed on commit.

> a second time. The double free hits BUG() in free_heap_pages() and
> panics Xen.
> 
> The hardware domain (Dom0) can trigger this. The host LPI pool is
> limited, so Dom0 can fill it with large MAPD commands and make the next
> MAPD fail.
> 
> Erase the node under its_devices_lock before the error path releases
> the device.
> 
> Fixes: 69082e1c210d ("ARM: GICv3 ITS: introduce device mapping")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


