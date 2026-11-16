Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DC5606A780
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 11:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=d2+QpsBb
Received: from list by lists.xenproject.org with outflank-mailman.1490720.1691682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSuqW-00059w-OU; Mon, 16 Nov 2026 11:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490720.1691682; Mon, 16 Nov 2026 11:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSuqW-00059p-Ll; Mon, 16 Nov 2026 11:26:00 +0000
Received: by outflank-mailman (input) for mailman id 1490720;
 Mon, 16 Nov 2026 11:25:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xSuqV-00059j-1S
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 11:25:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSuqU-00Ah8K-Dm
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 12:25:58 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6afae846-8faa-0a2a0a5109dd-0a2a4504c646-2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:25:58 +0100
Received: from [40.93.194.28]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6afae842-b57f-0a2a45040019-285dc21c440a-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:25:57 +0100
Received: from CH2PR10CA0006.namprd10.prod.outlook.com (2603:10b6:610:4c::16)
 by DS7PR12MB5768.namprd12.prod.outlook.com (2603:10b6:8:77::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 11:23:51 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::85) by CH2PR10CA0006.outlook.office365.com
 (2603:10b6:610:4c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon,
 16 Nov 2026 11:23:51 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 11:23:51 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 01:22:29 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 01:22:28 -0600
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
 b=SBNcPsJCLmb3LZk10wLF3gOrOxtReVgrM8Km7zXTT3lOBmRoxhUCIbjYIqW41vhzNr5CYS3x8m3+XqcW1cOH27+0h0gLSyRKfj8KnK0C9Z37p7ll3FKQEPO5m6EvRmDzqv0V/+TVgwN+/GnPd2OVRaokdAG0xc+kOW1V7WRgpgpryFY1hd13u3Z1HVTpkumiN4Tup8cNkvQbbHVJvLvCxDEHYK1O0chdtsyqEkKOU4jEUHW45PjKUahrCZUrKEmLsak5pH3ARGRyCxO762EL2716tDaxEB2gNdQHSpxhMYsE5+iXeP1HJNC2m42Qq4LmT3XYNZTaSKdaR0MB3sfa4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/mr0bP6bkLX247dxuec/Rng2W59iThAyc7t9N1pmBv4=;
 b=CPoxbfkcC+98DrMD+z0ivvePZ9xdUI/cP46HuDKsNm6B1Gc1XwbQIBs3PWfMJvPyltGZczC/qzaqkaztlYvlRIEqrsUFQukWWtQkVpV2Y+E22C/FqjTtfPyammfMG508CwoKbEyrVyWem39VwlCbwP8z8PrG5QzY3N/puCrnkp6WB0VDmmFWK5zidu2KWzvi+wgyx2JPHgJlHqnqf8b3eIilahwdsqIjU8PJcceTqgIl03Qquc1anfk6EoRHqdmo4VWeAswQf1k756+xA2iCHYBgSXepeysG00W+z7ES7dvbsHP/eZgMwll0GOJoI2IU2Mkb7P7gJSCt85ge1/onRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mr0bP6bkLX247dxuec/Rng2W59iThAyc7t9N1pmBv4=;
 b=d2+QpsBb1LSiZ8lNZaNpgZ5d9xzVvIO6GiePy7pcVdTYenk8FQM58jcJ23N1ui4jBfyxspWsS9Z5zo1gLdJq3UgTJoLsnwfW8eimHKVFu4EMW6eVnB6Ky/WwV1OoPjOA414A7+xnbH8F0aQ0q7/ve/o8Ppz0b01XfZovjBAyWDc=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <a1dea481-c2e8-4a6f-9a2c-9468b20144f0@amd.com>
Date: Mon, 16 Nov 2026 08:22:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: vpl011: record the virq only once it is reserved
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20261114020040.4154189-1-stefano.stabellini@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261114020040.4154189-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|DS7PR12MB5768:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c57bd85-ff3d-4ca1-c442-08df43d4175b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|22082099003|18002099003|11063799006|56012099006|10067099003|261026140227099003|261022105027099003|261026121527099003|261028144727099003|261021135927099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	TMfqX6Ss5e9sWmjgxCywyzytueSihqnHfPDKcpp82lj7+wf3uA87f9DoGrt1dpp9fVsU8q8emyL4Goz0GoPrME/EiGuzsC+SEJ7q8Tcs3KGZjRPY2UoHWkCn5OU+LP3L//dOKQLkXQjd8RTmysadJUWZMCwpl2eSfNWHsUJu0C+C1IZMe3HN+JxFkoTCo1LgEqV/7Ni1yVaAkZMZfCvnPLPAOMc8hibdxLG1ZbI6d+Ebb41WC0E9Su49tyfLe2yt8J8Ap9VNOkMTv6Z+6n+sTCPgDEqXFNr3Q3PIxSsk50gp1Mbq5Xkz8Oe0jAwJNzsG5ydXNGHsFgK3yu70zsZNaeSktJ/IkE32U4ZGgZWqgT5dAcpniyxgocbv9XLgp3eNoBIglTf5B5wlW2wP+2DhGvDk+Tpd0thzUMYIjrnMHrahbRtpm4CB+vhaRmaXB4qFogcqwfttKa09a7kQkORM/hhKtxxbYB+zmXYMfaNkm9lLsKW8eU42h5RDszaaTjWmakLfXMZYyP8owLTjBFiPzL97uGrF9pODLj1xO6VMGw7mkecmR6KqP6OyFtJiUwI3suAhFVpkROkUPn8wNiIdXwp2D3lK+HW4amraayA+CDwLI4IPv++Wx/8OtLKuicECSJiRbYBf9Bfgy6JmVYaL9fC/KrF/QWf0GwqB+7Kceuk7xIl0TthLClRdFVlPHJEf3E5995vku974Qr4RgA229Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(261026140227099003)(261022105027099003)(261026121527099003)(261028144727099003)(261021135927099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cGrveuciZ4P7MRIza7ieXmwKhJFBU3/FwzQFdHOcFeTOBrpZRLbC8PmjUMFZycpUkMy5pp+07MnQFEJ/CHpj919FdiU1dV5mGUg+sBdbCtxZ9TJmSyDzSfgB0U8IqnlnZWt93Yz1MHaq1jALu9VD1zVUMTJRsjx/yCBPC33vMeP7l2Y611OBOUoQgNbBiUaYfLgSSgwRCNFYeAgbG/xub5g5iJ21bycEEu2iv5hdnDXOQR4ABfZ0g3EZVaod0h3eRb9EhNizRenN+uTSazqtQdpYejdvuVNMMHhBDY7GJfSlCO9d9pgexiYOqyvD0fvWSQnNRqmoqrdQb/tSPVNdFhlSg3T92UgptZz+VX/gb/xmcvzcXXEB6nhWaaS1OS1qF/z7diK15NZ7fyGgWOXjg7CifCvMiJWfnbPHdKO4gYnQkAs9tSf3s8wGr8ESP5PC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:23:51.3368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c57bd85-ff3d-4ca1-c442-08df43d4175b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5768
X-purgate-ID: tlsNG-ebf023/1794828358-C3CC7B50-89BA5630/0/0
X-purgate-type: clean
X-purgate-size: 1049
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 14-Nov-26 03:00, Stefano Stabellini wrote:
> domain_vpl011_init() sets vpl011->virq before vgic_reserve_virq() claims
> it, and both a refused reservation and a failed
> alloc_unbound_xen_event_channel() take the out1 error path into
> domain_vpl011_deinit(), which frees vpl011->virq. That clears the
> allocation bit of an interrupt the vPL011 never reserved, so an
> interrupt held by another user can be handed out a second time.
Who is the other user here? The virq is either GUEST_VPL011_SPI or the
Xen UART IRQ. libxl rejects a passthrough IRQ that matches the vpl011
SPI, dom0less reserves the vpl011 virq before passthrough and panics
on failure, and the Xen UART cannot be assigned. AFAICT there is no issue as of
today and this should be explained in the commit msg.

> 
> Record the virq only after the reservation succeeds.
> 
> Fixes: 08bbc1c02d38 ("xen/arm: vpl011: Fix domain_vpl011_init error path")
The SHA is wrong - unknown revision. That said, I think this should be
1ee1e4b0d1ff instead.

~Michal


