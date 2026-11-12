Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A74606A323
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 10:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Z3tmCxcr
Received: from list by lists.xenproject.org with outflank-mailman.1485380.1688613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRRbz-0006ff-Mk; Thu, 12 Nov 2026 10:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485380.1688613; Thu, 12 Nov 2026 10:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRRbz-0006fR-G5; Thu, 12 Nov 2026 10:00:55 +0000
Received: by outflank-mailman (input) for mailman id 1485380;
 Thu, 12 Nov 2026 10:00:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xRRbx-0006Q9-D7
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 10:00:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRRbw-00CHfV-Px
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:00:52 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6af58e50-bab6-0a2a0a5309dd-0a2a45059f7e-12
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 11:00:52 +0100
Received: from [52.101.193.11]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6af58e51-4cb1-0a2a45050019-3465c10b4789-5
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 11:00:52 +0100
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by DS0PR03MB989595.namprd03.prod.outlook.com (2603:10b6:8:432::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 10:00:27 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0592.012; Thu, 12 Nov 2026
 10:00:27 +0000
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
 b=OS6/NX9pFdRqtRqOO+G9s7Pc3l0ZdvJZemxdZ5brUvuJbbOrF04LlU2VGCRUpsHTOb9pLMF0Z77cWFsyFH+oy9pk/yUVifhl1mG7YT4EZwvrlzK2Zil0VPpNLM7QYTd/X90CnaXgyEPrivUw5CvrgDk1XNEVfCUsUre1vdY3ZW6wDn5iMVBG/IGnoSXpjn3WmMLU9b9w5f6ccJYyeONieLYdfBESX8gQ0mb9l7xgA0e++R4v0IsQf4seDLrqMz6kGC0xrRuJnata+wBZ3cwk/MwapnKf+u5BPm38jR23PC2MERnoIJA9uUiAkyO84T7CK8b7HSy632I00k7opyVbag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+53iO0VQDTk4tsXS4k6ixdyHKnLnnvfKHl6X4B8Gag=;
 b=kuz4pxclE6U1j90n1zepj1aJDnmeb7Sl7D8RBXGm6iKHevjOqoBeG3q0M+JW7rhORBVIYtf0RQJrj9nIxdV35+LvcbYrg5mAhvIU7Tx2F4QGhlGpz8cjyd8LMO4NoGECY+ntVKn/SDnR0Fn/YIK3QlAdRBX+vIcm8an3PZ2Qc2ed7jZOrzg1OJdM/j3sSe5yif1CNe0aD04o3S44qw0mVUWcylZLBvD27Mv5/svHA91UsuPnydoWXzQqp7xGJvDskT4G9FpmvFhf3AtvIxJxW2NxdOQ+G1DV8BLXV5+CwxhsOG3hPh1HTHyHnfeN2FwDeWlikL1EAqsmeYIyYKNbdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+53iO0VQDTk4tsXS4k6ixdyHKnLnnvfKHl6X4B8Gag=;
 b=Z3tmCxcrvK9Flyc4N9G+v0yNnUxP+A1A87BylAQnH712NwPDD/NBViLsYwm+G3OjVp5BWb9ozYN8J6tVvVoW4+uSYjSHCw+eo6YDRGRmCFB6uRDmznIETiFtC0wPXdF3Qsa6KizrThBFoGaKpw1eocy9EHOQTSoNxv/8eoG8pqA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v5 3/6] x86: extend mod_l*_entry() to optionally return the old PTE value
Date: Thu, 12 Nov 2026 10:00:02 +0000
Message-ID: <20261112100005.324440-4-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261112100005.324440-1-kevin.lampis@citrix.com>
References: <20261112100005.324440-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0207.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::14) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|DS0PR03MB989595:EE_
X-MS-Office365-Filtering-Correlation-Id: 449faedc-799f-4713-34b0-08df40a3c719
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|6133799003|261009223027099003|11063799006|56012099006|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261102123227099003|261026121527099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	nFLzSRe03U/ze37IOjY8KISVqU1gbuOA3FVpDxafzmoMAXanxNMxM1HChI/Q7xszYHoIQWqufHQoW+X3hq++u0553QUU1DFJ9+lBsoN1K6wCRGxQ/MjRyzehDmdcCcBZUP2ILlj9dynEN2Z4oEJPIxvsENgpoIS+D5+tAECIMs4E70SkSit0DtDxBkM23xmNROkPHFW9gz+jhhH0iFcSRkn0FaHUt3Zo2lWfQu2HGtQtFbfSF2Y5q88NMyzamuH+qRYSVRhVGcrcOVnoenvQx7OlMQqYCh7Teu24AHvRWbl7GrTqaoaS7OQw95B/Qeb7F6YJ9dSIrvX+5etyBAmB/8kr+Fx3Y9NZ7Bw4L+RFEIaMnxf57PlpSIHSQp0K2Ote8AfYLQAIXB3wOd5bIISgMVw/Y+s9ve4ETc2sKhRdd1mp2ZEczC1Ssb1+2tfCJFkHZ+KGU02X6R26GP8o5p7ZDhfmXzchTP+HapMH1OvrVYLbR2vj348uCL9RJQHnC6LPt+yA++FhLgslUJsxMwOS2BMiJIlB50sdSj8eGsHj/Rw/tm3ZWYKaX55jlANvPoAZyhk35ufvy0LJQkfM8U4YITVpYAEDFh7qJcKj2A9FQME2QbSCRSpDOCnpjeNLZ9QlZ4hraEaE1F0Z92HUCgiUEAT0UxI8Et8sL3YDBOs4iaw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261026121527099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2IknswT4kZsEnDM9CL6muw5YcScGnT19eMb5AXWfq8kfJVqigKonXP3yvFQT?=
 =?us-ascii?Q?bhviRtiEfUA9CPwDlOYMEwUbIXmq4CGnRF1ahijGFj4Q9DbnzOwZVbCuH2U8?=
 =?us-ascii?Q?pbMWHbWy1u58sO9siYS926PwmcBV6HmezDlPY/7k/aEes4FGKzcld6sx9MHv?=
 =?us-ascii?Q?oEbsZ3pB75OVm9+BQtQZ8MFcBcpnG6FtyrLSWI0MYgKYby8a4nUdRbidgXj4?=
 =?us-ascii?Q?rmjMPo3nnwPEpkV7x4ZkD2oVILvPjjtFe3Ja3mESt2GL9s4Drwj5gujE8Iy8?=
 =?us-ascii?Q?7RosYovxFb5H+DyvOLPnrA3GPNMDZDeFNqmt/4XEYQ21Y9otkUSpIY8GjkMX?=
 =?us-ascii?Q?u/vVuk3G8B8AXEy5jKxMAYPoTZUnJJvVQ4lYDpS/Kuit6DM+fwL39xavhR8R?=
 =?us-ascii?Q?qMbQZhFsKde836tMimUfoOXfuAT3VNWB9dapMpWi+6dEAdtkqHY7vRpoEv6B?=
 =?us-ascii?Q?MwNeD2oBU53QLH8wB83i/84cNenEocVJFEGYcw+0swsnmbmQZvOtFtET/QZk?=
 =?us-ascii?Q?9s5wbUOx9hbl0ctwFadWmag4mF5XDZEmT9NB0H5KBDH7hAMSx8h1/W2CyEDx?=
 =?us-ascii?Q?iXXsLt1s1GDhmB1ks3+QIbWI1onsOr38oLYpk12OcmsIX0iCqWoIFZH+auma?=
 =?us-ascii?Q?l/uyUSswrWWxvElrFRprodx7T/tcIwEX/zt9pz1WcU3q0tbgeN1GG+7u7WLk?=
 =?us-ascii?Q?2xCI5TBccKxyPVjIni2TSL8Pc5Hl3Yaa46jBQkbh47JAQEGKe3zns7cHI/dX?=
 =?us-ascii?Q?wkyt2tdOeKim6l5YW/KSWbU+f6kfwtugAHMIxoJ4SmBRk6m1zBwQn23cBCeE?=
 =?us-ascii?Q?5g65CGhLN9KAHtZniF/acp7bj7WuDEXHDQbAaYw5GbEKmjKpE8FB1btViMo3?=
 =?us-ascii?Q?WpAwp58IlTwQCXAyys5ITKvXJtb286Ci4eUZeq70zXGUaMaBFA6r/bOyd8Kl?=
 =?us-ascii?Q?YnATzIUZ4vhm5wTIQb44VfNF4slEnAVXx5wOEteZnYFCnwkqoNKy+3YIk79Y?=
 =?us-ascii?Q?B8Q0t3a+XiZdVUIewSItomZnKo74n1+SZKJtgpX+iXQklf+5UUn0WKgt1qr7?=
 =?us-ascii?Q?sIVpjqTMOT+mDTv8yfKzFH+/JeIqVe9v3WwpxKoGrLW9STmMuwrcuty81KOM?=
 =?us-ascii?Q?In+552vncqu4ekRAQgDNZRB8oWqwC8OxsU1QAIF7rfrrBbhXWns4Z0rp+8ZI?=
 =?us-ascii?Q?Y7+P1RaUDJHpPCpiFnul+0DvB/4Z4cMj19SdbzOza3U75bjYhrCoPD2kIsbI?=
 =?us-ascii?Q?wo/DxwIXNfRDg4sEP+/hkZ9Mg1Kf9971qhlkV9SJ2QyyK7PDJQFzWJAx9mdI?=
 =?us-ascii?Q?ZOshAiji1X1IyrV3K5h+TIOunBK5R6DZZ5PlYfQE00DNaU3kQ9V92FEl+5wD?=
 =?us-ascii?Q?/Nee7160aA4qD4mTLfeO05/hn5xq36DfODkB2WJGuU3hGHgvvlw5HwEtWWqd?=
 =?us-ascii?Q?2RmmWxfT/GyaApHuTLM6cCutAWlgsWiTFkIontlyJzEvU8+tSowIMn8GMXLs?=
 =?us-ascii?Q?BqFcQ+kMRRAWK9wiokP3vkZTY9JSvehPSrDaPXS5j/R6kO3c06eLcggTNEv+?=
 =?us-ascii?Q?epfm5CMA0m80PAfYapnl25iJu2L5h6FL93TR3/kCj4Nx9hzvc+wUobm9SpXt?=
 =?us-ascii?Q?7m4FyDxmHZRziIOLqLhGBOHuO/mLliHfHRcqO2H4iyAlkVtnCXpZokyYKmmE?=
 =?us-ascii?Q?f8RGE0yeOTEo+ApKQpMysqjq15bVQ3kN8/HEiC7bHS2OBZkV8CsSDYu6mF3q?=
 =?us-ascii?Q?KlCSEva6Qw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 449faedc-799f-4713-34b0-08df40a3c719
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 10:00:27.4801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L6/qw7BVnCaaaL/g9vZWcrPJ00nPx4DXLxeOpxZ1mcYmfyQwhYEdOi6vPjjcmFkFzp9LOdN9K9V6RWU5bB5zXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB989595
X-purgate-ID: tlsNG-c201ff/1794477652-F7CB82A1-E59794A4/0/0
X-purgate-type: clean
X-purgate-size: 9427
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Calling mod_l*_entry() with a valid ol*e_out pointer will do atomic
CMPXCHG to set the new pte value and return the old pte value through
the ol*e_out pointer. If the ol*e_out pointer is NULL then old behavior
is preserved.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v5:
- Refactoring the mod_l*_entry() functions was split out
  into a patch before this one

Changes in v4:
- Refactor how UPDATE_ENTRY is used
- Update commit message to specify CMPXCHG instead of xchg

Changes in v3:
- Add swap to mod_l{2,3,4}_entry()

Changes in v2:
- UPDATE_ENTRY now returns the old pte value instead of using an out
  pointer
---
 xen/arch/x86/mm.c | 77 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 59 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index dc0e0d451c02..316a435b9b71 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2193,7 +2193,8 @@ static void l3t_unlock(struct page_info *page)
 /* Update the L1 entry at pl1e to new value nl1e. */
 static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
                         mfn_t gl1mfn, unsigned int update_flags,
-                        struct vcpu *pt_vcpu, struct domain *pg_dom)
+                        struct vcpu *pt_vcpu, struct domain *pg_dom,
+                        l1_pgentry_t *ol1e_out)
 {
     l1_pgentry_t ol1e = l1e_read(pl1e);
     struct domain *pt_dom = pt_vcpu->domain;
@@ -2254,7 +2255,11 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l1e_has_changed(ol1e, nl1e, ~FASTPATH_FLAG_WHITELIST) )
         {
-            UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
+            intpte_t old = UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
+                                        update_flags);
+            if ( ol1e_out )
+                *ol1e_out = l1e_from_intpte(old);
+
             if ( page )
                 put_page(page);
             return 0;
@@ -2280,7 +2285,12 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
     else if ( pv_l1tf_check_l1e(pt_dom, nl1e) )
         return -ERESTART;
 
-    UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
+    {
+        intpte_t old = UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
+                                    update_flags);
+        if ( ol1e_out )
+            *ol1e_out = l1e_from_intpte(old);
+    }
 
     put_page_from_l1e(ol1e, pt_dom);
     return 0;
@@ -2292,7 +2302,8 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
                         l2_pgentry_t nl2e,
                         mfn_t mfn,
                         unsigned int update_flags,
-                        struct vcpu *vcpu)
+                        struct vcpu *vcpu,
+                        l2_pgentry_t *ol2e_out)
 {
     l2_pgentry_t ol2e;
     struct domain *d = vcpu->domain;
@@ -2324,7 +2335,11 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l2e_has_changed(ol2e, nl2e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags);
+            intpte_t old = UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu,
+                                        update_flags);
+            if ( ol2e_out )
+                *ol2e_out = l2e_from_intpte(old);
+
             return 0;
         }
 
@@ -2334,7 +2349,12 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
     else if ( pv_l1tf_check_l2e(d, nl2e) )
         return -ERESTART;
 
-    UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags);
+    {
+        intpte_t old = UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu,
+                                    update_flags);
+        if ( ol2e_out )
+            *ol2e_out = l2e_from_intpte(old);
+    }
 
     put_page_from_l2e(ol2e, mfn, PTF_defer);
 
@@ -2346,7 +2366,8 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
                         l3_pgentry_t nl3e,
                         mfn_t mfn,
                         unsigned int update_flags,
-                        struct vcpu *vcpu)
+                        struct vcpu *vcpu,
+                        l3_pgentry_t *ol3e_out)
 {
     l3_pgentry_t ol3e;
     struct domain *d = vcpu->domain;
@@ -2376,7 +2397,11 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l3e_has_changed(ol3e, nl3e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
+            intpte_t old = UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu,
+                                        update_flags);
+            if ( ol3e_out )
+                *ol3e_out = l3e_from_intpte(old);
+
             return 0;
         }
 
@@ -2387,7 +2412,12 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
     else if ( pv_l1tf_check_l3e(d, nl3e) )
         return -ERESTART;
 
-    UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
+    {
+        intpte_t old = UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu,
+                                    update_flags);
+        if ( ol3e_out )
+            *ol3e_out = l3e_from_intpte(old);
+    }
 
     put_page_from_l3e(ol3e, mfn, PTF_defer);
     return 0;
@@ -2398,7 +2428,8 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
                         l4_pgentry_t nl4e,
                         mfn_t mfn,
                         unsigned int update_flags,
-                        struct vcpu *vcpu)
+                        struct vcpu *vcpu,
+                        l4_pgentry_t *ol4e_out)
 {
     struct domain *d = vcpu->domain;
     l4_pgentry_t ol4e;
@@ -2428,7 +2459,11 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l4e_has_changed(ol4e, nl4e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
+            intpte_t old = UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu,
+                                        update_flags);
+            if ( ol4e_out )
+                *ol4e_out = l4e_from_intpte(old);
+
             return 0;
         }
 
@@ -2439,7 +2474,12 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
     else if ( pv_l1tf_check_l4e(d, nl4e) )
         return -ERESTART;
 
-    UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
+    {
+        intpte_t old = UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu,
+                                    update_flags);
+        if ( ol4e_out )
+            *ol4e_out = l4e_from_intpte(old);
+    }
 
     put_page_from_l4e(ol4e, mfn, PTF_defer);
     return 0;
@@ -3311,7 +3351,7 @@ int new_guest_cr3(mfn_t mfn)
                           l4e_from_mfn(mfn,
                                        (_PAGE_PRESENT | _PAGE_RW |
                                         _PAGE_USER | _PAGE_ACCESSED)),
-                          gt_mfn, 0, curr);
+                          gt_mfn, 0, curr, NULL);
         unmap_domain_page(pl4e);
         switch ( rc )
         {
@@ -4149,14 +4189,14 @@ long do_mmu_update(
                 {
                 case PGT_l1_page_table:
                     rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
-                                      update_flags, v, pg_owner);
+                                      update_flags, v, pg_owner, NULL);
                     break;
 
                 case PGT_l2_page_table:
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
                     rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
-                                      update_flags, v);
+                                      update_flags, v, NULL);
                     if ( !rc )
                         flush_linear_pt = true;
                     break;
@@ -4165,7 +4205,7 @@ long do_mmu_update(
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
                     rc = mod_l3_entry(va, l3e_from_intpte(req.val), mfn,
-                                      update_flags, v);
+                                      update_flags, v, NULL);
                     if ( !rc )
                         flush_linear_pt = true;
                     break;
@@ -4174,7 +4214,7 @@ long do_mmu_update(
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
                     rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
-                                      update_flags, v);
+                                      update_flags, v, NULL);
                     if ( !rc )
                         flush_linear_pt = true;
                     if ( !rc && pt_owner->arch.pv.xpti )
@@ -4514,7 +4554,8 @@ static int __do_update_va_mapping(
         goto out;
     }
 
-    rc = mod_l1_entry(pl1e, val, gl1mfn, MMU_NORMAL_PT_UPDATE, v, pg_owner);
+    rc = mod_l1_entry(pl1e, val, gl1mfn, MMU_NORMAL_PT_UPDATE, v, pg_owner,
+                      NULL);
 
     page_unlock(gl1pg);
     put_page(gl1pg);
-- 
2.52.0


