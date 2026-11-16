Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E23D606A336
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 09:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=b37ZX1DX
Received: from list by lists.xenproject.org with outflank-mailman.1490300.1691242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSso0-0006Ja-PD; Mon, 16 Nov 2026 09:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490300.1691242; Mon, 16 Nov 2026 09:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSso0-0006JP-LF; Mon, 16 Nov 2026 09:15:16 +0000
Received: by outflank-mailman (input) for mailman id 1490300;
 Mon, 16 Nov 2026 09:15:15 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xSsnz-0006JJ-Ky
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 09:15:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSsny-00BB8Y-5F
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 10:15:14 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6afac9a0-bab6-0a2a0a5309dd-0a2a45038988-6
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 10:15:13 +0100
Received: from [52.101.48.30]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6afac99f-fae8-0a2a45030019-3465301e53d3-4
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 10:15:13 +0100
Received: from SJ0PR03CA0089.namprd03.prod.outlook.com (2603:10b6:a03:331::34)
 by DSVPR12MB449095.namprd12.prod.outlook.com (2603:10b6:8:4fe::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:15:09 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:331:cafe::57) by SJ0PR03CA0089.outlook.office365.com
 (2603:10b6:a03:331::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 09:15:08 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 09:15:07 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 03:15:02 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 03:15:02 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 03:15:00 -0600
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
 b=g82t2Pyy3DgISJU+F0XKm0wQXw4lGHbjCmYY1NAHmS2u9/rYJYqRhV9dn7lugAzbPP404qYt894aKmXjdUQ5bZkJ/5JHe02nIX+bzKIweNKktwN8pcCmbRvoYxhd8GzN/n8jRbi+Ba1rFY5TI18zIuQJSsAzPwx3lr0HkQqbk8RkaXBSykjW1KL+m9Emmkd9uXYBV2LRgslCxc8D9TpBnCYzYtjNyNtf6g8weSU9vXwaE/TvD3tqIRpCcPEULi2b8yBY6BdEpcQ87Nyajf3UPOl94JeDmfDsHavjUrtjffpoTNclzRniHQxLpdg7qhYFjW5KCE0ObNT0Htx+wPTHuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/mr0bP6bkLX247dxuec/Rng2W59iThAyc7t9N1pmBv4=;
 b=nXshC2SPZSiYmDSW/3BiIGECKfcCMHU691JZs7HrjVAKNCKdwAxXeIdDsDWISnRDl9ktkyq7sVQs9j8sGAoKAQddtDdB8y2KfwRCV4Thn6mkYFCpIPri1Cny8HfCqQrCvGtSNVG8fvB0kwaD5FL2hr8ZNK39Aivyu6Xs3MOgHHw8ftt/GskTHFzch+Y/tlO6Q5O6u5AFHnawrGHCYbRgvIvw2H0jOkO1dV7V+9NuQHJhwxh6t9CETLWughjtoItSQzVVW4alms+6dv9cDUydQaH90J8zJVfOqfOLH8BgXYnOX9hveraKB6LrizlKMVBF0RuyrBO/uXjH6G+7yHfQxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mr0bP6bkLX247dxuec/Rng2W59iThAyc7t9N1pmBv4=;
 b=b37ZX1DXdHI/rpT81WWuTinu6tTuR1SYC+cFvWw5bAY5/68rMGBKITI/u2+b4tu6xoXHYYxG0+sdGVrNmgBKWYpvOs7z0AETAZlAamkpbiwo9+FlHfUmXakE9oVgqS8dKLDGRcADH6Eht7SAlGevvYzgsLjWdPRaUVwPL1hWZF0=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <f6508bde-7024-4b5b-a1f2-993cf0effb0e@amd.com>
Date: Mon, 16 Nov 2026 10:15:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Orzel, Michal" <michal.orzel@amd.com>
Subject: Re: [PATCH] xen/arm: vpl011: record the virq only once it is reserved
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20261114020040.4154189-1-stefano.stabellini@amd.com>
Content-Language: en-US
In-Reply-To: <20261114020040.4154189-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|DSVPR12MB449095:EE_
X-MS-Office365-Filtering-Correlation-Id: 63697b52-e7bd-492d-871c-08df43c21bbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|18002099003|22082099003|261009223027099003|11063799006|56012099006|10067099003|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261021135927099003;
X-Microsoft-Antispam-Message-Info:
	h7mk6O6IpI48Oer6NMlR/+GxueoxrYc88PP1vX7WGwRxYf45c53AnFQ0vQ6yO3f9HqKUWNMWCw+AXiUEgBILXWWyCjToXHTHVp23CxEkeWJVyArTwm4YK+FbuJJ2raiBLv6Igi0RD2vMK9D7/uIPM0z4v6N84wfdsfSsFRFJ2WYWStRIogleMYM1MTkw6jbzglGI7eWnbGFwZqt7VhZKg6m5l6s1ovjPSMxK8+UGWRlG8Ck/0p7MZpRk2FgcKexKAx0BBazvvwgL0WfdJ26vtdhm5chabA6sBjDG3QJM73+kQOtvY/ZQZYCdEIy8aY/52pHzGjW2Uezj//frwsJUWB3PQI6j0VGQhYQSREvvZiAHTHaiQ14DC1gFku3OON3SgLX6EgTzh3ukjs8lGLS+HaRhskwgRs4KZcbIk7+Dn8uSUouaDx8CWgUyAd0yypaUy6WYCnczjhRSyfGjlf/TizEcy0/89odyqvajo1tHdp7tMTTr62QC3egu6A8KvV2CPH1fdXy/Cium+1dz4AnXrAPr+0MVN+txJGVMlOpQgOKgyLgWI+wqWQnmlz7XFDCKpRzIM/MY0Otc/Ui5LLSBwiC7ZZ65EcCaz76L/JQxNl21kLM+THjZzVXbOdzgqHrKK3r/R1rpZcpgDFqJQS0s7v4ckAsiW7LBK6iaE/cWlxZkyt2gW1jX7CN3MkljePutLRXEWY7DD1L432dMObgBvQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021135927099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HLEI7nyinbUc+tpdHe8FI7PZTzgB0KnkNm9gKHxaB5sbJOj/8HOVMG8gGvwzLBjYzsnt1Msbd60zSO/4+hbw/t+RzdsMeFBCpi6+6oYH/HHfag4fju05oCJTzdSZu/I6431AWtjxsZ6PzyzeUnvpl9mHPP6NbhGWFp7QVAxjXb83LtCgkQuy0C7oHOOY7EMTS9ecDGcxwI6XOHOO5GbBliaYphVrf+xJVdHUHJ+L61ihKbp0Cvc573sj8s8afjM+3lxLmt/nw89gD695rELf2EvzuhojEBLpO7al0vSbpfpGUYVzuqPNnxtAh7r2jtt94SkH45Cr23q49giI4itfRX9BVD08ZrLitMPsbS11t5wHacRgP4V/XxcdlyzMdBLoX1H1tN1F7v1AxdAgA40k4obCDC00eSRiKnQhX4j5hRcdHpRmrUPmtg4V30SJWRMr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:15:07.6795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63697b52-e7bd-492d-871c-08df43c21bbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB449095
X-purgate-ID: tlsNG-33051d/1794820513-6D4D74E9-E26321F6/0/0
X-purgate-type: clean
X-purgate-size: 1049
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 14-Nov-26 03:00, Stefano Stabellini wrote:
> domain_vpl011_init() sets vpl011->virq before vgic_reserve_virq() claims
> it, and both a refused reservation and a failed
> alloc_unbound_xen_event_channel() take the out1 error path into
> domain_vpl011_deinit(), which frees vpl011->virq. That clears the
> allocation bit of an interrupt the vPL011 never reserved, so an
> interrupt held by another user can be handed out a second time.
Who is the other user here? The virq is either GUEST_VPL011_SPI or the
Xen UART IRQ. libxl rejects a passthrough IRQ that matches the vpl011
SPI, dom0less reserves the vpl011 virq before passthrough and panics
on failure, and the Xen UART cannot be assigned. AFAICT there is no issue as of
today and this should be explained in the commit msg.

> 
> Record the virq only after the reservation succeeds.
> 
> Fixes: 08bbc1c02d38 ("xen/arm: vpl011: Fix domain_vpl011_init error path")
The SHA is wrong - unknown revision. That said, I think this should be
1ee1e4b0d1ff instead.

~Michal


