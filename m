Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95020C9831F
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 20:55:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433029.1653865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9qTn-0004kE-S3; Thu, 24 Sep 2026 20:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433029.1653865; Thu, 24 Sep 2026 20:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9qTn-0004k6-O1; Thu, 24 Sep 2026 20:55:43 +0000
Received: by outflank-mailman (input) for mailman id 1433029;
 Thu, 24 Sep 2026 20:55:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1x9qTm-0004k0-Kw
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 20:55:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9qTl-00CMNj-UT
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 22:55:41 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ab58e10-2eae-0a2a0a5409dd-0a2a4501ec40-44
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 22:55:41 +0200
Received: from [40.107.200.11]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ab58e4c-5984-0a2a45010019-286bc80bba38-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 22:55:41 +0200
Received: from DS1PR05CA0002.namprd05.prod.outlook.com (2603:10b6:8:457::10)
 by CH2PR12MB4264.namprd12.prod.outlook.com (2603:10b6:610:a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 20:50:31 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:8:457:cafe::ad) by DS1PR05CA0002.outlook.office365.com
 (2603:10b6:8:457::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Thu,
 24 Sep 2026 20:50:30 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 20:50:29 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 15:50:29 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 15:50:28 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 24 Sep 2026 15:50:28 -0500
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
 b=g0TnSY8VneubHBgeyhD1m8uEhNIg8U5WXBnSBj7obBu3+LyFZ91YkcpGa+Ok5i84mYBB2LvTvnn91Qbob/MVtLBQQEFQcfN0k4oEUX0xGIZbhLmeFfj6EuCxLJ2CCllT9OCvCiF6oJDq+baKfIZbWgvxBenIC1Io5Iy6E7FDvI9c7D9p0OBRewuImeVBx5cd2vxFizGtDHlqZlFsbyTWCaL52YBOsnjnU8Hkw6KQWFCzwNy/4ia6jofKcxRPNQ6NJnLa2ZdbyTxrvpiYqBn8JDYpRQxCdq5jPAhpoDg8Ci3JX+/guGyg08PB0jWUD8EUH3C3cN865YySBEGnvNqNhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrwXOGVPoCuvkbvKL3weAoNwHrYqs0UvPWiSsQhyNMA=;
 b=VvYuX1BmrRwNwHXwcBwKj9/s3boaaWy6W9RKP04oKGNUdlrIJJZ8xqjVzLX9Azk/6vWbC9Kwwt8yiQ9v9ATCJ4M395TOQvkPjotR+EbEzt1VXylULZV9KHUVINFG2OEpv6EJxcboo7U+2xIc27yTcypQCf1btgM6E6bnLDJX2yDrbsgiHAHAUzvjJXIKyXRE9a2CZaSYy9xAkyOMzWzrPbRJdYHFJL7CI2ApD+j+CB3lBCgQh7uUh21taBXeyQFM5ZYalpLiHLBprmJC3BW6oE7zRlg/4anr5sbrk4Q5SDiVHLrkUiF8FmLHIRrMv9pCTISGxadNZCsxkGrKlmqHSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrwXOGVPoCuvkbvKL3weAoNwHrYqs0UvPWiSsQhyNMA=;
 b=WXhW8v1CKNCX3u2brQrCemNfsog3kUl4Ssk/TaB7PTxvsJi8YyQcWo4+FULYvPhb3Pl9dDCT7v1qeT7m+QAVu8CvVfrWu2zzppgpGkcdMOEsJJoCcRIftj0TFjWgfVJkoCddv/tLN8BP4rVlni18YPsca/NvBE3Z0xZ1cbN8BcA=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <d52b2229-974e-4ec0-8d72-bea574d650fe@amd.com>
Date: Thu, 24 Sep 2026 16:50:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] vm_event: svm: Don't BUG() when enabling intercept on
 hypervisor MSR
To: Teddy Astie <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>
References: <1790250881.8631fc262581453bbf619ec5b2062170.1a0d344933500072c4@vates.tech>
 <1790250991.8631fc262581453bbf619ec5b2062170.1a0d3463da200072c4@vates.tech>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <1790250991.8631fc262581453bbf619ec5b2062170.1a0d3463da200072c4@vates.tech>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|CH2PR12MB4264:EE_
X-MS-Office365-Filtering-Correlation-Id: 08af3900-ea8c-42d3-2e4d-08df1a7d77eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|6133799003|11063799006|56012099006|18002099003|10067099003|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info:
 X2suyCMx/ZTjclQ82Y2KFcEBkyVmanpJFNAvRdICyBvdhe6HC1jZ9D3KXlodJwsQ3WWruzB/A7CmDDrs7dJ2h8OnIkMcORbI0hRxR/t6kpBl8NJ5IxwKjCj7Pj1xFA/WZ1ZeU0/YqnhANR/dvCu3fsQ/w3Hu5D7HhlZzBVoB42mYtm8Eu0PZwVd+VXY3d+uLfqPiH7hPQGo/thpRxhbJ1h45QxPsPMoJ8Ao1VfnqAib1RqYnVeKG60a6G5I7H1XhaX9/Lo6MMPSbZhxD2aRvUqCaRwr/jrBguMivfIXhPkLnofGmnjlUks+KzJcp20DmSCJ9HTwvYarE1/OimZc45MBuX5Ud2qX/WFso3wSJMm3MAxDYSuzxMe5F342DBM54iO6Sy4RHu2XKeGmslSL/DoXXCbxUunsqluJWoB8rXGCjagREDLu0bQ6EdFV57JQDXKSmSCFhsIzYZGgpkJpMUjOIVQHDDq9Ohay4LA0p9fqn1w2Uw4Mw7WzwISw2SUtrzut8VlhOSNEp0Kt04ohlv0D9hyOQi5cuRBst/6Se9PW5wu3uZBBCjExxXacvsyVugkSTTUHSmFVIueFPr/nomAeVk4nwBFyhakFKj4PLfuto0JXYfx810nwZMshma7J8fh2+YOxETCsaZ/qmBATAHScWfhlCFHVPzZTwV9Z6MveG2re4fGajVj5usbMrmqTp
X-Forefront-Antispam-Report:
 CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(6133799003)(11063799006)(56012099006)(18002099003)(10067099003)(4143699003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 tBONMGLDF9P5eTwqzLgp/rLtSk5XzzTUNrig8QNUMRiVGIfIE44WgVksF2xXit8b0Iai0LBR0PmNEVzQPWhosUbef8oVZZg3bmbwTOfP13zHWXqY3/w8yLGe+i7wo2IgyLOzP81G/IPYELAuAQcsMR/c8sgd9NKkzrYOfGTZGW/gel1lbARlV2XK708iNADw65y7moAyWxDVPbkN9eejOqHTbzBG6NIhKy2CLGh6wi6HuFQ3r+VzRiKuFHxmQQmrM+4J78K05n4/KR/+bRmwsJJnnR1utzpa/0ekjzwC713SiHFeJSf935vrzi3G8m8Z/8FlrKlh8nQhvdF6AU6FexSETKuCiaTQKtzSHOt0FN+jqd6tXN7vnn2XKZP04d1IPp4S1zYZ2ZGFNSWE+xA9IHyAUUeVsWG3qHagv1JigrK/R2K2UFBw8McJcNDJqLHM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 20:50:29.4241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08af3900-ea8c-42d3-2e4d-08df1a7d77eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
 DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4264
X-purgate-ID: tlsNG-d62444/1790283341-BDE78757-7FF90730/0/0
X-purgate-type: clean
X-purgate-size: 800

On 2026-09-24 07:56, Teddy Astie wrote:
> svm_msrbits() only cover MSRs in the ranges specified in APM and returns
> NULL for all the other ones (i.e hypervisor range), which triggers the
> BUG_ON() that follows.
> 
> APM specifies that MSR outside the architectural and AMD specific ranges
> are unconditionally intercepted, hence don't require any specific handling
> by SVM logic, fix this by ignoring cases when msr_bit is NULL.
> 
> This is only reachable with CONFIG_VM_EVENT using XEN_DOMCTL_MONITOR_EVENT_MOV_TO_MSR
> to configure a MSR intercept in the hypervisor range (0x40000000–0x40001fff).
> 
> Fixes: 6e9fc4d628b6 ("hvm/svm: Enable MSR events")
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

