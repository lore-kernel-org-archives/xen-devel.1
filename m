Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBCB606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 11:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=ebV+ZuAf
Received: from list by lists.xenproject.org with outflank-mailman.1485595.1688747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRT5n-00006G-6Z; Thu, 12 Nov 2026 11:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485595.1688747; Thu, 12 Nov 2026 11:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRT5n-000065-3D; Thu, 12 Nov 2026 11:35:47 +0000
Received: by outflank-mailman (input) for mailman id 1485595;
 Thu, 12 Nov 2026 11:35:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xRT5l-00005y-Lx
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:35:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRT5l-002tO3-1a
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 12:35:45 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6af5a48e-bab6-0a2a0a5309dd-0a2a4501b48a-8
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:35:44 +0100
Received: from [40.107.201.4]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6af5a48f-5984-0a2a45010019-286bc904c9d1-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:35:44 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by SA1PR03MB6515.namprd03.prod.outlook.com
 (2603:10b6:806:1c6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 11:35:40 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%6]) with mapi id 15.21.0615.007; Thu, 12 Nov 2026
 11:35:40 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPe142uaIX0OXiMd8LWjUbzGIVkIlXU61rTcmvPDsAikyia2h8NwXMPCEH0jFzpUQ5tU2SIm+MxPq7AwwNo6ZAyOcln8tBtj4gnOTv9X9CBG+D/D8zaBtQvboBq3ux95s3Iqa6qd8QFeJbjnc3Mqxdo+T+XIz32ohw8CYEWdQer0G9YVkaKg0X9Wy+K2HL6v4oH5q88qLmWioSAn0YCSbDy1a7SiVi0N/Lu9fec99uWM2Wja0WDF5TvR+dYzV8vD3O/GN3KNcSAYc421f3eSgbBgJ7DrMwQAnnjBkpnIjH9gPGJAZiRiACViN/B7oG9A79auQ/3UzHw/nBflMTOnJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+2qg1E44+VWTFt2UWwUryotZ4QeugZqDASY4PX9Xlc=;
 b=e25QutM2mr8hgil4U1QOv7ZlpwEw3qjxH/+fG4st970GJHOmamiFDsgH0aggWXzI7gyiLavnuX2OKZwjPkr52UZgdko1z4t60uYTskWY0QtmT3t3b3hmJKron2rCH+3vYdfW43OuMtcLET7G2KEmNh82SUDMF9KcO500Fym+FB9wmWG3g0w5rlQwR7GWesi930oLJvMGu7gLdnORMZGh8d7EPE7Tk/1TCowqSXX1XDVr0lYUSlKkUhZ4G40SboKxsZCPvlRxXZdGv0a34ph3tTZsOlQYbC98gMGlQZBLcAH84nNCnwbrvLe8N+zo8UZhSJtf5Vp6QYwqInHFD03LLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+2qg1E44+VWTFt2UWwUryotZ4QeugZqDASY4PX9Xlc=;
 b=ebV+ZuAfKrKLnf+KofoP4cUbsh/nemN0h5CyQyThgubaDXiVujnfWFzqO7t+Kk8Laf6H9K1p8eXNpbpL5ZbW02Dn3DQ/wV8Qi51G96Wb9ELN0LPIIDi8Xi5tHSMf8k6kFb2SV641dxLn30Dk3M9q74mg0axlCt09+Xc8VflfB/M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: ross.lagerwall@citrix.com
Cc: andrew.cooper3@citrix.com,
	chunjie.zhu@citrix.com,
	jason.andryuk@amd.com,
	jbeulich@suse.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 0/3] x86/hvm: fix EFLAGS.IF handling of pending events with nested virt
Date: Thu, 12 Nov 2026 19:35:22 +0800
Message-Id: <cover.1794482561.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ee9fbfcd-04d2-4e02-8f80-efb850289c30@citrix.com>
References: <ee9fbfcd-04d2-4e02-8f80-efb850289c30@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JN3P275CA0069.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:cb::8)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|SA1PR03MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: 8747f5e3-805a-44a4-859d-08df40b1142d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|22082099003|18002099003|11063799006|10067099003|261009223027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	+ndq+MXDD9juuvHIDSTgVCCFlG2UcohQGgFqNF/2MBeyJwDZMmjJrjS8RitYLMscg++TtiuFcHxkxePyJm7DfjGdZW+RXFBHCCatFQj6zru0bhvqBvAxVEXylwxmoPuwv+ia/hAxgUuH2PJ+lailb8mfMv5hm87c71wlV0ReH9e4Z+aZxv/pzMyQMR75sjim8KFRRTMZ5GpzyJeBIyzDxk0bKhwZ9CwKXx1JgjNbYNFqFx6a6EbqJAa8tBCaZlHH/rU3XUeRnRjJqSP8UxGKGUhc543ikIewKwPc5xsrA936sK4ls2VCdqbKACPfRLrqNCtOcfkGueea3zwBGLL9JZlD3bLibrb20ooSlsvr/bruNfrT4Dt8b/B9SzrqTKLa/GjJJGlA3wxUIN44UmLhsL/FhTTXuqCuttPVzDHrem9VwoC9n6GGUJjDK5pXRaX/5Qq7sFln6oCgg1wMfJgVmwr2/qSztO+Wu86yk3CP0kC+tdG28HZNyuWO6zrmzsU3rQXSY4o4GFk5MtsFRY+p/9wh3ove2sxLutaYkMw7mAiB9p0qZ8mcj0+QVaweLVqyrJ7hMO+kyDMn6H2P78Z8G5QovMBdd5L7QEbP5O70BosLG0z9s6gzGHQYjfF11YpHjHmHQ1W9RIKW00tfJJHHvmTTUKrE0ONOKmi0Dznxfz4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(22082099003)(18002099003)(11063799006)(10067099003)(261009223027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?61K5KnFZ8kSHCWvmolg2kPDQGgrx9mKlhzjqKgEUpvT+LDCUj247R0QPz1b5?=
 =?us-ascii?Q?uRLhTa7177/dTf+fxvVWNJOQn25cYWtk0DqypvMw+VJmFHjxSMZX+AEuhd16?=
 =?us-ascii?Q?w54patWBg1ekmiZDg6DYtu9cDojyWGaVKA0wVeGyyWmjh6CcBLekL1Ip9AsS?=
 =?us-ascii?Q?Rw56njWTW//4gkMpxWv7a4mKg0wUJd1wSnL6yS5s23Qx1VBXlXMisxdjlsO0?=
 =?us-ascii?Q?6pBqJDTML43J0cR0tD4wRuiQ4KMIa0oa4kwYiGUoal5i8UI/jNo76Ifg+/Yi?=
 =?us-ascii?Q?HHan7gdU7IZ3D4BiKZ1KaL318vSn8wEepW/CB0Ke+LYGUv7lx2B6lIQT0QHV?=
 =?us-ascii?Q?0hlkcBWP07HkkBNc/eOa3Sf8118hQtvTZT1fN2EeeL00fT2+7CqvU6QH4TN5?=
 =?us-ascii?Q?/cX+WaeDuO02T1mdC7hoxKOjwf2wOia2LQebcT0tdWP9Xo/HJFXbnoXnJHFX?=
 =?us-ascii?Q?+QZe6aHMXUgpROWvb2mwAXvEm0tyhw3DfzH1OdT4JGRi+97nDL3ey3ghkeoE?=
 =?us-ascii?Q?HSQRXI9OTNeV9InbkZhdr7MjtbZHUONXdqmEKd1GaSDrbag8pwKAuPL64tKT?=
 =?us-ascii?Q?a3pzajzd/iWPzg5a3htCecOaiI9Lye2clFWUPMbj7QXQXWAKk9PGvE7mBfao?=
 =?us-ascii?Q?OFsZqIJJYhqo3LT0Jn220FWINZxHeGR1lCUxEtg87xtWpUSOXdfHWUSEYsyK?=
 =?us-ascii?Q?2hd4Y0GKdXSICLiXf4TDkB6phDFAriIXD+Uc/Mg7Z/9QqJl/0oh1THeWzBbF?=
 =?us-ascii?Q?CWXRkWD2ngNS0hBAYWq/O/t3s+A86aF0HLdUugUPVo3OOhenJCatP1ykcLRs?=
 =?us-ascii?Q?Vkdc0ncRLMeaFG3Zf/kz3pbrZGMG1gH0dlL/VnwEma6kBNX/zRG6qE9cTKxP?=
 =?us-ascii?Q?HI95TVzOL/BwRrK0k8T01gESWNRmUqst5gWurNvmyKzfZ+VyngFx95bfk9bh?=
 =?us-ascii?Q?8okun9SrjQDppPJRMVpIdQ7+iLs+ltCFPk1lRG032h1gy2guPC/QpzvWxzWy?=
 =?us-ascii?Q?aseCGlVi5kcoiXpearrzmCzARDZkp/AnWsf8I9HZdGQSIWvpHGaOb+sCtDl4?=
 =?us-ascii?Q?xP0LRqnPFHqaT2EF37V7sZqajlzHCpUApOAfTZIasT2SJG/vQRvcHMH8nMcU?=
 =?us-ascii?Q?j2gufQNgJFOAyXkZAJXQxFJHxuiLHUJkNZ7Yj6L1P1fnALhrTSZx765+T/gO?=
 =?us-ascii?Q?Jr2yKB6qVhIkYVEfG3LPNa0/QuUpZWjBUF5RJ8+WtEQoUO0LFKVYc9eeNvFW?=
 =?us-ascii?Q?iiS7Q+L7Bj19PP3PbojAD55utMu/qi2YkuMoYespUV9yIIEDPQNHziNhdqy0?=
 =?us-ascii?Q?nG+41mKFl5/RKNtrp6ZNi6BFEq5VfCXws+5Y/OJTYBOgEC+e40snjiGToP+k?=
 =?us-ascii?Q?ZBenOPPJWHfFk/pFPhc1U++SqaLuwjLjBBoRmJe5FqmssG3R05vpUuH/yN1s?=
 =?us-ascii?Q?i8X+7OZxAuErHyY4HymMTUUA0HYYdOOL/Cn0WdEkratCMlQHE+0iy2G13D5i?=
 =?us-ascii?Q?r8JYY/S9yRGRsB834gV/sce97FBi7ZwBNbcR1p2vvxGM2QNmIIj6fMTOUFg0?=
 =?us-ascii?Q?PliQBJLlafjJg1zu38nI8BTqWbHruHhgcKLxE0APZKIGYb4c4XmZB9bP4OP+?=
 =?us-ascii?Q?lqPmxUw6IeLulWcBXc7sd0M6neYR0rZXj9u2lUmPjC+NOXatv12hJs5L3dvC?=
 =?us-ascii?Q?pQOx1/65Wi2aq/ii1MdP+KFbmp8N0qZ1kBUA42O4fzlru39dB1fRyKvfNkne?=
 =?us-ascii?Q?TCbEmNuZcA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8747f5e3-805a-44a4-859d-08df40b1142d
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 11:35:40.5559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9a2ZsgvpJbrFnXvZ8Xqj2wETFgOVRCZad5lrfIYaUlKXyyPJutXYujPl721I8MXgZHhIq1NNwxWbn3Epn6S3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6515
X-purgate-ID: tlsNG-d62444/1794483344-BC75B757-F23A71C6/0/0
X-purgate-type: clean
X-purgate-size: 897
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

Patches 1 and 3 stop EFLAGS.IF from holding off NMI/#MC when nested state
is involved (and in hvm_interrupt_blocked() for #MC).  Patch 2 makes
nested SVM honour L2's EFLAGS.IF when L1 clears V_INTR_MASKING.

v3:
 * Address Ross's review comments on v2, see individual patches.
 * New patch 3/3, suggested by Ross.
 * Rebased on staging.


Chunjie Zhu (3):
  x86/hvm: don't let EFLAGS.IF block NMI/#MC due to nested state
  x86/nestedsvm: honour L2's EFLAGS.IF when L1 clears V_INTR_MASKING
  x86/hvm: don't let EFLAGS.IF block #MC in hvm_interrupt_blocked

 xen/arch/x86/hvm/hvm.c             |  4 +++-
 xen/arch/x86/hvm/svm/nestedsvm.c   | 14 ++++++++++++--
 xen/arch/x86/hvm/vmx/intr.c        |  8 ++++----
 xen/arch/x86/include/asm/hvm/hvm.h | 12 ++++++++++--
 4 files changed, 29 insertions(+), 9 deletions(-)

-- 
2.34.1


