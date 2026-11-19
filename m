Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C9C606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 07:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=e0SmQ/Ax
Received: from list by lists.xenproject.org with outflank-mailman.1495835.1694557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTwML-0001kD-8N; Thu, 19 Nov 2026 07:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495835.1694557; Thu, 19 Nov 2026 07:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTwML-0001k5-2s; Thu, 19 Nov 2026 07:15:05 +0000
Received: by outflank-mailman (input) for mailman id 1495835;
 Thu, 19 Nov 2026 07:15:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xTwMI-0001jz-Vg
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 07:15:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTwMI-00B1oJ-0W
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 08:15:02 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6afea1e0-8faa-0a2a0a5109dd-0a2a45058554-44
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 08:15:01 +0100
Received: from [40.93.196.20]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6afea1f2-4cb1-0a2a45050019-285dc414561a-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 08:15:01 +0100
Received: from MN2PR06CA0007.namprd06.prod.outlook.com (2603:10b6:208:23d::12)
 by PH7PR12MB5829.namprd12.prod.outlook.com (2603:10b6:510:1d4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 07:14:55 +0000
Received: from BL4PEPF000003F1.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::f) by MN2PR06CA0007.outlook.office365.com
 (2603:10b6:208:23d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Thu,
 19 Nov 2026 07:14:55 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL4PEPF000003F1.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 07:14:54 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 01:14:54 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 01:14:54 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 01:14:53 -0600
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
 b=wJhq0qg/sCM/vtQnsxHBS94c7HVB4NqzXmXyzRhkenxCnOwhR9rEMj4kJlNVKBdR1efZMeuJGQ88kZaRnkXjY3qIjKTPyAREciU4eKunCEO4HO+av0/q5ryscu0DcgRn38P7uC779T9mM9eUdfrFm1xzSxpm05sWTrHZcT+eSnG5a048RPHenh1vH2enee1CpDzI0nMxxeJ3EhuddOfKxqTiDKNyRXbqQYH+MD9AAeTFHlihzogAUvv53IBhTJXjwse5HJ5YogqKKnFP6DD3S2kidKSRPpdpkWooj4VTSFMJY/wpxkfG3w+ty0EHMqOAqLneqfinVhBC2pbwBYcWeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0rqx1/XhVI0bpv0Oeo2nZJn/orGMH9SvJOSl51ewmg=;
 b=LeSSkBzZNCj7eHFlcPu1ZduiecsuL/Efw+99f8KV9uuuTLhijVQWxPemyBkb/+N93ON3LRycW14mZerC5BFZA3ccdojN/+UiKhaTCfw11bT8+tMlRJE4/uPDGua9wEra3cRTD8AWlWNrwA4rq/8i+1ID1to5jeJCfdXb2mR49RGl00QfsrYLQXYhePdex5+UogafyW/AEnvtJGDiDcnDv4/Bf+owWhLPOdfuH4n0aH5hNfenTXmY24V+DfKih9CBpAIQTnV43S3r8SUpEhqqPH47liAGbaixcLBRlCYQfWCwp5jGc8Xfr4LBVgq5U1hX5wcscoMfWLYQeilYIc47UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0rqx1/XhVI0bpv0Oeo2nZJn/orGMH9SvJOSl51ewmg=;
 b=e0SmQ/AxaJb3pAHHUV7ItpI/iokXtIqZ8rcWhFXLIu/EZLAwcUFLNrS0DmUsK0sRcNijzDXsCSkFm5vstDznQHRPksm3m3xPK3r7AwZbIiQssYHxb/0GBRuyayM5D+telKMKwdZuk0PT0AMkn+IP7PIqhYwYi6hXCQklRhD6Dhk=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <4280b0e1-b189-4837-8878-8add3f141cd7@amd.com>
Date: Thu, 19 Nov 2026 08:14:48 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/arm: guest_walk: refuse a block descriptor
 where the granule has none
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1794962603.git.stefano.stabellini@amd.com>
 <b29ceab6082cae0336e56c6695e661b0c8e12813.1794962603.git.stefano.stabellini@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <b29ceab6082cae0336e56c6695e661b0c8e12813.1794962603.git.stefano.stabellini@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PEPF000003F1:EE_|PH7PR12MB5829:EE_
X-MS-Office365-Filtering-Correlation-Id: 374e7a7e-4847-4bd2-7704-08df460ccfd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|18002099003|22082099003|3023799007|4143699003|56012099006|11063799006|261102123227099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	JKrwBjgeCEa9mIrDGXtInFup6U42ja2J7KUQv0PiD2OeQ1BX0Kq0N/6tv4tRdYuECmgpDrgJCciruhwwjQR1aZZOsXRjsBHrgZIWy/fBk7fXLQZhi1NsvMXVcC1a8FrNElkI1vhavBD+47oasGHpF7hDCQpnclUmEZNhu0XUTc27yGjFogIsXrEDiJoRkTTcnj5vxfa61BR0k5kSG18mz7p7i8aH+9Fx63eh1YA3L24kioRdWbb0i/LyW8l9qBpv0WTXnHQhHsSBA1j9bT6JCBrDGSDEy3C4gZBWZsgRlOSTpNBtr3vOuE6fCjLhTDI0pUkurSi6OcnNrkTuw3AHrxXkzl7aRhdrTkl+CFwjAljDj//swkVog99DF+i0NFCiDL6ZPHzEbKJTo3nzpFu1sEKigZMNS8PsZOz7uyDaog2C9nvOCiiaomlyQwXQDRQDhcduNp4bJTc+LDFYr0uIOanAFLW7IJZlmeX5gPMvAcMpv1R4nPlMZL2x0OxNwcONHjm8QfDsuRL5YP6G+JdC1g/EOlcxV2S6xw+UueD5KlsEVY1XtTFeBfaqTC1OactuFCV6KYicA/nTD6l6rqN3wY/Uu7jP3SnMuK8a+OIpn4kC8nqALST5SxRswJcX7fY0V2fKYuRFWrgDbKkaYv20itgfDq9l3QPBukX6ggdA4fg6D52XZHv7061JjHK8MHOd0ej4Gq/UDBmrMSz4PfMdNA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(3023799007)(4143699003)(56012099006)(11063799006)(261102123227099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	s3SYmhYSJHk2+a3EAOKXQbG7zTVwkStSZr2ZPdbchVE8oJtx7GED1hA82moE0X9varMfLQVT/qLg4bwR1Dh5C9GPmGJdHyI9SxGutAKXO8yr5s53kz5L1+464gj+q1WXXjkEDpUMW5if4NaURvo1qff9j47XLY7ovl+QDLh9bzCt36coWvReCsDjoqpNN9sGOjMNOUJn6NEor1vJwipHVpJwJErWghtez1bJwGdKAOKXVneK5rCgy/IeoDUSaWd8QWETi5zqAaxNMy776Udtxw5CG+iIebx/8Eozg9pw1e3i3otJLH9IOueZwnrx/ATKrB3A8sPN34Y0YI7d3+dqxEz0x9OOC4ay3sX7ymoaZ8lXwsj+jWp5WNI3dHgEQ8Fj2lEm9LdoZJoMN+eIauihE/k4HZKcnXABo/UA/O2PmdjzAYGqAdQjGw4lJj2I9HKM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 07:14:54.9428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 374e7a7e-4847-4bd2-7704-08df460ccfd0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL4PEPF000003F1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5829
X-purgate-ID: tlsNG-c201ff/1795072501-F4AA72A1-E6C475CD/0/0
X-purgate-type: clean
X-purgate-size: 703
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 18-Nov-26 01:59, Stefano Stabellini wrote:
> guest_walk_ld() accepted a block descriptor at any level. No granule has
> level 0 blocks, and the 16KB and 64KB granules have no level 1 blocks
> (ARM DDI 0487 M.d D8.3.1.2): the translation table walk makes such an
> entry a Translation fault (AArch64.BlockDescSupported()). Refuse it.
> 
> The check is only valid without 52-bit support (FEAT_LPA, FEAT_LPA2).
> Note in get_ipa_output_size() that 52-bit support requires updating it.
> 
> Fixes: 7d623b358a45 ("arm/mem_access: Add long-descriptor based gpt")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


