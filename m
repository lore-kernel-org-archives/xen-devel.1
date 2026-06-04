Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D909CCD6E6B
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2026 13:25:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1327835.1592560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV84x-0005bt-Nd; Thu, 04 Jun 2026 13:25:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327835.1592560; Thu, 04 Jun 2026 13:25:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV84x-0005bm-Kv; Thu, 04 Jun 2026 13:25:47 +0000
Received: by outflank-mailman (input) for mailman id 1327835;
 Thu, 04 Jun 2026 13:25:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wV84w-0005Zy-TI
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 13:25:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV84v-004cwE-Uj
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:25:46 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a217cd4-5cb7-0a2a0a5109dd-0a2a4506a250-12
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 15:25:45 +0200
Received: from [52.101.48.20]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a217cd7-7371-0a2a45060019-346530147b28-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 15:25:44 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB4972.namprd03.prod.outlook.com (2603:10b6:5:1e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Thu, 4 Jun 2026
 13:25:41 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.007; Thu, 4 Jun 2026
 13:25:41 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hyKruJQkKEBoceb+Ut7kHnUgunktRr4YwEj6t99REMYeTxyo6KBptgOJucych9H3eNYh5kRavVcOswm1gDJVKdTnKuO8siyeUtSRbR+qJ7prXH0uYOiQQmE1Ve1Vi61V/qLz4IrPjly4HMhESBNBvToTSZvYd+bB59j5i9nLqZk36yuNNveLPtHv3q/lS4yrwoc+aPuUGvQejjZr7gnmZO2o00HzOUXwe15Sh4ssVu90JXt56Mmjah1D8Krm+bZ7RmUW+7eYLLsyncMEvekahQLUUDcNoLPW4gI+5Z9kMpz7Ll/io7RnmLg3P0ZGVMIqyxdeqFIrApTNjDQmERVizQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mI6Gl3mQTNjJOc5YuzG73fQwjes8R0Abb4hxfnCCHaQ=;
 b=gP/GkWKxuntaLVZkmjPd5xqlN8B4Gi+4uYQ7/mT8vY6HUB0JZwTzdE0xKZ5T1zF88s1LBt4UjbACXfsY1KxM+5bGxsFrCvY1OopXRFjAsMi/15w1OR+bZQ1tMBOZL7ScYvVmjuuy3wI/K7oeMB/6DTeiM2q0KUENwXlLGYyl9RfVhNFJS7wsPXkppx93138rPXSb1XLZtCtg1UFhkm94XOCjfd+iggEZeuuJP3ZWoQ+w3Ah1dUJM8pmQQ9NqMsgN+hOtZ7RdJgwyQBCzw+vETbzUjKvcEgK3PlkE8y2hOClnWy9NjS6LEV7AoYswHJ4GNsKcQ6o7HnLzHVcbj1Bh9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mI6Gl3mQTNjJOc5YuzG73fQwjes8R0Abb4hxfnCCHaQ=;
 b=PWx3q38utwSgGYjuTlashUhayDwqUo3D8cJp1TrnLW8hDtpKT7TLGOtchlJehyzdcKOcJfubjo1up9TZrBSbolwOZ2vaCg4K+VISJ/XAR+mI1FQ//BJ0HbWIX31W4BvHy8B/31KLaEQombKXwNpOSnqXJCjONEyioBnPxJ6CIUQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH for-4.22 v2 0/2] x86/mcfg: relax checking of MCFG position
Date: Thu,  4 Jun 2026 15:25:21 +0200
Message-ID: <20260604132523.95125-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0039.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB4972:EE_
X-MS-Office365-Filtering-Correlation-Id: 205faf25-0382-492e-43ea-08dec23cc607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	nK4UqjqbgH30LW1d2AT3q0sTKiPC5Ff94wJw8LZGPSOwbkzWK0DiB3Dpkmir5lTeJpEMyZyjmlz49Ay+siXEuZCMA8PtEBsXGUd1nNYBzYyTE8D5VACokSs2lSyamxihJG5doMJr8LQ1ONFhPZqLSv41+k4RK9VcCgrX4YFgfqqclmnHdx6oBgmwaYJT3iWgosUvxbaW09Z4zFh7ElAT4nyWwj9Ge0VKc3O0R1i9sRVd1WlXwgPhyQfrgg5t91HlwbZFe3Q3WCTppBxo+Njza5QRv99NK9zQE0McmO30vVo/5r+lyGutYUwetbhUtU3swMoawmPYWh6SJEj9iV5Z3H5o+lXZReu0GASbPq0lzKlu9LzwEiy1QP3GNYh91qAreh1CuSAxV5HaZ3WlzJophcNtTU+9nXFHigi3V1wkFsNgqvM6ofic77PhEVxY8MVOCBHTOF2qNRaCvdEDtiDnSXpZrHw4m5uyr4QmqGc7Q1cpWnHpyBmrWvo4dnEXSfFyIFHoKZF2OqFaVl73txgxRydYXfJywAvck220k/xaSqDvi/Lw46dsd9UCumjOmL2y3GGeHDiLTr7sZ2AUod4eN2cc8nAiM4Mkv1ryxtQzZqdumzFRbLoI+4N6HcwQYPXFWxJvXwPq4I6OKae2fD6hR77nEmfQUSQ2iDCuy3Acjl9ZfNYE4W051XA3PwlKQ+7P
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVpGbGprWWpkcWx1V1lidzV5cW85azl4aFdlejEyUWIvT3JVVUgzMjVIZ2FI?=
 =?utf-8?B?SWQybU1XL3BSb2pEVjVjVE1lMHh6TXlKWC9DWjFzNUJVcUtLdTBmY20vekJ4?=
 =?utf-8?B?YmUzYlpBT0FXdDJRMHJ0bGtYWDR6aVZBTzFjS25VbGI3Y2FwMG43RHFvL3Qv?=
 =?utf-8?B?Z05DaDF4R1ArRFNKUE1CQTJHWS82MHJzclZqRmdqL0hJU2Yzckh4TnpKcFg1?=
 =?utf-8?B?cWRPU01JaWt0b09OOXlBN1JuaW8yajBzS2Y1WXNyTGtwemxKbkpUUDNJVlZZ?=
 =?utf-8?B?SUNueDNiMTl4NUpRbHg3aUhTc1dXcitreFh0RFBtdWpKYWV4Y2hiV1d1RFc4?=
 =?utf-8?B?ZnhBM2luRDBmcDV5SG40TFFOTS9nYWc5aFI4NVZPWG1hT0hqdzNRNTFwNGZU?=
 =?utf-8?B?VWh0YjhLemNFWGorVnZ1dmFYYVFTVll1RERkc1FJNEU1VHlrUUQzSENsSHpM?=
 =?utf-8?B?aElNL3JRckNGTzJSVm5HOEdJcmhwVUpIZHVUTm5JM1IzcUNaaUJwWFRZTkFZ?=
 =?utf-8?B?YWpidVErNS9ZYmNzbENpNjEybzNKQzVXYmdpNVhWditEbE9zOUt2M2thWHNV?=
 =?utf-8?B?b0plMU5ORGdEZU0vOEhnak04ZzY2ck8xb2liYzV3WnN5TU5vQXVucVV3N1Fa?=
 =?utf-8?B?dmh6R3Q1TG80UWx5OFhzSnVwNG10UXFoQktPUVJ4U0NiSUhFYk1DUFZnTFl6?=
 =?utf-8?B?aHdaNi9GY05nZndNNVdvc2FvanRzVXdVUUltakRKR2d5QUhiQXRPTzZXejNC?=
 =?utf-8?B?QVROaUNRMUQvREdRdlg0THNRMlk1U1V3SFBSOTF0Rkh2QmgrenNxdVVLWEtR?=
 =?utf-8?B?Zm9MUEdndW5rcGRJMFFuMVA1Umh1MlpBdGFLbURzRlJBZVJpU1QyckZkcVhG?=
 =?utf-8?B?UG1sTXpLeVdnWGtza0E4bG5scGdXVHBPNm5WLzdIUFNFVDlTMUUzWUxhQzMv?=
 =?utf-8?B?Tkx1ZFRidzNwM3VMb3NPRXRuM2hSVHhsYnR6Z3Q2NjkvcCtyMitRb1FkWE1v?=
 =?utf-8?B?b0JabVNwOTZqdGRJRG5PSExYRXBMYzhrdm85ZEFGb2Erc2VwUHJRWFJlWkFh?=
 =?utf-8?B?SFg1Ym1INjZSbkVMaUVqR3JBNkJjeHhFTXFRdDJVWnkxWDB2dWNDOXJpRm40?=
 =?utf-8?B?V1lXWXZkbThWazBtUzJzRDlwS2ozOFpqVnYxejBnU2J5QlN0d2ExSVp5cDQ4?=
 =?utf-8?B?UTkveVFJTExCOGpNK3VKWmorTHZuTzA5ZWphNG5pMmNGVTkrUVRGakt1dDRK?=
 =?utf-8?B?b3ZnNURYWThvMW9INGd4R3ZxRFhTalhRVjA0VnJ6ZndEUCtsWUlaUjRDRFA4?=
 =?utf-8?B?b01QK2NkYWtNOHBUVmhXMlFualVZYWIwaDcxVU85djErQisyUHdOV0t5Ti9O?=
 =?utf-8?B?L2hzR3lnUUNjMzBQeVRoMzBtWFkyazVDYTJWdjI1alVoRHlYUFVESkQ2TGdk?=
 =?utf-8?B?b2dsaS80K2g5bW9tTFZCMXhOa25ZV0hqUklMWVpKYk10a3E5bUNYMUdGaXl4?=
 =?utf-8?B?TFNHZ3F3aWpNNW5GLytwY0NrSWZyc0E2cHNqSStNRE9mY25FM2NVTyt6bGdO?=
 =?utf-8?B?S0MvbE92SUxKdUhXeWpyVzNwc3IxeEJSRkFOS1RuUk5hLzFOQWR2U29IcThz?=
 =?utf-8?B?T0puUVBNZzk4a0J0UTV3czl2V3AwNlNrMi9RbFhKLzI0OXFhUWc5M0Y3VDVN?=
 =?utf-8?B?WTNCRStKTlRCZFVRQ0xoRmhKZXRteDlXQ3d0RVlKcmFEcEpla1lGY2ZKd2Fp?=
 =?utf-8?B?bDlCY0hVYWdVZ3BKbkZkWWVjYmZsa0UwQjFpRzhtNm14aGY4aWxWbXN4UWpJ?=
 =?utf-8?B?YjhvRmZtTThUYVVoOWliaFlyeUhaVENnSGgrbjdCRHg4R3RTT0xBb2R0cUdo?=
 =?utf-8?B?WUl5d2J4d0JuYVJjT21NOW9QUDJUUUJDWDVCVTE1REt0ZnFhUE5xb0hYUUxY?=
 =?utf-8?B?RTRRekM4blFsWUZFQmwrQXJTdHU2ZkRyL0xZYzVEWW1FWVZXSndQZHpaRlJJ?=
 =?utf-8?B?NkVZRFhvMmMvZlVzMkFwZkxYSFVpV3cyeStEVDg3YnlPZ1d2RVlzUVByOWVQ?=
 =?utf-8?B?Z0pQVEorTWtlT0QrRkNnbWN6dVRFQmgxNkZMZ1RFRUw0RFFGRFZGcVBzUlRR?=
 =?utf-8?B?blhFY04vWXN4emUvYk1DSDlrZjEzOU10VzdZSS9ReDhvelVvL2hqZzg2cUgz?=
 =?utf-8?B?WWl6OFkxR1lUU3RLZVBRajVGR0NxWXhXUGowZDF6bi9XZy92QU9xcWJhd0ZK?=
 =?utf-8?B?SzFzeW5keTRQWTRvNmZJOGo1ZWgxVW5CZWhadW9aSFlDSHhsNEpYMVlheEU3?=
 =?utf-8?B?MW0rOFBMaEVKWmsvcEVxVnp6cE9sb0piUXVyY0RHRTU1L2RXMUhJZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 205faf25-0382-492e-43ea-08dec23cc607
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 13:25:41.1930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEx44s5T1cKYK9jVwygjR+CPHR3lPI7Cj+PmYSRKNj8kbyLXJ8bvGyjXRZZXCwlV3cJv5eSzFkNlY/axrhuRsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4972
X-purgate-ID: tlsNG-16d1c6/1780579544-8777FD75-5361C7B9/0/0
X-purgate-type: clean
X-purgate-size: 416

Hello,

First patch is a trivial cleanup of header sorting, second patch is the
real fix.  Possibly something to consider for inclusion in 4.22.

Thanks, Roger.

Roger Pau Monne (2):
  x86/mcfg: sort header includes
  x86/mcfg: relax memory map checks on newer firmware

 xen/arch/x86/x86_64/mmconfig-shared.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

-- 
2.53.0


