Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A42606A321
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 07:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=g89NaN+r
Received: from list by lists.xenproject.org with outflank-mailman.1486791.1689266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRm2z-0002um-Uo; Fri, 13 Nov 2026 07:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486791.1689266; Fri, 13 Nov 2026 07:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRm2z-0002uf-Rh; Fri, 13 Nov 2026 07:50:09 +0000
Received: by outflank-mailman (input) for mailman id 1486791;
 Fri, 13 Nov 2026 07:50:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xRm2x-0002uU-SF
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 07:50:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRm2x-005Ybi-2H
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 08:50:07 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6af6c123-e002-0a2a0a5209dd-0a2a4505e734-32
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 08:50:06 +0100
Received: from [52.101.201.57]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6af6c12c-4cb1-0a2a45050019-3465c9392c58-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 08:50:06 +0100
Received: from SJ0PR03CA0042.namprd03.prod.outlook.com (2603:10b6:a03:33e::17)
 by DS2PR12MB9685.namprd12.prod.outlook.com (2603:10b6:8:27a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 07:46:38 +0000
Received: from PH7PEPF00000006.namprd04.prod.outlook.com
 (2603:10b6:a03:33e:cafe::81) by SJ0PR03CA0042.outlook.office365.com
 (2603:10b6:a03:33e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri,
 13 Nov 2026 07:46:37 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH7PEPF00000006.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 07:46:22 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 13 Nov
 2026 01:40:14 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 13 Nov
 2026 01:40:14 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 13 Nov 2026 01:40:11 -0600
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
 b=JOUS3g7TcxCF7TonZuMpXO1FlHS0MAkvfpOrPOJbJordqjZh9UrOC2XvulOVqWFsTGOLrsxeMSMJfcw9ZDLRv6sfEC7iHl2tRp2eaIuya6iqQHMMwh9OZdnKqF9jP8q1juZukRCCEfDF/b0YP/zeVrdvpLUeeB0YEunprqkzI0VO7X9M0PgMiCR3qOVAdGAsGMObftWFwzXqQw4dg9uE/Lfo4+SiZ/enkQRTeE0rUj4oQ+zul7KDrlzURhmdVv+wvsBOJKMa4ml1YPqd+ahUwCMZEeTGcLsUplNrXfmFHglhGNc0+9ShTRU3tdMv05OVJVCv0jDSUtai+Glm7f0Rxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6L8YJnqqJ5nZagOSe83gOFP/A9dAJMqkeGu1Qhbeh2Q=;
 b=QZZLEc9zbCBWJqinvyH/C6jDFpBFVHKe3+9hO5bL4C6chlp6Wt6OblfJYFXjTA/Lgd+fI/2TQvrzOUeEV4FDxZW1aXbkqPPIb9hbg27v0xaSdRH6BSipkBekge/uB3W+kYgDhzBNB1Bp8W5e9A3RxHadexXzJqJKBHjT1HIOBwTXbemXY5FkPA+x8Sqgl7Q7Fr8LJw1Lk3jdx392TYCQ1FEQvp0ODXw2Z6Ci9Hg1u4OtIcmX4Nlvm31ToOnGo/hJCdPqnbfaSghUUNRd2GDbRIsK+mlzbKnvokZH7Siu+3qiet7bOFqzidG18L3nfVf7W1jeWlW0TWfJ3fovn8Meww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6L8YJnqqJ5nZagOSe83gOFP/A9dAJMqkeGu1Qhbeh2Q=;
 b=g89NaN+r6E4RWIBtwfL0+rz9kSxwno5AhXKU1tc25LbS1EYnrpgJW0Qd4rrz4HqzmnBmFnzoBlpVxO7KPNlKmcvz8zIjizat845htj1d18bNk6ElwK+kmLauqCNVAaWm2gUpBeyGjN3HcFNIbMjTP487d65HBjJXDXTWtuCiY/o=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <93760dfe-dedc-4608-acef-7de9ee7a87d4@amd.com>
Date: Fri, 13 Nov 2026 08:40:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/link: Remove CONSTRUCTORS from linker script
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>, Timothy Pearson
	<tpearson@raptorengineering.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20261112204032.3325011-1-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261112204032.3325011-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PEPF00000006:EE_|DS2PR12MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: f22bb71b-a88d-4e53-12ba-08df415a367a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|23010399003|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	xlFv46TJz1jexOJ6nKSsJCiCj/cE3poAQ69Et4VGcGY4AiNWBbhwhxZASpaUpx5xw6rRs0EBtzP0YvOT2GsPKYGOcGkprgksgWmtdkeb7w1IZMWhq3ly+ZGjtvsU5gchsOw1MEntkQG41TzW4MZLSyquCHTvzZayZ/xIReHJxA0xaArWAgKl7JpDShryK86zyQX3BknWxngU+LDMAad9WL1NCtzOu1for3+yWVo79UhTOlXevp9+vYAcYl856dLF4RB+2vTG16ugEozFdPcudEg39OwwAI9nPhrODfW4yyaVbw26pxV9zeaxtuEnW4WU0IZuEI/HFlM11xJPo6VBKKxq1SiPyT0zhpa3OgcqXAKIC2zqB0gsdDtTLTeRGCTm7mThDIGk1ZYPRBKLSz3xIS1akQdh71DqFX87xU3/csj/6oX4ywIcVxP48lQKLY/cVjxK03cVY590oReOfRQzO0nkkcAP0Su/Pv/dHGnYMrEDGMRa80Ov4aGS26awEoHOCi0FBDKWhmfgrLDbT1e92DBoYLuwMEQq3rIKGoT7pGJqCV495God+V9C/PFWfyCSwMUUqfhVNVx0ULKac2oI6FHsMrW2EHhxLuKnybqmqn+fpLmWETU3pji4ZHe43J0g53SLZC4/Tx+nmjObzhr2znaq9nqslbLl8HfgbyHdOaRBhBMPVBQUc2Hy1PymqxWHvcnc4xUGTa+qDq3yOmmLmA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nmPZGwu8P1u4rmFx6nAfsx7vYXwq1uAAHcuCMmLjfeI667zaPb465iH5TaHSxIU4RBNYUQr5dNxs4rVrCp8kOrDEZqNJ7l6nZDofoxvbwW68Xp7SVj9FXx2IFplJ3SKs5xuaHMYC/Q6OI6RRb0FbXRy3V6FgGI8RYp5o3XVWNI6I0dqqj32kyiFdmFhgEImC1+PSEOfW0Ksi38Pr//b6y8c/vmUuObukB1ytGsgn5hTdckaVNc9VLC3/SqYmcVoz6LbG36aA/jJVpoHREBEAe+/1OAA5kq87scyhZzQ2PsG1evfYHgF3GsM0ZF9RqEP306rUbwAdfopMBYSiETUrgorYT6iPyFBYOexeYbUv8hMpfaaMNk9/L4spJ9/EBaBMmhisI29jumqdGHivpiwn4dnrmkeF5XbsOHxfq5/w8WA+LQpaT9qYGRljLDplucEn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 07:46:22.5546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f22bb71b-a88d-4e53-12ba-08df415a367a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF00000006.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9685
X-purgate-ID: tlsNG-c201ff/1794556206-71CA82A1-A9D1F87A/0/0
X-purgate-type: clean
X-purgate-size: 423
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 12-Nov-26 21:40, Andrew Cooper wrote:
> The other architectures inherited CONSTRUCTORS from x86, so just as with
> commit b7a7e346c710 ("x86: drop use of CONSTRUCTORS from linker script"), they
> should be dropped.
> 
> The .ctors section is handled explicitly in all architectures.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


