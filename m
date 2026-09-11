Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36ACC88E4C
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 09:13:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416065.1645223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xJj-0007gX-Em; Fri, 11 Sep 2026 09:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416065.1645223; Fri, 11 Sep 2026 09:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xJj-0007gQ-BG; Fri, 11 Sep 2026 09:13:07 +0000
Received: by outflank-mailman (input) for mailman id 1416065;
 Fri, 11 Sep 2026 09:13:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x4xJi-0007gK-NA
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:13:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4xJh-008eDQ-DU
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 11:13:05 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa3c608-8faa-0a2a0a5109dd-0a2a4505b4fe-46
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:13:05 +0200
Received: from [52.101.53.0]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa3c61d-4cb1-0a2a45050019-34653500a15e-4
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:13:03 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SA0PR03MB5548.namprd03.prod.outlook.com (2603:10b6:806:c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Fri, 11 Sep
 2026 09:13:00 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 09:13:00 +0000
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
 b=rGRzwXE2flHPXEuLJzjY5nl6ceNBmozYNK4PeqCuOhNRSW06zBX9psjHuDeBepG3MG+3PY0xs203AF8aR3oaAHgeR2CJyPk1A6Sl2XuL2JYR5FP3Qgh8s9cROinnQUaq5492eh/RzNzJnvTel2roG/I/IAA+MqqX7VBZ343dm7lcsTwKUsHMkHi5zmyqnxNNbFQ7m1DX4JygxFydpm6LsaT35rPHgrBueyNOtYkYdqlNCXkQyv1V4Q8g0ApSHTTHI21831yJuZm+TI6ojCSdWQSSbjzi5W3UUT8zBAk2mQYElwITMcnPzQjywJm6DfTU3omyeQC322vQ221gaABgIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpyX2fKlOrWfioY9qFuyjQOAwz4CmZDu9eRzqRkPKRE=;
 b=Jay/5jAEdqJ1ymPdTgWZqnlzbUrSX2uQcS18jDSjfoMMEVP24YoAe38zaOJZ0o85T0YIHwqVTom5nVMFujwY3//iy/ISNDKJq1IsULWC0+hcHJHsvu4iBZDxvdQLNQEY7H3Pduq4ueRonQjDwWiAiSNWYdIlgsfRKY759XYpuxsr5qtsXGjhPZ2Zwum3eycglCmvhpAJEn4tx70D3v8/kV/bojZNLTidFtSv/se/Orw0YVMWG5hPvlE70JJ9JHJNuTwP58IuRQL5Zk4TjXSg9bl+zxh/wHXJw1qIpk39HvIq9duUOBBwMUtbAragSCaHJouS4/Fikt5+32KXuX0/2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpyX2fKlOrWfioY9qFuyjQOAwz4CmZDu9eRzqRkPKRE=;
 b=yGPjuF9jWjzgU5lhx/pR9GshM7BEVQijYaqEnhDGWOXBT+CHWduA6dj4hEdlUUOifpXNhnSPoDhVo0hxozEdm2oC5MeMJElCt0wR+OxqrhVvGTT5hmp0QN2p85+wQONWL8xhMh4hk0Y/kdQeDXvGdWBVI2q3mUJZUeTgbA1Mgjw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 0/3] Viridian changes for Hyper-V as a guest
Date: Fri, 11 Sep 2026 10:12:41 +0100
Message-ID: <20260911091244.1165516-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0312.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::20) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SA0PR03MB5548:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d8a6c47-7a8d-46d3-14b3-08df0fe4e04d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|6133799003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	soXabx5Df9A0+54+LKxdGLlIX459tiMbYHY8128Isu6bq28zoM2+Z+wPJRpFowydZLufYQPEt3Vrhc76kCVRhyjL8Tb/zIiU+rG0aqX0Hw6GR0vD9lCjEaZrA8vINlBP+rr8jphVfQUGjNFriR+CTsJ8swlQ2PE1CI6+KMUF2x5MNQHHaQHJas2h3FObeBvzLx9+oTIFLVtQfDWrC4LhPoPzIgDmSsscpA2/9t4wOrz7li1Lzps4ll6DhzPG7Rmad9lCnskDr4tkycHQvvbJTf7yawetc6ZP7uTcWCyoNccfd89Lvz+NabxvENADef44oxkq9Cw87opcYVwFjbPaXG3lQkhQ2ng6k5VgxsG0oZATTNiX5TH9RjkszUAP42/h6YidXNw8i522b77wG7nXhMRRReiliLHrnNGo32q2yx+uRQTvjJ8GX0AxeE3NgMLw1xER9W7v/MJRwiqmXhpHkyL1c4n+4SyL5hXNs98u49Zz47KN1M5cY7S0sqCVWdiZssYp6QaaEWWxDswWI7QXs21IQDPWhlrJmPrpTPKtkh02n6QjUMkEZTzgZoskdlmNZImR8U8twutmnQudTfYkhU69+tE//+GvK74jj+DeEIJlWiyuzUONx8V5zRKz3Qd6/skRapWSZ1LdL7uvV6OLMBiF7rptMZfcFM/03m8YAT4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kdIed1txg1aNDMm0gq4umS4hf0cnmsbbPJ3QHs1hfIX9vhZJn4WV3iRk+8b/?=
 =?us-ascii?Q?uf/h0V6fXrrt6tFoAF2d5quqZNr0KesWwHRDP12s7OYuWlQPRljmWGlBLvaV?=
 =?us-ascii?Q?E4fwGW3t8Y9L/qi/llFSXSBtuNNxCxM5K4zzhtd0BgReKdKs1QXsOgDINuwK?=
 =?us-ascii?Q?DOqA5GtAS3Lt5wfVR+BrHtvlRUtfdQTr60pDLZ58JtVtdRy+A0PbOdyiDat8?=
 =?us-ascii?Q?NVYNvRF2d44FZnUw5+PY4otLJvbRTGZJXqLObKPf6zYN7nj7MMaQhSgc56TS?=
 =?us-ascii?Q?bHgkL3ozczCslZ3sqwqrXSlUi4V3r58ziUYWrcv1RnBnu+QnN1qIG8UPVq7e?=
 =?us-ascii?Q?mLJPsABtcgM2gU/bStTeqwCw6jTfYTZwxO0FFGyxRwEUC8PceL8nREUO1vDR?=
 =?us-ascii?Q?ogdmBf70vdxFTbowk+4DONeFTo51sGp7a2Om5mfqXV/FuEcKVju0RbQ0rwlX?=
 =?us-ascii?Q?ZGYVI68DtqZJPb6bfRJOLvSl5QtWx/V3VM2L/9l5IDoIAk61WVjMGwgXEket?=
 =?us-ascii?Q?+vgQJuAmXvxLRF86+F/XiOMPoRCyY3ZCC1Z1KRNY/pYftA+WiQ3iL/iKNWUU?=
 =?us-ascii?Q?eBLpjqU959NDvZXL8GJpAigkBqcORkgBtdLcfxsDRWMbSio1umuHe5NRxaA3?=
 =?us-ascii?Q?dlrwrBd5OCt7x2MA7V/YS1TwiWctz0a8DSWz6dyDkkF5tnWVY6nj456LqaWy?=
 =?us-ascii?Q?sRiAF0aYhE8lsgLLjFfK3ioT3W/1olYk+krwO/8hltCxlrFn4AYYfv0VYudb?=
 =?us-ascii?Q?Z8W81mjd5OPKZqhrQS6qgcWlB8+cZpO3Pxaxk5bbbEB2xsFnQlli8Z8MLh9P?=
 =?us-ascii?Q?3rM1ezAkAACE3hToRo01EvxBv9cXGSK3H9m0VGYYu3sNK36/Nm+hnDV7sfFC?=
 =?us-ascii?Q?8K8EE/KytHbvtaKR0Jz6kilbMjb+Ybo/TYXWDigqrcoRaTv0lnH2AiWbtDPf?=
 =?us-ascii?Q?47DU3i5hUOigmXwhInNcGKi1f8EB4ryxKKMEJOe1dHiNjzCPAWPI530ARu5q?=
 =?us-ascii?Q?gIBRlSy3g/ZnJebHcfcC9alc81I7hDCQLIEy613MvVtSYraMAf4WMequF9/+?=
 =?us-ascii?Q?beMcS6F1pw3qVJr2xUqHHmNvqeZXLPYk4zrlbmPZweT0g/HQZZ2o6AAr7gtx?=
 =?us-ascii?Q?iOyhV2ICDxE0pe0rxix/IAVogx/Z9zrAyIjOyFO8fpIiXgLLvSTwG2U5JfwJ?=
 =?us-ascii?Q?/AQGZy7iEumeM6/Hw8KC3IdpH7i7O+2KPRzi3zcLtiUYWnertIPjT2htWjQV?=
 =?us-ascii?Q?uU+RKhp8DbdqkIhkFlOPoLBuoepYPz1gO93aWJ7dW+tBb3W5+eVgP2YagaXs?=
 =?us-ascii?Q?9TpQL6CesmZGmyGq8EFtCNY1l5JkzFLZbxo7Yt0QzhsNu5UWOQG8l4kBBhs4?=
 =?us-ascii?Q?F3qL2BxXHEOZ18LaBCB42Hv4dc4CfpZ4VqeNEx0JlhZ/mpKSG6Dc8b3jHm94?=
 =?us-ascii?Q?NbSJJABwaIravLHe7BXITOtJSi3pEXPs0h9KCGZujhiB1ldmL/5paC09iXP3?=
 =?us-ascii?Q?bb2z67SJRiJIKcONkIjjSFHXUxfIdq2fZG+5WEMWTM/WWvxE086BQ7zy1iSS?=
 =?us-ascii?Q?7H4UxMKyT750RI6vdM1twxnoXEcipCS4P7bAFT2nB7uFmp2Q1aDs+jaETjyS?=
 =?us-ascii?Q?/omyMRKiDasAic4iGCzM8XBelqSRw9I/nJTHomPUvIRLYx1JTpODSdI8ISeI?=
 =?us-ascii?Q?A0++wc+SQUUQGVCz9BY5p3mTjfKurB6X2b8XOjxvH0FUt5FlBguv88FRCfa6?=
 =?us-ascii?Q?/8q1HDLFQGNljHCwgwlcn765fRxECXA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8a6c47-7a8d-46d3-14b3-08df0fe4e04d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 09:13:00.1136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tjpo0rE/jDEbkNWc8FN0WuKqQW62cwSp7T4A0KqQ6IoaCYacK4kUmwriNHRLnkMK7+IvIjnKfBPsCq75CSzlhOuScNwmbfb2t0khGRBv3eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5548
X-purgate-ID: tlsNG-c201ff/1789117983-253192A1-BE802926/0/0
X-purgate-type: clean
X-purgate-size: 945

Hi,

Here are some changes to get the existing Virdian enlightenments working
when running a Windows 11 guest with Hyper-V enabled

Hyper-V also depends on some unimplemented MSRs to boot, but that will
be addressed in a separate series.

Thanks,
Ross

Ross Lagerwall (3):
  x86/viridian: Workaround Hyper-V GP fault writing to MSR
  x86/viridian: Implement synthetic timer direct mode
  tools/libxl: Add support for Viridian stimer direct mode

 docs/man/xl.cfg.5.pod.in             |  5 ++++
 tools/include/libxl.h                |  6 ++++
 tools/libs/light/libxl_types.idl     |  1 +
 tools/libs/light/libxl_x86.c         |  5 ++++
 xen/arch/x86/hvm/viridian/synic.c    |  9 ++++--
 xen/arch/x86/hvm/viridian/time.c     | 44 ++++++++++++++++++++++++----
 xen/arch/x86/hvm/viridian/viridian.c |  3 ++
 xen/include/public/hvm/params.h      |  7 ++++-
 8 files changed, 71 insertions(+), 9 deletions(-)

-- 
2.53.0


