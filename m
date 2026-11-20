Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049DB606A320
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 09:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=L43xUYkc
Received: from list by lists.xenproject.org with outflank-mailman.1497892.1695934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUKW7-0006YA-CN; Fri, 20 Nov 2026 09:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497892.1695934; Fri, 20 Nov 2026 09:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUKW7-0006Y2-80; Fri, 20 Nov 2026 09:02:47 +0000
Received: by outflank-mailman (input) for mailman id 1497892;
 Fri, 20 Nov 2026 09:02:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1xUKW5-0006Vd-Ej
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 09:02:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUKW4-003Mfw-RH
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 10:02:44 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6b000ca8-8faa-0a2a0a5109dd-0a2a4509cd14-34
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 10:02:44 +0100
Received: from [40.107.208.22]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6b000cb2-be1a-0a2a45090019-286bd0169719-4
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 10:02:44 +0100
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by SA1PR03MB6419.namprd03.prod.outlook.com (2603:10b6:806:1c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 09:02:29 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 09:02:29 +0000
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
 b=adL7xdR07f1ZD5y/P0wfXtk7VV23JKbRYQYs0NW4Nc3EFeADBSsLL2vk4zXf0jK3ty0zns7xeKlums1405u6lWLuemSf0q6F2eWgyyVCSjW7pyRoG+SUy0AO1tQcTP/wcIOx+WPOUx1Ja0msdq8ftPWULxdciL8XUEFEVX8XOYK8IcLhd8s0rhL6IsbAiGFuDdljsn3hpgdfAkSE0v/5Z4WsPoSmR5rBfBEGZHb9oNBrrF3RBXLtu3KtBjtg+hGQqGkoTo5wXTMn0O3eSQr8RPhMnzOXVW8KKqTpgyh9hyJXOAE9VnLX4FiT7sigKS7RDGd3EVDkh9wa0HRJeGVmVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5TRhWD1Ujks8mNxichRYb4a82YhbY3PV06BDqVi/KvE=;
 b=AUDIuyPZ7RAi9PYlkv0SZ9qSjskfmF9DgTmrIfegD9V0z/xRPxOkHnMmsu0VNbZeSIZj71zlLV1BwW1URuSRDR+qVFfo2NZUR8Z6W6GuKhbIslBTRQm6Ao8iwYebA02cv7NTXa92V/pZ/qasrF3Jj+GL8XuFSDDzfPcWOE1+mvDQlOIExgCcLB1tOl/knQERPNDi/xI5Z0+plWJM+pgWANiCpi+pPOyYXAQf9dydJ2o6buNyl/DiNJzTNrMkntYLH8s9Kygt3EupRf8MraRsoT3sF+lRfWr1RVLsi464Rh/KGTfHG5N90QiKLI0I4G5hCCp4VkjyLpZ4MaW8UzHWKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TRhWD1Ujks8mNxichRYb4a82YhbY3PV06BDqVi/KvE=;
 b=L43xUYkcLdDVDpCp85Ab9P3/CVI0SHdTY4GT+dTxHJiZUubMPAaYAVOByAoL8ai1OIDESfAdB1T7raKBYNUKpFX8JViyMm4ArHxHbT2X+3OTRcWqG1wrY+YWNNWB9YpgBlQDE0py41qwcJp7nPx9jc1z6oEOn8Ddi80jpMFy7Po=
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
Subject: [PATCH v2 2/2] x86/nestedhvm: Don't treat an emulated INT $n as an exception
Date: Fri, 20 Nov 2026 17:00:13 +0800
Message-ID: <20261120090013.271926-3-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261120090013.271926-1-stephen.cheng@citrix.com>
References: <20261120090013.271926-1-stephen.cheng@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::10) To CO1PR03MB7889.namprd03.prod.outlook.com
 (2603:10b6:303:275::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|SA1PR03MB6419:EE_
X-MS-Office365-Filtering-Correlation-Id: cc3809b3-1b68-4923-0b33-08df46e50102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261022105027099003|10067099003|261022075727099003|11063799006|56012099006|261009223027099003|261021123027099003|261102123227099003|261021121427099003|261028144727099003|261026140227099003|261026121527099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	/8TyV0kzold4BMnYqyEySqXxMFSg97pLviGjDK8nrfeObe/Ftm/nXiM9eyv8+DT9kuSUWwvHVXGQwWKZzBbghSnagNlDLx8pg31IFpXg5Xq2LOE10L1af8DfwIHBRCNJugTMEF1oezDwpVui8vC675qGloazimtKGouOeCNeXQwGaV1vJYWtIaIGrcVwwqEv807qdZLbHrIKKTSJU4rplVo5pkL2ER+AkRzL532caVkMTUp55873780CIpb9h8ipZtWH8zfYeVfilxDOL83IPPCeDXutOw6KtvDo4XGRbsAlho2M+goEmQN6/U8yg60fLF1R3E8UTbZHvnWNuUj2BE1nWGmzKeutIc7ba4hF2ztUxSGsnqYnPK9yo24R1vmztsdqJVj4qNEmV/qt81kaRdmoJlM+Q6UU+ImMAV5mbXCFYINxem2U2J1ET/AWeUZvAPoZzyfy/w4pN3LYWR+FPXaPLgBYKMaXTkYdcRnGM3QNfcaPzr4LHMJiARU+0nuL8jc8vdJKgAhL4vuAKCaPgGIyAPzbkkY2kHqCx4BGTe/L3XttyUukpxggFWYG9O5xj2AshVSyx15Hpaa8QufHW0H7vmSMiGPWLCOfxjBsRjJyQc4vqjylqE8kCmb99kwEvWI8eyEPXyq+td6QTmjtpvsT5StGgyLPOd4aTuSKNhU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261022105027099003)(10067099003)(261022075727099003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261102123227099003)(261021121427099003)(261028144727099003)(261026140227099003)(261026121527099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gk+VRkVl2/hthFgvauw5zF/CLgHYxZ5ClGxvLbz6E6+JZnUHKKLUAi+EvBWE?=
 =?us-ascii?Q?b/YGSSrLRHLA6Wfywa003mQJ8pNWf1geLcSTj22nCuen3OpdLuVHFVOwd5hq?=
 =?us-ascii?Q?wRjqMic7moDbsMQFruEn1hoNg6pk3GU8H1t1yJGONGLWvJVyGi017iOFdtBF?=
 =?us-ascii?Q?UtCvKbw0Y6K8UTgl/4107WBLnsAOjXS9Ukwo/EHqrhp9eJnhcM41h4+X+qkv?=
 =?us-ascii?Q?i6kJp+ePBKPiuLtvQxXMZoMi/BYAuba38irK8eK4OIxZIycY9ZTr4LPCN0EO?=
 =?us-ascii?Q?HQ8rmd0JvVx9+IrI3p1QT279WZQObWsDDqa5A7rw/oAtyDmkmisqlr+2KDn0?=
 =?us-ascii?Q?ytKnUq70wocOG3TnK+1eAYjmWjSbY3eQIXP+1l3GUGbW1ML8YjyE115Hz//f?=
 =?us-ascii?Q?Jjgl0B52P6Fzhb+KsXd+q+SfKiOBSgQbKb/xBJFLdbeKWtByA4gBeXwzXd6N?=
 =?us-ascii?Q?HyAChS3NBM7UXgBkP7u/KsAzr0ZjBkcwy78Qw6VlQ5PAcJlm5Tkpt3z1gKbO?=
 =?us-ascii?Q?nkmCjBab3cpyH3OGB0ygSEK0Akcx57hy3SSrI76UMbjHb+zBDf3Cs/mOBqx4?=
 =?us-ascii?Q?1ZOehl5AYtTxXS5EegrKMwT2W313xTknbM1dnxozsWjZUhGOVnAtxD85PHWQ?=
 =?us-ascii?Q?mkJ6QFwdI2Pvwq941JGzqtN3QXDfu5iHIfQdB2mf8jMsKg/m8iV++V1gSEoR?=
 =?us-ascii?Q?Wg3MN0fXm+ENHnKRdf9OvPEl2nbh3YK8B/4hk9rx5MDurZhPujyUCFAD20HG?=
 =?us-ascii?Q?r0AjBQwt5d/wC1LToOwT0xR3MD4cCGfNc28qCQpM+Gm/3Am6Um5EZ38w2pxY?=
 =?us-ascii?Q?tOqQn3fMW1koEyW2HmTFvwcnss7NT+ckrZJ8HTT7UCRaSBvmoUv224Eisgao?=
 =?us-ascii?Q?k74w7JX3AgWxjO0QdpQGIhGbmDrMpxbWOYxhN/ZfgWlMrqM/Jq64NT4tGWwR?=
 =?us-ascii?Q?fZ8JisTSHVL+2yj8TX3Jmr4aTqJpwFCah68fw0RZpXVTwvILUQf4B9kfVqtP?=
 =?us-ascii?Q?OEjk2ohQJIenvfEIoPtOquqfPMgDh0fRFjnN5gwsM9/u1bXVS1EfsVoajvga?=
 =?us-ascii?Q?Ej2nzDaTnVgvHs0venyf3KUlKi9niuhIGgLmp5XXBvv/Jjbrvyhw+udAtKd4?=
 =?us-ascii?Q?kDiLlGEprTerJyiDDEkz8wRu1zBg7mgzo1w5l8pylbCkCDPgoW2R1u7/d1TP?=
 =?us-ascii?Q?EnBvI9HqsdGUmQs/7//IHCu9zTuMCHdXr2AaXrtHW/mXvIkakMtVXWDrXUUn?=
 =?us-ascii?Q?XRnyV3XO/DdLmQ/dKE0Y2y7g33gf97mVNBeR4RS8z1I6aHgY/6EHL3WqeUWM?=
 =?us-ascii?Q?C8GAJh/P6PTEX1ZbKF4SaDLaQjOCslbXpzmIuEYauUuZuHW6wYh2qVXB5vun?=
 =?us-ascii?Q?gXYEBQYXRvfFM/wV9BLJ6Bj4KzvJ5qhZeKRXtgIGUFlcC6jW27GqZaSpZ5Gh?=
 =?us-ascii?Q?EbRPY9y6cXT7K/koNw52QpNUfHct3dMNYl99YR+nnB9eCIy9XFuA/5AjXQD3?=
 =?us-ascii?Q?aAG+aDypfJ6RkMLuejM/nJ5MvOiQRssbLxckg9XgRJcsAk2O6XiWginQ7SWE?=
 =?us-ascii?Q?+Zkyg/M6+iJ14FOPyxv3IAktJ4A6qpObfv+buWLnDIXZP28oH/dfnhdz8b4M?=
 =?us-ascii?Q?MVV5mxUFfUEzUlfWwgzPhMaD7Mz3+0Xr6ezZSdQILQHhr7UtEL3X7XFMPpnF?=
 =?us-ascii?Q?BFsfrQwze7iTOSW9YL3T9TaBcdrAHkLt7D5JzEAFQu2RTXmUXfBKkgGemqef?=
 =?us-ascii?Q?ARwQt0JOMw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc3809b3-1b68-4923-0b33-08df46e50102
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 09:02:29.0541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eV86PXcS6Gf2rpBKewfDm7Lb4OuCfO2DA44V6UQxeLucsb95K5oyOt3n9C5Kwx4KyEmC1oBgixcUR4wXHY8NtAjo+UYwT/asWDhN6AnBsuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6419
X-purgate-ID: tlsNG-bad1c0/1795165364-BF0DD034-EBCABB32/0/0
X-purgate-type: clean
X-purgate-size: 12085
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

hvm_inject_event() asks whether L1 intercepts an event raised in L2, but
passes the hook only the vector and error code, so an emulated INT $n is
checked as if it were exception n.

On SVM, L1's intercept for exception n is checked instead of its
software interrupt intercept (INTn in the APM), and the #VMEXIT is
VMEXIT_EXCEPTION_DE + n instead of VMEXIT_SWINT.  If L1 intercepts that
exit code, it gets an exception exit for n < 0x14 and an unrelated exit
for n in 0x20-0x4d.  For other n, L1 is crashed with "Illegal exitcode".
On VMX, where INT $n cannot cause a VM exit, n < 32 is checked against
the exception bitmap and larger n hits ASSERT(vector < 32).

Pass the whole event to the hook.  On SVM, check INT $n against the
software interrupt intercept and exit with VMEXIT_SWINT, EXITINFO1 = n
and NextRIP after the instruction (AMD64 APM vol 2, publication 24593
rev 3.44, sections 15.7.1, 15.8.2 and 15.12).  On VMX, never intercept
INT $n (Intel SDM 325462-092US vol 3C, section 28.2).

Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
Fixes: 479d4619fd5b ("Nested VMX: interrupt/exception handling for n2 guest")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>
---
v2:
 - New patch.

Tested on AMD with an XTF test which runs INT $0x00, $0x03 and $0x80 in
L2 with each combination of the software interrupt and exception
intercepts, natively and with the forced emulation prefix.  The emulated
results now match the native ones, including EXITINFO1 and NextRIP.
INT $0x80 no longer crashes L1.

About the Fixes: tags: the two commits added the check which this
patch changes.  At that time it was not wrong, because Xen injected an
emulated INT $n as exception n for every guest.  It became wrong with
commit ecf5678200a ("x86/hvm: don't discard the SW/HW event distinction
from the emulator"), which made normal event injection keep the event
type, but did not change the nested check.  I can use
Fixes: ecf5678200a instead, if that is preferred.

 xen/arch/x86/hvm/hvm.c                  |  3 +-
 xen/arch/x86/hvm/svm/nestedhvm.h        |  2 +-
 xen/arch/x86/hvm/svm/nestedsvm.c        | 42 ++++++++++++++++++-------
 xen/arch/x86/hvm/vmx/vmx.c              |  6 ++--
 xen/arch/x86/hvm/vmx/vvmx.c             | 10 ++++--
 xen/arch/x86/include/asm/hvm/hvm.h      |  8 ++---
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h |  6 ++--
 7 files changed, 52 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4334ff678d3..863c3666d25 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1774,8 +1774,7 @@ void hvm_inject_event(const struct x86_event *event)
     if ( nestedhvm_enabled(curr->domain) &&
          !nestedhvm_vmswitch_in_progress(curr) &&
          nestedhvm_vcpu_in_guestmode(curr) &&
-         nhvm_vmcx_guest_intercepts_event(
-             curr, event->vector, event->error_code) )
+         nhvm_vmcx_guest_intercepts_event(curr, event) )
     {
         enum nestedhvm_vmexits nsret;
 
diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
index 963390e8a99..a45694457b9 100644
--- a/xen/arch/x86/hvm/svm/nestedhvm.h
+++ b/xen/arch/x86/hvm/svm/nestedhvm.h
@@ -46,7 +46,7 @@ int cf_check nsvm_vcpu_vmexit_event(struct vcpu *v,
                                     const struct x86_event *event);
 uint64_t cf_check nsvm_vcpu_hostcr3(struct vcpu *v);
 bool cf_check nsvm_vmcb_guest_intercepts_event(
-    struct vcpu *v, unsigned int vector, int errcode);
+    struct vcpu *v, const struct x86_event *event);
 bool cf_check nsvm_vmcb_hap_enabled(struct vcpu *v);
 enum hvm_intblk cf_check nsvm_intr_blocked(struct vcpu *v);
 void cf_check nsvm_domain_relinquish_resources(struct domain *d);
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 70ef50eb845..05c450f9fd3 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -753,6 +753,7 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
         case VMEXIT_EXCEPTION_15:
         case VMEXIT_EXCEPTION_MF:
         case VMEXIT_EXCEPTION_AC:
+        case VMEXIT_SWINT:
             ns_vmcb->exitinfo1 = svm->ns_vmexit.exitinfo1;
             break;
         default:
@@ -766,29 +767,48 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
     return 0;
 }
 
+/*
+ * INT $n (CD nn) is checked against the software interrupt intercept (INTn),
+ * never the exception intercepts, even when n < 32 (AMD APM vol 2 rev 3.44,
+ * 15.12).  INT3 and INTO raise exceptions.  ICEBP should check the ICEBP
+ * intercept, not #DB (15.12.2); not handled yet.
+ */
+static uint64_t nsvm_event_exitcode(const struct x86_event *event)
+{
+    if ( event->type == X86_ET_SW_INT )
+        return VMEXIT_SWINT;
+
+    return VMEXIT_EXCEPTION_DE + event->vector;
+}
+
 int cf_check nsvm_vcpu_vmexit_event(
     struct vcpu *v, const struct x86_event *event)
 {
     const struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
-    uint64_t nextrip = 0;
+    uint64_t exitinfo1 = event->error_code, nextrip = 0;
 
     ASSERT(vcpu_nestedhvm(v).nv_vvmcx != NULL);
 
     /*
-     * An exception intercept saves NextRIP only for INT3, INTO and BOUND
-     * (AMD APM vol 2 rev 3.44, 15.7.1).  The emulator raises BOUND's #BR as
-     * a plain hardware exception, so only INT3/INTO can be recognised here.
-     * As in svm_inject_event(), truncate it outside of 64bit mode.
+     * NextRIP is saved for the software interrupt intercept (INTn), and for
+     * an exception intercept only for INT3, INTO and BOUND (AMD APM vol 2
+     * rev 3.44, 15.7.1).  The emulator raises BOUND's #BR as a plain hardware
+     * exception, so only INT $n, INT3 and INTO can be recognised here.  As in
+     * svm_inject_event(), truncate it outside of 64bit mode.
      */
-    if ( event->type == X86_ET_SW_EXC )
+    if ( event->type == X86_ET_SW_INT || event->type == X86_ET_SW_EXC )
     {
         nextrip = guest_cpu_user_regs()->rip + event->insn_len;
         if ( !((vmcb_get_efer(vmcb) & EFER_LMA) && vmcb->cs.l) )
             nextrip = (uint32_t)nextrip;
     }
 
-    nestedsvm_vmexit_defer(v, VMEXIT_EXCEPTION_DE + event->vector,
-                           event->error_code, event->data, nextrip);
+    /* With DecodeAssists, EXITINFO1 for INTn is the vector (15.8.2). */
+    if ( event->type == X86_ET_SW_INT )
+        exitinfo1 = event->vector;
+
+    nestedsvm_vmexit_defer(v, nsvm_event_exitcode(event), exitinfo1,
+                           event->data, nextrip);
     return NESTEDHVM_VMEXIT_DONE;
 }
 
@@ -955,10 +975,10 @@ nsvm_vmcb_guest_intercepts_exitcode(struct vcpu *v,
 }
 
 bool cf_check nsvm_vmcb_guest_intercepts_event(
-    struct vcpu *v, unsigned int vector, int errcode)
+    struct vcpu *v, const struct x86_event *event)
 {
-    return nsvm_vmcb_guest_intercepts_exitcode(v,
-        guest_cpu_user_regs(), VMEXIT_EXCEPTION_DE + vector);
+    return nsvm_vmcb_guest_intercepts_exitcode(v, guest_cpu_user_regs(),
+                                               nsvm_event_exitcode(event));
 }
 
 static int
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 3c7374a9ff4..2a760e9d161 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2083,7 +2083,7 @@ static void cf_check vmx_inject_event(const struct x86_event *event)
             write_debugreg(6, read_debugreg(6) | DR_STEP);
         }
         if ( !nestedhvm_vcpu_in_guestmode(curr) ||
-             !nvmx_intercepts_exception(curr, X86_EXC_DB, _event.error_code) )
+             !nvmx_intercepts_event(curr, &_event) )
         {
             unsigned long val;
 
@@ -2128,7 +2128,7 @@ static void cf_check vmx_inject_event(const struct x86_event *event)
         __vmwrite(VM_ENTRY_INSTRUCTION_LEN, _event.insn_len);
 
     if ( nestedhvm_vcpu_in_guestmode(curr) &&
-         nvmx_intercepts_exception(curr, _event.vector, _event.error_code) )
+         nvmx_intercepts_event(curr, &_event) )
     {
         nvmx_enqueue_n2_exceptions (curr, 
             INTR_INFO_VALID_MASK |
@@ -2886,7 +2886,7 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .nhvm_vcpu_reset      = nvmx_vcpu_reset,
     .nhvm_vcpu_p2m_base   = nvmx_vcpu_eptp_base,
     .nhvm_vmcx_hap_enabled = nvmx_ept_enabled,
-    .nhvm_vmcx_guest_intercepts_event = nvmx_intercepts_exception,
+    .nhvm_vmcx_guest_intercepts_event = nvmx_intercepts_event,
     .nhvm_vcpu_vmexit_event = nvmx_vmexit_event,
     .nhvm_intr_blocked    = nvmx_intr_blocked,
     .nhvm_domain_relinquish_resources = nvmx_domain_relinquish_resources,
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 29e48387a11..2f1788d1737 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -506,12 +506,18 @@ static void vmfail(struct cpu_user_regs *regs, enum vmx_insn_errno errno)
         vmfail_invalid(regs);
 }
 
-bool cf_check nvmx_intercepts_exception(
-    struct vcpu *v, unsigned int vector, int error_code)
+bool cf_check nvmx_intercepts_event(
+    struct vcpu *v, const struct x86_event *event)
 {
+    const unsigned int vector = event->vector;
+    const int error_code = event->error_code;
     u32 exception_bitmap, pfec_match=0, pfec_mask=0;
     int r;
 
+    /* INT $n is not an exception, and is never in the exception bitmap. */
+    if ( event->type == X86_ET_SW_INT )
+        return false;
+
     ASSERT(vector < 32);
 
     exception_bitmap = get_vvmcs(v, EXCEPTION_BITMAP);
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 9bf2064925f..0168d85f733 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -206,7 +206,7 @@ struct hvm_function_table {
     int (*nhvm_vcpu_vmexit_event)(struct vcpu *v, const struct x86_event *event);
     uint64_t (*nhvm_vcpu_p2m_base)(struct vcpu *v);
     bool (*nhvm_vmcx_guest_intercepts_event)(
-        struct vcpu *v, unsigned int vector, int errcode);
+        struct vcpu *v, const struct x86_event *event);
 
     bool (*nhvm_vmcx_hap_enabled)(struct vcpu *v);
 
@@ -663,12 +663,12 @@ static inline uint64_t nhvm_vcpu_p2m_base(struct vcpu *v)
     return alternative_call(hvm_funcs.nhvm_vcpu_p2m_base, v);
 }
 
-/* returns true, when l1 guest intercepts the specified trap */
+/* returns true, when l1 guest intercepts the specified event */
 static inline bool nhvm_vmcx_guest_intercepts_event(
-    struct vcpu *v, unsigned int vector, int errcode)
+    struct vcpu *v, const struct x86_event *event)
 {
     return alternative_call(hvm_funcs.nhvm_vmcx_guest_intercepts_event, v,
-                            vector, errcode);
+                            event);
 }
 
 /* returns true when l1 guest wants to use hap to run l2 guest */
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
index da10d3fa961..ec725dcc71b 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
@@ -11,6 +11,8 @@
 #ifndef __ASM_X86_HVM_VVMX_H__
 #define __ASM_X86_HVM_VVMX_H__
 
+struct x86_event;
+
 struct vvmcs_list {
     unsigned long vvmcs_mfn;
     struct list_head node;
@@ -78,8 +80,8 @@ void cf_check nvmx_vcpu_destroy(struct vcpu *v);
 int cf_check nvmx_vcpu_reset(struct vcpu *v);
 uint64_t cf_check nvmx_vcpu_eptp_base(struct vcpu *v);
 enum hvm_intblk cf_check nvmx_intr_blocked(struct vcpu *v);
-bool cf_check nvmx_intercepts_exception(
-    struct vcpu *v, unsigned int vector, int error_code);
+bool cf_check nvmx_intercepts_event(
+    struct vcpu *v, const struct x86_event *event);
 void cf_check nvmx_domain_relinquish_resources(struct domain *d);
 
 bool cf_check nvmx_ept_enabled(struct vcpu *v);
-- 
2.49.0


