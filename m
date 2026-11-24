Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48341606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 11:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NHAwo9aB
Received: from list by lists.xenproject.org with outflank-mailman.1500802.1696876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVoPP-0001s5-SJ; Tue, 24 Nov 2026 11:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500802.1696876; Tue, 24 Nov 2026 11:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVoPP-0001ry-Oo; Tue, 24 Nov 2026 11:09:59 +0000
Received: by outflank-mailman (input) for mailman id 1500802;
 Tue, 24 Nov 2026 11:09:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xVoPO-0001rs-Fe
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 11:09:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVoPN-008Lhh-C9
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 12:09:57 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6b057074-e002-0a2a0a5209dd-0a2a4506b9ca-26
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 12:09:56 +0100
Received: from [52.101.56.43]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6b057083-195a-0a2a45060019-3465382bafbb-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 12:09:56 +0100
Received: from CH0PR03CA0114.namprd03.prod.outlook.com (2603:10b6:610:cd::29)
 by IA4PR12MB9787.namprd12.prod.outlook.com (2603:10b6:208:54d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Tue, 24 Nov
 2026 11:09:53 +0000
Received: from CH2PEPF00016D47.namprd02.prod.outlook.com
 (2603:10b6:610:cd:cafe::90) by CH0PR03CA0114.outlook.office365.com
 (2603:10b6:610:cd::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 11:09:53 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00016D47.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 11:09:53 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 05:09:52 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 05:09:50 -0600
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
 b=bSdrzkLo58on/fjeZNbG9gcYJYKWPgmZxYyV7VhrEtpkfQFWJn65xy7tVXD89yRaUVopz2YlDsdjNGged01VBg0MPMT2YGLva6WvSd6wLaex8pbsGfpAzJb3Zaf5h293nBRly8omhW28G/q5qrTm5EH7vICdisunFHYtQuDKYBwjAwBgDJl5cQlGv9QGzJtqNlwuMukJVqmBdOVQ+Bd2MIzA3tVvDuu6p7yBAFyBbdomK/mJvEkHJSA5lnaIru9ZFHvyhTqy6QbLriPDBpwPR27NXIrpXR0P8Y1mb05eT7ssMa8evVFmSWUFmsPUMqqvC+zw9svWLI200z2sL1+aFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7um8PC3nBpcaCoz1sbq1yxw/ub+4+YIy4BGCISOBwdI=;
 b=do+1XaPeFfM/gzvOixpv+bprMKB317B6SpUOWjzp3ga+ux1BuT+1182qFNELd4pet7EWl8OAEivvwuzEDPd4BuBgteNFDqbM2ZIRTBqOJzU2LGNpLFEuQVYiwcjUcHhRILzLsO0LZBQ34l1KhNbm/hKWkkQ2aZSyMFd2Jr7I/826e2l8iwHnalamBltnUbkQ92ewKK6WcJwnMJWXD1BXBG8ajNUC0VkyTV89xUe9OfEYyBV5RvCEz/97Jzsc6aj0nkQRGqNI0ZQn8q1iKnQGWZNGCrqrjl9pufemoBWsVKsSTbTp60kLuiW4IETbr7LIlNPQuygg7yUSkLQsgG1xdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7um8PC3nBpcaCoz1sbq1yxw/ub+4+YIy4BGCISOBwdI=;
 b=NHAwo9aBvb4kncmntOKsrw7X03ZkzwcEn0YjAvlNSUwu7swq4lYrMR1QhuOESM43wsL839emj4nMHkZHF/peCKmOLax4J588ppF0hAJyY+u65BGq1nFa9TIbvNURCjKFkOMvOqmRI4WvfW3FSBs9aJ57hZsWJs4xBVPR/Xt35kA=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <18b10aa5-a1e3-4c0b-aeea-832466bb2775@amd.com>
Date: Tue, 24 Nov 2026 12:09:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] xen/treewide: Remove NDEBUG
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <20261117115549.3872611-1-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261117115549.3872611-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00016D47:EE_|IA4PR12MB9787:EE_
X-MS-Office365-Filtering-Correlation-Id: 84703e00-0b78-4c5d-34cb-08df4a1b7717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|1800799024|82310400026|10067099003|11063799006|56012099006|261026121527099003|261022075727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ThWpj0sWsnojKC1kf4K4/eKTrKcd40ynpoJCrIWIPqBIC5DREsNu06CfUs5Qm/Y9WP5alvu/0DBvZ1xykCRt+Ffk+9VghJwoMBhJ0maaP0EyaKymfyw36HNc/li3ZAA0e9Z1taBkd/wh/tXp3HV7T2aeawom/yUeeyG48nXdpzWES3mhLe9aIXsfcRrGmchc8NkQQhit8gaaY7/im5C+xYvsuCH+sP1St0s1fIKQ3yY0l4DeXuguLGsRTcjieW7EWBxeaAUxOxkFABFoCeAkhwQqwg6AV9Uaoh427coET2YiU/Usky/FdlOVXSHMPqBwDQp7EIneqN9bq/NYJN+Hj9iGtyKvn3/Rmh+j/mnAuQKkGrl6g//mNLcec7n4B6gphSLxcL+P39aveC2Mrd/HWW6gsVFhLMb1BsmLwPJ06C8aBa0GNER4ZvE92KfwpsVocww5pZnavgOpKTwyCoH38InjFTY+Mfj28swqHCICugkiXgPU9Zl8GkNNwLtd5Ykf/bhNCRJE8ub9bV69bPzo9dngb80G+in2La0sHGH5luEJXkmNgTZ/MYhiPPtH7jen0ds39EjrMY93RLRt5lmhtOdKHkB+qL2f9hUJrG33Q0XKF/uw64SsFW9PTG8r7x7OYwSvpp41BvN3hKaHaGNztaJIBYbeCS3/Lofigwd7Jlc/9JbCc4fEslFZV7wtgzAaY0xWKbDbGV68UaSRhDAwYg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(261026121527099003)(261022075727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	J+bRO7Ml67r+F2hTAhO/c3y/3wGQjGIYoIsAMgjZLLnjyeMtVX14G4CDIMpbrbZ82QVe479bp/IzppPOPuUEZDfWPvaEW6A3fZj/TZI+fT16ZXRYrU93sQz+2HmtkIrFQtRIzLepH2uySOtenA3PirueTJd50NJLryyrsJn6FEnUJxVFJX6K5BoCltjQtJLOqzCcHksK9xa9nfI7TyMN1GJfqxJE4ji3ziOrOZaDCFhm0euXubl197rWWuypgW+l2ilkjDbIqLPkl5Q2eBHc5lIEYoKSTd3Xfv3dDvVoN2Dmfb7KdVlR988Vqks5vZT7JHtguMedHIVU/6PfioEwhI9nr0t8VbwbQc5r1f71/n1/dchToDatTJNTp9nPjYp1K8UDpTyr5ZNHqwVh8QLejMrcv6iriGHeVxBu+sBVB+130a0Rjf/rfyi/DKsdVNdx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 11:09:53.1923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84703e00-0b78-4c5d-34cb-08df4a1b7717
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00016D47.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9787
X-purgate-ID: tlsNG-16d1c6/1795518596-F520877B-C2FB81AB/0/0
X-purgate-type: clean
X-purgate-size: 379
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 17-Nov-26 12:55, Andrew Cooper wrote:
> We have two ways of spelling debug build in Xen.  Reduce this down to just one
> way.
> 
> Andrew Cooper (3):
>   xen/treewide: Convert all #ifndef NDEBUG to CONFIG_DEBUG
>   xen/treewide: Convert all #ifdef NDEBUG to CONFIG_DEBUG
>   xen/config: Drop NDEBUG
Acked-by: Michal Orzel <michal.orzel@amd.com> #Arm

~Michal


