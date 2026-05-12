Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF07CD4F24
	for <xen-devel@archiver.kernel.org>; Tue, 12 May 2026 15:07:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1306929.1578656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMohL-0003VX-Ke; Tue, 12 May 2026 15:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306929.1578656; Tue, 12 May 2026 15:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMohL-0003VQ-Ho; Tue, 12 May 2026 15:07:03 +0000
Received: by outflank-mailman (input) for mailman id 1306929;
 Tue, 12 May 2026 15:07:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wMohK-0003VK-KI
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 15:07:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMohJ-00HBBO-TS
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:07:02 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a034204-e002-0a2a0a5209dd-0a2a4501d81e-28
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:07:01 +0200
Received: from [52.101.61.29]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a034213-c1f2-0a2a45010019-34653d1db8e7-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:07:01 +0200
Received: from SJ0PR13CA0111.namprd13.prod.outlook.com (2603:10b6:a03:2c5::26)
 by PH8PR12MB7231.namprd12.prod.outlook.com (2603:10b6:510:225::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 12 May
 2026 15:06:51 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::1e) by SJ0PR13CA0111.outlook.office365.com
 (2603:10b6:a03:2c5::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.17 via Frontend Transport; Tue, 12
 May 2026 15:06:50 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 15:06:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Tue, 12 May
 2026 10:06:50 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 May
 2026 10:06:49 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 12 May 2026 10:06:48 -0500
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
 b=MEblssxI7t6FxNaMkviTM0rZ7Sl6tlplHP2iO+bVOXXkvBJEgo+b2J0rIH6fY49ti0L9Sy14VqgnalbhdypBy4XXpIUHf17Hd3syRG9lXJd+54uBEsqsZ4lbcLEnBKfMyXF3MCdpsveNpgZ3a19YqD7NABBfq5/EP86tCwiNRA2nKawOwJjwKl2pK+dQyEyyuIgTMYAVI62EoxJDOil90UjX9ZdNcbmUma524xpWJKaTkL0/Sxwm1yvDaZSMfwgskT//RysofqRSd6zXCJbuK0w4WToABpu8gdXWMmbgVDw2RX1YmuNpq3Wm6J7KMhuaZvch5rbEwXuGIDtvEKMF5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVpMux7L250Is6nPBwS3JGR0AaQu25tsuA+5psG4O6E=;
 b=c3+cc5vsiJ0Bxq4ZbpBsZLYcQssspWETv19liVrzMtD3fnNk5x+IWwrK/x8jB3XJmOMqUfuSotEY77u6i0XdX7FT+tMK53BEWoclHyNj+pLQr0viv3/z1hv227cWUTNGRY8vKbV2+eCX7vjQZuGByGKfJYEDs7dUvvZu05SZOle1hiBXH+eXL5/oPIKREKINOq0p+8ptYkopat2sOJhfpWQUm9vQbphToQ4stZPwgG/RcAVnzn25e58gn5NQCjX015fNIP+rd1FlSXrj7JEIXDVFJ23fJ9UJy1RjsfW66ohdIZSQyqfBYzBYYvymM2Jmrb/sizTDbTyizCYyv2WUug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVpMux7L250Is6nPBwS3JGR0AaQu25tsuA+5psG4O6E=;
 b=FiTVoKATsTZLA7tsYCwxMUncpKU/OijpnSZ9Wd/PkBb+0+K4e8p0qHNByJen2Rh+AghmGfCliNjtcPDVFkoQBNX4c36REwCMdZcj+teYO4bdFKPrFEMd0kb0NxwwRJL63YLzwYN4IsBogXElyxhZlTsqIVceGOouRr7fZjbZJBY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <c3589eab-da92-4199-b760-ce2eba899fb3@amd.com>
Date: Tue, 12 May 2026 17:06:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] CI: Switch qemu-arm* jobs to using the distro
 provided QEMU
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Stefano Stabellini
	<sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20260508212907.1643761-1-andrew.cooper3@citrix.com>
 <20260508212907.1643761-6-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260508212907.1643761-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|PH8PR12MB7231:EE_
X-MS-Office365-Filtering-Correlation-Id: c586d971-af51-468a-e442-08deb038184e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	C9rCp3K1AeM0yp/9r/qCkDJNTB7+OnI4luGdrW27x8vJwRJW/0MhFYVehTTsTsgLKYNHqMIe71F3U6C+wgRKtxjNCc1PwUNJIQ+8YRLWdil677DDBQlXvbHLDFOOH1jZa90pE2tcWVeXLBajJJsmyN70APaeQWVEXG5f3xzaKY/FzPAUXw2EX7MYKtPiS4KUp0bI4chWUDaEpaZZKXhDNDOcyi/hwkyvZu0pkEljWvFWboRUIHTzBYRZXgT0sU2EB4Hu1P8qn8pthx7DqqZf6GpmB4NI+PVbL/WOVyNNj3EjD6IpKFN+lhp4olFIcykvMzTaA+YFpCALv3zvp6/Q2QKc8fjuLsoMWbaPrj0AKBqjhRheRik/jxuxeGgHEvx8qXF2dcigCaUDfwz/arApkNni7TuG815YKJetqD2/y0zFbbDg/Ujqf7/JtYQeA0cTE7vdy95fjgrBRF3waXfsBiMf39uI08VuWXHijLyG+WXlm9ltg9N4KAOhcG00fdvbEiDWA7n7cw6nZTkKP+3KLGPvtz8ltzZZWN/xu4W1QOzI64iyGaGogV/23RGO+JmMQWIEFjMgLVC3Nyd08T1HD46kDJxRD/+0JQ9GXyjWLm9TbxyBYf3CAPX/VTDPCLI1UJRd5QZ3CTCkL9yhKpwzFXDnEZdfevAAPqFwd8YdRUSu3GbQRKDd1T4lSDJ7GgyJc0A3a9E3DCMuaEhsV1uZmNHIH412W3mDsKjqYuoVkkM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EJi8tj4wtlP9jl+hP3wK2rzdJtmjlLl1ki0cQCzvRPip7xcLWB5zsE1AOWC6PDYDCVCio87RQ6ngAvphN4wmsLroDpcDOQF/LRBjwrn5yLHW4iuapdkSunoRH9gcBJZ058ZV7vmjfVTPbRamhRSLq9OAVxynZLunckADlyp+p3UZkwlS7FtpfMNyo5yIXNtZsWP59vKFyRqL6qPuaoKUu6nEj73cjxzYwRtjHoTT6KQOYuil0uRe43V1cWblBUFmvNlDqQKI41DUP7e/98neSXsiLm8JX5uq+gUnt7gEdV4bHdkzBGIbWDkleNP36YgZz3j6qSVDCl93UmUppmi3tm7/6K52opcT26qXEiQks7jNdZmi64GVPgHBMLyQwYZyr50Xfb18nF3bsc6bhJBBIZMc94BIyCqO/o9pxJmyESq8coABfTs5nUyfFwdtO2ci
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 15:06:50.4866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c586d971-af51-468a-e442-08deb038184e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7231
X-purgate-ID: tlsNG-d62444/1778598421-AD9A9FF4-C741064B/0/0
X-purgate-type: clean
X-purgate-size: 349



On 08-May-26 23:29, Andrew Cooper wrote:
> This removes qemu-system-aarch64-6.0.0-*-export and fixes the outstanding
> TODOs about efi-virtio.rom, now that the QEMU in use has it's /usr/share/
> properly packaged.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


