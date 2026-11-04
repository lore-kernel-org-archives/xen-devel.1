Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1412606A31B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 06:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=vy6PjuSU
Received: from list by lists.xenproject.org with outflank-mailman.1471461.1679830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOUpe-0004ca-9x; Wed, 04 Nov 2026 06:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471461.1679830; Wed, 04 Nov 2026 06:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOUpe-0004cT-7P; Wed, 04 Nov 2026 06:50:50 +0000
Received: by outflank-mailman (input) for mailman id 1471461;
 Wed, 04 Nov 2026 06:50:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xOUpc-0004cN-AH
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 06:50:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOUpb-00DI1L-Mu
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 07:50:47 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aead5c7-e002-0a2a0a5209dd-0a2a4506cb9c-0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 07:50:47 +0100
Received: from [40.93.196.43]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aead5c1-195a-0a2a45060019-285dc42be729-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 07:50:42 +0100
Received: from BN8PR04CA0052.namprd04.prod.outlook.com (2603:10b6:408:d4::26)
 by CH3PR12MB8355.namprd12.prod.outlook.com (2603:10b6:610:131::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 06:50:37 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:408:d4:cafe::6d) by BN8PR04CA0052.outlook.office365.com
 (2603:10b6:408:d4::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 06:50:36 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 06:50:36 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 00:50:34 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 00:50:34 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 4 Nov 2026 00:50:32 -0600
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
 b=DyCbJRPJEFBFs598FDcZr599FkzxvKhquPbZiHTgFjz4z01/AoEoStizreH0/nw9poTRjYKncId4m6XEuIeOotQiCLWuvSSpS9ygvwEm9q5txEUGnbG2D5SC4nX+nPKxfDLtsfOvnrm/hm/Py2m40uHIQLKdANICxaTQkbjTwd5brGxX3Qpu5L+KAWRrwCWYj2zlvLhFFdl+qz6GB7znV8hNioT4e9UErxtBRPjoUOASa/JnHl14T/i6Y2CS+4CXDT1f47AjSI1fkcfkRr76xcIcszRSbzPwj1AK6q2c2pL9xgSmOOdzF1dUinmdbzUDnrVgkRVW1DVlmv+m1rKcOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iN86c+DTsA3xjSD86IoRp/C9OSENxZp8vtwoiqGn2/U=;
 b=xLdoaEuLsv2gs+ck8ZCx4c3j0RGWrVjzJ3QwtYGEZO2tHvKjoYcnE5gMeB/Q6e81Dcugnqr3lAn4G3t+lYUdtlFLS9amlqCmqMTFzbRtpT7Tr5P92jYU2Svz9wrO4SHsEwfibyUL79GJJcKsuoHDRwMyQnxxsvsDsY4VYFfoTVKK8uqXKFJsbxzRs8iFMISy8TWBh6NFgvP8PaOBeaa1eAetX1fDIWkufmO1gY5D7ZHBlXKxm4j8Y6BY+fAE+cGnmMonwPIAo9rg+LR00Yy3Dcg6ilgnXM1/WPNZU32h1t0CvGrMSRMRoW7OILulR6BHzg+AvQ7lnIo8rhI+VTxF4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iN86c+DTsA3xjSD86IoRp/C9OSENxZp8vtwoiqGn2/U=;
 b=vy6PjuSUhhcM/qlBCO5aIzmu12YcBOLXgIVT8bUyKCwno84lYb3VYpbwFlk3WVlEnxLT2MsXS8QsER7zk1vtxhST77ehJJRRL61pXTuEEwYU28hRn0k3oxrMkodecnfNMJQVYv2kp4p4TCMoeu3SN1b6A6spbT3TxSL3SDjzWIA=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <8462d860-fd13-467f-baff-b7455fbe422a@amd.com>
Date: Wed, 4 Nov 2026 07:50:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] treewide: Make {invalidate/clean}_dcahce_va_range()
 void
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <20261103152928.2142176-1-andrew.cooper3@citrix.com>
 <20261103152928.2142176-7-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261103152928.2142176-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|CH3PR12MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: 45a5432c-b2a9-4878-ed95-08df3a3fee72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700016|376014|1800799024|23010399003|6133799003|18002099003|10067099003|22082099003|11063799006|56012099006|4143699003|261026121527099003|261102123227099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	rOQW6rE1p1is54WmfhBOYqgOK/Jb1ryPeP1oJSsFUrtq/Kb7MTmfxqA/n4/huWyNz0VAjJU+bngq2ezP7vJWoKXTcW1Uqo2dHDAmQXIY93RTjRghsKXJW3i0KSxTIhZfOmbwo84zdWtXZwjmWLWOjhplLsPswknWiwP8cgkLQgPY/mA2Qpu27f5CKB3zC1oXGeo4ZbXHMBoLOF0VMCKMggzaSxLH3m6YNcs32RRw8ncMJbWAkamRkEmXj/HGLI7I9I2HpTU7KrJ/6Am2QAUIGug/6EDI6XIwVSG/T3b/+xh9gx540StX+NLGS5kVTNhgX5eGvNvdA2PBYaQe/HkiEtVp/TQ826caMfuEI8Lim6BAm7kCzeYj5cM0Nz0J0JE0DykkrK9I65RbrTHYS5w/+ZBSQrBmgG7Fw5XFLfA5vbjVQhE9HvhFQXZqOuaforzRChxd1iGBf7EwnFbYROwK0SXm+EBidLBWaiEIiMhmCR8IDkmXZi7ZsLZyn2gQ00UvO8q64oMmfoe1HfZ84pwyVqvUo7uJL6CMILf1YXeU6umWDmNrYrf0ESWc2mHL+OOHdUnSIfB5w9JDfIcZgo92qXk4Jig6acmFM6hVT26hfcCp9JKhieUcRjRof7/A5x4VJq87w8pojv8ax9VFVHCnGfhWnQ8h9h0YO3Acm9irovvoXnIZPI8nttPcGwLZg9ftysmPghjusniNVDhCBph2UA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700016)(376014)(1800799024)(23010399003)(6133799003)(18002099003)(10067099003)(22082099003)(11063799006)(56012099006)(4143699003)(261026121527099003)(261102123227099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nWVcz/XrLyBOddRUQPXNp6KGM16rgOLrMv/O1/iBAYO9eEvpC3A+U01DkvKg9/MEcA6QrOrT+OEJBTwc6yrkNeYQfM/UogYc2VZ0QVpmsqqWdoZ4CNhR0f691Dt5uoSrrA4SEhY4n74SE+bcEPD/lZrYDS4nglhUr1WofJ+Pgy2qgkQkT6A3zuuXfcgjEyVKsmORqjzR4XHY0YXuFOFN1+B2Btm4DYJhhnHSCuJsm5twgLZ2aQWeo8LBY6enUQYOx2c285wfTKIjgTryhzuLsdqRMRziclzgGJ0RausNHNy2gJV7vK1jYVdz3I5TlnuH5ra1dpQAGfS8u2sfJFE214Gt2CElOWOMQ4xtWv5mGrGf1k1Npq+sOywmOHQh/izkMEaLbFhaKQCp0mJ2YZ04C/fDW1NGmvVIa+gvkmYBCzUTM6uRUJQOkKlNJQyIFzlr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 06:50:36.7328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a5432c-b2a9-4878-ed95-08df3a3fee72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8355
X-purgate-ID: tlsNG-16d1c6/1793775042-FC20077B-4B572300/0/0
X-purgate-type: clean
X-purgate-size: 474
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 03-Nov-26 16:29, Andrew Cooper wrote:
> Precisely two functions - RISC-V's flush_page_to_ram() and ARM's
> _cache_flush() - check the return value of these functions, yet all
> implementations return success, and ARM documents this as a requirement.
> 
> Make them void and simply the callers which care.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


