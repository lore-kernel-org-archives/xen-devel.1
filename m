Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FA8C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 12:19:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392892.1631855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvwJV-0007jU-1D; Mon, 17 Aug 2026 12:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392892.1631855; Mon, 17 Aug 2026 12:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvwJU-0007jN-Ul; Mon, 17 Aug 2026 12:19:36 +0000
Received: by outflank-mailman (input) for mailman id 1392892;
 Mon, 17 Aug 2026 12:19:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wvwJT-0007jH-On
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 12:19:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvwJS-00GnZq-QB
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 14:19:34 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a82fc54-e002-0a2a0a5209dd-0a2a4504c778-4
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 14:19:34 +0200
Received: from [52.101.43.21]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a82fc54-b57f-0a2a45040019-34652b157a11-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 14:19:34 +0200
Received: from BN9PR03CA0378.namprd03.prod.outlook.com (2603:10b6:408:f7::23)
 by CY8PR12MB8194.namprd12.prod.outlook.com (2603:10b6:930:76::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 12:19:25 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:408:f7:cafe::58) by BN9PR03CA0378.outlook.office365.com
 (2603:10b6:408:f7::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 12:19:24 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Mon, 17 Aug 2026 12:19:24 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 17 Aug
 2026 07:19:24 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 17 Aug 2026 07:19:21 -0500
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
 b=whkLmkd0PAf58XYwjI8SftWaaMEgfcWC+yqqqlVpcz3gF/WJpXLz+fxYeUe54iFYrxGrag1pAsotWGdJPMUOftRmG9V6MzCDm0k+36p/wqhEVqZHIrJDzjX+E3DMMLgBdwC5U0iEUVvRdp6yGACMzOnurj+C1yzCt6pJP3q/FSoN+NWYJ6N45pZo3tVkkd56k1/+I930514AIGmWF9mDCW3i8teY0B8aid3naIPgAzbgAvPKCVdbDqt586zo2ShqzrEhokFBuexMWV5vgkpA6M7vic8waQlH3MNRz9Bl0uGSN1BRVAoR0mclMywJJDRKABASRehbsRUsgaQJCN3J8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xe80fhEQSwjndlQz7q67yiDsbz9eJTHhOn+Pkvtb0/8=;
 b=rLI8byiECUhBgzKtOMH6dP8C8oHf0sgvUAyFQZ9dfvSlp3wSSAyRmb30STZ0P0vTKHCmBu/a2zzhgly6xk3pfMZ3uDcdvbHTGrGO74HfrUm2eAkyfdvG9Iew3HdvadbvGlvQzsnEKQiSlyMBTCF02rkiaAKlupt6u4VMzwajCPSSe8Kx0qp+sMDcQko7DJQsUb4iye51+4XK5UlWy76nETmDr+J0kwiKBFm5KHFJPnY8uoxzSE91CSYmCJ8tFpLsIPDsH5Joa8Jn1I0ntxvwvcy5e5+TLYnSNkMEtA3lnWdxaPD695r6yi3V+a/X6QIk55WaCGVirI+nxp+1rEKvSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xe80fhEQSwjndlQz7q67yiDsbz9eJTHhOn+Pkvtb0/8=;
 b=mmXJ5kVZv2fiBP/iRxbwEd7WhTqHw4ZZqG2SJ+AYoqZZXcwhvA4zVUk0vJJojHTOnDLikFtWRT77jgcfiQF9/zVc6aGWJuaW96G5EBy2txh1rXNsB1Lh4h06rurEeYABfQgbE8K5dhozuLf0G9QdxZAP1xfqzR564TumaMLV/tc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <e052ac27-1ea9-4f30-9e6b-3dc879708262@amd.com>
Date: Mon, 17 Aug 2026 14:19:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] xen/arm: report proper GIC version via
 XEN_DOMCTL_getdomaininfo
To: Julian Vetter <julian.vetter@vates.tech>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>, Guillaume Thouvenin
	<guillaume.thouvenin@vates.tech>, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, Teddy Astie <teddy.astie@vates.tech>
References: <1784210820.8631fc262581453bbf619ec5b2062170.19f6b408bba000edb5@vates.tech>
 <1784211104.8631fc262581453bbf619ec5b2062170.19f6b44e2b5000edb5@vates.tech>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1784211104.8631fc262581453bbf619ec5b2062170.19f6b44e2b5000edb5@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|CY8PR12MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: 98223a4b-abce-462b-7fa6-08defc59c693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|82310400026|1800799024|6133799003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OGmrqXPFbYhKsF1iLj1aRmFAtO5UtGF/xa/9PH7yl/E+sRVBAvoTy9/FBCMKhgFDoip8B70P3oyn1FvECi1yoPSmCXJ+rytwvP6ZCU8Q7KbHBCslu2xanHjMI8nLnW5Gwdl3MwVZxi6MPBuUWudnWBZlnAz6RJNAOQ+hpBec5ZFREhtWYHGhMzokR+svs5QxWHdyk0JK6APOosFxcg7CiIk0CSA2G6qZ1gwJHrmUupgvGJaDoNOY6L7GTqEl1jzhXtbTGE378Be7w8xTNh/eFR5jtrIVTtkPpsQ1GqMdJ5M3fdhrNp9/D0X79+ITGQq6EDJ675tFCqKR7v15QiBC2cCxOJ5EAIEVaMPy1N5ak1QfvC/B0lkqZO/THNqtST/oACG3MUkvcgXz9aUzCFq2oQ3vBvFhK9wKK9/W1oth01PEdZsTib3LfkJ2AHRP5g8vydjKfiDMJsIfdl8qqjfJ0FKzNQGAxwlk0b/suZz/Pixnc+doRtwdjBPzSqkWVPuHSqvn87TGobK2mb2z+MpiQQveFIrXFOlssQNoT0k93Kv9uEeQuRBBSBBQjHPia/IjUgP8cpXVEFw/RmVVXSS9MFVwg9l3kS27D9J7j1LgOtVPu2GjUAwex83VQJluEzLkjxBnn+tF85/FGfNdzY3/Kf3kwf5JoehSA7Ar2IlJKfFVFMMHX6bmE8c7238GuqlKr5bgINtfUBwXgRn0KosRKA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(82310400026)(1800799024)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	24j0TbTIb6RrmtiZDcfJJQmlojVLWm69gAyBqKmPwX8q6chCnzvIa/ngZtPaF3+EV7BUBL/ZKl7gGKzaR5GrbhkPQ/GGQu24k9z/9LAqRUCILAxDOdsugOGYwWGvTEXaGxprWwAso2778IYRAMZjmWa1vMff/0GSujCWHz3+rSO/Cb9gJvf89ngc/IYTlXYgr/VtaLqnqFpGL7LKmAXPfzhNNR/K8TRTBx56UPVkdTEf9PZjm/e+MaFbaMkhx2WwD8bnqI7hCVkLb2HMk0lOfdL4whmdgbwIXGghFB/9V2mK4e+hlUT0rM2IRj2Wrlz0NKphRhD1XzJBNhY/+rvniAJY8BPj52uddjKplxbflNVoaUaxNGZ3uxXQWhtpcIJWwC4evlPioTXwX21aUx6CVIVbV/yKYYTGGETbaVsakAE/OhgTs9AbYzixdT9OPW/O
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 12:19:24.6600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98223a4b-abce-462b-7fa6-08defc59c693
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8194
X-purgate-ID: tlsNG-ebf023/1786969174-C0EDEB50-4A0F3524/0/0
X-purgate-type: clean
X-purgate-size: 1168



On 16-Jul-26 16:11, Julian Vetter wrote:
> When creating a domain on ARM, and passing XEN_DOMCTL_CONFIG_GIC_NATIVE
> for the gic_version field in the struct xen_arch_domainconfig,
> arch_sanitise_domain_config() resolves this to the approrpiate GIC_V2 or
> GIC_V3 version the domain actually has, based on the host's
> gic_hw_version(). That value is stored in the domain as
> d->arch.vgic.version, but can't be queried through any other domctl
> later. Toolstacks that create and build a domain in the same call
> already have this info from the createdomain reply and never need to ask
> again.
> 
> Toolstacks that create a domain and build it later from a separate
> process do need to ask again. But, the ARM implementation only fills in
> info->flags and info->gpaddr_bits. info->arch_config is left zeroed, so
> XEN_DOMCTL_getdomaininfo always reports gic_version as
> XEN_DOMCTL_CONFIG_GIC_NATIVE (0) regardless of what was actually
> configured earlier.
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


