Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93157606A328
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 22:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TC/+6tTg
Received: from list by lists.xenproject.org with outflank-mailman.1475753.1682308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP5Ze-0002fR-2a; Thu, 05 Nov 2026 22:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475753.1682308; Thu, 05 Nov 2026 22:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP5Zd-0002fK-V8; Thu, 05 Nov 2026 22:04:45 +0000
Received: by outflank-mailman (input) for mailman id 1475753;
 Thu, 05 Nov 2026 22:04:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xP5Zc-0002fE-8o
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 22:04:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xP5Zb-00Fck8-ID
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 23:04:43 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aecfd6b-e002-0a2a0a5209dd-0a2a450ab5ea-16
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 23:04:39 +0100
Received: from [52.101.43.66]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aecfd75-f2d2-0a2a450a0019-34652b4292ec-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 23:04:39 +0100
Received: from PH7P221CA0027.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::24)
 by DS3PR12MB999241.namprd12.prod.outlook.com (2603:10b6:8:38e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 22:04:35 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:510:32a:cafe::ac) by PH7P221CA0027.outlook.office365.com
 (2603:10b6:510:32a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 22:04:35 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 22:04:34 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 16:04:33 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 16:04:33 -0600
Received: from [192.168.19.2] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 5 Nov 2026 16:04:32 -0600
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
 b=kkI3alVXptmtYV3cOVtk6yPY8VtoNC0RWA9OwPK36vmhPFmEPl281OAzuzgoFN31FIhqi8eCvs14yeVvcn9MDgHcfliYDySZ65VrdJB9OUU2pqZogBOXtmCE+ZiHQjAW4ZfdscZPXHD+++y3pTGChu7RqZmoMIQKXt6H8KYjE7iYySsWupLe+4zJorWCkaQk8MS+ct5NhK4UkOCCGyePAojduOJj28JnzZSzJ/rD+qtxU0TVUsSOSbsmqbRunVgIyhEGdYskkTYN1Tb9sgOqDAnUckPUH7ojFjWJM0efPb94fdszTAegph57fALwDf/6wb9egNhyTC7PBRnd4TcrTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTCoU6s00uFNwMiskVr4x7Q+tZYyY1voUalgftXtpM8=;
 b=OOdY8DsS5/CTeFxtz2FEbzk53elhtKIK4vYzYVuHqp0DVKPw9Gipgx+RNPOn1APvzV5tUHSD4eFGepd3NVRkVu3mPSO7AN7bziHxEKWYKGBclbfuIPdU8T3X3KO4J+B50XC/TBvaX8RXWBHZE/fjKG2+c/Bjv7nRszy6oUp5mrQApnFmjUrFgKXzvKQS+doEPmGgm14XWMmDjOdmIZzCFHstzAJ8IAAuTGtSR9YDBiHsoiin2B7qD+PiFhXMi2waHdaiBVFkvTO+qhHY3Xy4scfJM46T9uXaG8WwurfToKs7mNqOEQrcUWq1G7Dpjyn3eD8TL3n+Qn81oDi8ztmbMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTCoU6s00uFNwMiskVr4x7Q+tZYyY1voUalgftXtpM8=;
 b=TC/+6tTgT1TlcCQL64092IXsb33KGzKvHZ5qsX35/w7uMWEnyYnbi7rfpqafSK5I3PmjFaeQiBPHhcMTE5BAKbJiei8G+EYa03sLF40lGc1D8MOPUqpUsZax7CwWsluHkAmn6w6oHVjnWeYYuORDb0NaByydkZb7Vg8roYpSkrU=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <c6070257-2725-4dce-8ae2-0172c9ecf2fa@amd.com>
Date: Thu, 5 Nov 2026 17:04:31 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/28] x86/hvm: move SVM feature printout to a separate
 function
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <jbeulich@suse.com>, <roger@xenproject.org>,
	<teddy.astie@vates.tech>, <dmukhin@xen.org>
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-2-dmukhin@ford.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20261105013347.719392-2-dmukhin@ford.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|DS3PR12MB999241:EE_
X-MS-Office365-Filtering-Correlation-Id: 300ddb9a-cae1-4418-5d72-08df3b88c68d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|18002099003|22082099003|10067099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	ncCzNHd7510XAvtjqr7SDpQAyrBfgYZNPD7k6EofIAkD0TPReDxHsWVUbpOPbZbGAPPeYFc0ul3Z4lVXYzjfBxJgXLd6fz7MhxNQSMqlII4yu5hihjjV0Cr2cnyVCqGrPbP1lmWRO6634yhfxoMC8dlwc8QzdU0Ad1fdKG71qwnD9nv4SK9cfl1/ehi4ucC/XFr7eiGkNKjxQfxTEnnrijRzSzYr2zJL8D3F1Dga5h2/mMRikGc6U7Ea3wUGe0WRH1ZmRkPhaSJQ7fhM3xoyB9+Fj1JVUhgPvMmgO1S5ZXk0ocBpY0eCHsldBqzUYztwPASDK6a9nz9PnNRVX567ymK0AJrlhnae6CZwEr6DdQi/4ittbgYUNzTkQneYXB2L/6vKKFqHoK5czFWC275cT2prf3eefeaeQWxBCBR6AnY8p8/34tL1+L/YU31qXy5/xgUa+ozZ9NtmfIs7hzGQbpBZ+EVWle8OKmRRGZHGqwBCJNVJgFUcT7YOMu75Pkkui6H4zSvkjDycnI826posmql3Uhzz94GIY9YbvxRDtV73dDvBTWYJ5CwcyNG5lNZUkt/gBSmFFiXwOXSh5SYfkXy/CE17uK0BfyIwOftE3sUJ942+hLWwc/7W/0PHOomcI4oZJ9t7XQABCCFuwO+plAI6EkgkyChVhm83CRtHwH0jCuXoBwBzPfAqmEzl18yie4PPwZUnuF3KOICVi5JyvQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+YA4ILPLfYr22KaEeFjLkCLx/w1QFk2P3A2ltmSkIF3UNFBzb5pqUi3Oa040VYqiVQJx1JElfCIsFBDu1Cx1SKEaVjj+buk4wZ712mEmSBRR5cx0YmhFs+WU8/WLveaJ4I+b39YIMMfS2JuIQG6UDtw/LAQsGE7d550/Us6uxGJunRIZ9s0/LhC/RE5S0VNDKJWNc04OgVfWaGQQzQ9HI1ZzxJo7ervbsyiMKeTloR+XBKuiLYFLoJjK5Bh8cYxtPydmphH27kNFrkoEVsqgXHHseBsL5ZQ3P8vM3+0jVXU/Nn4Ab0zRUN0D9ULoK3GvlLsgBbfjNyNGn2orSHBdaMRUIQeuzYQHEbf7oQrsWB4k/IgdV4cCGQkh8QCuEH3/1tF7SdRH+zTAHHEBjSyA8SXgPd2Hyhue6N9fd8/scbJBYyQEs097elfGrJMjlJrP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 22:04:34.1902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 300ddb9a-cae1-4418-5d72-08df3b88c68d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR12MB999241
X-purgate-ID: tlsNG-4011c0/1793916279-597C2CFC-175C228C/0/0
X-purgate-type: clean
X-purgate-size: 321
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
> Isolate long SVM feature list printout in a separate function to
> improve readability.
> 
> Not a functional change.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

