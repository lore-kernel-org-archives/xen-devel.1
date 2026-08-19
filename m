Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47900C5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 07:08:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394690.1633360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwaPI-0003H0-Mg; Wed, 19 Aug 2026 07:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394690.1633360; Wed, 19 Aug 2026 07:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwaPI-0003Gt-Jc; Wed, 19 Aug 2026 07:08:16 +0000
Received: by outflank-mailman (input) for mailman id 1394690;
 Wed, 19 Aug 2026 07:08:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wwaPG-0003Gn-Lw
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 07:08:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwaPF-001Za4-Uy
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 09:08:14 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a855652-bab6-0a2a0a5309dd-0a2a4507ec34-10
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:08:13 +0200
Received: from [52.101.61.46]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a85565b-b4ea-0a2a45070019-34653d2ea953-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:08:13 +0200
Received: from BY3PR03CA0005.namprd03.prod.outlook.com (2603:10b6:a03:39a::10)
 by MN0PR12MB5764.namprd12.prod.outlook.com (2603:10b6:208:377::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 19 Aug
 2026 07:08:07 +0000
Received: from BY1PEPF000264B6.namprd02.prod.outlook.com
 (2603:10b6:a03:39a:cafe::60) by BY3PR03CA0005.outlook.office365.com
 (2603:10b6:a03:39a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Wed, 19
 Aug 2026 07:08:06 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264B6.mail.protection.outlook.com (10.167.242.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 19 Aug 2026 07:08:06 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 02:08:06 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 02:08:05 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Wed, 19 Aug 2026 02:08:04 -0500
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
 b=elOR1Uj83B26GzLVMdtUWGWN/ugPVEI5UWKlmF+YUBMyjh3OapYxIKFk/lqNYqyznAZZaCdUJSAAORC/HjL1fdTwugSCnnrbUM9o/msyQbtXznPLTu7ZT3hT0Gp57wPOb3ldOnJ2OMS/ZLsd2Flq1fas5Eyokm1PvhR1OkkjPVWX+2bu9RTcfJkLpg76HUtvMVaxMNcQJafDdjoEzVys8eagX5rxOpRO5Q9Zit91PXPeN353N0AhgNpx4JPDTKeoMETn1RUVbCPmOZ5QlkBUA/gDaUrY3c/x0spolymRFPtJhriVYWBE/NDWtT781I3upMaTl9s0Ou4B1wiCmMfPXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjHP+Ld4TbMYfxiyJZ88jQOO3OOQviB4Z7wac3Ji9tA=;
 b=aQElrLR8O1Mu5VQLbVdwEIGQPp/JEw9TIGAakJSzXFcioWcygJXJnFxIgDLrWSPSMR3BsFawn9Nu9ptVKCZWLduqgNNMOqjjd3ydOZzQrabVRtSahICJd5WY7JiIaXVUB3ttvkAkPwrUdlOtjakMcidLH7XBiZs53UYKK+v0EYcdwmxjHEG6IU2U9cZq3yA+ceLRwcKCU6MX7a/14OFRhENkcCvtz+udOngr8C9fIl4ouqVEM41HzitHShmXeXSrTbxb2sKAyL+puDyEHzxneoS1V9ajDi5IFl528dhPJzcudMJhuuxaSvii8JSnn6UMBFjkKvVcFrk6oO9KqFB+nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjHP+Ld4TbMYfxiyJZ88jQOO3OOQviB4Z7wac3Ji9tA=;
 b=Xg2DJ442SgeR3nlcu/1HLFbKrrrfO84+YnysT7ezPYZ/sF6SRgH7Y1qgUEUdk7TDNo56eTNKOSQlobxVQnQDTE5oRNOftzXgtnoRIko4pZmxlqQqr7glnq/zh2dlgrypVTVr3N09bTeKukznaALmmFkqTMpzl10iwLDfSuuO4lM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <e14eac36-cdba-4882-adb8-2849f3305de0@amd.com>
Date: Wed, 19 Aug 2026 09:08:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] xen/char: add classic i.MX UART driver
To: Wig Cheng <onlywig@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, John Ernberg <john.ernberg@actia.se>,
	Peng Fan <peng.fan@nxp.com>
References: <20260818153946.1635464-1-onlywig@gmail.com>
 <20260818153946.1635464-2-onlywig@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260818153946.1635464-2-onlywig@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B6:EE_|MN0PR12MB5764:EE_
X-MS-Office365-Filtering-Correlation-Id: 76a83cef-297c-4000-9263-08defdc09e75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|6133799003|11063799006|18002099003|22082099003|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Xq8Pzk0sBCxXHEiPyxHVN+6z6RBxbkGLb2fDC67dQ89O+kfFdeBVar4yjozt4/+PYEhjRxGSMPcg0z42suUL7VdLzm48JRlixjQtcAT3HZ7sBzSvjXJmn9cek1AfVIQXjun9F7TBpJOVCXD5t+zP6Zu6/3oIqOiR8oNxb483RrsK8y/vS4mvIEuDDweiH3Wll2lQQMEtnuhRXNFsGusmyvzcw90NZ9YxYe0OAwVN2bJ4wTrGjdyr7FB8YHG1jF/PGjDJaVQ+vvWNLqtmCWTl1wipObXEd5jQ/LsRKT76mJnpqDe1Xv8642zx81q5WIAjwaR/0IRMGPv79CJkPkOnji5mmDRyCiHyIaO4CD78IRxLtoBpVZJs7UlMKlAmSwXWXivlALejQJHnkZ/FeTwyYBGBuzXKtJaYvFqFlI4Gi/SWkjiYXQlOHBRe2GYEQSt9j03/+15RKTt3ApceGDcNCGbS7NoUofxfuNA0/5z3IwBErhcLK62vgU8aUDjOByaYB1Mpw3YL0GVhG669KUdW0rVJpabo7p5/TjTWWrQKIWZSiYUJ9WlDgsrT+MOnh277ihmwjWhOWihGcZLisVxLHJoK1DYkMtAFU2N/jzA9zio3c7zJ7tBh7I6XOf9vxeq+RFbpHA2zV2TEPvDNfDhkip41G2L0BGfRDJElW781j1nzvSY0tUdlVcxBvmjFPEzD0lE8iVM7LWVg9tVAi6UMJQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(6133799003)(11063799006)(18002099003)(22082099003)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vKIbCbDnhjBy6BKRBpTaGSuNsOyi/iTQX1F+MVpAeZmvmTYkoTpLHGqNKxcAr92LsPaR4azYQEOEd8fbHFxsF/m6BrL0q5H2wyJN9nJqeGJYvHV1hnHTv+kUqEu4yJqbK45QjjhvnFrX4bSt1PLKjNfLnbJr1wCab2T4LEoLvmQJ6yXIX4gLtQan+f8HcRu8U+hIkfXhje0pHsuIsqLcYJaF8Ri8AMeOZ1RBdmNylTCuDR/1IH2gyU3Axbp/6rawGtvuuwGMoMfj2mWmJPYyCKN0RgkoPQpmzZ7LdDx74K1SVPKvkvWCehMvTeiyjt9Jy6O6HjOxwhlZy4R5u/jD0DTJkYtO5FtdKBA+GGCPqL6lV8qz1YqFxXVUI8bqijefcQPnSHhjxWSpyLHiq2nayn8NMPzYEvG24KuwOyPrsiDg+/CFsS0TtoX3voBBo+sV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 07:08:06.6468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a83cef-297c-4000-9263-08defdc09e75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5764
X-purgate-ID: tlsNG-ef75cf/1787123293-36EDEAE4-D6334771/0/0
X-purgate-type: clean
X-purgate-size: 609



On 18-Aug-26 17:39, Wig Cheng wrote:
> Add a console driver for the classic i.MX UART IP ("fsl,imx6q-uart"
> compatible), used as the console UART on the i.MX8M family.  Baudrate
> and pin configuration are inherited from the bootloader; the driver
> only enables the transmitter/receiver and wires up the RX/TX
> interrupts, mirroring the existing imx-lpuart driver.
> 
> The i.MX8M family's UART IP differs from the LPUART used on
> i.MX8QM/8QXP, so a separate driver is needed.
> 
> Signed-off-by: Wig Cheng <onlywig@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


