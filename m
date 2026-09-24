Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B950C98318
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 20:52:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433014.1653838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9qPn-00041a-7z; Thu, 24 Sep 2026 20:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433014.1653838; Thu, 24 Sep 2026 20:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9qPn-00041T-4n; Thu, 24 Sep 2026 20:51:35 +0000
Received: by outflank-mailman (input) for mailman id 1433014;
 Thu, 24 Sep 2026 20:51:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1x9qPl-00041N-W4
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 20:51:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9qPl-00CM19-Ct
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 22:51:33 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ab58d2b-bab6-0a2a0a5309dd-0a2a45099eaa-16
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 22:51:32 +0200
Received: from [52.101.201.55]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ab58d52-be1a-0a2a45090019-3465c9377d18-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 22:51:32 +0200
Received: from BY3PR10CA0028.namprd10.prod.outlook.com (2603:10b6:a03:255::33)
 by DS4PR12MB9564.namprd12.prod.outlook.com (2603:10b6:8:27e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 20:51:26 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::d) by BY3PR10CA0028.outlook.office365.com
 (2603:10b6:a03:255::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Thu,
 24 Sep 2026 20:51:25 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 20:51:25 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 15:51:24 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 24 Sep 2026 15:51:24 -0500
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
 b=NXWlg9Ga+C/vZdSkIbuf3xKsmQaUj/FPutWo9UNbbRvJZs+thX5yKEandiIna6uBGYgpVUO0HY8M+WmeFKtbmt02Re3xb25ubvdyGX/Yi89mblN2+zpPPtO3yokiiYNPEE8+SiXoV89uv+AShAa3VxMhsKAVjEvNF021sQdaLbJg9T6R4Ihb1pXhjASxgF3TIXW04K14f055HkfyqhdXEdfPa6TXTg5mpb8W2X+ImWFw6Mvj/g0AMTYRA973ncqbooPSiYumLTmMrxE4m8PSwijH0crxzmor4RvqGYU/6UHtyvl3m2j1EseoORIx8kNF67fqYJGLyirzs+bl7PcGUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2E/f0fpmXT0ZjsFoGXlxc/pgA8IpqgUbdIw6ulGug+Y=;
 b=AnayFr1PziNbSCtwF55RLXQjYQaS2ZatyMzDC+HCUfMkXXCX6DqufjggLtw45ie+HDs9seiS8ipSO4hqFQS3A9Hn9NQVzL7ezLXLc+QifDFpkEMkD6S/1PilFM2V7W8zR2e4YnBky2kuFHD7tBTronELcSZDtIM0JlRaywB/WaN2X7mghwx7po/CB3VlCEvQsmbLggvuLgdgo6CsS/qokgTt+GQ47adwEChCdNkQm4j/bypiKdSGYsTjY5d40il1VnuFkdmB6PgxZ5oO3UWTmj/UUpkWJKJAmsX6tjABPRPHuUCFyeWnzwZwRvwwM7zJWdtQCoqMHux911Y6o2F1Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2E/f0fpmXT0ZjsFoGXlxc/pgA8IpqgUbdIw6ulGug+Y=;
 b=bXyAE+lSts67hPDRfO7oEkdxbhaaSOQlkVqH+xOlATeG9bJgZQ2PnGpL1x0Sje8LA2FdEMU/spiIMsF9eRTgNmyZtvUA+FOdz+1fBkcPWuOrr6X81oGpTzj8YpXyH7jzsJzPM9EqvRhwbG2YORDcXhyCeJFcToD/chiDNz5ByAY=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <3aa3d405-88f8-4f4b-8fca-1671e3d59794@amd.com>
Date: Thu, 24 Sep 2026 16:51:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] vm_event: svm: Fix incorrect monitored_msr() check
To: Teddy Astie <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>
References: <1790250881.8631fc262581453bbf619ec5b2062170.1a0d344933500072c4@vates.tech>
 <1790251023.8631fc262581453bbf619ec5b2062170.1a0d346bb7600072c4@vates.tech>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <1790251023.8631fc262581453bbf619ec5b2062170.1a0d346bb7600072c4@vates.tech>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|DS4PR12MB9564:EE_
X-MS-Office365-Filtering-Correlation-Id: 760d8560-0a4f-44d2-2eac-08df1a7d9959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|10067099003|18002099003|56012099006|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	ekAIeKbmHDqxPH4Hm4X5LZ/JD4rn8fTTUHKERaexa7Qw5a9r6njSTxuGA7hljPHy+ZLrYpPoXYT/SBhxVLqXkoX09PqbZ8F42aIJsF+31FaccCeJ/jAE4KWbrpjfGqe+Q3inlvGwfzmLiY/o3C2CZC8INHI/plY96+UK8IL59XVxj1gyGqbkxiV64Ya7IvbMmCz9Zmd6RnJEe8kNNy47+P8HBL3ai4UryN/C8XHsIgkuhR66RynVjqTIAnXiI0jqL2qbrMojYG3TyqGyO1zV7yzAQDC2WztFNCg71BFtfqfm4iDfWv0H9X1N1L0/PJ1E6by7KLef4tjuZfIdfndL4lybUAPuhtOO0rH3di4aZSBPZWTAPo3bMDCJMF56kWyB88TADiy/zEiXW8OuYHSUMDIiQjDYaGT0hWaeee+Lv/6KUiLWSNbWiB/homiBO08+lul88eXZ1Ad1qjYpbjClyMQn3MeTE10Gas+ySOx8UIRDc8A/gEnGaiymacKqtR03vqWQixyi9YDnJRohDyd2lvuZzRE0wd/mNh+jr5YWxbIZHPBfVmBXEnUvoJgSe02C14P/qp3uH7MK4W2akwmpTf+lkG7eHWMUdwjfOXRyBxlt/NHaJXs/dlAqW5KdU9gCXwE2uGn4ht0hd74NMmNvQOJSRsNZb5AATsqm7FBhVDZXWDF1soW1TyplcKhAH4ZjAUN8OpBvQnnT8zuAVSrl0g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(10067099003)(18002099003)(56012099006)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3TqjHq+q+0MXmqE6XickvlLWIkKe5+9NM4fN/1KDfIdOIHdDVHbE/QjhTmt277g9JgyWg8AAg4rI/6NCVyoGb0KLKeuTM/FuSIIv7nK4+dlj3jLUYhxTf1EZVNVL+csMe4OGGs1JRe+SFzoPFHkd/819mhi0igUnUpORSWSYKzDSV7Ysz9VdnXyiTeeWMo07zgbOHFAV9AviKtrYYMfZLZjFlPDhdEhXfPsRFdLFXfqeQSXGuf+HcKb70Qx2o6bdAS9AfG9x3Dgw2OLFJuxo3FhUOOgN4Zxe7GfS5Exb9CJbmbyEytYjf/48YaMv0OBVGpQ+LuTK5unwEoeWFbrgEAg6KMsyXNSGKeKuA/CUTGSKw3NqGaHuuyO8LqrJCmwfr4p5Ca8YeNtsS7jherydk7bsZol/9IpCLyTR9W0uBAYITJA7klSuhdvxJWZdHxyU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 20:51:25.4558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 760d8560-0a4f-44d2-2eac-08df1a7d9959
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9564
X-purgate-ID: tlsNG-bad1c0/1790283092-FC610034-4BB73B45/0/0
X-purgate-type: clean
X-purgate-size: 714

On 2026-09-24 07:56, Teddy Astie wrote:
> monitored_msr() is called with truncated MSR values (&= 0x1fff)
> which doesn't match the original one, making the check incorrect.
> 
> Fix that by keeping the msr value intact and computing the bitmap
> offset separately (in msr_offset).
> 
> Fixes: 2746088d9cb4 ("svm: don't clear interception for MSRs required for introspection")
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Nice find.

> ---
> Should we multiply by 2 msr_offset instead of doing that in {set,clear}_bit() ?

If you do that, I suggest you use msrpm_offset as the name since it is 
no longer the msr.

Regards,
Jason

