Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA216606A321
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zkWPOyYV
Received: from list by lists.xenproject.org with outflank-mailman.1454701.1668194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIsrD-00065J-0K; Mon, 19 Oct 2026 19:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454701.1668194; Mon, 19 Oct 2026 19:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIsrC-00065C-Sv; Mon, 19 Oct 2026 19:17:14 +0000
Received: by outflank-mailman (input) for mailman id 1454701;
 Mon, 19 Oct 2026 19:17:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xIsrB-000656-Ju
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:17:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIsrA-00089n-Pn
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 21:17:12 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ad66cb8-2eae-0a2a0a5409dd-0a2a450aa29e-0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 21:17:12 +0200
Received: from [40.93.201.4]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ad66cb6-f2d2-0a2a450a0019-285dc904645b-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 21:17:11 +0200
Received: from BLAPR05CA0032.namprd05.prod.outlook.com (2603:10b6:208:335::13)
 by CH3PR12MB8186.namprd12.prod.outlook.com (2603:10b6:610:129::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 19:17:08 +0000
Received: from BN3PEPF00022BCC.namprd03.prod.outlook.com
 (2603:10b6:208:335:cafe::8b) by BLAPR05CA0032.outlook.office365.com
 (2603:10b6:208:335::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 19:17:06 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF00022BCC.mail.protection.outlook.com (10.167.248.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 19:17:05 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 19 Oct
 2026 14:17:05 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 19 Oct 2026 14:17:04 -0500
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
 b=hUR9irI1UYeyGkeMqxb/TqXFoAGENbefmdiNNnN81uOvz10Xyr+L7dVZsKh7th4/e2l1NKZXC3nTxK6XNmm0EnoyWiOlsxAE/CKWDzolaNw+AYlnHfTEZekr/JedPPobDsDk+VLCC9Q7TIy/2LZ7MAoOziJNRVFbXYFsdWuAai4ypAc6piIOBaNr0d+5ciFnXSQBumIkJIaNKW1def+JpURCslkwx1WVToYp5OqFZIQKOaHvpNAs32/+ukA/i6hEgjXgBtJ4On6jN5LYssDRExktzM9jUoLbu21fx/3U0hN83p6QktEhvmrMXfHTfKtL05uPT48NkYer8wfFMb71QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+mth8fN4z1ivw40SWovHkzbmoxRaAYcPK+5jBE0+2Q=;
 b=JaxxmZRkl2flXOE3WwHWzBzDZoujbqs4pqDL24pn42646z8NCEzFWJudaLzqQvxEXM3aG4wMIptyC/fbSt691R/E83jv2M4fjvxSpQYRykWBk5COkTMpPff4PnXQXy+aawdIndLfx+yiioimGV2qwj/FAnTVEbhYfb5ahwRbpaWnfKjXdcISE9Cs0pEoMvMnTChIkDTfFwcBVdWg20PDVQyexw9oShsSMpQMVYW3qMw25i2az3tS7LUtzYz5ExsfmzKj1pMTeN93wKO7VjvcLQWSJi+xDArMUDtdW6CDdBOJOlB0FbOYgZlYVH23EZb9sSJ5W/6cJUZMsbuegV0zjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+mth8fN4z1ivw40SWovHkzbmoxRaAYcPK+5jBE0+2Q=;
 b=zkWPOyYVBYLdhP9i/eaqBl0Cn1oBX17992KBdVjf2zdineTQQazd7wJzrgcSTDwhceo/RSr84R7F6BEuKnnWQRPVDldp7QJu5ZuRM3DDYZBZ55Wq3AAbyDLDLsf+ZbKpUd+3u+cmp3+vFO4eheCJ0dCWanIFNnLoMWjO1wKlIVI=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <62f101ef-7f47-4593-a79e-06abbc18f84c@amd.com>
Date: Mon, 19 Oct 2026 15:09:02 -0400
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] vpci: Export functions required for SR-IOV support
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>
References: <cover.1792072426.git.mykyta_poturai@epam.com>
 <5b2721b7213d53232ce912e4f9ce0b4e7b1b39c7.1792072426.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <5b2721b7213d53232ce912e4f9ce0b4e7b1b39c7.1792072426.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCC:EE_|CH3PR12MB8186:EE_
X-MS-Office365-Filtering-Correlation-Id: a9cd8c8e-ac97-4fb1-fcd1-08df2e15902f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lWIIDnmyx+6/Ltu9nA6RviIQz4zKJEdEOyM0pyOaw/aEYFNDxpBDEsuGHuyWs8KEF7dsy9zesgwj+uCNVV3BzzApSU6XL3eHUTOCsqqc2CrrN2ZkU+ZIgoyf7hRG931m+toSHZvd3GWLfWfn315RrWOAZE+LRT0KjwGzBS0lZG3uExm/sFwx8jxbyUSqh25aok/PwycoP9hwvj3IcFeksNt/zHwBnkD3bv2T5l1lqW5XDOZa6oJqVY8wRvVlDticzRbvpPjSmzkz3gnjjq7Ci3ORvUnnUXy5rCbuXgj0t50pxTB3zCLGz7rPm7P/XQkf0J332KFAzYLe7N3qVTCFef7PZ0qzDBjhkNHyi6BNjeO0aPgcI1A9cGFi8XJVZZXS8yfstz0pEWntIJE/1aoEwXXBcm5Uf74c1eyxj/7p/WLtF0ej/hlHR0Pz24P+Ia4ZZBENAKsK/lIL7WLXZkTyIRaTrePDHA0MG5eHB90qgBRGWucdeTYw4rXKvrXFn3kvTCK3P72FXNI3kUABC7IPFrDg0Pw6fJ+sgjN8NsGGyPlr98GEwHHhFzR5bgj9FLIuezRvs1RzZVcE3v4VCeIKuzA0WVidCGcUkmbveP2BhWIbSH286zDHmjVHmF2BlmuKVCtDFqzb06xALxTmdLZPwtg6H+lOx+cfiMKDZDUDDclbCKsly1BseTbUfkaUHrRgNUo6jWVv5poeAgZiKMG2nQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HljmdO2iwOKwO8GauWBaAd8sccfWeWfBJa1NHl+lC1Rg2XiL9YoWzNzvBoYC+XYoI6ggdXY0cVGWioV4kc3h6fMhPDSxJGgTAsUGg6xHqOVUtZDqa4YUMZLEpBSkQ/ykTSEA8ix/GZcp17ZUYZQOm0N6DHlEbEDonRIQDr8KO2vH1YkkXo3IV54u/bRox/9w80qNLVihpdXlubtHhGURoxjrb4e0JGIrzE3oIFPSuEXh9XjCPKueF69XTMdXc9MnH6rrivu5o2i7STFjPi3pCPS/dhHZd7Axn7Zi1fQzLtxldzgua64STdzhAjHLQCdf6NSCfwggNUjH1qLUx/DHHbTxRlueqgrKpamCh6W3wttuTvIA2eh/Aa9eRCcipm/snP6Tt08k71Rjm0Z8U7sPC4/47iX4Be5jYeenDBQzfmh7LlKKDXfcfzIWCGe6hmsN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 19:17:05.7749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9cd8c8e-ac97-4fb1-fcd1-08df2e15902f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BCC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8186
X-purgate-ID: tlsNG-4011c0/1792437432-51CC3CFC-20597508/0/0
X-purgate-type: clean
X-purgate-size: 410
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-15 10:08, Mykyta Poturai wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Rename and export vpci_modify_bars, vpci_guest_mem_bar_{read,write}
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

