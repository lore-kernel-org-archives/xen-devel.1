Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A7AC79FA1
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 10:16:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411274.1641978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3srx-0006PF-FA; Tue, 08 Sep 2026 10:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411274.1641978; Tue, 08 Sep 2026 10:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3srx-0006P6-CH; Tue, 08 Sep 2026 10:16:01 +0000
Received: by outflank-mailman (input) for mailman id 1411274;
 Tue, 08 Sep 2026 10:16:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1x3srw-0006OD-59
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 10:16:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3sru-00Ggz6-Pd
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 12:15:58 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a9fe052-bab6-0a2a0a5309dd-0a2a45068510-34
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 12:15:58 +0200
Received: from [52.101.62.48]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a9fe05a-195a-0a2a45060019-34653e30e2b8-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 12:15:55 +0200
Received: from BN0PR10CA0027.namprd10.prod.outlook.com (2603:10b6:408:143::28)
 by BL1PR12MB5802.namprd12.prod.outlook.com (2603:10b6:208:392::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 10:15:50 +0000
Received: from BN3PEPF00022BBE.namprd04.prod.outlook.com
 (2603:10b6:408:143::4) by BN0PR10CA0027.outlook.office365.com
 (2603:10b6:408:143::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 10:15:49 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BBE.mail.protection.outlook.com (10.167.248.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 10:15:49 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 05:15:49 -0500
Received: from [10.71.198.170] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 8 Sep 2026 05:15:47 -0500
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
 b=acQdO/Oep2Y81sWePjSaARO498RepWQaoKpCpor90ZyLD7SBVNC/fBmzUVLlaA8QgMreahO3hqWVCVu74WP0KB0nq9tOJYeqHKNP+InVnM9iHHi+v6fWlg1dzp4l8SSO5/9YV+FWJ9k7TH2tiUwkPTt40MHfvcbcGNs8/OXVTfG6CMqGcmdncrktTevkP+yAoeUyjyus3XYuowev+xeLii1H1DAdQALdslOAUtrrDuspBT2w8+IroD6QB3ZjNzwPcyz62EyOMVtKihFZxkydffsLvsbNgbG8Rkx7pw6BxhVRVbb7IOEwnSOk1P1P53+KaetRs972LsrCwCuqu8CYsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CL0RqkCcFHvzY0x/FMtT+wm5AEKe2Jhg4P6VvBd5Aq8=;
 b=W4lhjvaeQTPvG8DHZdqvvETwp48D+G3ZgF7KehhBdA37FHv45u0lQFM1WmY0Cjox/gFKxzNYuvAVZXliLPUNtwk5TMkxV1ex3KxG6IxY2pI5iIjXCMw5/qL+CN40CV/QMZmuk+8hal4OY7OHjmurz7WxZJpo3Zw5FX/Xg3dYkr7SWwjwlJmhD9HNKAcoc214xgjOoIC054LYQVqU4vx5iFzC/khtCdhgTOr1awHo9gPlceyrdmwqiieno2F5GFaqJIi2OLf6qiRGuax5Gk3q1m8WB4u364be2VjvdS6xFYEc3eZxIz7orDL65aZirN4ASvMEZpDvuW6v+vS6MNTSMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CL0RqkCcFHvzY0x/FMtT+wm5AEKe2Jhg4P6VvBd5Aq8=;
 b=Ent3vZqiNV/zoqrASG9+TmJIWXGMa9FwavZzDb0x2DitVv0tAq+XJTubnjj2umgaBkEFMo00sHteTTlBnDnuAr4PGSG/X+c7biRERGUEgrk0yhYhwVKUOgp6dGF3WrVph+Ab61G92tbbhIDqWbSH/TZUbrmq6d0g5e9dTBgyT30=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <a1534770-411a-4067-b21e-a19231948548@amd.com>
Date: Tue, 8 Sep 2026 11:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drivers/char: Panic when the requested UART fails to
 initialise
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Alistair Francis <alistair.francis@wdc.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, <matthew.l.weber3@boeing.com>, Andrei Buzdugan
	<andrei_buzdugan@epam.com>, Simone Weiss <simone.weiss@linutronix.de>,
	<uwendi@gmail.com>, <harunobu.kurokawa.dn@renesas.com>
References: <20260902073606.61062-1-michal.orzel@amd.com>
 <20260902073606.61062-4-michal.orzel@amd.com>
 <48a7a4a3-605a-4a22-a7ad-2a4041f65b77@amd.com>
Content-Language: en-US
In-Reply-To: <48a7a4a3-605a-4a22-a7ad-2a4041f65b77@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBE:EE_|BL1PR12MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: 94f5be00-4f06-4098-e98c-08df0d9227f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|23010399003|1800799024|82310400026|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ZRdyLV+uT/Co3Fg4BO5O3A6EdMleGh95K0Mrd9g4+SPCh2YBkUirtzc20nLqPsu1X/TW2Iu4lbH5O/GT55dL4+PcHqA1xovjdmM0Q56eaE+raj1jFMufe6iBgilz1MQriqq5vv9MPmgGae36sf0vPJlI8n9XEmwRWFTqdpYvAa19NAlFLcZZlF1IaMdN9OaA5YFEqE5XhHcCjZsgRP2x/OjRtxDVTK510OPQ6AZ/P9yDIocOK20GnTs8cb6ePxcpdeTP5VEBrw4bYFWvwvNDzy7a4ZbR2gGNXbI6IRIr5SJSsTQxFrhi85AbMNvGTKVeP3Jo6z8cDn/Ps6/CK2OzuPCMCPGUWtGP6zwRSGqiQlDNWF5lZ1aNrktxMA4e5iQFm9XCtc1VQGh/I4rF8p1wy0QhkWprqAViqFQmrufiI5xzWsr7tn8eV+yTIt6UaQMk9OKn43CRY+6bmo0nWSIyH6A1Ol9GdMrbqWv59w9PiQczmfXA0xRVcAVpXtpCZOnqJZdMsafsg6I6I26lQ9oH73GSd30TmFd5H530rIjJX939xYrKVC16iwmAa8ozmg+iZiuboOAMl1AuVKG9W4hjDngMNDAffj1tFnhYd9rKab1LfBLjEWRGOpjQkIpWA795rTTFyahP9vS5iOeW1PQ0enq6AYz+Sg7KSS/711XdtXwrEGy6oBuXH43FN46knjStryDEcQYWKVKtNxC6x99hoQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(23010399003)(1800799024)(82310400026)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ktPSyHM0l/cBpOR7GIaq4wZy/bpcxLmf9ZgnuuaetEEwxrNmHgY3W3GlBx+XWY0RIAHFB7jn02SsTWnmTTp0gcVR/YkUuTpKFU0Hv2d3l0lB/NRa3Zb5mehYv4kBmCD7oLV/CU+FtE8KzbMSXOVzfmjxSFoKJUxK1Ice8Ve4AVlX/+3CcuMwYNB6fAyD3fpm8CVJNt+vmJenLirdg04Tzfwmjjq4otdKjo2D3TZJdl+m0wYCg/CKT0Sx/QxBN24Wn6mZvd4mNTTxNimhbEEN2aYegTtE60owT1zFyoyd8UHee4cisJfKo0SRk/T09BpvR/1sltw5S97jYJKUIaUGXFPsAWdhZujIKDipLcFju9StcGJXmmjSyQF16wk7v6ZHt5oOACFpF8TUZd2SLfBqkLa8SBOLfFeaPd+40YRjk7RphNuR87s5Y0yCRS3A4hNH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 10:15:49.5960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f5be00-4f06-4098-e98c-08df0d9227f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5802
X-purgate-ID: tlsNG-16d1c6/1788862556-F5A0C77B-4D9375E6/0/0
X-purgate-type: clean
X-purgate-size: 1953


On 02/09/2026 10:44, Halder, Ayan Kumar wrote:
> Hi,
>
> On 02/09/2026 08:36, Michal Orzel wrote:
>> uart_init() cannot tell its caller that the UART the user asked for did
>> not come up: every failure path only printks. Arm and RISC-V carry on
>> into console_init_preirq() and boot without a console, rather than
>> refusing to boot as they do elsewhere when a user request cannot be met.
> I just want to emphasize that from functional safety perspective, this 
> is the preferred approach. The user's request is given the priority 
> and whenever it cannot be satisfied, Xen should panic.
The patch does it, so we are good.
>>
>> Return an error from dt_uart_init() and panic in start_xen(). An
>> explicit request Xen cannot satisfy should stop the boot rather than
>> silently degrade it,
>
> If there is a silent degradation, then we need to document this 
> behavior somewhere. I am happy to keep this documented under docs/fusa.
>
> In the safety manual, we should mention all the instances when there 
> is a silent degradation observed, the underlying reason and how the 
> end user can detect it.
>
> Other FuSa experts can comment.
>
>>   which is what start_xen() already does for the rest
>> of the boot configuration.
>>
>> Only a path given on the command line counts as a request we have to
>> satisfy. Falling back to /chosen/stdout-path or acpi_uart_init()
>> therefore never fails. SPCR is firmware provided, the analogue of
>> stdout-path, and there is no ACPI equivalent of dtuart= to make an
>> explicit request with.
>>
>> While here, decide whether the SPCR table was found from the returned
>> acpi_status rather than from the table pointer, which was only NULL
>> because the caller initialised it - acpi_get_table() writes it solely
>> on success.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

- Ayan


