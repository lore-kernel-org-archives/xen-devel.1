Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA1FCA5FA1
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 00:00:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436230.1654964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBLGN-0000BH-OM; Tue, 29 Sep 2026 00:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436230.1654964; Tue, 29 Sep 2026 00:00:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBLGN-0000Ai-KD; Tue, 29 Sep 2026 00:00:03 +0000
Received: by outflank-mailman (input) for mailman id 1436230;
 Tue, 29 Sep 2026 00:00:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xBLGM-0007z0-4W
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 00:00:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBLGL-0074yJ-He
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 02:00:01 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6abaff4c-8faa-0a2a0a5109dd-0a2a45099efc-24
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 02:00:01 +0200
Received: from [52.101.193.9]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6abaff7f-be1a-0a2a45090019-3465c109d7eb-4
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 02:00:01 +0200
Received: from CH2PR07CA0064.namprd07.prod.outlook.com (2603:10b6:610:5b::38)
 by LV5PR12MB9826.namprd12.prod.outlook.com (2603:10b6:408:2fe::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 23:59:57 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::34) by CH2PR07CA0064.outlook.office365.com
 (2603:10b6:610:5b::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 23:59:56 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 23:59:56 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 18:59:56 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 18:59:56 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 28 Sep 2026 18:59:55 -0500
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
 b=vm5bdO/pQ7pkd7x8pAekcQ3qibOLzqRcexUW/QJB2jO8KgmH7yzNxfxSlAsZEqRXuz7tpoJ6O8caMl+Vr0i/1GH8wBBDZZ2hi05/k2lwihQsW2quzqLn2Iq5SpfVGm2OjrVszdEeobf+Hv3ZzqgQXf0sxwo0l3E11fqOb//DcuG7oBmd6CDyRSwoLAhMZta9aUIDLWhJ2oKBUqAj82nU122H/CKw3DpMZ1orBalUYJwyDxX/GWHcSMJ9dUN//H6Bhpcb8ektvRcKrI0AVsgC4PlqcIF78yL3OhAt8XB4wVIOYiY/qqv86IQIIk+wJ2QvRV84UG9OzdEliRIDItuJZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HiISDdy3MR86W2mX/SIvv6uSO0oA735U5fb5jKWr1wY=;
 b=rWZYOhrOcpSaoUe3B1XegAvJW9jeweNw4fKTMp2wyJb2c8+KsoCtiTZt8Y9DBRHgWH1jvdo+tDuoBjBkoc5iyllv9jaF/AxTSaX1ZIQmt2LHh35rV+r2lyOkPimBK7Bjbc73p76ORWOxmjeZNIuaOo8lX/pnzKXZcWA0/pxz2ZvaiO6n9GbwPHzkNUoQfHeXI4vrS0SkQCHEnCTdAl+zowc4ECjxMUpCc1RFlIlF3wwfjnw0iYzMZrW9CBJLVB0HTx082JHCwvE85QcoMKNK/BiC2qzJNC03NEm7hSE/1xS0TJYhbbSRM88fjf9EuDvnxFV0NOt+6J6obTxkqW4cAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiISDdy3MR86W2mX/SIvv6uSO0oA735U5fb5jKWr1wY=;
 b=G0sygJ6x3PBBndoMQ1gF572m+ppcgXUZV4kYkWgMGdwab9W/wmpz9a+FRd7bvPQoCdsiTHLquaP6UU4D10Cq15NG2frOforeE8WUl9Gqyc6FIOxxM3ozZqwK+N3ckYkm5giqS0Fzj3gm48+fQ23vMolEY0lZlpSuqzUqnvHmQKQ=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <b43ddedd-25a6-4cae-a377-fde12d2ec7ed@amd.com>
Date: Mon, 28 Sep 2026 19:59:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86/svm: Cleanup virt_ext_t type
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
References: <20260928140248.1543013-1-ross.lagerwall@citrix.com>
 <20260928140248.1543013-4-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260928140248.1543013-4-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|LV5PR12MB9826:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b163162-f721-46a1-d1af-08df1dbc991d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|4143699003|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	IYs4c/5Ggx2qZEKROVYL+bBJB7AYNQ7ciOXY8E+sZWGXEDFq3Jwlb02C1+iLZI/qIT91ghkNS607G47qUMS3YIxpH/DrTQE75OUTcYyBB+TUvLW239cC27cAMZJx1U2Hk88vetMVRw6N1Ot5I5yTGGUOnMvO8C9HJFPp7WNODjNagSphB57PyFZVBsQJ/enZPxvIY86H6aYUBq/QhxOCGytjKKDnoTq9VHwBT6SluaS0dqGi3W+q+8kNTX0O9CvwpDPT9N85QDNMOnjTJ7aiA/t3CPyranKhzVsb4kL/gJRG8u97pdl+G7hHETanEd9Htp4IoX2BwaAEwmt4OC0aoVfybSmwmPuriZUAWVxfiUVf+5dY8uRNuSZGzq4tYXB4X1piL8ScIzW/9PKz+UcPUsl/0uLFNYWix8YoY8M8CMk11Uegt29AlN0I9ZUN+Q6dvAr2gL3gQqL6nv1NnOACiT2BwjX9Oz6q/5OEa70CB6BOW/V2uvAuCiNADKBmqTI2Jy/XwupK3JaDYFXrIhCiOKxcrqnHgHiCMoeg9ZSeM5iJBwf8V7XaplRCI8pTYljiepdWJq9lDx26KHOkUOWTKbZCcXaS98JT0Ji25tHfTcRMruq9agHl41F16eZIMWBBF3b5+6GaQrcxBNodPvpCztj3sy2ZBNu6aEwWhUKpX23abjsGpN1zzzQHvz511/TV/OYL5EAakbMmI7jEl35pDg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(4143699003)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	skyYymeIZveDHDBIRq9P0AmgyyM08MEVOk3lvDCPDI1PXmFyQe490yBUzDki84blU9OeUtTgfYOnxaF/p13jfJ8OPZ8KRQZcj7HzlOTrvuuKIJjWAT92Gk1NqKkM0Lhj0YcbDTWoT/aqsdK4EXfxK/7o7OvF0Dv1nPAwLnHxHvRlOrpkb+pzpfWgfgSCOAGnTvvDGADmy78e6LnqA73H67/MAk/up69H9xm0W/SzlK+13r4yfTtF/yf62enKzybQ1P1GoqEl4tiSzvesPyom+wz4Ts+nwTuQLKXH75SM0qOIolbIlOKpHPRr2IFbv2A7l5BhMmRj2ySK9BmH3pEos49/HaBHHo/DFscdy+WK36+3j0in2/8hAHJzxJWfjMKFpvPSgr+x9o5XH8V2cEs8JBNRPWNodbJdyRt7YuP7gOpAQjYwt9p90yTpkjT1XKm0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 23:59:56.9277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b163162-f721-46a1-d1af-08df1dbc991d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9826
X-purgate-ID: tlsNG-bad1c0/1790640001-3B0DD034-41731B4F/0/0
X-purgate-type: clean
X-purgate-size: 438

On 2026-09-28 10:02, Ross Lagerwall wrote:
> Rearrange the union to drop the .fields infix, rename bytes to the more
> common raw, adjust types where appropriate, and simplify some names.
> Adjust the users accordingly.
> 
> No functional change intended.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

