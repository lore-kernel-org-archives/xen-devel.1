Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443DAC44529
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 15:13:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367872.1617532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmC9T-0003xK-CZ; Tue, 21 Jul 2026 15:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367872.1617532; Tue, 21 Jul 2026 15:12:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmC9T-0003xD-9L; Tue, 21 Jul 2026 15:12:59 +0000
Received: by outflank-mailman (input) for mailman id 1367872;
 Tue, 21 Jul 2026 15:12:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wmC9R-0003x7-8X
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 15:12:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmC9Q-00CzvD-I1
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 17:12:56 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a5f8c6a-e002-0a2a0a5209dd-0a2a4505922e-44
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 17:12:56 +0200
Received: from [52.101.62.58]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a5f8c74-4cb1-0a2a45050019-34653e3a2f97-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 17:12:55 +0200
Received: from CH0PR03CA0045.namprd03.prod.outlook.com (2603:10b6:610:b3::20)
 by IA0PPFDDA81179A.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::be9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 15:12:48 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::9e) by CH0PR03CA0045.outlook.office365.com
 (2603:10b6:610:b3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 15:12:47 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 15:12:47 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 21 Jul
 2026 10:12:47 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 21 Jul 2026 10:12:45 -0500
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
 b=V67yXsiMLtxZvM4GspuaZ+eMqfgqbxT5aHorGJQEsDINfHPkRj4DEHEhpR7evMQGrnQ74b6BLG2Od5sMHSgUvr2dZnr8yFJEJnE+OzDOpHEh/tX2D3vVCmjB1Ksi3LDR88MCJ5uBRdK+hWwsIrW+zdwl8xX6X+I+S7S8fjOwm6ycij4LQOlSrl3K742H9/L5u128xhNrA2lLypa8UAYwLywL6YrmsD1VKQ+DQRBJMt83iKspWSIpHXWa2xqv0WQ9caOYPJzmRyoIrmo6ATSZuNaAXofRqVEiYyz457pNDycgweHuLzM7MxZwI/C6lT44DYbMBUKE6h63sz4vji7u7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYfyL0TRa+sLz5IgV3XFwlR2kxbsGJdCfgcvdujlGuA=;
 b=vvcehsJk9MzgSJ0EZxhTbb/mF7wXnvEldb9qFo5cFkl0EH8Pyrbfv6aY2x2ABZH/c4t1GIsV3olwdKCVuoyQjoMedtGbUxaEywKboZflawD/8ge49QIc3bxGgfHvAHUlG+ypRDjrYlx8e5+uzzy0AiAN6PZ0hvVRXQ/cfdxGDmuRSLrt104gaNEJJuGyZiZrtxR3D5tfYG1e1kz1W5s7F7tq0qgkZcvM1f8KY7+NEngXy1mwDBtW2PmxyKzizB9htoN+CbwljHWM4LolQ+5IfHFpOjXNLKBlluUeHhO6DXInqAAJWbLJNmMfiQerVohO1LlnP6RZxtA4Sr+B1PEm/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYfyL0TRa+sLz5IgV3XFwlR2kxbsGJdCfgcvdujlGuA=;
 b=gZIpv0YFydyn8wEI5GIPxVe/LAnFtDIqxk+mIvGNlmGrFjkt8rsJCbpjLA7evvx4xZ4O9a/CLY1cQ5cpZUyYH1dIL2QzAmEXpUsnvjtobDn9pj/jHAfu5LzCHYb7w7SMa+lIMXKtSNU0NhMGzDVYmdTBuH0dxZiKalskWnbiTz8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <872e19e0-8622-4962-88a2-efcd64a20093@amd.com>
Date: Tue, 21 Jul 2026 17:12:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] non-x86: sync tidying logic at end of linking
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, Timothy Pearson
	<tpearson@raptorengineering.com>
References: <c9109e8c-e471-4f4c-b58b-fdfe3cb044d2@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <c9109e8c-e471-4f4c-b58b-fdfe3cb044d2@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|IA0PPFDDA81179A:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f84ed9-0044-441b-5e62-08dee73a860d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|1800799024|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	D2v70BedwwOhrH5NPPLK0W4Hqb0+nJ8GTtdOtJcTAtRGs5l3TOQTzwxzImLws2c6i9VYDpc0/2kbFYDm8AuMFU6vEkNY5ZZ5cMDi3ojlfb0PSNPVbRgXkTm6nodP7FlnYre2kx31EBMitqLbFHcEu0HsVK06mEEHu6RbnoDXWAXV39I7xYrhjtYz4wfkbC3SPPtDhBPVQ383ZCdkXTyvzt5HB9LLg1TegQpiSuq/4KD50ymax4hZxpQrqMAWsXtyyB68I78TmKSRUr5PurOAXtpmeuw37zH/sJPOKi4vR1aj86czaYyUibd7ekl/ZNY2p1nhq8mqWHRe8obh1JR9cgoy9wKBStTHyAN6+fJDWBTFIc6EExRyWlSN37Y2HGFmz0ULeS0fegY4f2y6l3G0W40RMcOYBLAJ3MwhuUQHOvYsfRDD0WfX78NIIeooSogxPV+qKl1nlmxQRBXjMLcD+akkToOQwcwp9LhB5az5vyLayNHcFS+Ci0oiK7CZYbcEr+EXVkLis55b6zHo1GoTubkgyGAUffBzBlb7QOBWQwO6t4UrmORxQOCO92hYqLW8cendRrTDw9x0g8XlqXMLkMhELP6ygSoiGiXJlfrWY0qTl8P8KIv+m44K+4x4M1LXVrjaq37RC5LmIvNbz8Az4Vq67JjwTvqoI0T+YBcrCPtRdR99wdy6gdyqZPszqqrmwLeKjnsvYseM9hbKI8XQHQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h/Q8iu472gdWWuYSp3Z6rmI5anpRdd+Z/77FeOJR03FYQZ+yZ/D3XVG6sxS/lM/QWfyd6RE6WNMjV0rqbMpEhqBlhP3mpoFI/qS3zGTbFCLSBPomV2bpDgEtFLQSm8IoH6vv/Wa2aexmlfjFGH2EK1+8+vthZs7abnWX5/YuHl77d/sXg5hKJxRSWvTCGOMe8KpVfve7sALJoEc/R1IedX8HtShgRj+iziYhtquuJ8f2XHHHD7qJAxWW76MzmKchFFIw/UWIpFW79QybktjKnK5SQ9/kh/65GPG075YHfk1PxfSlMkSLPPXr0uKlS/ZbHya71D6x+K+BkCnvE3AbW4ALVxyYDTn8hN9PNey6O/y+K0FmA/5w91w07VYwrUj3dIzNJ9tw7Fnuk7NZHpY/e1l2dHJdrqSyke8QC56JEv1qB5RSepecFobb2QOdlF6+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 15:12:47.5556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f84ed9-0044-441b-5e62-08dee73a860d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFDDA81179A
X-purgate-ID: tlsNG-c201ff/1784646775-732B32A1-F4255D00/0/0
X-purgate-type: clean
X-purgate-size: 332



On 16-Jun-26 09:52, Jan Beulich wrote:
> Mirror what 761bb575ce97 ("x86: fix build race when generating temporary
> object files") did there to other ports: These ..*.cmd files aren't useful
> to have/keep.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


