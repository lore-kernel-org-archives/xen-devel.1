Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB070606A31B
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 07:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=fh0bkxoz
Received: from list by lists.xenproject.org with outflank-mailman.1460815.1671679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLEzE-00063H-5L; Mon, 26 Oct 2026 07:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460815.1671679; Mon, 26 Oct 2026 07:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLEzE-000638-2R; Mon, 26 Oct 2026 07:19:16 +0000
Received: by outflank-mailman (input) for mailman id 1460815;
 Mon, 26 Oct 2026 07:19:15 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xLEzD-00062U-Az
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 07:19:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLEzC-004ZqH-OC
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 08:19:14 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6adefede-bab6-0a2a0a5309dd-0a2a4505d366-46
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:19:14 +0100
Received: from [52.101.56.35]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6adefef1-4cb1-0a2a45050019-346538231dc8-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:19:14 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by MN6PR03MB7549.namprd03.prod.outlook.com
 (2603:10b6:208:4ff::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 07:19:12 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 07:19:12 +0000
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
 b=rUoHRlCOb5Sr91iXFQj86sS+cWB3kRfAFdu/ptlvgqgwwA03f5AtLWuFhOmVT5TDVFtsg2Uki35CpSsPslVaaLDmmupDFly0SoBYw3HOrEmj1IiNe81K7YOf47cY214ICJjzaxnVZv6gDpgtytNplgycDin3cluQpjQlpaJ9EY1Se9d1WMye6cuM7fyarY/Gv8+XSbeY9mSHpGISgr5ptQp2b0u/UP2BQQCnVQBSoYQ1rvTIOHv+WavMY41kUZnvpWZZI874/K7p0hTqFkcTHQtFp58kSxAe7hu67o4a6ORLUn6o+dp+pfVKwW7gFUPN8wcO6c8eNYm45hiwc61K7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Khj/KRTU4lyxeIU4dIXAw6vp1YA31vzVRgbSAA0KGDo=;
 b=g8uFdyddl6wEzZahZK7lcDsewCzEQqgFLW1Z99fwXKN0go69qnOFau86TFX0ef+VU7GtRbuS4Q+ngkRoYDouRskCf7fCrGAU+UaAnkB87S5WHRvGIMjRZDJpavQLAd7RzcDFXnGT64Gztwq4PwDFBZE8ynnqIAWzgw8zHLKkqo3UI0qX+yFQzLMLzSETdXnZkPfBHKZbH0gv+uPDN4Qxgvoji8DWkoEgM6lx4HAbpzqBrDyVpl5xTI8sWhXYmM9EUoO3+cmYlrHW8zy91xxWPTVBUfX4iMrLRUs7XDSUmWQQ6UBkINwVKZx61/4+bCoKWh86j/xLn66ok3XGs+warg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Khj/KRTU4lyxeIU4dIXAw6vp1YA31vzVRgbSAA0KGDo=;
 b=fh0bkxozFDK6ycdxXohsjV5AxjNfj013faIelb59hiKznWcFzOfVB0YeD1RltIrs7sBBNKdGwKHhqigd74V7vDLHgcRm4KLhgrghIRZXpRJo734uuo8KcplwwmgGREIC3ey9qvObnGhkPJUpl2ViEEPLMDar4uM/9eLAZ+Ljl40=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger@xenproject.org,
	sstabellini@kernel.org,
	dpsmith@apertussolutions.com,
	Chunjie Zhu <chunjie.zhu@citrix.com>
Subject: [PATCH V1 7/8] x86/nestedhap: Retry nested page fault if the np2m changes during walk
Date: Mon, 26 Oct 2026 15:17:53 +0800
Message-Id: <c8ab3ade3ca5348cea90b4cc7991383b116334c5.1792997742.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792997742.git.chunjie.zhu@citrix.com>
References: <cover.1792997742.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JN3P275CA0044.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:ca::18)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|MN6PR03MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: 0de06610-90ea-475d-5f9f-08df33316ef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|11063799006|56012099006|261021121427099003|261021123027099003|261022105027099003|261022075727099003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CmEy4ldlJ8ky4VZtDq2QwGQPxPDME7pdmmujSljwoEcCPh6fOD35C1NEULLaO2g8p0nMKIHEZn9RICpgJQ+iiU0i40xY+fbtMzuGhYe//F5/6J417SACPc1kMqFX5WuI26S9QTeZWD0YVdI3dDNnx4e08MSdTEEyaCRDCxgWjsDjZjitGuunF5Cw5uP9Ig6J5gx64fH1EKOZWMQ4FqFrCSqfIj6cedk/QbPzIWiXJaQ5v5L0h5BHzl5ysMek64FL9LwuW4Gi6P/whzP9FvtejJlttHHrWmGF/YL455SkGRsbM5WdaS/JRXmzoCS+coA+wDnn3wYY9ecj+hC9BTMCtXMG/lE5QiZVnK8LAU7/+tqC4/AjXMev5L7rzWl0Pi8ze7qpw6N9ftAGOBfZ8a8Uz6HM0QnkBlyte6U03pNJOZ7ntZEvGXmW7tsGMZ4kaVhjKbeWOGZIreqG3mWHpDS0RzvdR20rpq7dG52qCifIHk/XcWSrCuRK4KkPNJsR9o5qaT6XS6kk9X3CJbsC5ZCTowXxUTDSXo5AZCGEbJWnQY+QskN9MCj4XmSDIVKwv8hd0NH70mXgf5cER8CZL+g8A7CTUNwSo5DbuWJx0mL7+dUgC70eqehMEVH5hCQwiPHxACqbh21sjLHfDoJN2OS4yCbIc7YemZPHh7TJUdI8u7A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ywDPY/dd6GUTordgNIppKKJwtG2KkSn1e6wd/fBND8z4s/Ib1wp6D4Jg5ANn?=
 =?us-ascii?Q?uJ+7fQwzujyLYoSJlIFOHtmCQi2y7TFMwp4UwTurKN4pu6BCJKPCk/vlO2tF?=
 =?us-ascii?Q?18lm1szpJz49hu9Vk8hKqVmLe3sl5Jp74NBUFU1k4HehWvCWFIGtIE3MpcQY?=
 =?us-ascii?Q?GX9Tno7j1oNvL7ZkKQ5AnHBmc00eVohGLDR0Du+mj71vf3VUIWpY2fuc9HDi?=
 =?us-ascii?Q?OudAM/oCOoAHHVMTWgYywUXkUIsJrmnm8GCP3yTixfO7GBHTr7Mx0drEA3aB?=
 =?us-ascii?Q?kCRhuHKv6nzIEsRlhX3oJIJdqSg/xRQpUgmQhW2cgSVuuUag9RFk9YpA3Nml?=
 =?us-ascii?Q?3peI85vf41PJEk6ezlQdxQEExJz0IpNro6agrCzwp2z5n8vR8YCnONEmp92g?=
 =?us-ascii?Q?LbXfdURvSbDaEQ+q8TB7X3m69HGFNSAu4mX2rIhaoUl7aMEvTaAg1zI6cXyN?=
 =?us-ascii?Q?CefT+4jF/gzfu1GU0kUZCuALj6HJ9g98ipDJCufUy9ft7xVw0lVyfgzNuXEL?=
 =?us-ascii?Q?ehWC0sqqSkCi5hCB7Y8r9bFl0AwIgN0oJmns7Pa6LETERbLmdK6vcd9OXf08?=
 =?us-ascii?Q?k581Mdkh9p0iythGNJCoTNJvebugR0rMZ6xPXiM7S6xAkJ70U08iIXGDdDWK?=
 =?us-ascii?Q?zvcmXiDHiGNfp05njWkDGvMT8ppYIud6dXcgVB+lt9+MbCMBqbIyszxrVvFM?=
 =?us-ascii?Q?MZ+fVsBBFumJjP8UP3hCzyg5NPdjJxG7IQyTK6jZAkLmPFxLn8I1MzYvdzvm?=
 =?us-ascii?Q?apIqwJrDA7p2FxCaTOGlF8ICwIBMjBVZEJ/ItsGpJ2VB2JckfzeHbUI/x5Sg?=
 =?us-ascii?Q?HUWuoKyHHU83Vwc/2D1/nmGaTD9SNb1R1bYvM0ECyQblyKXtw6tNLXkM5IaP?=
 =?us-ascii?Q?iSjjC5OtXuQuCc4i1zfzXT8yxCJT4s6wqXAylzhGe4CYAdRUcUZVcT7q6mX3?=
 =?us-ascii?Q?d5SWmJiN27B8wIczd1OdKKsTpgQUrl/73BtNxXsjzh8TgmP3AqFFdBD3rHqW?=
 =?us-ascii?Q?rogB7ScWMLD1pAEcHaDsysvgwxmp3TNPRNj+HPHbFu4+Vwl6HUA/XTlNgCXc?=
 =?us-ascii?Q?Z6AUnHbersHRaN1g++ECipuqy+wHDnbfBaIvAFMGnNQMxcJPaPsOXmAs9Mcr?=
 =?us-ascii?Q?h5Gby420pf3LM7rcxKz2eFoFGOpUNBR7pM1mDBEbawkoftR5/wzg5ptGgzJN?=
 =?us-ascii?Q?k8cLMDmdbvxXg7SgWVQOonYV6gtkjA7wNUk0AP8ugXWqScT4ibgVc1NSnEbH?=
 =?us-ascii?Q?lJFxvHGYQwpXOruiTmymmIgpp/Q7sbcjBbiz4Zhzb1isCo4yKvE1Iee/Sb9t?=
 =?us-ascii?Q?43d0UsEztOJrzJ4rqLYXtoYspR8+2F08llyJvaBR0CueXobsDQG6ueeX8Icf?=
 =?us-ascii?Q?5DpjHWvUyM43F196R4azPPEsj34i2LqrxttQT1GxjWKANtugzzSri8OIXW1S?=
 =?us-ascii?Q?UQeWUM1X1Qz+RzuDzsCGxcgsr/7+cCgzDVPighOBosTGHt1isIFL0qI+MUgz?=
 =?us-ascii?Q?OBNvOgiuotk21JCYrHfm5liwo+0hM1a54w1cTqsSi3eeUdatKfwcORuXqwF+?=
 =?us-ascii?Q?3euSmXh9XdVannNVW+TF2B78CDqTSySKQlTkkW1dYdQDT/3V4fE1a2A+Yj8D?=
 =?us-ascii?Q?GisMRvOdhEci6t1/F69U7vzWBQqaN1uOyxFtMqAErAcvq/xtSDWiRdEgIkES?=
 =?us-ascii?Q?KoP3KHQJDmW02oNz+FXn0mmenOKYmGRGz65CSlJ94Q15hC0mDkZktrGSrqzG?=
 =?us-ascii?Q?9m4CVXlxgA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de06610-90ea-475d-5f9f-08df33316ef7
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 07:19:12.3306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vEpZdbV+YXNr9uWKHUDIwbRMe4A69dQ7edDKOj6fjLrYcH+7hVwSN0gSz3k/ZTy9g74bwmT1q0GHi/VkGc26Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7549
X-purgate-ID: tlsNG-c201ff/1792999154-714AC2A1-29E04ADE/0/0
X-purgate-type: clean
X-purgate-size: 3953
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

nestedhvm_hap_nested_page_fault() walks the L1 and L0 p2m tables without
holding the nested p2m lock, and only afterwards looks up the np2m with
p2m_get_nestedp2m_locked() to install the result.  If L1 changes its
EPT/NPT base or the np2m is flushed or reassigned during the walk
(np2m_base / np2m_generation change), the translation computed from
the old tables may be installed into a np2m that now represents a
different L2 address space, leaving a stale or wrong mapping.

Snapshot np2m_base and np2m_generation before the walk, and re-check
them after each walk step (L1 and L0) via the new nestedhap_np2m_changed()
helper.  Re-check them again, together with the np2m identity, once the
np2m lock is retaken for nestedhap_fix_p2m(). On any mismatch, drop
the lock and retry the whole fault from the start.

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
 xen/arch/x86/mm/hap/nested_hap.c | 40 +++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/hap/nested_hap.c b/xen/arch/x86/mm/hap/nested_hap.c
index 72706cebaedf..1f09c706dda5 100644
--- a/xen/arch/x86/mm/hap/nested_hap.c
+++ b/xen/arch/x86/mm/hap/nested_hap.c
@@ -101,6 +101,19 @@ nestedhap_fix_p2m(struct vcpu *v, struct p2m_domain *p2m,
     }
 }
 
+static bool nestedhap_np2m_changed(struct p2m_domain *p2m,
+                                   uint64_t base, uint64_t generation)
+{
+    bool changed;
+
+    p2m_lock(p2m);
+    changed = p2m->np2m_base != base ||
+              p2m->np2m_generation != generation;
+    p2m_unlock(p2m);
+
+    return changed;
+}
+
 /* This function uses L1_gpa to walk the P2M table in L0 hypervisor. If the
  * walk is successful, the translated value is returned in L0_gpa. The return 
  * value tells the upper level what to do.
@@ -176,16 +189,26 @@ int nestedhvm_hap_nested_page_fault(
     p2m_type_t p2mt_10;
     p2m_access_t p2ma_10 = p2m_access_rwx;
     uint8_t p2ma_21 = p2m_access_rwx;
+    uint64_t np2m_base, np2m_generation;
 
     if ( *L2_gpa >> v->domain->arch.cpuid->extd.maxphysaddr )
         return NESTEDHVM_PAGEFAULT_INJECT;
 
     p2m = p2m_get_hostp2m(d); /* L0 p2m */
 
+ retry:
+    nested_p2m = p2m_get_nestedp2m_locked(v);
+    np2m_base = nested_p2m->np2m_base;
+    np2m_generation = nested_p2m->np2m_generation;
+    p2m_unlock(nested_p2m);
+
     /* walk the L1 P2M table */
     rv = nhvm_hap_walk_L1_p2m(v, *L2_gpa, &L1_gpa, &page_order_21, &p2ma_21,
                               npfec);
 
+    if ( nestedhap_np2m_changed(nested_p2m, np2m_base, np2m_generation) )
+        goto retry;
+
     /* let caller to handle these two cases */
     switch (rv) {
     case NESTEDHVM_PAGEFAULT_INJECT:
@@ -203,6 +226,9 @@ int nestedhvm_hap_nested_page_fault(
     rv = nestedhap_walk_L0_p2m(p2m, L1_gpa, &L0_gpa, &p2mt_10, &p2ma_10,
                                &page_order_10, npfec);
 
+    if ( nestedhap_np2m_changed(nested_p2m, np2m_base, np2m_generation) )
+        goto retry;
+
     /* let upper level caller to handle these two cases */
     switch (rv) {
     case NESTEDHVM_PAGEFAULT_INJECT:
@@ -249,7 +275,19 @@ int nestedhvm_hap_nested_page_fault(
     p2ma_10 &= (p2m_access_t)p2ma_21;
 
     /* fix p2m_get_pagetable(nested_p2m) */
-    nested_p2m = p2m_get_nestedp2m_locked(v);
+    {
+        struct p2m_domain *current_p2m = p2m_get_nestedp2m_locked(v);
+
+        if ( current_p2m != nested_p2m ||
+             current_p2m->np2m_base != np2m_base ||
+             current_p2m->np2m_generation != np2m_generation )
+        {
+            p2m_unlock(current_p2m);
+            goto retry;
+        }
+
+        nested_p2m = current_p2m;
+    }
     nestedhap_fix_p2m(v, nested_p2m, *L2_gpa, L0_gpa, page_order_20,
         p2mt_10, p2ma_10);
     p2m_unlock(nested_p2m);
-- 
2.34.1


