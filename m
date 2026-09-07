Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F3FC79FAD
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 06:37:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410588.1641396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3Sys-0005by-H3; Mon, 07 Sep 2026 06:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410588.1641396; Mon, 07 Sep 2026 06:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3Sys-0005br-Dg; Mon, 07 Sep 2026 06:37:26 +0000
Received: by outflank-mailman (input) for mailman id 1410588;
 Mon, 07 Sep 2026 06:37:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x3Syr-0005bi-CM
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 06:37:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3Syq-007N0g-PH
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 08:37:24 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a9e5b97-2eae-0a2a0a5409dd-0a2a4508d1a0-46
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 08:37:24 +0200
Received: from [40.93.198.45]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a9e5ba2-f659-0a2a45080019-285dc62dae19-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 08:37:23 +0200
Received: from BL1PR13CA0204.namprd13.prod.outlook.com (2603:10b6:208:2be::29)
 by DS7PR12MB5837.namprd12.prod.outlook.com (2603:10b6:8:78::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.15; Mon, 7 Sep 2026 06:37:18 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:208:2be:cafe::97) by BL1PR13CA0204.outlook.office365.com
 (2603:10b6:208:2be::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Mon, 7
 Sep 2026 06:37:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.1 via Frontend Transport; Mon, 7 Sep 2026 06:37:17 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 01:37:16 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Mon, 7 Sep 2026 01:37:14 -0500
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
 b=kmRtBCmB40lpkxmj6VeGcyRKCn8GzmVc8lVGTSdPbXqMN76vQUEn6vgGT8hi3K3X6oXqZ5Fj6IqvZ6cq7e27LPNl1srUjmm/vWUEnjf+gOWTD2ZCJ72W9zT5gU7rys4d8JPdIZqYRbcnLbTUKQWZjfv32PwYjhIz6ruDf40AX8ozOAlNwUT9cp7WpND+EUllPTcAWXShhRJlI+p3fguRiKH7zn0YF1om47L8MSmhysrOHtRt9V5UM/D+/wdt3PEGasYQcEQSHZ+d+lwoEnj120mJ1z8DKSE/I/IZl2cqJ+KSjxxjgkwyuMB1QizmdKceO4DfVWyOkc+mYBTtD3Wpeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4StcKgkQ4GBBNqC7rmJv1+YJwlWU0j125A71M3d4aA=;
 b=mRyzLWO6YYrMndoYp4UUJF8oxbxlR/SoO0qtT92TEWvKnXQ78Nzf0d+hqUL7EU9eczaPNojit4JVN2nnmEoEbpbsg8g+V2mpvdgI8UqztccZzJnjNdzijdPoFeU8OL+xsLQHeCKDkJjKWI03/+LTCjzFIgR+kDTa8k815yxBowruGjWNdexOLbg742JiJQ7SHVVJ71YoMHXCe/1EOb2rTD4r+1/b48A6U6Zk48gP6BhsAcX644+11hKvgEMl2wq0WD8H3+OS/Blx+QVc9dAWrCZJlKCP4vRcNSdVO9lqc9ZwrPSywxV4ULAFQCzkfjHbu4Ho+Qpi21JiG5SVwJWzXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4StcKgkQ4GBBNqC7rmJv1+YJwlWU0j125A71M3d4aA=;
 b=M4xQOqKScxHz0mvOA4FXGIGqGASoEYU+g7jRQ4jVrv2HfLrk7bwx46rgpG1K0R6WF4XrXo2OZe433hK0ntyYlDZ1URmvIdLEsRN34xWthDbhWEdv7LSd9hb77MLh4F/6gOdd30nYgogAT5g/S4kvMs3J4RI8XUZoLzLbmJNbsOg=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <a2d18ee6-de89-4da4-bdb5-0d542d457d2c@amd.com>
Date: Mon, 7 Sep 2026 08:37:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/14] Arm/guestcopy: deviate copy_guest() uses just like
 their x86 counterparts
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <volodymyr_babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
 <a581e503-f1cc-4ae9-80ee-6b32653e8084@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <a581e503-f1cc-4ae9-80ee-6b32653e8084@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|DS7PR12MB5837:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a4ac08d-bea6-42cf-215e-08df0caa763b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	p5qVCTwZ7XLdVYjJYt5yZlJKq9Ppi98fWgQKpNw/vsQ4w8Se47WXv8EnQ1fcJd6Z6H/DckdDa+mt7UPTMOq0vzVjK5UJIY92CfvpbefupILdiqh6xFi0rGgxOuyvI6ErJI4te/968qSKpszdkYx9S7vDM8J3TXmyvfIpiiZXD832fRFkWqo6Hr0QQbVKD8x2jPAsb6zCL45D8g52UNbFTtQcy8G79+gYzEdDuoGyqF8mO/rjMEyTse4jvK810gylPXNvP0WIIXZzA01BTs6RPaZQm28b8JgVlwB5fy1vi4dLpm3bvXlOOCIDOGLBagZ8d3oc7HQJK84of0w1EedsQ8OcuHEE3PbLbRYCNZHgAhxh3FolJTzHw7oNgaITuraHCR0R5dHaLp/gCmuO8tBcQhxhDpKlE9mfeXarIGaRrDnw7Hv0Pwxxq2HjEkL/w63PCHI9LfclX2SJ2xJftVLWQi/08RLTB3OfaSYVCd4tYehh7YhAgoBgAT6Ou+FXZCuT+xiIrPj3T+MMpwDQDPC2WQKaoEA5wyUg0fOTJ8etBK/BWoyNWdZ1An1gH6B2v8uVL07K9iXveS4pH817qruUySo5FTTodnEDLyjfsoWfxE+SXiPPxNTbnp4GB1ag4bwmwyvlSS/UpK7aURuNRqSwKA29lOiH9cEeIXeYw71RBzuAPPX0mA8968N/KfFE9AR+8RcDSvu+vPB5a0Rz4Fl/Ag==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eeboS0hosql8OIzBOffG92MUOHYmeqvFlt0P3iY1CdkvkI0VdEWPMH5HYj2u0DJ2B1rJ/S3mXUUZubGvmIzIoqdS9VN/sZmmegofdu217tB57ySJwmuoKtvpnRU2BRXbG8rKIhZwU7o46zh9WGLv2MOH5VCh4zRcDeLpBuw1DMJvvRZFKV6asKZ2Hi0DmQz8tVJ+Ilc+2GNMm6ycE1XXj7gdeGk8a2+j9zEjgk71aa/St6QFhbP0flMEDr4Lq5uUg1RSSdw05Y3VBWEMHikj0b96GTyOiBnOYqI3/yqglRRfAWFuoGT0e/iPPeDmC6RucYlyMN1HJnQfkk0NJEuVupShYqsKlNLlP8jIY3xDh2bTGkMtkby4PlWYmymYJhMeqkN6TRq4IEVIkM0ZQHR6ogsVzdqc6iu3Qe+OzIL/Bzmd8f/YFgepMSZiIylBt3P6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 06:37:17.7042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a4ac08d-bea6-42cf-215e-08df0caa763b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5837
X-purgate-ID: tlsNG-c1860d/1788763044-CDB4987B-B84D59A4/0/0
X-purgate-type: clean
X-purgate-size: 432



On 02-Sep-26 08:33, Jan Beulich wrote:
> Like x86/HVM's __hvm_copy(), Arm's copy_guest() is used for both to-guest
> and from-guest copying. Naturally in the latter case the hypervisor buffer
> needs writing to, hence the function parameter cannot be pointer-to-const.
> 
> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


