Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02ED9CD8CA7
	for <xen-devel@archiver.kernel.org>; Mon,  8 Jun 2026 22:04:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1332116.1594756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWi4V-0008CW-BE; Mon, 08 Jun 2026 22:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332116.1594756; Mon, 08 Jun 2026 22:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWi4V-0008CP-8U; Mon, 08 Jun 2026 22:03:51 +0000
Received: by outflank-mailman (input) for mailman id 1332116;
 Mon, 08 Jun 2026 22:03:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wWi4U-0008BA-Cd
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 22:03:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWi4T-005Q3l-Pa
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 00:03:49 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a273c45-e002-0a2a0a5209dd-0a2a4507b014-0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 00:03:49 +0200
Received: from [52.101.57.2]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a273c43-229c-0a2a45070019-3465390230de-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 00:03:49 +0200
Received: from MN0P223CA0007.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::27)
 by MW6PR12MB8760.namprd12.prod.outlook.com (2603:10b6:303:23a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 22:03:44 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:208:52b:cafe::3f) by MN0P223CA0007.outlook.office365.com
 (2603:10b6:208:52b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 22:03:44 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Mon, 8 Jun 2026 22:03:44 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 8 Jun
 2026 17:03:42 -0500
Received: from [172.17.22.200] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 8 Jun 2026 17:03:41 -0500
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
 b=gn2lIollSbWT+NybHgh1rVoEKxS7nx+bmOTbqmtSHyRH9nhS+ukmMM//ZhxP4EOqnKNu/HOkex0jCFtbP7L/AuJhjimw3f50gRBPOHsziQRSRFvVNfGtAbPluhu5296lVY15ZLZKNyVaCyV/MPG0OjrQMs++pI6Ih6w41ppTVCEnF2BuGx/NgWIFGZfQCzrGZssViGWw6QBr1TWaC4ukWXKF6SJNU1svTlR2sDKY0UNPan5c1rs3fAKqcII6pfm/2neDyzBwd8BuWqc0ANkabjf6ST4f/r3+z89Vj+bC6I7BIlTz+20PvJHY+OnI+bxzkJ0E23Snr2E//qDh6l48jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQeQ9TLTMTCKT6Tbp1P8AwU+VqXXdKy2zq/iIDiEt10=;
 b=Fc8oIwOxOUJ4kaoCm3W+wHDGTlTcMn8HB9VT1CRUk/ewyH7B6jQcwOWXZdtNlq/+N7cA0RYzt0PUVZNe+Xt+BKDPbGR0dMmz47i3QwrRoTaTkInyJiztaoI9rNxClpnbGxC6ssaUTorp5VPHmGJL8HTrNU8MsE14CJnaR87LHlAfWS4bIhZYdw3q+eXcm9tfn4Lq7yZ0WXVXYgGmJwxvVIdh1a80ZgwowTOvclgCf+TgSyrFqxCv0JP8+/1smkx4dUOz9ulJbIVMSVEIhR1k8iyhEOQHGdT6Hx2OPSSfLVIKPn6PliwMz8NE33VC3mRb7WZLsg0VEBwgTgvriXDMsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQeQ9TLTMTCKT6Tbp1P8AwU+VqXXdKy2zq/iIDiEt10=;
 b=wlX12h8eF4sh9yauxfSofDIWAJoOoNf1qhM1Ye0TFQL9wjIvZImzNtpVof66Jn8pcYrfgcdBF7qx6fMQ/wAmPFRA7nec/6xUMAA59m2MNVNoUWRUMVzrtQt8Aj2b9I2sc4kojrtUu5g8rNraOkxN+ULFYZFOsSt0zwbTYJ/fShc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <50e8aa69-fbd8-43b3-9783-6b87851f4384@amd.com>
Date: Mon, 8 Jun 2026 18:03:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] argo: few log fixes
To: Christopher Clark <christopher.w.clark@gmail.com>, <dmukhin@ford.com>
CC: <xen-devel@lists.xenproject.org>, <andrew.cooper3@citrix.com>,
	<anthony.perard@vates.tech>, <jbeulich@suse.com>, <julien@xen.org>,
	<michal.orzel@amd.com>, <roger.pau@citrix.com>, <sstabellini@kernel.org>,
	Daniel Smith <dpsmith@apertussolutions.com>
References: <20260604214926.1735194-1-dmukhin@ford.com>
 <CACMJ4GZW26MGYr9RbCw=tO9rvrpL1u-PAHG9BaFvyg6RnDDfAQ@mail.gmail.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <CACMJ4GZW26MGYr9RbCw=tO9rvrpL1u-PAHG9BaFvyg6RnDDfAQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|MW6PR12MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: 14366a21-d2a8-4b50-c36f-08dec5a9ced7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	gIj+0bLeTx0GTGjqXVpJ/vyCcD/NlisKhNulwbOhgvsZz0zrX2Np+c5fPDq9Ptgxixcsx4HdlHzy+Jhm/kVUCjMJrdQYG+lRn1aKS5skAJNLZjNxBT70B4DuxGjvRe+/W0UM5xiBt4pV8TgR7Q1/LoGedZCw3odw0YvbxBHBisQLXV7SDBztQ9JdWQbDodtCRvdCrBlNInxCgt2YhmuUOWF/fFCozcDXdUh6Ye1q9jgSB1FSQ19HF4c2mcWOVztkM0vTYl49Hf/qpmw/X8Tnn8BwJkrZ+nFANVj0iSL2yrLDe+Zv0ZEKBx7HuRzAJUPggSIHqckb2c1VkHvSHdaFiYt7fw31qAKl3MT4rVJKQCt/mpWhm2arj8Qf351RWyMOZ7eqe05eLB9EcVyzjwaCt0Xw3UJallUTaeyyFXxOO0P1oUs5oRr6SyuJI7aK13FC3QNCmJfdb1Q2ZT5sGSzcgvmo0e+CjdNz8/G6uWVSMjvTfOZ4p+T7nvOqQBe0VzfA9vUUkLKRP4unM/tRKZ4IfJ/CUO9OfnzyQ6MoHqB9Lg9gdWmbkS8FbwJJtIVO3TsA+WxRlQpzdHUXU5/dupq+eiE7aKBRs1drK1XbQM1gIpr7ecEG5/tJus/i1SJaS02s9YOKGHM1muIz1oZSJAC1t3J9pR5wYaLeY87Yqtm3bVLUlRYN5xm6dBMPkQBOboL0utRnezqtHd2YBJO9G/IFAlodO+bscnsPUcI+wisLa/4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VR/u4G4sUAL6HIjBuwnT6cBPOjWnZ99Hk3hDwpWvbUkiypdyrH5VUEP/9iz0b4bPzKToXb9qKhnJSIsqhH3fHirBgpX8s2LBa09R1wMoPGm+LDhb6BPHLnLvOXySPJNm3Pjq8Wux9w9WIk5C1nif4AKVUmDa5c7wsKPfdaSujKHBIPl9Nbx2SWXnnnGtn9aPZbMsVlwPPhiFDgpcqr1+6h3TQTGsth7PV5URSekhveEgWnprGqKrlobMDeLzTBLUJzirUrHrnVF90y7QmhYP7UQCCXmPjGkCyTbDWE5KDKYe0znlBA0uboy9AqP9s3YcnDXDi9p519SEtDEtWClqDQzc8oBwVgHmuDEYk/vHmvkofv4LrwX2LwGHgwiyZ4lMWzdK9eQYIChJyL3kWWE4hor9VhFsRCg0kexTcMrl+Jz1vwQh6wQERs5Jk/NLcfyK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 22:03:44.2659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14366a21-d2a8-4b50-c36f-08dec5a9ced7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8760
X-purgate-ID: tlsNG-ef75cf/1780956229-21F6EC48-4305FD6A/0/0
X-purgate-type: clean
X-purgate-size: 670

On 2026-06-08 17:49, Christopher Clark wrote:
> On Thu, Jun 4, 2026 at 10:49 PM <dmukhin@ford.com> wrote:
>>
>> This series corrects Argo module tracing.
> 
> This series has been committed to staging.
> 
> The maintainers were not CC'd on the series, and did not provide an ack.
> 
> Patch 1 is rejected as an inappropriate change.
> 
> Therefore it needs reverting.
> 
>> Patch 1 lowers the verbosity of a spammy log message.
> 
> Please see the review comment provided by Daniel on the v3 version.

FWIW, this comment to v3 was only posted today after v6 was commited. 
It was not an unaddressed comment at the time of commit.

Regards,
Jason

