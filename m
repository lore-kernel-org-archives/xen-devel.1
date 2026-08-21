Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EB9C5DF8C
	for <xen-devel@archiver.kernel.org>; Fri, 21 Aug 2026 20:43:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1397824.1634645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxW4c-0003ps-MD; Fri, 21 Aug 2026 20:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1397824.1634645; Fri, 21 Aug 2026 20:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxW4c-0003pk-IO; Fri, 21 Aug 2026 20:42:46 +0000
Received: by outflank-mailman (input) for mailman id 1397824;
 Fri, 21 Aug 2026 20:42:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wxW4a-0003pe-5J
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2026 20:42:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wxW4Z-00009j-F1
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2026 22:42:43 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a88b822-8faa-0a2a0a5109dd-0a2a45048ac8-16
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2026 22:42:42 +0200
Received: from [40.93.201.52]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a88b840-b57f-0a2a45040019-285dc934cbb0-3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2026 22:42:42 +0200
Received: from SA1PR04CA0011.namprd04.prod.outlook.com (2603:10b6:806:2ce::18)
 by DS7PR12MB5742.namprd12.prod.outlook.com (2603:10b6:8:71::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 20:42:32 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::79) by SA1PR04CA0011.outlook.office365.com
 (2603:10b6:806:2ce::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 20:42:31 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 20:42:30 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 21 Aug
 2026 15:42:30 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 21 Aug
 2026 15:42:30 -0500
Received: from [172.31.17.222] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 21 Aug 2026 15:42:30 -0500
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
 b=ivpANpnQ6k8Kwa/TyT0ks+0uMxtZkzWlVKhYtul0bSnO5lYRmRpvu45uPqlFitiBNPPHCsl6o8flVUMG+4RqOzs1zmgG/Jn1iuzGr9cwj2lhMgsi8hdoSnpOcwPFOFy+mKPjqCJPth6B1k3jDQy1TB8JQldwcPjmUk6nE2dOc0JePNPGbfyFVOAooHcdH5qvdOYQRFAUNbRYNAInM1t8eHtClK9lNQD2ZsJLjWq6yADtsZbIG3/gLNJdpVF+TRagpgPs8ei4OnqUCoNFXgenXIh4wBnCDCDbJDPkvQ7qCME861Eos5BSHifuSsULGgNBxy2SSQtCwNGZyEyu/2jj/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfLPMpH8LtRG8qnXzF/foDvebuOFDGtRC45knZK6XFQ=;
 b=yl5qqf0BCM8ByovaDWP5fG6IbsCihBOTiE09sA3hm4XT4Q0rPYfczVJBrh3iJEggcJpjOO7ixitQhpeFoyGa1uJZcY/ul2WCg53IRnBgoVz5IKUzIeL8DlFmrBsBmPYWUA6bDGgYCy0UmgPyMlc+nYdYnqZXUtPOohDmCg7h3GSWwKHW/6SGgGg6RoccEPgSdI9xZZGiM4krjstB70TyVzByu9hTjhXmbkMt2lUpLRfXBOySwmcvkqZshDFkSLXVrT2dK5D+AdleHHvoeOqde9YOu1FmD9vgzQh4bceedaZQrDCSGB7Anuyp+RolnR/ECOdDOa1Y2dkJuB3ujIWB6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfLPMpH8LtRG8qnXzF/foDvebuOFDGtRC45knZK6XFQ=;
 b=wpTWSvm04I6h+9XZOgCKJncsDf97pOv89q0ubTlGdYcpUV6BwuOlHn+kZYPlhGUIZ/V2dYf00FGOXYcukynEjH5+0dTdZDVAlJdlMIIMqK8gbDr67QTbAMbRJkvxmSkE0EK5fLnJpA5CDLUXDVirop5v4FAjqDtyry3FsUxaEzE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <170401c0-0d3b-4481-ad3b-e3f149a4843e@amd.com>
Date: Fri, 21 Aug 2026 16:42:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Linux kernel crash in amd_smn_init during PVH Dom0 boot on
 AMD EPYC
To: Arthur Borsboom <arthurborsboom@gmail.com>, Jan Beulich
	<jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>
References: <CALUcmUkm7eL2RtqAn3fJxrMdY4aj8AYzkFZfs7LVwntSLa44Wg@mail.gmail.com>
 <4a1b5392-93b9-4b9e-bf65-3fb280f385fa@suse.com>
 <CALUcmU=QNXA8gs8JYy01tLVOH-y8mjZM-GxKzOCoA_3e2QFVwQ@mail.gmail.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <CALUcmU=QNXA8gs8JYy01tLVOH-y8mjZM-GxKzOCoA_3e2QFVwQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|DS7PR12MB5742:EE_
X-MS-Office365-Filtering-Correlation-Id: 64840380-124a-4bc9-e50a-08deffc4b8f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|10067099003|4143699003|56012099006|11063799006|13003099007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Hfvug27uX88TrL1XSlSUAdg3kAKpHIZBsz1tLXWJ0py5usMp9MXErfroHQxcci2iqQX0OXbyFJj3x/EJFii00eIZojRbOYu9giVmqNCKq+HfnJ4zW8xTWIFsIoHyzjTrE+fACDOBEXrgunsrb5ACcCIzZRmBvtcWmILxOfMPKkJoho0Y/SIt+JQBrokR6B7mxxWSp27a5opEWez/E8+Ak3bpORPi+aa4V2iv3FF/kcf5KadEWbRrTwSc7UQOujv50l5AgRefbdUJZmdNCHCDeGiP6tKCBtjYkyHLkvP5A8l1u96LbX3vC5iS5lQEjU7ojTZKTxOBwTX/ayh1SgK5+LfuYMuYpQWiP0YL0TV5G+ocVWslFoY+J2M+LSzDO5W7OrVd62C1qKL+XTbgAzlhdcujcPeIUMvIPt3/j/HN0EGh6giopR4DCm+fat8AtczRaJfzFqcby5TQBJ8ekokQnV37OwnTbQY2733viETCk5AZJi1Xw7nhwAnT4XCuNvmLgeWQUOTm475kTT6oa1w5lstbmRSidLbhatIVPJjK/8rXO3AVW6UkgBE95U70G2Pq4JpvTcoLWnssqtv23CXWlg2Kv3P9pLd5I+CBynNeIkRGGS6LRBD+v6C/QVp+UAu63JQUjdenxpYxnxYmlg2MM3VASYv79hDANHW16iZIVk4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(4143699003)(56012099006)(11063799006)(13003099007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bqgxChAk7XlRnS2n+Dbcn9SKEIqmFasSal2UtWf5Nfzs/zAlXz119h3kPMMJEmx2VqGGO5p5Ar5dJu/X5PksbwA6attqZHMb73WTV8HbQAwPVUMNYTL82saCRnc/I5OmjUjLBFH6UBRDwl9CHuUKoRGZsfO1By/utd+oN07rmxyVnnoziKvg5EZWjrtRD9xlSxYgnfnAWHIttOvPsmDGLNv3Bo0pU0sB+4sPG+iA6blqm/QuOGPSUJtcrXkTOWVMXGo6mDc+v11peMoM3lrWOZR+qASUpkyMKrB0QZMcy5udpURISP4oUtPRZhBkjCyPRAJVaLnW319SsnyoV5POoa4O3lf0rjOpY00imfSlSiqCUsS029GkfBIETovC+LVW7akEvYz091OZeOOqh6X6wGvfemQz67Fj7LkB87PTgHTApVFE0Mh0LSATlwWgDfkL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 20:42:30.9629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64840380-124a-4bc9-e50a-08deffc4b8f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5742
X-purgate-ID: tlsNG-ebf023/1787344962-C22D4B50-2ECBCDF4/0/0
X-purgate-type: clean
X-purgate-size: 1551

On 2026-08-19 03:09, Arthur Borsboom wrote:
> It has taken me about 1,5 day of work to find out why the screen
> remained black, to determine where the problem was, how to retrieve
> potential info by a serial-over-LAN console, subscribe to the mailing
> list, and create this bug report to help.

Yes, this is annoying :/

> On Wed, 19 Aug 2026 at 08:50, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 18.08.2026 23:47, Arthur Borsboom wrote:
>>> Hi,
>>>
>>> I am encountering an early Linux kernel crash when booting a PVH
>>> Dom0 on an AMD EPYC system (Family 19h Model 97). PV boot on the
>>> same system works fine. The crash occurs during amd_smn_init due
>>> to a divide-by-zero exception.

That looks like the same issue I am trying to fix.

>>> There is a potentially related bug report discussing a Linux patch
>>> addressing AMD SMN initialization under Xen PVH:
>>>
>>> https://patchew.org/linux/20260623211904.3674-1-jason.andryuk@amd.com/
>>>
>>> It seems there was an ongoing discussion between Linux devs who
>>> seem to have the need to align with Xen devs for a proper/future-proof fix.
>>> I am submitting this report to share raw hardware trace data and
>>> help move this forward.

Yes, there was some discussion, but we have agreed on an approach.
>> [1] https://patchew.org/linux/20260814214255.83127-1-jason.andryuk@amd.com/20260814214255.83127-2-jason.andryuk@amd.com/
This v2 is basically what was suggested by a maintainer, so it should be 
picked up - hopefully soon.

Regards,
Jason

