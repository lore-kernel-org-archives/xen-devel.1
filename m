Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279F6F99352
	for <xen-devel@archiver.kernel.org>; Thu, 23 Apr 2026 08:30:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1291779.1570610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFpRe-0005m4-BK; Thu, 23 Apr 2026 08:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291779.1570610; Thu, 23 Apr 2026 08:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFpRe-0005lw-6Z; Thu, 23 Apr 2026 08:29:58 +0000
Received: by outflank-mailman (input) for mailman id 1291779;
 Thu, 23 Apr 2026 08:29:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wFpRb-0005lq-Uc
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 08:29:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFpRZ-000JBz-GR
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 10:29:55 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e9d879-5cb7-0a2a0a5109dd-0a2a450cddcc-42
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 10:29:54 +0200
Received: from [52.101.201.37]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e9d87c-62f1-0a2a450c0019-3465c9253969-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 10:29:51 +0200
Received: from PH8PR07CA0031.namprd07.prod.outlook.com (2603:10b6:510:2cf::11)
 by CH3PR12MB9148.namprd12.prod.outlook.com (2603:10b6:610:19d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Thu, 23 Apr
 2026 08:29:44 +0000
Received: from MW1PEPF00016159.namprd21.prod.outlook.com
 (2603:10b6:510:2cf:cafe::fc) by PH8PR07CA0031.outlook.office365.com
 (2603:10b6:510:2cf::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.21 via Frontend Transport; Thu,
 23 Apr 2026 08:29:43 +0000
Received: from satlexmb08.amd.com (165.204.55.251) by
 MW1PEPF00016159.mail.protection.outlook.com (10.167.249.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.4 via Frontend Transport; Thu, 23 Apr 2026 08:29:43 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 23 Apr
 2026 03:29:41 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 23 Apr
 2026 03:29:41 -0500
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 23 Apr 2026 03:29:40 -0500
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
 b=KsLKJdUOfm0yV8jDj9k87YVkKQqY/OI/Y+5+P6ManSaj4rxTtr9PuvUXirHkrf4S3TXT3mh3yk6ZhVLBcUiYzCXi/Q+lLRuiEdbN6Z+we3j2ia7CgxtSWA2t0y2ICTNGJA7f58zgqZavMOyRyrLzu+tF34ksJkISkbigRWmPSYFhYD6ekdJtwvJZoAIB8fwOuCYMvHFS1KiLiZnl+Us4wg3YUE1nuJumdKe2NKwXEycHBKimyWqo5rRCIfY1ae6WcNHixfxGxS2Ve3ad6lx7lNMzUVsFY6ZHtbn+6dGVGsBIr3qzz5cgGb5/Fi4jiQ/Tj6hFRFfX/nvuo/xEJojrVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxdQcPxLPDlp1pyCmDltS2zTW8V4jJD+1uFfXjOK/x0=;
 b=fTIccJ8THDsd4hggClfKtSNooran/4Uiyps07O98JeSHRzOSjo9h5WG2sf70CQcUzpMzUIgAARpM0I/Pp+B5oncyl/DibMfy7s6pW48gzMTc9qZW4hzOZZ3xh7tj9EBt1miJGxzEgbIPUrQpPXCDrgKOJ6ggVS2kKYTdE9/h0BZu+ZE5p9ePJTr6+3fFWg/E2H0eldpOF4bmM4uLyFCTrE/kuiF7aUA2IabqseFug8wU6cD9bnYepLQlvsdgglq9hw0+dQZcLOWauXmPgHCNuHOsK/bEtMN75EkIT9uKi8kKmwoL3cGsIiRnEkqw3vS4iszW/20N4+bHuyLEcOh5aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.55.251) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxdQcPxLPDlp1pyCmDltS2zTW8V4jJD+1uFfXjOK/x0=;
 b=JkhnDwM23Ckw/uD3S0lVmxSY2lMJB60gqS7/w2KR9241W1DcGegU2BCUPbjJI9Tr92RqGNry4yCnNMm4IrNcUy5Cl5txh8lHVyslBXkSY3dqIPKEE7ECUfYAGea4okfPc5TNSxATxPTa9RqdnYRX0NkEjGzDjFEqQHTMc9WKl2I=
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.55.251) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.55.251 as permitted sender)
Message-ID: <e7453f42-6aaf-44b7-8408-6622c448c989@amd.com>
Date: Thu, 23 Apr 2026 10:29:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] xen/drivers/char: fix exynos4210 IRQ registration
 failure propagation
To: Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	<Oleksandr_Tyshchenko@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <cover.1776850201.git.oleksii_moisieiev@epam.com>
 <e15f6ef27470724fd987f0c5d248315abb1d2c55.1776850201.git.oleksii_moisieiev@epam.com>
 <eb609076-bd0d-4a62-a259-fbe0e4b19a26@amd.com>
 <f305fefc-a703-44fc-95f7-44de2b98baf7@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <f305fefc-a703-44fc-95f7-44de2b98baf7@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016159:EE_|CH3PR12MB9148:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c11ee4-a3c1-4e21-12af-08dea112784e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4LzQF+k+i/6Cl+p0xulsyasLXLfIHSUQQSpSOm9hSvxWdmMw8XHlu8NQoHoa1hAV+Co6UQFNCxTYaUJnumBpt1GwyveiQi/qsYVRpfTFOaCDG8Yb7PMoXyocQwz5StGwDukyYKS9+BRkDUK1L4/mrFW8k18UDopvd3nbqdspdzX2erBtqHrUwsmqZ/aqWIOWaM9opZmgmSZ7z4Ne20gY0ikIU0dUcyKwMLqMvS8fgo8Om3uIYxeyY4Y7vlbzc5AZ4ucpuMkr6b4+JIBbLGd4Y/bulsamHGfHs2CNpGdLSkgoDrosNU01zLFzdxg4yqZuzUibUxQoLBojVGRVZWY7MydgrmxE8KoxVlSs+M70/IQ2FGo6RzrBstwpmzMQN14zHk077ChoO/lOdKFdGFHErWzHFX/xqMpc2yUrM6vDfn6KjSqVjM1yF0TNhFRPJMhX1oo6ly62pFT/0ccn0lwmuGHZI8K2fkYWMuxkxTFood6F5pxMwe1UeAePe6BpVG61IJOPhkrhl3PfEEr7Nng7FgrtYLZfOPn836WC9ClyjidKc1MB77pzjHawlqYFoteX41l8BXystNAT3LCVzLAj5NOxYkFr9qWNad9jNrUug4444kjwOL12Dea9Il+rTGC7bkXLbIVkXiDFN6NYWj/yQ6zg6iD9C9WAjlXfeYJWgLTkIxFlZb4nkd/+cPZ9rrMRG9iEtyrA/idVYkycVjxtKgZZoytGllyYXmWIoP78vccSjMTRLHi6sfCCWXRjnN1P9PNlH4YUGnSoKKJ9CGW49Q==
X-Forefront-Antispam-Report:
	CIP:165.204.55.251;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6NshDjRGfDoaWzKP7uQgYXe2obu0y9Wun+FD+BmMWkvjVl4ScqG8AIoTku5V+3OWmeUwb/DssP4AVPh8l/xL/swys2d1SEEItEXFBiIdi7+MIe1On/1ZNPu7GO/mqhbRMVtrex5hcyUPEAiw4F7jCr6TxB1vQhCbcjAC01GJ/SrOLPCQLQCuvil1PbnGoQXkswnBHObd92ozL/zOJegd2alyszNNU2MlR55XKVVlLWwBtB5yQpskf4D6qXY9f5D0JHikl6VlJTlASHx4spmRmwMpXZ6WUEEep8wTz+3IRsQ8rGfeHkO3oideCfwyJr/xhs0bc/ofswq5fZRpjyeI+LOGzdHFGWSZBUOv3qpNuv0S7xsJhNmkZ9w89j4dVrQ6zIUIV1tfE7H8a1jBWMe3gLu/QyqdGPxubRYMv3aeJ4Yk1BHj9pm+4iRxGKVnqci8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 08:29:43.0570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c11ee4-a3c1-4e21-12af-08dea112784e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.55.251];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00016159.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9148
X-purgate-ID: tlsNG-d25034/1776932992-F5E0ECF5-733113F7/0/0
X-purgate-type: clean
X-purgate-size: 437



On 23/04/2026 10:26, Oleksii Moisieiev wrote:
> Hi Michal, Oleksandr
> 
> Thank you for the fast review. Well, I don't know why the commit differs 
> :). I haven't copied it, just wrote from scratch.
> 
> I see that overall it looks good. I can post v4 with nits fixed from you 
> and Oleksandr, or they will be fixed on commit.
> 
> Which way is more convenient for you?
Please send a respin with tags kept.

~Michal


