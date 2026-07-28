Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEDCC53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 07:17:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372172.1619569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woc3d-00022W-Ga; Tue, 28 Jul 2026 07:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372172.1619569; Tue, 28 Jul 2026 07:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woc3d-00022P-D4; Tue, 28 Jul 2026 07:16:57 +0000
Received: by outflank-mailman (input) for mailman id 1372172;
 Tue, 28 Jul 2026 07:16:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1woc3c-00022J-Q4
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 07:16:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woc3c-00AFyG-4p
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 09:16:56 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6a68575f-bab6-0a2a0a5309dd-0a2a4505e71e-16
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 09:16:56 +0200
Received: from [40.93.196.56]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6a685765-4cb1-0a2a45050019-285dc4380cb0-4
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 09:16:55 +0200
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by MN2PR03MB5152.namprd03.prod.outlook.com (2603:10b6:208:1ad::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 07:16:51 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%5]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 07:16:51 +0000
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
 b=otoBDz4JbFB2f8jWf4rMJR68u0f18i6Z2nMRKyd916LZZ7mGzqvR1D4FjvnTk9PXErJJo53TdAkcXcJrAv5a2h5fVA6hMbu7wzeKtygOGsemM7X3ZF+Z3VGEU10K02uJaoXYtJvIMVqJt/xsitQ5MgkGuZvK9aaW5AdhbDD7EQXifad3DdWNYA0XI2NPX5AinXvfZlONAiVELPXa/lGHDppfeBG/GlRB5ZPxnxthtd2Gtunu1fal+PljX3svLcFdzkY+AYRAB8FNSCHaC/ZBQKkeFRdMnp23D8TxCg42vNIFFfb+XSWeYr790Culldc70XlqYtBtyD5VphGmlU8uFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgfj3omKwaaiAUxGLqJajfCkz5k3NrUUzXsfzvFpM9M=;
 b=sdz1FN2MG+Fz664k8rb5FZiwZ3ulh8Y+7ytCyuSLsKqkslrG1GO/3lAPaJjokkPoCduVA2FXHef4JRQgrMm7ik4HAEScO4nJpHVXgoc4mDQz68yt53rmiRg9F1gaxliYmNCCquUWf3NeJY2Cj9xKDLyO7hKk/Qpk2mVZFxmCgG6yKFFq++xI3V8MDi8jeAzEW6RcXNu+xkTHLpULzYskGIoZxmS791oX6/5G0cG18tiLNsirYoLvyqWyQKW9cjWXj7YJXHnOcezJOHkj4v8OPtNhtBEbVcHlPpNagI0XP2ndapA/T6ZMvJmRU7zqQ1wCzbX7Ooo/NZ0iUjB4ho9sfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgfj3omKwaaiAUxGLqJajfCkz5k3NrUUzXsfzvFpM9M=;
 b=W0mKHwPJT4NXr++svc8CmAEEOJCvFzs1GLlWk29rnJQiD+xAVdsP4v7t9KHiksMMw1J9Ahyq4Yzm5ACdsuyiM4/grq5f+WenQCfmikQngR7WFatgKxASt+GnriQ+1mhurWOqPe6I5I4u2dO6dTMX0ziDYn50WLrnedi768+DIKU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: teddy.astie@vates.tech
Cc: ross.lagerwall@citrix.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jason.andryuk@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger@xenproject.org,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/svm: require VMSAVEvirt for nested virt
Date: Tue, 28 Jul 2026 15:16:41 +0800
Message-ID: <20260728071641.263677-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <1785152912.8631fc262581453bbf619ec5b2062170.19fa367bc22000e099@vates.tech>
References: <1785152912.8631fc262581453bbf619ec5b2062170.19fa367bc22000e099@vates.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096::28) To
 CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|MN2PR03MB5152:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d65a814-ccd4-404a-9d25-08deec7831c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|11063799006|10067099003|56012099006|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	VgxcJ3OvcF9cJfKNNd2jKikjvy9SeglFO/SIxnlJVj4IRhqwzd0/sXxzOxqmSCAlf9FzF0FN8mPBXQNkxl9iTISJl5AvcbORc0n95kRE4UYp18TbMoCU9uJwNvrwDlZ+HLDZ3pv9gp8fA8DjMOEefn9zLJ3BOxtCXogHF5T1jMqSQebQnX6h1Mq9ScCFs1ZPDvCNcCHpjlYjFBbwzwSwKBp0d8AwYx7aPPkEPJIIykLXjdKrkuwXh8ZFQtpAMfaOTJZyqAVonk6sLBjY+5hPl1joqDU7sO60kIkFSbfu9wTNM9jZMANPrMZUjaX1Avjyzm5yQy7293sxAYzDqyJBtIzx6QY5kjuqWhKBh0Orc5U06kDtfn+4LML7o1XDAhMc8u7LY24FullxzIho8DwQ/O3+XRMzAwFFVawU/4SilITjI0EfiwRVMqR8ME92C2ZsU8MzRbc4tdYNLanG0o0Bvf4ubEOC0nCK1KlxtlWwBLd1ELhWBst0JrwYm6GS1tGgfYGOSMMlwgLBPychHBpBLtFiZ/Xyeg6I9gnOsf1/J5vSDCavsyXWZKWRPne60KTqgkXQHUvw8U7Vl0yvdB5OxgSFig63tTVebBqZnE+D2cxJR70dmLiLerlha3GqLqE6rqbiHsRMsdqYY3W/V+0ukfqjLKtIcxuW2eNQgiJg23w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5Lxe1WwjzcjHgjqrvMKGKn0lHDte37KLCrdMBsUHhSjjsYpDcJl63cyJQHd/?=
 =?us-ascii?Q?lgTlG50fzKgauEVp93ckD6G3JQT/9UP7hRAYHZmO8tieESfoCDTqsuoPEmp6?=
 =?us-ascii?Q?nckm3CULbgp3GgTjXoxumJmDd9lLu/k6D4o9GORrxChNQWkdHKZAlzSuZGSj?=
 =?us-ascii?Q?QuDVlwLpmZGYbLHhSQNjdokFDV5PyTjwASFFR39I+r8Q7sOljUxtcrSX6oM/?=
 =?us-ascii?Q?rKeXkVJe+1vL8hlz1k+S6RHdD02atlD2pG3w5K6m+/VLmJlPRlD1z1X4g7rJ?=
 =?us-ascii?Q?YoUQAdSP6LF3tGgZSWof2zFFULDWuGoKFIqz0zdXmoLmVlC2fADTZ50V+XhM?=
 =?us-ascii?Q?YHJiHh5R2mzQiFddhBGDDPVjU+UoVcT+gEKVj7zLrLJbmH72y6j5NS/LdQqE?=
 =?us-ascii?Q?Dhd1LGpS1lxF9bvZnqe+u0IwOJSvcnwcer7AVpAflc2aa0nsgNKRwgb5nv5a?=
 =?us-ascii?Q?GL86vs6rDHsei4RDrUMW3kRnetytoPeWXmzDQWU4EWjiooxvymLi0BEOyIRG?=
 =?us-ascii?Q?OUvvWACOGAsm8kJ8onhLaUSn9Y73fjbV/AvVEKOoXe0CKtRAy+8AllYRli9m?=
 =?us-ascii?Q?7v/4TJdzCTKONCUF9OxWK1rFP9NBDfF2azCrp1vi8xfNxMBJUIrqUjpT5trW?=
 =?us-ascii?Q?CjXVkzYRAmpHJUQVZfkTZIFNVH31ixLKKGFBy1f/HfwVHG9aL8Noh+Uqfzk1?=
 =?us-ascii?Q?Mu9n6E3S4CilqogZbVQu8APXIl9adVzo1NSaa8OqKwQ3BFZqgRxO+cFOAGWM?=
 =?us-ascii?Q?YEQGprmPv5RogFJ8LPkNvGijwcFoJAo9DAQPgymSrZ1emoPCvR/GiRw7pVu/?=
 =?us-ascii?Q?kg2m6Y555kADANiJOn9yqdKg8XSqFPFXupb2rD3ND0NA6ygh/BAFFwOYE2fm?=
 =?us-ascii?Q?Is63IUs4MYcXff8vCAUnDeZImFkvGTkB4/tt9uGZTelySUs9rkMH6WYhIOcQ?=
 =?us-ascii?Q?X94vM2ar/t/uU6/jmIoQuN6ezvncEW3swiTBBhTdMArUl/KF6HyT7Il/KV+l?=
 =?us-ascii?Q?tWYhjpuB/sPBxboQrxqfyaFxMvaOCX0u9FsN0RFtNru99XrY8ufBZakDYY2Z?=
 =?us-ascii?Q?V1AMWcBcsxsnCm3SMgyU7PmJIuRAj/XFQvck4WGCHlahTYCQJ/rN0coN3cHK?=
 =?us-ascii?Q?Tk2V8+lvCC4wX+bXvEALxTPCgyhVkrqNOMWCVhcd8g2O7FbBXM/RZa7a5PBT?=
 =?us-ascii?Q?yNDQ1aVImTP91eAA0vkP0gHnlNxiiRcEH6xNkcm4XH/Tz27XFaikHbAq3v1t?=
 =?us-ascii?Q?g+5G+Qq/9js4sYioAMOWvE8uFznI0Ybro4xOdkbj1hA2QiTNii/oEE2+lvDx?=
 =?us-ascii?Q?6m+Qslq3ZLwEWb68fpF2FjpVNyMg9x2xtiIfTyWgRGxIMdxyVWLe5CDcmPJK?=
 =?us-ascii?Q?s3KEQgcS8ams/uGZiECF64fr8BEe0glgF4Sme/2O0ixpwcwZ6LcRi0ggx6W8?=
 =?us-ascii?Q?5dyaP/zaINtT5d9olBA8//JRhwL5+ePbgYD0nJD5bNam4wFG8UA4YdKIZiRT?=
 =?us-ascii?Q?MvF69cf9oB4Zlyft0MRdpN1A9Nr0fPWx2vElBUcNgOlY1YvkID6r1HcnbKG/?=
 =?us-ascii?Q?59soTFLu6y21OOhzZkuuqev9rG+WtCqKl/MkGaAK75Ra5wykY3RjJBsqNAfK?=
 =?us-ascii?Q?IsMmE8USfnC4YBY65ov3Qz0Ga7W495wALTrlMMO3t/+QOB5zpm+K7INJyuEC?=
 =?us-ascii?Q?ObthUS1IYbXPKzFIxm/2+WL6ZjtwHH+VaTqLWTrAlRTqhXjIAPAFhcjTJekT?=
 =?us-ascii?Q?p0sYqQItqQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d65a814-ccd4-404a-9d25-08deec7831c9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:16:51.1479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F9VxB1P7I5lHiDxqLVwRYDE26Z/iX3ovLNRbCFLclQeGDW4+bGExdERW39NBYKN/boU8hEU9p569KYRHf+8KnqsWDAQmGech/dWi5+ZkROM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5152
X-purgate-ID: tlsNG-c201ff/1785223015-72AB72A1-BFFF02AC/0/0
X-purgate-type: clean
X-purgate-size: 2826

On 27/07/2026 11:48, Teddy Astie wrote:
> I'm not convinced making "VMSAVEvirt" mandatory is a good idea, in
> particular, there is a errata (1454 - Processor May Log Unexpected LS
> MCE Error When Executing Virtualized VMLOAD or Virtualized VMSAVE) on
> Family 19h regarding this feature.

Thank you, I hadn't looked at 1454.  Quoting it here for anyone else
following along:

  Description
  Under a highly specific and detailed set of internal timing
  conditions, when a virtualized VMLOAD or virtualized VMSAVE
  instruction is executed the processor may log an uncorrectable LS
  MCE error of the type "HWA" with:
   MCA::LS::MCA_STATUS_LS[ErrorCodeExt] = 0x16 and
   MCA::LS::MCA_SYND_LS[ErrorInformation] = 0x00094.

  Potential Effect on System
  System may log a fatal error and reset.

  Suggested Workaround
  System software may contain the workaround for this erratum.

  Fix Planned
  No fix planned

I don't think this patch changes the exposure, though.  A part affected
by 1454 has the feature by definition, and on such a part staging
already enables it for every nested guest -- see the existing
cpu_has_svm_vloadsave path in svm_nested_features_on_efer_update().
What this patch removes is the emulation fallback used on hosts which
lack the feature, and those hosts cannot hit 1454 in the first place.
The set of machines exposed to the erratum is therefore the same before
and after.

That doesn't make 1454 a non-issue -- "may log a fatal error and reset"
with "no fix planned" is worth understanding.  But it's an existing
question about Xen's use of virtual VMLOAD/VMSAVE rather than something
this patch introduces, and answering it means deliberately not enabling
a feature Xen enables today.  I'd rather do that knowingly, once we
know what the workaround is: "system software may contain the
workaround" doesn't say whether that means firmware, microcode or the
hypervisor.

> Had you considered improving the current implementation of virtualized
> VMLOAD/VMSAVE ? AIUI, the way Xen currently implements this instruction
> (by mapping the L1 VMCB then calling vmload/vmsave on it) is more of a
> implementation choice than a requirement.
>
> A better (at least, likely safer) way to emulate such instructions (and
> not relying on VMSAVEvirt) would be to copy parts of L1 VMCB from/to L0
> VMCB and let Xen perform the appropriate vmload/vmsave on its own VMCBs
> as usual.

You're right that it's an implementation choice rather than a hardware
requirement.  On whether it's worth building, I'll defer to Ross's
reply: given how limited our resources for nested virt are, and that
AMD nested virt doesn't work today, dropping support for older parts
isn't a functional regression.

Thanks for the review and the feedback.

Stephen

