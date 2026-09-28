Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE94CA5FA1
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 23:58:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436221.1654947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBLEg-00071z-4E; Mon, 28 Sep 2026 23:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436221.1654947; Mon, 28 Sep 2026 23:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBLEf-00071o-Tq; Mon, 28 Sep 2026 23:58:17 +0000
Received: by outflank-mailman (input) for mailman id 1436221;
 Mon, 28 Sep 2026 23:58:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xBLEe-00071i-Hj
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 23:58:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBLEc-00Ak3R-FL
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 01:58:14 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6abafe09-bab6-0a2a0a5309dd-0a2a4502def4-48
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 01:58:14 +0200
Received: from [40.93.201.71]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6abaff14-6ca4-0a2a45020019-285dc947c16b-4
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 01:58:13 +0200
Received: from BY1P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::7)
 by IA1PR12MB6531.namprd12.prod.outlook.com (2603:10b6:208:3a4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 23:58:06 +0000
Received: from CO1PEPF00012E82.namprd03.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::98) by BY1P220CA0020.outlook.office365.com
 (2603:10b6:a03:5c3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 23:58:06 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E82.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 23:58:06 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 18:58:03 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 28 Sep 2026 18:58:01 -0500
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
 b=TbICLjzrrWh4VNAnJJNYeXQkkHMtq/zf+45KHwSVQMp6gCVrPXI4ztVc2HXiON+A+qJdHzk0w9/7+T0+eQ8tLEO2X/LvHf5Bj+PrEJhm+anqR59uOZBQ0RQseMW1mzih6uPY9F7a2gvuoIs2ugbPKlGueC7zdRSeQjnkb/N1yGG1XcZdqeXFzu8EWn2P4qkEBr7V8FoFoELCXLzvEBKTseeI949e/lJikgjQJlulcXGo2+LaCjx2riTnatEE8zgFhSwMtC9Ks9VTh+mvllD63BKVcI6/lqdi+KVLWMx/pGakbJurUntqdStvFPjFd0M3pwVAA5hmkI1CjcQmRrRs/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HiISDdy3MR86W2mX/SIvv6uSO0oA735U5fb5jKWr1wY=;
 b=UTqzR3AVair4wa3gWpzQmxZcv0GGMw3Z2yUcq4dE7OMjz9I/7cL3bgaMN+KA/fUZViGcQvKSlHRCxhoo12DnwRsLdem1vGKCsR88wEVdza1a61LQJMEZEXVVipODXxoYdrjAI50wp3bvyz0p+11qYGLInU2npMJLd+t5eZbL+83+FTUnangzBtctxO401Y6/9wTI6x3dkizmmzNmpGRnpQDxUwcBRDzU+PSm3jFP2OvTjzGK9KpWFfI/uxd2ceBqKH8jwFSLYUDpRZBjuAftJE7xT4SCHCgxAGtY38szcM6ZpZ4PBJZojXRLGjCqxRGLUgOhwDfvs3bE9F4YATQOFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiISDdy3MR86W2mX/SIvv6uSO0oA735U5fb5jKWr1wY=;
 b=UKNLfD6OBfcQgYxpBzIMhVK8YgR/GuTnOG2OXn197TY123E0+Y1AddSvsO4ulWqvPTdHSdzTeVFbyxgpYPQ8yygGKbEo2T7vAEKCHWZxlHnvsTZjg0URZel8DeuzEACs2s7e72Wz0bNVQlvxpx8m+Yu5w6HtdW3JiG3pCvuNHYQ=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <c7938ed4-e900-4c4b-b4f8-a220405c7a81@amd.com>
Date: Mon, 28 Sep 2026 19:58:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86/svm: Cleanup vintr_t type
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
References: <20260928140248.1543013-1-ross.lagerwall@citrix.com>
 <20260928140248.1543013-2-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260928140248.1543013-2-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E82:EE_|IA1PR12MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: f35a2914-e7db-434b-ada0-08df1dbc5717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|22082099003|18002099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Of6tEI2SIDfJWTUdkZhX5Kz6XAJv6OltVGuxh3WQAbYGrbkpTAMZlLVcKT9dZhXqOfwPO3jYRg91kMYip4m1c3BIfqBIJD+MUljhOICzmUewuqNQR461FmiIA6oc9FUSoRfb0MM+uqCICYoXBK3onY+CTod7elfvROZmR5+zORcjgoEzQsbj6vIqN8zxpDQGRG2zd4ccTZzScE/TI2HmAsK5fbXy9m00vAdO/O/ddhHBM0O6xP1dpGe+LXjQkipcTV84RAqPHgEAe+NKbhDdqHPcKUbuMotxqKr5OLDPYkqQ7HKqDHyyAExQVkVYFN0Bcli8n4qqe3bKLCpM9iQ2//0SQ/2kx1Q8Wz4RAMikhAPEmZiX3Sero+9726P+vRM5r6R4sBcPAGEBVVBsNO646Yxweek8uf20PrgmrV55ixZ6HkEbgLUbiFpizQwy5Rsr8/Si429sLNDu3j0rt8w6PqXwtoLU94rssqqhY0eeWG5CEaFm+WLtILJBedZS8rbO/bZeOyonZiXIJZOadAjkkPLsjl4C9WI9O/bleezcLiS9jYwVipzvZMVjXztdol27YhlUSFwBi9Y+vc1vyFH0oimUnH1J73+9k4lPwG4muyNNVNqLLnPxMA6hEw6b+sJWmMWXN6QEN8l1w06+S4l+tScfbB+XmFdVSc49OYSAu7SwdnMEPpVxDdWGeP8TU53MheeiRnLeUSNXYce3oJkcfQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	J/bQqiUuEqPiGiExInfS7RiVN9s2DBU4q/dcDv7PvOHfd7lkQVi5wxJpq/noTy31zxWfRWM8VrTUEwjO7l2SiXcv+XG2qzejxjgm70lwyleJjhZdu0hPNESFIHYYKXSl6buEkmrpF03o1yzOVR5vryq1tahfNRTISshupq+JO2iENqDBT48Kl9m47z4QuEXE5Z6LmYpvqv29J9Rp/0pDlmObvHgT2nKV21jSqLE5HAnSRRpZmIMS/9iG3CpZdo3QKHjtucSA1gqMbfdc7Pxwiv2r37f+hFSqNftb6cpjf5qgVLutSGtaNQZ2L7QdGQjeIVmBv5SN/a4rHB07/zE0E4dn0lxRTvAgxNLvgFjnRdjwAgpPy3gH1t8pfqkm0Vxtuo9ZJE05FOgXngDaz28BUFBfM/ccIJ06TB8lx+dhsSBoZkmxp8xEp4QC7Ztip6TJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 23:58:06.0809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f35a2914-e7db-434b-ada0-08df1dbc5717
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6531
X-purgate-ID: tlsNG-720697/1790639894-F04A62AC-544DED8C/0/0
X-purgate-type: clean
X-purgate-size: 438

On 2026-09-28 10:02, Ross Lagerwall wrote:
> Rearrange the union to drop the .fields infix, rename bytes to the more
> common raw, adjust types where appropriate, and simplify some names.
> Adjust the users accordingly.
> 
> No functional change intended.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

