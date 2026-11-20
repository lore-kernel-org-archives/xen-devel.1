Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60BB60A2624
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 11:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=sy0GOPVt
Received: from list by lists.xenproject.org with outflank-mailman.1498055.1696055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUMWh-000230-4Y; Fri, 20 Nov 2026 11:11:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498055.1696055; Fri, 20 Nov 2026 11:11:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUMWh-00022t-1o; Fri, 20 Nov 2026 11:11:31 +0000
Received: by outflank-mailman (input) for mailman id 1498055;
 Fri, 20 Nov 2026 11:11:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xUMWf-00022n-HP
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 11:11:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUMWe-007pqd-NN
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 12:11:28 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6b002aca-bab6-0a2a0a5309dd-0a2a4506941a-42
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 12:11:28 +0100
Received: from [52.101.85.63]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6b002ade-195a-0a2a45060019-3465553f39e3-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 12:11:28 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SA2PR03MB5676.namprd03.prod.outlook.com (2603:10b6:806:116::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 11:11:24 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 11:11:24 +0000
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
 b=ISo+u4erfQ2gOqdWBzuF2cesBXBBa4KtrAl+YBQLbpnYxIhZIi3/prOuW3bEz/pGja3R4qsggMrGPsLFmba8tX9Bc5NNMzT4LXvA6JmUQH47zwyMo/W+bpJAZ/7LBzrtBNhhNElCCIeQlKcTZGE0xA2W5S4wYos4f9ei3zglFPitbENsx+oE8mmNC8yAXrpQsovka1Vxvnai/c63z0K05jj02EZBZ3a/EhQ50B6aR25PaPAh6x3G8fTS8Mqo2F+xpagboptp/ZqTZeSNj9LoAafw8KMnzr8HNr7XHdtFM3k74N5aYW8BpE4g5DFt1XB8Gmqotu7Y/Dd6eQwUCTEssg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQcj2z2LkRdrjxPr8x4xYgvUyG2/EcmvGz87ZVciWxc=;
 b=W/SnVa/rMgCdUxxfQUayDF9NaPpgVUBXo3MKqtUC4zVvpVPbXDasFeArvnyHqE37g4VStaDjUs0GCahxmnwtQME1RzySGeKLAJCJ4AnB5TVukr5JvLlAraxwmEeCadpFq8nN+m2Itq0V7xyBv93Gy6d1cDJPZi3mjtFxPB7Ozx7JE0aqa78kLDiipR/eo1r2X/9/BRUz8ICQ7uWuquJx2PfIHzcE/0pwb06CTYuz8yynA3gycw5nmYeFBWOaLhCwwxc0aH1uuleOu48oaxyNLn/kai8goqH8aZRdtTX9APOeavo1LjWcNxhDgISp9yzeFIjpJKAnmwDt/myFmuiZQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQcj2z2LkRdrjxPr8x4xYgvUyG2/EcmvGz87ZVciWxc=;
 b=sy0GOPVtprz4RKjVEAubl51qv3+f4kH4+Uxiz/w20WA9L0to1uPQNnZG8Rsl9bVKlDOl24MB07DcEettj4q7ctrIyhJkhWLljvoYpqYFuO2cKsn+ILJ9EjvGK6sG2DKNrw4oESQjahToP8vuRmaQKbUXxqFpM7bS4LUv3MWqozI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/nestedsvm: Inject #UD for not-intercepted VMMCALL
Date: Fri, 20 Nov 2026 11:11:11 +0000
Message-ID: <20261120111111.1794822-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.56.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::9) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SA2PR03MB5676:EE_
X-MS-Office365-Filtering-Correlation-Id: 62d304d0-3196-465a-ac19-08df46f70374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261102123227099003|261009223027099003|261022075727099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	GevWyL4BejoBREtc4fO9nDc6TpfZnymJCvqhXTgymfh0pSo1ci4X7SRg4BuxqEvphDvz9WLvvukL2BUGuUu5SqW4QWL4vODU8nn2HxLLXEnLUJfCcuZuEUdCWPw1EydT+O9Gi28z/pLHudyOvLtce9/So6NwJ3Wlts6EjLjEfn8h2ajCcHdgZimlk+0BkxigEyTPue8+LQvfjsqfRGRmunSGdlbzpGc+0QO7APb2rMMMfYmAJdpAHiW1NAl0+W07WJt+geTPJJxWkX9ho3iG3RDpXhaLPOGH61IRtLwlysr6GFhbvkVwHaVFdGtvGbA2uc//hDmMXcJdBRIblxsJOTgk/DXx/wx96sw65FVgHUyDZaJno+4LzfgfOFCAFwf329etha3e8ly2K3pP60Pf/EPgqAF1dcmlhFgeG+Lb5BH05lKlE2P9zMIQ1WV/d2K/a52dmkDsc8TdbgvBn8xiAWalw1cuK4FfxDMcpv986hn7AQzZ8ERi1yAn1WFfBLAJp1UAOasjAv8cMTvb2JVc68tKbUhsyjNfJsYgshDUN/huX+/X4gN9yskMSPAYnlMIUFjeL3gMN4xCU/TemJmvO6irmoIa+3l/wMjQoQfnSHUsN+FsU++D5Osuv7JnkVV8U+j5A1hFI6IqEgJOJKe3Z/xUmtJG7LnnkZu1TMgazaM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(261022075727099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WcZfAuW7iKMSjvVPpM+VdEV9fBUnw1IRWV8FwSUQsaLUY74JlC2rD/noXte8?=
 =?us-ascii?Q?WKNh0+GRIkA2s4DM2q0L5oQShIXxa3b2YUR3flzKeBVr1Y5vGp81nnEKbMDf?=
 =?us-ascii?Q?XSFT6ff9XyLwwYctNM8mR8VBM/MHBf68e0z432TM15sA8ZSWf0AtENZ8uIZP?=
 =?us-ascii?Q?SvcvKLekcpbp8tuDh6VlJ9fY+/P23V0dLtcGgzVoc9tOO5a3esa4DxwHabg3?=
 =?us-ascii?Q?s4ysJdGQfbqf2LUlpgTC2Y6eanqZRiQwYOCj/wsI9b7cVMggzufMOoxEsJza?=
 =?us-ascii?Q?fXBysFkYy0WcIVaBxIwJxt2lq3ipTF2/kx6aaJfN42agslYDXRwCqZfER1Fu?=
 =?us-ascii?Q?tsh2HBG8+MUx2lC05SZVbgQlR+4zsc1P5n9FuoHdZyfEuUcp7Ak+0jRAZArw?=
 =?us-ascii?Q?SC+NoT+QiNoj0fbxuE4DDyb6a5DoWTAldxsA06qfp0FNxX9Geua842eCE8er?=
 =?us-ascii?Q?vF68FyfPshJSSo+64pQaKFW3yLwbXy31kQTh6A2LehwA1ottx+q58Wj+rdmS?=
 =?us-ascii?Q?NIt2akHYue7TDM+I0YtjEIaU7gVkYumYumhxjqVIWefFwEIvjT04IZ8u1ig6?=
 =?us-ascii?Q?zYDVCwW/Licm9GxY2qTj/7g1EiNTcrP1pCVI6NP7iz4Ou0axAt0+SCTz/Idi?=
 =?us-ascii?Q?ZeAQ5X2PZX1NQEoYIsjtpp7jYDdX6Oba+JObJ9ZlWt2D0EHcUageu7fE/caX?=
 =?us-ascii?Q?uqoiLJDaCH6/eoIh/wBrtbhb4bJjjIeIP9sKBnEiJ5DwfP6spk1UChSHbSFU?=
 =?us-ascii?Q?GrC9CJc+IippPTEjde/MwPgvPhLWZt4wKfoHtEN+gx7wEiKP2fNfKcZZktPf?=
 =?us-ascii?Q?OzcPHZdGPzOokFmT9HuFRfxVAqS91YprYhHSyTG+D35LAkhH2ctmcv76Or8G?=
 =?us-ascii?Q?gzQq1oiv1HVqE1cXZnuELsV+pd+rfzhEOmnDp5EuRZYyXpokBgvkfznciz4I?=
 =?us-ascii?Q?B3KxVz9tlG9zLfSsKCnfXZlpFq4A58rk6pEbdblWqIvTnWAcO53pa1iSepIT?=
 =?us-ascii?Q?WQ2gnSGIkwcsB09GSL06XZvNita3P/YrzMGBsegYYmfI+P8kgQufK18Dl8uC?=
 =?us-ascii?Q?l8T4QMCnUm2AZEEI1z5jYLgyUSXYBdGs/uruO6d7+H6Vs3wQkgVWLiCD4WWO?=
 =?us-ascii?Q?TYUccMZNSWoPfs3IEf2gLDBIXDKreCN5eoWlTKYOYEfqeq8hBGPK63ValB8v?=
 =?us-ascii?Q?+DVdgX+SZYpKSF4PF2eem2pNHSvJxlbWVTxfhbcS5cwVFTOprbR9m1x6Bv9s?=
 =?us-ascii?Q?LRaO4YKWN5SphL/XOcLstuL/jc+Vl0ifguhLh8NSW4LWa6stiryRvDtNgi16?=
 =?us-ascii?Q?SMf4il/0EGdupIV0Jjp8rYBXO5Rar9xsg3m4Cc15Sk+TmriMbv5zAtcLwORw?=
 =?us-ascii?Q?H5uWuwax/WftohcJi6UX02xMJjVXBfwcrDIp+thKw3dd8McLyTglvLtSbwC3?=
 =?us-ascii?Q?lcB6nURGeRJgDfxDKM3u7LS7kkzNA4CRXq8HORgdKSDJKDPTajAvLRvKaLNY?=
 =?us-ascii?Q?n3P5NcSN2yxguxPuvTZjaw0ZSSa0ZYdjaG/MN6aKvZDYMYGJGC8JAV7CIzah?=
 =?us-ascii?Q?JtRqfpePDCusP/9CV9iLcfaBbLUff6h5Vh7pRGfRWzWdM4f5nGE2UTVRIl8O?=
 =?us-ascii?Q?Bi0E59qhfr1g87B6DorGzB9bkBaCFNFGbQlKtv4Xk6iOLJLaaOMBiC4QNJ8u?=
 =?us-ascii?Q?r0MD0vNwhhj2GUGxyR0EIkxQClU8OykMITcjI7gt6fuC26ZlWcPwdU2oOcx9?=
 =?us-ascii?Q?YEXTzZRSn0b7YfH7a87H4WyQlJcAoXw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d304d0-3196-465a-ac19-08df46f70374
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 11:11:23.9584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2krayN9ExFcT8Rl5iNw5Djs01fIFj7EDzpDvIyNBgOMtQlSFvDlWkMtjiOCZUFwwlBe/EHNL2l2+Ehegt2MGihwJXsAwSnRo3m0bUI6RuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5676
X-purgate-ID: tlsNG-16d1c6/1795173088-F4A0477B-42F9F750/0/0
X-purgate-type: clean
X-purgate-size: 1601
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Rather than always forwarding VMMCALL to L1, follow the APM Vol 2 Rev
3.46 15.18 "VMMCALL Instruction" and inject #UD for a not-intercepted
VMMCALL.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 3 ---
 xen/arch/x86/hvm/svm/svm.c       | 7 ++++++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 366178ff54a7..7bc5710c8294 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1261,9 +1261,6 @@ nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
             return NESTEDHVM_VMEXIT_HOST;
         return NESTEDHVM_VMEXIT_INJECT;
 
-    case VMEXIT_VMMCALL:
-        /* Always let the guest handle VMMCALL/VMCALL */
-        return NESTEDHVM_VMEXIT_INJECT;
     default:
         break;
     }
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index bfca1eda4af5..ef42d5eb981d 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2924,9 +2924,14 @@ void asmlinkage svm_vmexit_handler(void)
         break;
 
     case VMEXIT_VMMCALL:
+        if ( vcpu_guestmode )
+        {
+            hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
+            break;
+        }
+
         if ( (insn_len = svm_get_insn_len(v, INSTR_VMCALL)) == 0 )
             break;
-        BUG_ON(vcpu_guestmode);
         TRACE(TRC_HVM_VMMCALL, regs->eax);
 
         if ( hvm_hypercall(regs) == HVM_HCALL_completed )
-- 
2.56.0


