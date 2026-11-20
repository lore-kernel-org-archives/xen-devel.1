Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49715606A320
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 09:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=j18aIcft
Received: from list by lists.xenproject.org with outflank-mailman.1497883.1695920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUKUX-00062z-RG; Fri, 20 Nov 2026 09:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497883.1695920; Fri, 20 Nov 2026 09:01:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUKUX-00062s-OS; Fri, 20 Nov 2026 09:01:09 +0000
Received: by outflank-mailman (input) for mailman id 1497883;
 Fri, 20 Nov 2026 09:01:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1xUKUW-00062m-IC
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 09:01:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUKUV-004ifu-SR
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 10:01:07 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6b000c50-2eae-0a2a0a5409dd-0a2a4504df84-24
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 10:01:07 +0100
Received: from [40.107.201.53]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6b000c51-b57f-0a2a45040019-286bc93588f1-4
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 10:01:06 +0100
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by SA1PR03MB6419.namprd03.prod.outlook.com (2603:10b6:806:1c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 09:01:03 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 09:01:02 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfPf/4IR9MYcAVGNDP/UkytWpz/euG839Tf22jP4txlpgiCSj2jeUQb/3jO3WcqgrM/jDCCc/aVJCh6koluAbk/n8B1LwVtZuzU75muR2NNkKrHnonLqpMnOV/Hl3snU4GXyhXx8gFqy4FYKEpk4B+Fx6KFFH6Qi0AAlVd1RWLE+iRaKn1T7DLjDCD3v1wwpfa57H+QcbjTJRnUUZq2yo3Uxe7pTygSW/rlYhKthv71uXYgNZ6wQ12KN/6abuHR05+SibaQpwJFsiElPruSbJrF1oimrdRmy81YqC7ezBJVTND0HBVXBeDA9X4zPW1evZsjimVm25xZBjvNudoDSYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJflN8Rfxna3WIqRcMlIFLSb59UL/P6t4+JtU6Q2ra0=;
 b=hRf2Dkyyo/bHu/ptNRBgnf9CM4c5nCeb3VDTMr6t7J02FjOFYSK7Fea9QsI/NK4DELUGCs7yP2wTXYAm+CLf20AOoAuIFTC5rZWmrXlAjYVF681OHsKc+cV+K+RrVz69eC4Xyr1cppsNdAdzACyAbzZyjkSCs5bGkc+zpK/2f3CkIBulIeAseB2sLl7pOuvWmy3r9uKAkz07p6vP8skxCSuucOumQ2KesGw/F78B4h/qvhsItx+ZAsVuy3q6rqKFbWJUzpQaU6/yrS29818ntGq87gPVmZV+Y2Gz5B/SyL/CGh97hmXQFIwTIrPHMBTKOQwjDXPhEzU4FO/h4E3W8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJflN8Rfxna3WIqRcMlIFLSb59UL/P6t4+JtU6Q2ra0=;
 b=j18aIcft5p3+aB80GS8dNkgkQ5dzlagGGEZQtTTmbZJ2fXQ+IdGlrsd/fPZ3hTbN7JjUO6ewezKy1B0NEIXApTuu9FFSYnEoHa1ifeDSfWMFOvyfnaGnTCEyXyQLuuik3py0e+/WtKcd2ZZVTf7R+OSW3lAipM164blFhQoporo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stephen Cheng <stephen.cheng@citrix.com>
Subject: [PATCH v2 0/2] x86/nestedhvm: Fix #VMEXITs which L0 creates for L2 events
Date: Fri, 20 Nov 2026 17:00:11 +0800
Message-ID: <20261120090013.271926-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0058.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::9)
 To CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|SA1PR03MB6419:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a2c7d5-b8e5-46c8-2ca8-08df46e4cd3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261022105027099003|10067099003|11063799006|56012099006|261009223027099003|261021123027099003|261102123227099003|261021121427099003|261028144727099003|261026140227099003|261026121527099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	u52GRatXVApxbyojte2DMsjBpM1y7tjcUYMYV8DTOQX+YXP//QJwDEhMQ7mBhdlX6OTICg0zKdXEuPeVSRrcI3seekEgg/ecy5oNNywUSr7s4IJ3ZMFYb44Q084L2E4O4KOib8iF8XTSruqc20JBXyD1xtNqutbO9+Cz8picO839DeGDI79DwfaGQUKzCv70thXCupIQE7is6VV0GA5KTBRBa0sEM93IFIS1LP8rrWsjgxmUc3JZPHLPREn9OIXqPMWrJqIiJsPL/KRXLd9QEKY5Ouram2lylzH/S8I9RZBG2zB7r9lkgdvl8lEW8ZbtzAHYLZlPiXhyenntx1lYWouAo3RyrZQssm+Q8ULEAr3pO0M+jS/zYjAjj71NzL7WnEGeKLQ5SZGVTA0pNBYKqDl8OiBaR3ed3OmnAFYvWvI0YzuS5Qv+0GRVh/cOqRf79j74Pu1zGCOkYoui3PLo5oRiMtqBjuZxoK7zRe3dRy30sUPIU7cY3o9+PCYjFc1iVuA6tdoMVGu5PrUOvo5sErMnFcKvLqWS+lkcLvslFO4d/6Q1kJdZhjr9kGlURk7mDpK4Pl3xLJXzhFljqmUKEim6hZvC36qTT2Bevt45DlTMgovGNPYemR+yRBy1knvO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261022105027099003)(10067099003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261102123227099003)(261021121427099003)(261028144727099003)(261026140227099003)(261026121527099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QWqi5FwoJyUUICRoSC3nhSgFqikRq++yaPTgTfbaFetzznCKECf38QtLoQSp?=
 =?us-ascii?Q?l+DMeNuYWqjGF2g7K3b8WiMu3lqOgQeYSgoRRnM6bVKZWnWjjZf5DwUNQDev?=
 =?us-ascii?Q?iGtN23sTNvkU/qBI0e+X4U/GLT6RsM35jHMk4CIkWf1zegQlo+R/efKMgDM3?=
 =?us-ascii?Q?lL+6Efkwe8l7SbqfHFzYCKKCAk52LnYqSyYRAQSZuyIBhjoIdq+8uCoUBzVI?=
 =?us-ascii?Q?8nEXZlOrI7XFC/ZZ5KKCFKoOc1DiPsacz7f1HcxsiiuUxUJCaL4cXxWaNaS6?=
 =?us-ascii?Q?u8GA98twYj4T/skhzxFYlTMgTrBrp8vkD6Ry5N6dZylST4jCtyuuri9uN17S?=
 =?us-ascii?Q?6X6IgZgdIE1cDRIaxAIFhpZClFSKsm6pcPmUMFq72K/ubuLJ25NLRcjh9Ii7?=
 =?us-ascii?Q?qJCwuP8Yln4vv5eXU+9Mo1BhDl/uaOXNJYQrStTWqnSAl/u8hgaEuKw21PmU?=
 =?us-ascii?Q?O3K0YiNP93mOAkiFBKIvZ5IHkC0mM6/7fFwnoFOofSE0ctahNzyKWRgvg+/x?=
 =?us-ascii?Q?Z7i6NR1OIFMJvH0l4o63qUM40bJqeSMPtD4zx0HecxhiAwW9ayl/utHGvgbm?=
 =?us-ascii?Q?/cwpfQ4POxOclb5pvAntHpBUMwWicJwzHrs/JleOqf8aYSyAVHuL0OoTzTn7?=
 =?us-ascii?Q?mpIkWetJP0PYkBUPgGOLcwXOPCeqjgNpFdbPmE//3O9QQEzqEWcK+U4HSYvY?=
 =?us-ascii?Q?m++EIKC8imjEj4x6WJrQX2aD0SERff1aTzE/fJLFlwy0I4I6SNZM//AKu9of?=
 =?us-ascii?Q?1gvoowzmdVM14xUF5iLBlYr4FuE7SyHzZ8sN22GqzDdU7WSx/3VFk9Su4tt/?=
 =?us-ascii?Q?yLKWdCMcd3sy0jS7WF/a7pdx5r+P7e3nBNss6nboUTn/dUONmPIXSTZ1Osey?=
 =?us-ascii?Q?0OQiVttxuuPPga58Yh1PQHGO/WJwUzdz2iK4Q/v3IKbZEeOXA0GqgsR0xIva?=
 =?us-ascii?Q?hzuw6IUqa8wVhLKxaVFktPNxReeUtxztYXLEyKK7SZcoiKixeyHNNTi4lq99?=
 =?us-ascii?Q?INmDGoNjrzhe1donSTOrX/XqxzLrKSaxl7yqqC6LybqT19pugBZvaTU2+WQF?=
 =?us-ascii?Q?Nh+yCc6t+y4YIU5dxk/4lFw3M1BUESQmypIxHQjmCswUnJQb4lB5IYSSjZRK?=
 =?us-ascii?Q?+eHHtvPvjQeeyxkJtabWdyG27n/El8fOnwJox89Og1DqmG3NpZtUyJjL8Kxj?=
 =?us-ascii?Q?b2ob4Jq/i80i+iQ0aF7Z7SRNtdufv+zEG1Mj/VZol1w+Krzqy348ZER6VqyD?=
 =?us-ascii?Q?W23iKaDQls2LQ1wofh+px+J09RmKrpG66qmRGvUh5XghkIcmSW+6zPtwPDDV?=
 =?us-ascii?Q?3GVDyInoGZVA7IfcBVDAi9oGK78YGuXLdMpSqpgVkaD20RNr5Tlub9U7hncB?=
 =?us-ascii?Q?w4TmXy5WdteZC+TE4+Xq3+EwjlOK1uA0H2VEKnfQleFP78mQICbl5jDMC25c?=
 =?us-ascii?Q?GZLyT58nEif3hDWkmIR7yqld9yMwNswA92bG5W4nJAJhJ3tjuAZ6RQi6PSHK?=
 =?us-ascii?Q?khcKKtbZ/lXuMWys6QvOb2X0Pe/kRVp9d8nHQuYMB0f4YoKbpjkVdBfVY2Qv?=
 =?us-ascii?Q?gwLGQLj/uzOqGbUQ45w4Xne0PDy7OqaGf7sYq0czaFcNeY1i++NVO1AJ6CnL?=
 =?us-ascii?Q?YIIhy2wMufKo875CPqWTATzppxphoJH30PPJQGq0ViFiO8xUS4/E5fT6RWhq?=
 =?us-ascii?Q?wSNGvKQlRlHLh3R0gbjHwWvbnAw0qJ8/LMO8Wp6n4DsLgR94TeUy6QkI9rKP?=
 =?us-ascii?Q?W2E0do0KMA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a2c7d5-b8e5-46c8-2ca8-08df46e4cd3e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 09:01:02.2527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxtiDYZhaHqr438VtBdfBuox9NiMZcZpH5Vd4PSquJojPOvJ7bsg7kudlFNGvhlkXmEyoulpGVFgEmhhORBjKP+cjz91LIqwoPw9fpp27CE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6419
X-purgate-ID: tlsNG-ebf023/1795165267-51ED6B50-76877198/0/0
X-purgate-type: clean
X-purgate-size: 1875
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When L0 handles an event of L2 itself, and L1 intercepts it, L0 creates
the #VMEXIT to L1.  Two parts of that #VMEXIT are wrong:

 1. NextRIP is copied from an earlier hardware #VMEXIT.
 2. An emulated INT $n is treated as exception n, so the software
    interrupt intercept is not checked.  For some n, L1 is crashed with
    "Illegal exitcode".

Patch 1 was sent alone on 22 Oct (no replies); it is only rebased and
reworded here.  v1:
https://lore.kernel.org/xen-devel/20261022090658.151682-1-stephen.cheng@citrix.com/

Patch 2 is new, and uses the NextRIP from patch 1 for INT $n, so I send
them together.

Both were found with nested-SVM XTF tests using the forced emulation
prefix, and tested on AMD EPYC.  The VMX part of patch 2 is only build
tested.

Not fixed here: an ICEBP in L2 which L0 handles (always for a native
ICEBP, since Xen intercepts it, or when emulated) is checked against the
#DB intercept instead of the ICEBP intercept (APM 15.12.2).  I will send
a fix separately.

v2:
 - Rebased on current staging.
 - Reworded patch 1's commit message.
 - New patch 2.

Stephen Cheng (2):
  x86/nestedsvm: Record NextRIP with the deferred #VMEXIT
  x86/nestedhvm: Don't treat an emulated INT $n as an exception

 xen/arch/x86/hvm/hvm.c                   |  3 +-
 xen/arch/x86/hvm/svm/nestedhvm.h         |  5 +-
 xen/arch/x86/hvm/svm/nestedsvm.c         | 60 ++++++++++++++++++++----
 xen/arch/x86/hvm/svm/svm.c               |  8 ++--
 xen/arch/x86/hvm/vmx/vmx.c               |  6 +--
 xen/arch/x86/hvm/vmx/vvmx.c              | 10 +++-
 xen/arch/x86/include/asm/hvm/hvm.h       |  8 ++--
 xen/arch/x86/include/asm/hvm/svm-types.h |  1 +
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h  |  6 ++-
 9 files changed, 80 insertions(+), 27 deletions(-)


base-commit: 5b28c0efc1d5d73ce651ca651e103c45b6932f9d
-- 
2.49.0


