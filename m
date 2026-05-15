Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F82CD4F39
	for <xen-devel@archiver.kernel.org>; Fri, 15 May 2026 01:02:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1309314.1580340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNgvr-0007LK-4f; Fri, 15 May 2026 01:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309314.1580340; Fri, 15 May 2026 01:01:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNgvq-0007Ja-VU; Fri, 15 May 2026 01:01:38 +0000
Received: by outflank-mailman (input) for mailman id 1309314;
 Fri, 15 May 2026 01:01:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wNgvq-0006ND-0w
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 01:01:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNgvo-000fk1-5a
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 03:01:36 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a067066-2eae-0a2a0a5409dd-0a2a45048a66-18
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 03:01:35 +0200
Received: from [40.93.195.37]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a06706e-1dec-0a2a45040019-285dc325780e-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 03:01:35 +0200
Received: from SA1PR05CA0008.namprd05.prod.outlook.com (2603:10b6:806:2d2::15)
 by CY1PR12MB9584.namprd12.prod.outlook.com (2603:10b6:930:fe::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 01:01:29 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:2d2:cafe::20) by SA1PR05CA0008.outlook.office365.com
 (2603:10b6:806:2d2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Fri, 15
 May 2026 01:01:29 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 01:01:29 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 14 May
 2026 20:01:29 -0500
Received: from [172.22.59.187] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 14 May 2026 20:01:28 -0500
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
 b=LC5mk99qvxWRCon06e0XE2+eORAxlWCTT/7BtMiVpst2KC2cjsMqXeTeN7LcpZX/Z0r5wMyKWhrV6H024zxpMXcGmqJOL2BCbIo2nWOAvywMosTOjs2Q3Fymi+CBIhy2eP7Mayqk8/yuPC9xgzCxuExdQ2cyd25FARixK5He/uFXou9mlDhuWlMc7HxhAQJEyZqvZ8gdfduX+bA50I2o/k+9Gwwm+M61lvXl5lEDebfkcPC4YqneNPTptTOiW6U2mZ+aZzZfKwYU2kLqGIZJZU+qyphyx1tGvvroNI6gDBXukriarUr472PE+3vSeNUSkDTF0WonpvQy1g2IBh/Y1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Je8W8zM4s44lRTI5pNkIFUj9YashlH2zchz5vH3mpi8=;
 b=WLNhOVND3xPRvodRehhcgSAG9L1qjINHIzSrfJzUn1OgBxFy+dAchTjoL1laQNJzhPO88ljKToVpvcvKyiAce6HtG0bnBbt8/XysGztfLn6f/aPnIZQA5zAFGlO/z/npSt5bGl0coIs+/54/Yr3Y3p6AZ50Zn2DYvNIyKBWzhDoUfp4Nst0IE6dIl0YNSQUvljlxVRQgNeqepVzFHBowp4aY6Yx36s4/hMZX/yGLVzsAfAUDfPziHqweNnNIeZ/F3zI2ldrCFgB7ZdhPctN2mf2hjefmvyPuHCLWEJRsZuU4FlsYmeixOW86nrvezV3AeQytv0obyMahzyV0jsW9ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Je8W8zM4s44lRTI5pNkIFUj9YashlH2zchz5vH3mpi8=;
 b=nDvS0Dq2yA13za77NMQiG5vLgiVDUGrJwpDkGErwqu7akey4I4h8LdgUzpqtHbPikUlZyc7npRrdCV13WVaA07V1hW3T7+mwF2BCAXY74vGLPoHhMODjSahVpgxaDRLc697/zU/rHMfyOohK/oA3FeuDsCkqXYWq/8EV8/bLBKc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <591387c7-e78a-4bd2-ae52-c98d66554cbd@amd.com>
Date: Thu, 14 May 2026 21:01:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: map_domain_pirq(): pirq already mapped?
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>
References: <700f3bd5-2887-4f30-95b2-5dd19fb91abe@amd.com>
 <agWHLHzvhKCLQMI1@macbook.local>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <agWHLHzvhKCLQMI1@macbook.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|CY1PR12MB9584:EE_
X-MS-Office365-Filtering-Correlation-Id: 95e40369-d5eb-4cae-c194-08deb21d7f57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|22082099003|18002099003|56012099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	R1WJ0cnwIA10hqERQhNRrit+hCFsZwyM9hveQzBRb5DvZXm2RBbyHEl/Cun+Ugo1e5JB4RMF6gdJgD/5NF1lyUT7OgbksVICRXwZavdlxuxf4TdcqzbWPtufZh0BJvd2wujuSua/AYElH4EKelRrVWR4mdJiDxt/zZSRXTslt9cHd1X+cWVoRHlLOxSS6ynp+d4fUXjKGqPfs5hUyZKAdKC8Gd95N4bBUq18I8S+lvJgLhV6Iwx7hkaUio4mYOWoyWZ4/EjJ7qLESpMACvtRJBJaZG3Txc0OydQMv+D5rnVIvLUk8He3bLNYpX3SDSEY3vWc9fZff3C5OgC3qj2MB+Nuv06VRzOOXtH7GFWTYWQ5RCGjm18MdQfjFlRdIEO0pOSTfPTScQ5/ZJaQAP10U3AllOIwT5SaPIVu8NiIlPPT6n1fpb1dKgls5W2NY0g5CN3LIdQxtVJTswiUjCu0w1xI1+2djpyolPQqXC7CBvbt8253UxRNNP42cRNjFL3F3Ujvuo6hxe9AU+Ndl6+N6O052XHVNh37kdxSlHKd1YG9rrO6qyuhfsS5bQQDdEHOG/cnx5g6dFSX5rSE0/24HzX7GwTVQDgB5/t2gY2hedUt5peqJCkcbWWNxCpSV2fxJHYC9IFh/S55zB+d7IJEVLB4NUVUBiya5zoWSDshuc5I1Sm+exCKni/amEuEVt+ji5E2kMyXlUQ94OLVM7QGYgM7r99/3jHgx9oPvOhB5u8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/7S4+UBS1UVwOStO3ktXyrcpfyrVGnoXnBwclYyx7wBYU/Lx4NOfqiGTzshUmZSoxm9m49VFbN7ycmS6/fGiJlLLIA9IpSNpuy3KQScEWwCKaI4ukGtGZMb1tN2l1DKmTbJKQSq0e1pwYT6vgQVurvY682rQK4YP0Z1lTto2AMPFdIRqbM6ZF+WvE25xvhuCdwcWtxBhT8Mme+o2pBGSHfel7ccUODXDbhb6iHjwp5QVBwAyOkyKqBAIGBRVrc6T7aGCEzI+Qb52tNVYqTyky+D3wYj0T87OBS2cYNGb41PgbESjXIEW9rvi8vx+/+QGR5FS/SnCllTspTNqsu9KNMGFQVJRd0dvyEJkt1rN+roFNqIkFK4e1HDd2oKLRNELPG+7f3n2pSOKOBTAnNHLtwUtTvnRvBZTG8Ot2+qntmvlwSaOVtyAHFJq5Xb64KnX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 01:01:29.2729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e40369-d5eb-4cae-c194-08deb21d7f57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9584
X-purgate-ID: tlsNG-ebf023/1778806895-4866B3FF-B290B3B4/0/0
X-purgate-type: clean
X-purgate-size: 3373

Hi Roger,

Thanks for taking a look.

On 2026-05-14 04:26, Roger Pau Monné wrote:
> On Wed, May 13, 2026 at 09:18:46PM -0400, Jason Andryuk wrote:
>> Hi,
>>
>> Early in map_domain_pirq(), we have this block:
>>
>>      old_irq = domain_pirq_to_irq(d, pirq);
>>      old_pirq = domain_irq_to_pirq(d, irq);
>>
>>      if ( (old_irq > 0 && (old_irq != irq) ) ||
>>           (old_pirq && (old_pirq != pirq)) )
>>      {
>>          dprintk(XENLOG_G_WARNING,
>>                  "dom%d: pirq %d or irq %d already mapped (%d,%d)\n",
>>                  d->domain_id, pirq, irq, old_pirq, old_irq);
>>          return 0;
>>      }
>>
>> Why do we return 0 instead of -EEXIST?  Since the pirq is not updated, the
>> caller doesn't know that pirq won't fire - only old_pirq.  For
>> allocate_and_map_gsi_pirq(), the new pirq is still returned to the caller.
>> I would expect old_pirq to be returned so the caller knows what to use.  Am
>> I missing something?
> 
> Looking at bfc341a65cfb2 it seems like this might have been an attempt
> to keep the previous logic in ioapic_guest_write() that didn't return
> an error when attempting to add/move an in use IRQ, while switching
> ioapic_guest_write() to use map_domain_pirq()?
> 
> The commit description is not very helpful sadly.  I think the mention
> of "And this patch also makes broken NetBSD dom0 work again." is
> relevant. AFAICT NetBSD will do PHYSDEVOP_apic_read -> modify RTE (ie:
> set mask bit for example) -> PHYSDEVOP_apic_write.  However the
> semantics of those hypercalls is not symmetric.  PHYSDEVOP_apic_read
> will return the vector used by Xen in the RTE, while
> PHYSDEVOP_apic_write expects the vector field of the RTE to contain
> the pIRQ.  I think this is why map_domain_pirq() was adjusted in such
> a weird way, to ignore requests with bogus pIRQs and still succeed, so
> that PHYSDEVOP_apic_write would also succeed.  Ideally the interface
> should have been adjusted so that read/modify/write cycles using
> PHYSDEVOP_apic_{read,write} would work as expected (iow:
> PHYSDEVOP_apic_read should have returned the pIRQ in the vector
> field).
> 
> In the context of GSIs, I think we aim for Xen to always identity map
> them (so IRQ == pIRQ), but there might be (or might have been)
> hypercalls that could allow you to create non-identity mappings
> between GSIs and pIRQs.

To support non-PCI passthrough with Hyperlaunch, we added code to map a 
GSI to a vIOAPIC.  It does not require identity mapping, and that works. 
  It was while testing conditions that I expected to fail that I found 
the behavior.

First map:
machine A -> guest B
Then map:
machine A -> guest C "success" from the return 0

> Explicitly looking at allocate_and_map_gsi_pirq() do you know what
> causes the domain_irq_to_pirq() in allocate_pirq() to not return the
> already allocated pIRQ that matches the passed IRQ?

Well, it's PVH and I'm making up a "PIRQ" for the vIOAPIC.

> Overall we should likely adjust map_domain_pirq() to return -EEIXST,
> and then fix ioapic_guest_write() to shallow such error so we can keep
> the current behavior for that specific interface.
Having been focused on PVH, I didn't look much at the PV behavior.  But 
it was still surprising to see the "no-op" success.

Thanks for the pointers.

Regards,
Jason

