Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62062606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 22:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2WMXM1Cs
Received: from list by lists.xenproject.org with outflank-mailman.1475763.1682317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP5aq-0003Af-BC; Thu, 05 Nov 2026 22:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475763.1682317; Thu, 05 Nov 2026 22:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP5aq-0003AY-7a; Thu, 05 Nov 2026 22:06:00 +0000
Received: by outflank-mailman (input) for mailman id 1475763;
 Thu, 05 Nov 2026 22:05:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xP5ao-0003AO-OV
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 22:05:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xP5ao-00Bsbw-5R
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 23:05:58 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aecfdb4-bab6-0a2a0a5309dd-0a2a4509e482-12
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 23:05:57 +0100
Received: from [52.101.201.66]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aecfdc4-be1a-0a2a45090019-3465c9426efb-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 23:05:57 +0100
Received: from PH7PR13CA0009.namprd13.prod.outlook.com (2603:10b6:510:174::12)
 by SN7PR12MB8147.namprd12.prod.outlook.com (2603:10b6:806:32e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 22:05:51 +0000
Received: from CY6PEPF0000004B.namprd03.prod.outlook.com
 (2603:10b6:510:174:cafe::7f) by PH7PR13CA0009.outlook.office365.com
 (2603:10b6:510:174::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Thu, 5
 Nov 2026 22:05:51 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY6PEPF0000004B.mail.protection.outlook.com (10.167.247.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 22:05:50 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 16:05:50 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 16:05:50 -0600
Received: from [192.168.19.2] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 5 Nov 2026 16:05:49 -0600
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
 b=pss4GuHDNVgrlUpY0Bwkxj7Pl1dKF8S3YQ3jjOUl4PATODvY6dEoJdqNwTU3Mlf4icAantmsPvBffmHr/AK+EYdLp+dpP1Pb/0jggqZffs2viFR2TdzwUo2QKmE/Yb/nPRgiNnEVuEQxuunCk/QjUx92Jn666iVvJV4qsywfYqjRAjbAjpoJ+kNNvFIqYIjoTEBn1MSaFOxGqlVcSCMbW2+x2YqCIQy8rDldGthZ/o8eScW0/HGjQCxzjJw8Qn2IAVGyDvOCzlpyT3CD/1hcL3oMtqNF7B2DDWSidEiFMF6B1iHsqJty+tZ0a0RUufkRyoowwmZjkaoLZWJFdnxZWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47Lj9dmFm1tAAK8LAoPBModnphK0czM75POlFwwcwxg=;
 b=V7qL21ye47AmWf+faCVCilDwQKQau5RHH1hm4HQ1JDxnoj6F9xX+uRNqoBPvae5Pn9p3lr09mJvOr2jwELlJz3h0AF1CAxDkUTsc+6Sve8c4UPCROMIbEFW5UJAdx78SZKsxflT/41F2MDcaXKmbrpveyet77oOuqrkvpxEQWl8BU5wntJ140mKf6sa685ATc/kCJvoQ8IMsCJUM96D/7iSzwor1LmG7id8UJYabFGFTEmcCUDlTuvXhrxrUJtuPmT0S4DynEEN98Xv4y9akYRa9D3ayFjnmaQdM/3Gjr68cQf/IQ7wyAJOr4CnPKszUqLAQnOaPau38lZECz24nXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47Lj9dmFm1tAAK8LAoPBModnphK0czM75POlFwwcwxg=;
 b=2WMXM1Csbsb7CitQIYXnjzGUAaxuD/eCgMFl/ARnO6uE1sj2reUSskSF9S9cMRIJQkhHe9u3SEKqRH2emdBMHx7XtTENCsgObgozFmCgZbA6efSCwTFTqSsGQfuQlvrlsW1d61hmxPDlzOICuNi+WmYLW9f40WE1wC1P4dUHFq4=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <f7a5543c-2072-4229-8568-ddf0fbcded11@amd.com>
Date: Thu, 5 Nov 2026 17:05:49 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/28] x86/hvm: report SVM AVIC support
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <jbeulich@suse.com>, <roger@xenproject.org>,
	<teddy.astie@vates.tech>, <dmukhin@xen.org>
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-3-dmukhin@ford.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20261105013347.719392-3-dmukhin@ford.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY6PEPF0000004B:EE_|SN7PR12MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: f6a00cc5-24c7-4e89-85ea-08df3b88f439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|22082099003|18002099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	cUcYRuxyUOygytt9OxvpqTmjM5b+AukP5snEXFG6NG0HY6xtB493UbG5yKqtBO38yqFspizh4PWzpxiQpdOUDpW9BHfhtoTNGyrNNvTCXKTtmbGJBNz7zOUeyNESQU9Hl1refnU747L4ak4dZFqviImda2tVfRjgADglsXwYygCbVrBbGoRyvZkRqrV9Prbu3NIo/zJkMj/9zu9Kyg+jw8Uci4kstDIZLCgigWI7133dCUamvLjf6JqNrKTgbsj1Ts0NWgLPQFSK1865UFD5k9X4QSzaL01sp5fCzlKsWA2GEBWJJ++x5q+c/BPuexH9rjVPiS+fMFKuRejz6ghOP4Y4Uf3cbf0o0jbc0tQ5kHUlo/CvVBy69/+B3YxwyafIExnPy+LpFLdXnaCCZJlS1nXwZG+wTlRHui2P6piBEBNQIhlB8bfyq3hg4wpALQ05zOZAZ8S2LiUAyRM/dpLJFZqGaWoQFa3PWxT3T2xb6AJ9bQE6/d24gLMXuB5841JK4ax5s62imnS3uTAl4ljKGdipURQsotS630GRrtZ+R4uqnsTuXBrC/EI8W0qEuUpdEOmSeSCauFUugVvQ9qJd30PUVYrfhGbxeTjriYODXP4RPRZ/287Y2SpG8SnM98zRHCb48skxUUdkGlqBZVsivsz3heFAlRJffp1obb7JEIhXDmncZI6z4iubUH0LaiCxppmAglVibSQ7ATnYO/Zt2g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PUwxH4L1qYouYlawrJLOBtaor+Nr9rxijHKIht0olw8ipoVdTO3E4BbjFNET7efWtBP0VHbjQCNUBoAzOAt//BQ+JTHfl+rwS5+doj0U6/fmDgD/jDpiPUbwbH/wbUsyhQVGESmg0Ee4qUhJq9ad80IAFx0kNhcVhY8KIp/DQyQJxrsFFF/zz5DkftmwhyVoCu92XJFUrqG4XQik8TmAcgrHNPrwZL7asyYWnbFP5xAnxrwsVSMTd7Ksane4ODLmxfShXNJ0kQtmPmI32nvxVtGYIw38/aCHcj/3pYp8bFbwbD4TAO828nUcPD92inVakCIUIcKC1vk+YzmPNn07j89fZ3ua9ZTZnqhdS6O8ikKuqyIpqCWFlk7wuXwNlohw1OFUTnJaZW/1vjsUIiD1bA67JIjR25XkRnCoYk44y2zmkm/iCYd3oqiOVrED5y1q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 22:05:50.8042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a00cc5-24c7-4e89-85ea-08df3b88f439
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY6PEPF0000004B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8147
X-purgate-ID: tlsNG-bad1c0/1793916357-3B0DD034-0BF86C41/0/0
X-purgate-type: clean
X-purgate-size: 265
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-04 20:33, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Report SVM AVIC support from CPUID Fn8000000A_EDX[AVIC](bit 13).
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

