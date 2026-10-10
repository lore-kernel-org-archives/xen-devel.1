Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE001CA9EBE
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 10:14:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444961.1661436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU5R-0000VI-4e; Sat, 10 Oct 2026 10:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444961.1661436; Sat, 10 Oct 2026 10:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU5Q-0000VA-Ur; Sat, 10 Oct 2026 10:13:52 +0000
Received: by outflank-mailman (input) for mailman id 1444961;
 Sat, 10 Oct 2026 10:13:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xFU5O-0000V4-VP
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 10:13:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFU5N-004mxa-Qb
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 12:13:49 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca0f83-e002-0a2a0a5209dd-0a2a45068568-48
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:13:49 +0200
Received: from [52.101.193.37]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca0fdc-195a-0a2a45060019-3465c125669a-3
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:13:49 +0200
Received: from MN2PR03MB5328.namprd03.prod.outlook.com (2603:10b6:208:1e2::7)
 by CO1PR03MB7916.namprd03.prod.outlook.com (2603:10b6:303:276::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sat, 10 Oct
 2026 10:13:45 +0000
Received: from MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154]) by MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154%3]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 10:13:45 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8NNEPEDAuJCMq7RJO70uvbsHSC643tPpWropW2sS15ecVzKgt8PmliyX4kgoma/BRXSYfuylFwGunoxUhBjzULPG+noNOIT2YIjIp+bz5xonbxnmkeosDCwAR0k8Y7WrEUayE66x4ppkyC5es8qZa7HaTI3rp00IzmuZNz7h5r4kPIwxlN5g8aO2dvMZGjWiPXeuJ8k2tpS+z4RUjbqn4k5eYijZS/o/OcLSNrFmAxBUJjyGtJhoa6szKKDxLnrZDWJjfKjoDQuI1KxFOU88OLjFnmAxO0VF7MIMWpoMXpa/GJK1KRCQd+jwk5gwHLLQ09yYVbVnNYmQFpvLqe/VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqugbetrJdX8gVZTXaNh2smkuMQZeQG1KnruYZO7cYo=;
 b=zIERtxQIYpFVWc2BVVJqTLtaFn+lz0z/tkDnpbLtry1YXiFvxfjWz+jqbh62Um/b1MpYqqWJZuiC6rA1VfJ1/AxrcfxXDiYQ/idoXgCQ8UxQ37rvwXk1lgEHZssvzcFaWLPJlkQkJ8LBhQeYa75ent0V50NCRGylhwOaYAtOL6TlOC8lBJuuzyLigqMKA4sJmRXJz+BTknLvnQo7NMfmEn5FJtoMcPimSLL09I6jO/c8x+1d4N8hvuZ9bc5w/A9ujf5vUfEJ1UvLNtcZi+QYY8/ZahwYmgbF/Z6aXGoHMqyAqqk9kFpjL0RKPnoJ/De7yFwOb15aCiy0mdcT+t1utg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqugbetrJdX8gVZTXaNh2smkuMQZeQG1KnruYZO7cYo=;
 b=DQN2s5CBYP6+JoMz7wpn+I6NUsIx+ull3+tGfshcNWac9V35g7srqWmr6xoZSoGg979/DQQ7kLcJaZiJH8BlB2B9Xodu07s7oveHAEZ9iVuqJ2qMbFzPYSJqU7peQnejaWJDXeocj8MFGo+L+GkK0fiZcXqm3adcrv49eNH4G0Y=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: xen-devel@lists.xenproject.org
Cc: ross.lagerwall@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech,
	stephen.cheng@citrix.com,
	lin.liu01@citrix.com,
	Chunjie Zhu <chunjie.zhu@citrix.com>
Subject: [PATCH v2 00/13] x86/nestedsvm: rework nested VMRUN/VMEXIT handling
Date: Sat, 10 Oct 2026 18:13:13 +0800
Message-Id: <cover.1791625578.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com>
References: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KU0P306CA0015.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:17::19) To CH2PR03MB5320.namprd03.prod.outlook.com
 (2603:10b6:610:9a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB5328:EE_|CO1PR03MB7916:EE_
X-MS-Office365-Filtering-Correlation-Id: 8785c17a-21ce-47da-331e-08df26b72a30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|18002099003|22082099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Di8LRXtve735BUIQzK315agSuZUhHXT1MykaiDetteSuYO2I8BVr1gRjJ9/TCrEqPVqAnvBTDB8TdwaDTEoQo4UQIGI+XwEh+9OHKf+v04RMs0dYETrbJnnaXIXed93peffH3KGBOZZmwLZ2DHPNfM8ASLwGK7OSlhufOdepsqnedrKVujlvdL9V7c9xFrBVtW8UAye+1R3qOJIhyRDu1HDrXi86k6mSje7H9de1TUBGlFXrvltWvX37n2vLd+DStQ8R9lrYYV4lG8GF07E0ZxEyRmCEeWOVOKxJEB7HY1MdnHHvIXYigYnnEplQ/b7TuddQbkmJrl+Huke8u+z/CgAL5ss2tNiu8FrdwtsL0fcIL68ShZKzu0+BFtfj7cr3+c+lFu2jbmCUmZa72zA1QSWi2/IOwD4smFLrRRpkhcAOFwLm4Iaf4qFi0iANn7qHnknZkL8U/AKFbgolVajQvdosEpKhkBPG+dN9NeMH5cNmqY/18c6eS4pU6lvBiK+FajunhgttjltCdAp5jzYzcHHKTvJC/h0vCPLowQMN9fTaorPELorqC55jRTOR16nG3iEcXfsFVtFWtawYKOAEHQYOhTzbAvi69OULdBYNAyaRpZm2TTpCCNc7A6I/qxffZbyKNRZxbKNvMazuHvCJPW6J6baQN2nH1QDUY6Ox8+Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB5328.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2KfV+hNsN3CkmqoPhkQqh1OppwGM6MJT5AiOARtmSgl0+R+zA100tp4vmRjY?=
 =?us-ascii?Q?gjFE3yR6zVwSiA+Kl6mtODllp3klSxrleLzSt3oi65tcX3gy/yHGALxfe0+C?=
 =?us-ascii?Q?umHXMjL7k21csSB9PvC950HybYAJdXget0OuXgOdWAzTX7ku4tyFHQmCXlLN?=
 =?us-ascii?Q?g+TVs1W0gWDu8oNm/KSTBXevFgpFmJQUT6seFcefOB3SfRYDWv5qpzXfphYV?=
 =?us-ascii?Q?zqx9C+DKrY6Ozf3AdWTsPyxU1e9yMjg+ZbcJsyBfVQUQCxsvaOEoRYX6eaNw?=
 =?us-ascii?Q?NKfRtcKBU0Of7HMO+3HRhU+3a0rCM7sZN2jMkQh086L0oiDU/5D+Y+Qi4Ydj?=
 =?us-ascii?Q?Lvj+P6XK5Ypq1H3nOKAV/J7AfFEJFjp1xCUPdphB2fR4KhhU7isbjdUV09Jz?=
 =?us-ascii?Q?+9jj5h1ZNTVKuDeItN+ymmXZr41Ef2LyzX6QRD8u6EmsTwVvLHuWH48zPbLv?=
 =?us-ascii?Q?lDByWHjIW/E/CE3htZ2tV0hSXk5dfkSHewhRNg51vj2lb25U4/sKfVbJBJ7G?=
 =?us-ascii?Q?RPDv9/YQbRIhnr+9Cn/iYQ8iALo4w5CNkIaYZM/7hhtyTk8uHTN8FHv4i6iZ?=
 =?us-ascii?Q?4eTAy16D8uBXGZS72a8PKn2ydsAI0Nez9LDnZFu/iMCLIFDEsF1B/7gBythM?=
 =?us-ascii?Q?yovyAaPORfkUu6NPg1MKi5Uh6qgjQy+4mMmovN7lPhCiMRExX+LivSGtD4TJ?=
 =?us-ascii?Q?O9DJpUyJvlG4gAf/LQOPKHTOoRCegNtEndjKQ3tgg9qPqIOzVLYstzfL3rNc?=
 =?us-ascii?Q?XKKYDtkQIrDzUXIbOTYSblDLlo1YCwAQJDpkn4fZ5gJ7mTijjh3HRfxr29oj?=
 =?us-ascii?Q?rcK0hafFyAc8aS2gk1j8QbIu5OnZmWPGn2XlF9y9ul55JKuxXo0uATjNi+WQ?=
 =?us-ascii?Q?mNTuofE2IeEJegZ0FcZPkxxfG487UfZODcrTch2npkOzeV+Ke7H8yN2w6jnL?=
 =?us-ascii?Q?TOC/qC1RMH7fgKZ5AZ0ejIqxPc91DkPTz0JA6yKzy1gyLikNG31Q21pRTb5q?=
 =?us-ascii?Q?rR2bgkHW4q9JANNqwzXMsRmO6JAb2jBbevUTraknsfH40zLEgzI4L6pt2uvC?=
 =?us-ascii?Q?Y5uvc67EQFRdqxybRQ+ztj4Pd9HoboBGRn0I5UQIogIXgdseVC25Iko1yopv?=
 =?us-ascii?Q?A6gYB922GX23vLq7vGUqZB0IsO5qOSJIuntBrKexonEhxmXRBKujdPB4U7np?=
 =?us-ascii?Q?waLyFj1k9snZuoz3BFfQgVqt2/L8W0+ArPeEzSR/Ohg9DuMTe6OS8uLm+XXd?=
 =?us-ascii?Q?KZ/SFnmlv0okStJ2wGXtCrO3sm8sNa+G3SjzbliIaNmYPUTjB75tCtbmlXNx?=
 =?us-ascii?Q?yycCLh+OFX4jQSdVqUdO8x0lqsbgqJCJjJoZwoP8+4jjoTS57F9PveHmIwEY?=
 =?us-ascii?Q?8Op094a/9ktuWhAOA8nDHvQA8jM88dHNGFM3A4QGZHBArjMWXxCgylf8R2sH?=
 =?us-ascii?Q?nbdyfaG7tlhawlhZqFdVJZ4yts5MNob1faJxTR7iboB8Zo9+NlDRtt+0naEo?=
 =?us-ascii?Q?4nH6jEaEgkOgv4V6bC/3x3V7WINyIwNmoz1Kq12DU1jO40tVwFTWab4TRB0g?=
 =?us-ascii?Q?ri0iSGnd1TN3N3mq1S+7g6V3GHdo6hj2LoNi9BpdygFigwSC0RWZQCYI3k/t?=
 =?us-ascii?Q?cvjOInf7d9Cu8Ykc7xATKSLsMGyO7ezjy/0WiGrbb5PXrSCsoTND2+KkgXZQ?=
 =?us-ascii?Q?kOAuQEuNLl9KFysKjiN9iA+FGExduaTo5O9sL9zVeVyO5FesT+PIe1ZsOSdq?=
 =?us-ascii?Q?TCqC5jSCwA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8785c17a-21ce-47da-331e-08df26b72a30
X-MS-Exchange-CrossTenant-AuthSource: CH2PR03MB5320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 10:13:45.3519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXTQv6b7shoD/XcVAhZXB5Bfio4YgmOfXmD1XhCxmLGPuvRZh5c0zaopXY2ULAJSAHem3u8SbTB9L3unH6Q8gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7916
X-purgate-ID: tlsNG-16d1c6/1791627229-FC80577B-2887AFBF/0/0
X-purgate-type: clean
X-purgate-size: 3348

From: Chunjie Zhu <chunjie.zhu@citrix.com>

This series simplifies nested SVM execution by removing pending and
deferred state from the VMRUN and VMEXIT paths, and includes the nested
SVM / Viridian fixes the rework depends on.

Changes in v2 (following Ross Lagerwall's review of v1):
 - Dropped the v1 "x86/nestedsvm: update vmcb correctly" and
   "x86/nestedsvm: fix up" patches, which mixed in unrelated bug fixes
   from our internal patchqueue.
 - Those fixes are now submitted as separate patches (1-10) at the start
   of the series, with the original authorship preserved.  The p2m.c
   change from v1 5/5 is not included.
 - The three rework patches from v1 (1-3/5) are now patches 11-13.  The
   stale_np2m handling from v1 5/5 is folded into patch 11; the rest is
   rebased only.  See per-patch notes below the "---" line.

Contributions by author:
 Ross Lagerwall (patches 1-6, 8-9):
   - Fix CR3 MBZ check
   - Adjust L2's DR intercept when adjusting L1
   - Use the correct VMCB for vGIF
   - Set GIF during VMRUN if vGIF is enabled
   - Viridian stimer direct mode support in libxl
   - Clamp Viridian features to known set
   - Don't set VMCB(1-2)'s NP_ENABLE and N_CR3 during VMEXIT to L1
   - Fix VMLOAD/VMSAVE state handling when using nested virt
 Stephen Cheng (patch 7):
   - Require VMSAVEvirt for nested virt
 Lin Liu (patch 10):
   - Don't clear TLB_CONTROL on #VMEXIT
 Chunjie Zhu (patches 11-13):
   - Rework of nested VMRUN/VMEXIT without pending or deferred flags,
     and removal of nv_vmentry_pending

Chunjie Zhu (3):
  x86/nestedsvm: update vmrun without pending or deferred
  x86/nestedsvm: remove nv_vmentry_pending
  x86/nestedsvm: update vmexit without pending or deferred flag

Lin Liu (1):
  x86/nSVM: Don't clear TLB_CONTROL on #VMEXIT

Ross Lagerwall (8):
  nestedsvm: Fix CR3 MBZ check
  nestedsvm: Adjust L2's DR intercept when adjusting L1
  nestedsvm: Use the correct VMCB for vGIF
  nestedsvm: Set GIF during VMRUN if vGIF is enabled
  tools/libxl: Add support for Viridian stimer direct mode
  x86/hvm: Clamp Viridian features to known set
  nestedsvm: Don't set VMCB(1-2)'s NP_ENABLE and N_CR3 during VMEXIT to
    L1
  x86/svm: Fix VMLOAD/VMSAVE state handling when using nested virt

Stephen Cheng (1):
  x86/svm: require VMSAVEvirt for nested virt

 docs/designs/nested-svm-cpu-features.md  |  11 +
 docs/man/xl.cfg.5.pod.in                 |   5 +
 tools/include/libxl.h                    |   6 +
 tools/libs/light/libxl_types.idl         |   1 +
 tools/libs/light/libxl_x86.c             |   5 +
 xen/arch/x86/cpu-policy.c                |   3 +-
 xen/arch/x86/hvm/hvm.c                   |   4 +-
 xen/arch/x86/hvm/svm/entry.S             |  48 +++-
 xen/arch/x86/hvm/svm/intr.c              |  22 +-
 xen/arch/x86/hvm/svm/nestedhvm.h         |   6 +-
 xen/arch/x86/hvm/svm/nestedsvm.c         | 305 +++++++++--------------
 xen/arch/x86/hvm/svm/svm.c               | 226 +++++++----------
 xen/arch/x86/hvm/svm/svm.h               |   2 -
 xen/arch/x86/hvm/svm/vmcb.c              |  32 +--
 xen/arch/x86/hvm/svm/vmcb.h              |   3 +-
 xen/arch/x86/include/asm/hvm/svm-types.h |   7 -
 xen/arch/x86/x86_64/asm-offsets.c        |   1 +
 17 files changed, 302 insertions(+), 385 deletions(-)

-- 
2.34.1


