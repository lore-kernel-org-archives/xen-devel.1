Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13143606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 16:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=aFtz1Mqu
Received: from list by lists.xenproject.org with outflank-mailman.1459512.1671392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKHxi-00038o-BQ; Fri, 23 Oct 2026 16:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459512.1671392; Fri, 23 Oct 2026 16:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKHxi-00038h-8x; Fri, 23 Oct 2026 16:17:46 +0000
Received: by outflank-mailman (input) for mailman id 1459512;
 Fri, 23 Oct 2026 16:17:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xKHxh-00038b-FN
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 16:17:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xKHxh-00000009FoG-1Z8t;
 Fri, 23 Oct 2026 16:17:45 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xKHxg-0000000HIWo-4AeE;
 Fri, 23 Oct 2026 16:17:45 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From;
	bh=91d6mOvZPpjsKDXzz8mQfsrDndJawH+XacKy+EAZdP8=; b=aFtz1MquU1dz62WgL0+1e4gSP1
	yitzo4r62om5+mbal2Lky8BiNnPmGrGXZ24wy3P/RH6KmUcsqMgXa8+TVKOqw7MuhsTR5YVjfrWKf
	gM0CcmSEZGBB8Ncs3aUa1KVzqTBppTiQ7uniR9GTQda0asdCgzwXvEdlYpahcqgHfFUc=;
From: Roger Pau Monne <roger@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] xen/vcpu: ensure no write when runstate handler is NULL
Date: Fri, 23 Oct 2026 18:17:42 +0200
Message-ID: <20261023161742.67329-1-roger@xenproject.org>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The VCPUOP_register_runstate_memory_area hypercall tries to update the
newly registered area, even when NULL is being registered.  If the guest
happens to have memory mapped at 0 in the address space, this write will
succeed.

Ever since it's introduction in Xen 3.0, NULL is the initial state of the
pointer, and guards the update of the runstate area in context_switch().
NULL has also been accepted as an input to the hypercall.

It is unclear whether de-registration of the area was considered at the
time, but the behaviour of the hypercall has always supported.
De-registering using NULL is a common pattern for other hypercalls, so
formally make this the case for VCPUOP_register_runstate_memory_area by
skipping the update if the area has been de-registered.

Fixes: 705ea2b54c35 ("New VCPUOP_register_runstate_memory_area hypercall.")
Signed-off-by: Roger Pau Monné <roger@xenproject.org>
---
Changes since v1:
 - Reword commit message.
 - Comment on the runstate update attempt done in common_vcpu_op().
 - Notice in the public headers that passing NULL deregisters any previous
   region.
---
 xen/arch/x86/x86_64/domain.c | 5 +++++
 xen/common/domain.c          | 5 +++++
 xen/include/public/vcpu.h    | 1 +
 3 files changed, 11 insertions(+)

diff --git a/xen/arch/x86/x86_64/domain.c b/xen/arch/x86/x86_64/domain.c
index a02d4f569ee5..533b0b21a00e 100644
--- a/xen/arch/x86/x86_64/domain.c
+++ b/xen/arch/x86/x86_64/domain.c
@@ -58,6 +58,11 @@ compat_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
         rc = 0;
         guest_from_compat_handle(v->runstate_guest.compat, area.addr.h);
 
+        /* NULL handle is deregistering the address. */
+        if ( compat_handle_is_null(area.addr.h) )
+            break;
+
+        /* Update the newly-registered runstate area, best-effort. */
         if ( v == current )
         {
             XLAT_vcpu_runstate_info(&info, &v->runstate);
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 6b52713518da..a1e4cb80871c 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -2330,6 +2330,11 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
         rc = 0;
         runstate_guest(v) = area.addr.h;
 
+        /* NULL handle is deregistering the address. */
+        if ( guest_handle_is_null(area.addr.h) )
+            break;
+
+        /* Update the newly-registered runstate area, best-effort. */
         if ( v == current )
         {
             __copy_to_guest(runstate_guest(v), &v->runstate, 1);
diff --git a/xen/include/public/vcpu.h b/xen/include/public/vcpu.h
index f7445ac0b08a..403b81457c82 100644
--- a/xen/include/public/vcpu.h
+++ b/xen/include/public/vcpu.h
@@ -112,6 +112,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_runstate_info_t);
  *     VCPU was last scheduled to run.
  *  3. New code wants to prefer VCPUOP_register_runstate_phys_area, and only
  *     fall back to the operation here for backwards compatibility.
+ *  4. Passing a NULL handle will deregister the region.
  * @extra_arg == pointer to vcpu_register_runstate_memory_area structure.
  */
 #define VCPUOP_register_runstate_memory_area 5
-- 
2.55.0


