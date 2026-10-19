Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02F6606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=iM/SmPKH
Received: from list by lists.xenproject.org with outflank-mailman.1454771.1668338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItGd-0007O4-8l; Mon, 19 Oct 2026 19:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454771.1668338; Mon, 19 Oct 2026 19:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItGd-0007N6-0Q; Mon, 19 Oct 2026 19:43:31 +0000
Received: by outflank-mailman (input) for mailman id 1454771;
 Mon, 19 Oct 2026 19:43:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xItGb-00077Q-Er
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:43:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItGP-000000022jq-0zl8;
 Mon, 19 Oct 2026 19:43:17 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItGO-00000001FjN-3zHt;
 Mon, 19 Oct 2026 19:43:16 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=jkPIl+dPP6zf0AQ7LteorT5djg7uxPkCmb8aNhe84Jw=; b=iM/SmPKHE2sQAwkaLYZYQY8srW
	Uql64ogIv6tHXYC80tTTUHJOBSFxpWCMW7dAmPFWqyOVS2WZrhZp9PGZMM0CUAs1imQ6VpxIyFmM6
	z19rNIidUMjzJ3bIYsxC/GfScRFiiB5EHAR2cTDmfZASr1jEtw2JjJH5bbPzkyAAYXfo=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v4 02/30] x86/mm: refuse to promote an L4 while the domain has no vCPU
Date: Mon, 19 Oct 2026 20:42:33 +0100
Message-ID: <20261019-asi-hvm-v4-2-b68b66652266@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
References: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

init_xen_l4_slots() puts the domain's per-domain L3 in slot 260 of the
L4s it fills.  Since fcf91ce9de66 ("x86/pv: don't populate the GDT/LDT
L3 slot at domain creation") a PV domain gets that L3 with its first
vCPU (pv_create_gdt_ldt_l1tab()).  Only mapcache_domain_init() makes it
earlier, with the domain, and release builds skip that unless memory
hotplug is enabled or the host's memory reaches past the part of the
directmap PV guests can see.  So in release builds on most hosts, an L4
promoted before XEN_DOMCTL_max_vcpus has created the domain's vCPUs gets
a slot 260 entry made from a NULL page (0x803e900000000063), pointing
far beyond the host's memory.

Debug builds happen to have the L3 that early.  Refuse such an L4 in
every build, so that there is one rule: promote_l4_table() returns
-EINVAL while the domain has no vCPU 0, before taking any reference.
libxl is unaffected: it creates the vCPUs before it builds or restores a
domain.

There's no way to trigger the issue from the current toolstack; this
is just belt-and-braces.

Fixes: fcf91ce9de66 ("x86/pv: don't populate the GDT/LDT L3 slot at domain creation")
Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v4:
- New in this version, split out of "x86/hvm: introduce per-vCPU L3
  page-table": promote_l4_table() fails while the domain has no vCPU
---
 xen/arch/x86/mm.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index e42cd33c0d..3f6f9f3bd4 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1798,11 +1798,21 @@ static int promote_l4_table(struct page_info *page)
 {
     struct domain *d = page_get_owner(page);
     mfn_t          l4mfn = page_to_mfn(page);
-    l4_pgentry_t  *pl4e = map_domain_page(l4mfn);
+    l4_pgentry_t  *pl4e;
     unsigned int   i;
     int            rc = 0;
     unsigned int   partial_flags = page->partial_flags;
 
+    /*
+     * init_xen_l4_slots() puts the domain's per-domain L3 in slot 260, and a
+     * PV domain may get that only with its first vCPU.  The domain has no
+     * vCPUs before XEN_DOMCTL_max_vcpus.
+     */
+    if ( !domain_vcpu(d, 0) )
+        return -EINVAL;
+
+    pl4e = map_domain_page(l4mfn);
+
     for ( i = page->nr_validated_ptes; i < L4_PAGETABLE_ENTRIES;
           i++, partial_flags = 0 )
     {
-- 
2.55.0


