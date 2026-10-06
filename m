Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA22CA5FFC
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 11:13:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441411.1659010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE36u-0004ZO-BZ; Tue, 06 Oct 2026 11:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441411.1659010; Tue, 06 Oct 2026 11:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE36u-0004ZH-8v; Tue, 06 Oct 2026 11:13:28 +0000
Received: by outflank-mailman (input) for mailman id 1441411;
 Tue, 06 Oct 2026 11:13:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xE36s-0004ZB-Jk
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 11:13:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE36r-005lHH-DT
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 13:13:25 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac4d7d4-8faa-0a2a0a5109dd-0a2a45068f3c-4
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 13:13:25 +0200
Received: from [52.101.48.41]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac4d7d3-195a-0a2a45060019-34653029ce92-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 13:13:24 +0200
Received: from BN0PR04CA0167.namprd04.prod.outlook.com (2603:10b6:408:eb::22)
 by CH3PR12MB9195.namprd12.prod.outlook.com (2603:10b6:610:1a3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Tue, 6 Oct
 2026 11:13:18 +0000
Received: from BL6PEPF0006C3DE.namprd02.prod.outlook.com
 (2603:10b6:408:eb:cafe::46) by BN0PR04CA0167.outlook.office365.com
 (2603:10b6:408:eb::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.21 via Frontend Transport; Tue, 6
 Oct 2026 11:13:18 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0006C3DE.mail.protection.outlook.com (10.167.249.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Tue, 6 Oct 2026 11:13:18 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 6 Oct
 2026 06:13:16 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 6 Oct
 2026 06:13:16 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 6 Oct 2026 06:13:13 -0500
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
 b=AMbRYF7qoG90OmTvTIZXaSqWuRTaP/UGTMzFdWP+58wMH2G3JtEcxUKICbnu8qf4qSQNtcpq25SsMLtzfB3rvoStU78jYnBGdei2KeFc0w0PnA/6U86icY+ai7/TsAFoT1pDmw+BMpQ7UB5IetErANKXC5DbCoiHxvDmzUGm+eNEQtOeTGJ7m/+DCeCPeNP1zrIqSx2TwMJjYrDYNcum7KJXGN2OT/F7PFF20g9lmiy2LibevzbInqZE1n3KDPdASpUDkX9GsZMYlNvIaono3gSlBAsRIffA5Ybqp/co4zFKOt7/J1DewEp18wMqrGehjdMqDsFzVe7cV4mOh2neuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKmu5PKnjodKGkcEl00POImHpnu655yNZv7H13pskz4=;
 b=VxFWeBQxCvMRd+K4y4xL5mJOlhX4GhURbyzzcva/74I8QLCjpL++MJluD9MhHxWyu3ubSC2d2AwpERwlp1yyJ7mrW6wCk6Lj2oowkwrORC33b9AAYWYHeRbYoreDTf9THTirhB/vu3rHAbb31nrdp75SpNM3voI/tmue0ck4YonLBt63zlFLGNRCvUyMToGjP16U8kDyTzQDybUCQV/hai3RYZNQjT950zUMrFqP3hSpdbhB5fmHyV0fdZEkb6uKsmTz18JO4NXmvUfEdD7y/HqMh8RU9m/W76LOqzFcqSNmav12fAzyd8ymojwtNgmGAduRBsoGPzdPoHUt8O8VMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKmu5PKnjodKGkcEl00POImHpnu655yNZv7H13pskz4=;
 b=Nh/IowYV2CyOvzV/vJ4ub5QkReza7QhQKCKcjWeQ8OEMPOgcUHOBVQOAQCqUTZvF1MSg2zRrB1TItCJlFdcRgjCZDFNYQ/g9hoxIfF0SwaNfVbh2z0jGEhMw4yR4NC5CQxPvOKwriu82tRMa1Yn4vFABLowiI4CNXYwiN/N1m/w=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <6f02b2d3-5a6d-4fa6-b74f-9d32cf1ec70d@amd.com>
Date: Tue, 6 Oct 2026 13:13:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] xen/arm: remove XEN_DOMCTL_CONFIG_GIC_NATIVE from
 the ABI
To: Julian Vetter <julian.vetter@vates.tech>, <xen-devel@lists.xenproject.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, Andrii Sultanov
	<andriy.sultanov@vates.tech>, Guillaume Thouvenin
	<guillaume.thouvenin@vates.tech>, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Teddy Astie
	<teddy.astie@vates.tech>
References: <1790597845.8631fc262581453bbf619ec5b2062170.1a0e7f2cff3000b504@vates.tech>
 <1790598010.8631fc262581453bbf619ec5b2062170.1a0e7f5564e000b504@vates.tech>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1790598010.8631fc262581453bbf619ec5b2062170.1a0e7f5564e000b504@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0006C3DE:EE_|CH3PR12MB9195:EE_
X-MS-Office365-Filtering-Correlation-Id: eb279a40-3b43-4b43-b5eb-08df239ad30f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|7416014|376014|10067099003|56012099006|4143699003|11063799006|5023799004|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qIQotguJGshOQRKG109IQhET/3a8pylhGe9ZRJDTORT4/2VmYX+T0hchKmjr/9T4HgMMStTWEFhAG6/iV0aDabAi8LeS6TVCx8MWb4gfZ4VnKZ8gVwR9SYyTAQ544YLm80NSle+qWNGMWfxd8//uspK1NCQT/UxJeIDtqf4/64ytjp/tuR/USqSpN8gosSWFBEnvUnnyk/Z3PgBSJlkfVBcl0nSswe/QRMvMX+5K1np1YkHjvzwTjl7fENEzxrcQZP3SWQlqNuED2N7ghyTvdVHlZFkEEnK/0wve+E1v00sy8LmlLQc3/TBiUXJ9tz1mKJ9kgVJIri1rMgdsA7he/1teqc6Fa3z4apSzYw62qRKgFn0uggmZfAZdwDAvdWektnEihtQZIAzc+ARuQJWkKPNaVR7rv7j3xqLn/vvyy7obMWCrUlX8U6HkqJwSJbtd0Yw4LY8oA/R724AyDyu2lucaQknjqp/D5Wr3kwtE8UAN17LOgsiH6EPkfoBqvOJ4sE9B9Dljxpq+6vF8j/gcnAKEafSpCTxhuUdIrw/r2WR9C2jH958l+fPCeW5B3mNmkFDJDrAPDYXb4c+nVqH9my2IOAqhmXt4QI3HVaFJzZY3O9A29jzj7s/PGhFiL81hH/qfJ7sndNf84DafIgyw5sVzjpzX8hPQY6NY+O9c8u93hRc4PjQ/u/XNWpRjiCAW7LWv22EZvYkz+m7kGxrn3g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(7416014)(376014)(10067099003)(56012099006)(4143699003)(11063799006)(5023799004)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nJrEie3cq464RH64NicsqCzE6b8e+YqSaP1ZyEOQSfSp+dUoABOtiKhHpXu3mTNjrD8Y90nPfhUzuNMf2LKDFj+fLPkhe9Xf1PE8MvFFGXqNWP/0fG32t8nqOSWIDXG0JJY8rQsILBnaXs3KIpvLJ8kV71Wbo3yZouLVdu3gQgxEYK9eV4rJlLiIlemVAZNMMqNVFEuQ9/18iF0HjVOqsObKQXYsZhvaGYd4kZFQA12+qwHva3kEQpFFBjB4xsmrPrBuGWcwfFI7it5Q7mivscASaTLpw/aEjs66lJ8nYoYuYTwkCRirYgvjbLoMwhh7SIjpI/8nEuUcI4FrY50//0qxj01mjtow+Y1HooAzgAuI73qY7Rh+TIoJHqFu7MAvxyXSzlb85+YUzOsVXBrd63q4NoJLY6bX02UlX2cXLL6OkjzlJWTh1GAyt+Gvnp56
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:13:18.2424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb279a40-3b43-4b43-b5eb-08df239ad30f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0006C3DE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9195
X-purgate-ID: tlsNG-16d1c6/1791285205-F460277B-348369A8/0/0
X-purgate-type: clean
X-purgate-size: 1496



On 28-Sep-26 14:19, Julian Vetter wrote:
> Now that the toolstack always resolves a concrete GIC_V2 or GIC_V3
> before calling createdomain, nothing on the Xen side needs to resolve
> GIC_NATIVE either:
> 
>  * A new gic_domctl_hw_version() helper returns the
>    XEN_DOMCTL_CONFIG_GIC_* value matching the host's gic_hw_version().
>  * arch_sanitise_domain_config() uses it to validate the requested
>    version against the hardware, rather than resolving GIC_NATIVE and
>    writing the result back into config->arch.gic_version. A guest must
>    use the host's GIC version, except that a GICv3 host with the GICv2
>    compatibility mode enabled may also run GICv2 guests. This is the
>    same information that XEN_SYSCTL_physinfo reports to the toolstack.
>  * create_dom0() and arch_parse_dom0less_node(), which both always want
>    a vGIC that exactly matches the hardware, use the same helper instead
>    of GIC_NATIVE.
> 
> With nothing left resolving or relying on it, drop
> XEN_DOMCTL_CONFIG_GIC_NATIVE from the public ABI. Every caller must now
> request a concrete GIC_V2 or GIC_V3.
> 
> This is an incompatible change for any toolstack still passing 0
> (formerly GIC_NATIVE) expecting Xen to auto-select a version. Add a
> CHANGELOG.md entry, noting that available GIC versions can be queried
> via XEN_SYSCTL_physinfo.
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


