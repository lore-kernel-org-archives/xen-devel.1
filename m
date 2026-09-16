Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B437BC982C3
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 14:39:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423248.1648476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6qnW-0004I3-Uh; Wed, 16 Sep 2026 14:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423248.1648476; Wed, 16 Sep 2026 14:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6qnW-0004Hw-RX; Wed, 16 Sep 2026 14:39:42 +0000
Received: by outflank-mailman (input) for mailman id 1423248;
 Wed, 16 Sep 2026 14:39:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x6qnV-0004Hm-Es
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 14:39:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6qnU-0005FY-RD
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 16:39:40 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aaaaa23-e002-0a2a0a5209dd-0a2a450492cc-16
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 16:39:40 +0200
Received: from [40.107.200.56]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aaaaa29-b57f-0a2a45040019-286bc83828e0-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 16:39:40 +0200
Received: from SN7PR04CA0120.namprd04.prod.outlook.com (2603:10b6:806:122::35)
 by PH0PR12MB5632.namprd12.prod.outlook.com (2603:10b6:510:14c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 16 Sep
 2026 14:39:30 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:806:122:cafe::5f) by SN7PR04CA0120.outlook.office365.com
 (2603:10b6:806:122::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 14:39:30 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 14:39:30 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 09:39:28 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 09:39:27 -0500
Received: from [10.59.21.158] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 16 Sep 2026 09:39:23 -0500
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
 b=QrPUxMuXi/RjFfxc/22QD4eaL+xRixWb1SILwOaaUi0H5gNeZM1Tk5Lk5kJNzlRSxRQ5bKWyhJNcZsKXKLfAn7se4D8LGfsKgmkK6lyNLXrhZe4mDS9clqxMOKUOpRw0rReX7Y5b7wQ/sMflKmlUA0l2PDQj2/ytFHmFEjPUMEhl9PIQhLQeQFwOCXui2NDdWSzbZ7J7TitXtVkE/JbDqsCr2Pt59sRiOqyxWNo3ADz1Bg7EXmJ8oW0xEYj3odLBeuEboR/C1LzLZUtMog2GXHjfojjHgQ00QufAnFexqU4J2xC9O/Jg7j8UC8QJTl7k/pINaW95uETrwLuscADR3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pz4q6f7GLl8hC/23nld3wkkhJVaSL+69OiDtd5ESiow=;
 b=SVclmbPCVlA6BAI5yNHeHqhZhX1XQ0cL02g9uUDwmWokI10VZN1fPB5lCXBPBg2iyUXNPxYnq/WPociY8d/G5aUZP9CGgtS8Y7w3BEhaaXI4bEi3LN/vz2zEZGTwCumZf2u1qGLT/n8VVmpBgKZfLbSXCTK6RLwtnkoSSqFnK3HIvu09JbP67QmjYzd9HbxgBCd5GjSa4FNbdU84pCZs0bwe5rEBoevJHcdGLghtNfFqQ170/Z2ipTNBwTBrq9+SIxvLbhWH8DzE4TxuezU1urSLxPQnLprU+bvgcEQUGybqCzmgh2mDDRmG9cYmVD4OkpiZC75sq+nSboxYB7ID8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pz4q6f7GLl8hC/23nld3wkkhJVaSL+69OiDtd5ESiow=;
 b=muPuCqJ/mmvU9QPVtfnn2Iu2n6gvlPNG25eE/O0u+YhKQyjxqkMyX/5/t8LoxcduzBHb+ZIiHz+6ChEOx8F/apR7RlD1SGvs6ZhHJHUzWvw1/QYI3mC1NRV1zc7Hvp+ynu7Y+I+5me3vNvAJYoOgxuFiD592O/I1ELDNlGJtr8c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <c84edf21-e7e6-4ab7-b5ad-d4c677a659df@amd.com>
Date: Wed, 16 Sep 2026 16:39:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] xen: make config argument const
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
References: <1789130592.8631fc262581453bbf619ec5b2062170.1a0907e5286000c4f3@vates.tech>
 <1789130864.8631fc262581453bbf619ec5b2062170.1a0908277f6000c4f3@vates.tech>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1789130864.8631fc262581453bbf619ec5b2062170.1a0908277f6000c4f3@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|PH0PR12MB5632:EE_
X-MS-Office365-Filtering-Correlation-Id: 18e88d60-fd5f-4188-5c3a-08df140050fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|23010399003|376014|82310400026|1800799024|4143699003|11063799006|10067099003|18002099003|22082099003|6133799003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	coU8w49d31fU4I2Xt+Ca3R0OZHAf4WGlLc5eR1lY4jm8Kzd+Azj7vHyU3i4+6oMEKnewkBGptDnXB0Y6R/0jfjpZhHdodzvlzu6A6MbQFOxcc/yX3hB6Ivb+JapcFD+kmRwhLFlxVXuuqM5BJV4ZNBU87jiqwvW9nwGVGAjjoo1a4QbjLu5GCUL0m8KfrnLz2wokNmDnvoIqPfBrQUQCAcivITgfHXDKmrJ3brM093KKbaGZvwK9DvD5YJxLuo6GobFhsHGAAq8kp8HVszngtjfyCIIbm6g/M0yaniHeFTQi8mEmdGTu5hSm5eqwbtPgrpUy/39cM519UEcw/l+OxUQgjew+NgdgrV5zR21PIATPMo4mbVx2tHBkFQUOgWTMnq7T+n11Rtl/J5txsjIaegWlWRaMZeX1WsxShCCnAARiN2M1Sf1j5u63wEPs3qKmGGMXp5wvuujBcuAmDnBCqiiC5XPYjgHknnhuHQF9QUiUN6zENOM0sm59ts87F/0fCRdzNqjGHGDmPTdkO0Yxvjf9OIgYfRrIc8nSfZtm6pxZabtnfa6nKSn5iuD6IYAYkilO/PAMi/2rEFA6zd/+6sVFL7KhymN0877D34wfXbYgXeV/MyG4XTR4Ypg2gAuJhfB/LXYGY5oB6oNz/dgJzbPHmG3obLniRgGwIms0TY5njfmfBD9hTNHhHT51mPXCYqNsuomxn5pb++raa6q0HA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ium0/KCgOS62Ph/Lb8Z4Ucsebp/Hm+Oe0KZdz8AhdrD/6Hb+8X2xbjcpixezlzqiYhcYOUgE6dyagKfQYJogpwm1wAW3fcDYqPx0FCNmqGGbFARy13F/F/kISjAO/cU1W+8lOPuxTyTh3X3FMnLGNaAl8wG1prxNsMGXJbzToSr7/mG5TPyPAAuZD5GyiYDT/pJEXNfplYusA89csD5EKvy480Dt15kyzs0+tblyX6YJNRkr5xijiLRn5kajRfS6xFeK39qga4iAa9yfFyX2kEAiS7eSO2dAkqgl6fTRJIaTXJ3raj2+7mXEtjmRe2zv2fB6U1LoNsO3/kst5jSIbQeYj2pco0xoWYowmJwfr6SPQiJWv8lN97GeIZe778hw4EUUQ3fIdbIUpw2syyZQrjUTqoKqwQ4ahO5mnSWNLqIwQI+61176ejcM1ERrdDOh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 14:39:30.0613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e88d60-fd5f-4188-5c3a-08df140050fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5632
X-purgate-ID: tlsNG-ebf023/1789569580-530CDB50-3B5DF09F/0/0
X-purgate-type: clean
X-purgate-size: 1303



On 11-Sep-26 14:47, Julian Vetter wrote:
> arch_sanitise_domain_config() validates the configuration requested by
> the toolstack, and should not fill anything in. The config struct passed
> to createdomain is supposed to be pure input. ARM used to abuse this
> (GIC_NATIVE resolution, now removed) to smuggle output back to the
> toolstack. Making the parameter const stops that type of abuse from
> happening on any architecture.
> 
> The x86 implementation turned out to have its own instance of the same
> issue. It set XEN_DOMCTL_CDF_oos_off into config->flags for non-HVM
> guests. Since The sanitisation runs before the function domain_create()
> copies config->flags into d->options, this relied on mutating the
> toolstack's config to take effect. Move the default onto d->options
> directly in arch_domain_create() (which runs after d->options is
> populated), where all the remaining domain options are resolved. This
> has the same effect and no mutation of the input config is required.
> 
> ARM, PPC and RISC-V need no equivalent change, Their implementations
> were already read-only.
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> Reviewed-by: Jan Beulich <jbeulich@suse.com> # x86
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


