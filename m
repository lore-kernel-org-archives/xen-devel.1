Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73F4606A320
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 23:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=yM+K2gDh
Received: from list by lists.xenproject.org with outflank-mailman.1463800.1674646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6U-0006HG-Kd; Wed, 28 Oct 2026 23:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463800.1674646; Wed, 28 Oct 2026 23:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6T-0006En-Vk; Wed, 28 Oct 2026 23:30:45 +0000
Received: by outflank-mailman (input) for mailman id 1463800;
 Wed, 28 Oct 2026 23:30:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xMD6L-00049I-4t
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 23:30:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMD6L-00000000pQN-15gm;
 Wed, 28 Oct 2026 23:30:37 +0000
Received: from [217.155.165.12] (helo=Mac.fritz.box.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCjl-00000001KpM-0PPR;
 Wed, 28 Oct 2026 23:07:17 +0000
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
	bh=FlX8i68BurZZbddP5JFg/suxuQm3LKHJ87QfUKq0fho=; b=yM+K2gDhBTn33JbARZDS88dTNx
	/5uNKqrJ5BPkZtu6t+I8TYTpKDkJaCPVrU9PC7xKEb9T7e3rJ+n/GozNMw7juvP6RtjJU8LCWlK3e
	teSax+YVOY2/wI3pK7he0+Ea2otncKOX0Rhdrt48l8HF/1QqU3iijr1Wdotkq1BrmI3Y=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v5 39/45] x86/emulator: Refactor FXSAVE_AREA to use wrappers
Date: Wed, 28 Oct 2026 23:05:53 +0000
Message-ID: <20261028-asi-hvm-v5-39-13b908e0df0b@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
References: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alejandro Vallejo <alejandro.vallejo@cloud.com>

The FXSAVE/FXRSTOR emulation scratch buffer is the calling vCPU's own
XSAVE area, reached today through a raw pointer dereference.  Route it
through the VCPU_MAP_XSAVE_AREA()/VCPU_UNMAP_XSAVE_AREA() seam
instead, so the buffer keeps working when guest XSAVE areas move
behind per-vCPU mappings.  This path always operates on `current`, for
which the map has a fastpath; the unmap is a no-op outside Xen builds.

The macro pair is named MAP_FXSAVE_AREA()/UNMAP_FXSAVE_AREA() rather
than keeping the bare FXSAVE_AREA name, so that the mapping operation
is visible at the use sites.

blk_fxsave() saves directly into the caller's buffer when it is large
enough, so it needs a second variable: the save destination and the
mapped area are not the same pointer, and only the latter may be
handed to the unmap.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>

---
Revived from "x86: Address Space Isolation FPU preparations" v3 patch
08/12 (<20250110132823.24348-9-alejandro.vallejo@cloud.com>, Acked-by
Jan Beulich modulo the rename below; no v4 was ever posted).

Changes in v5:
- New in this version.

Changes since the previously posted version:
 - Renamed FXSAVE_AREA to MAP_FXSAVE_AREA(), as requested by Jan
   Beulich on the original thread ("the existing macro better would be
   adjusted to become MAP_FXSAVE_AREA()"), making the map operation
   visible at the use sites.
 - Introduced the separate save-destination variable in blk_fxsave().
   The original unmapped `fxsr` after that variable had been
   repointed at the caller's buffer, so the unmap received a pointer
   that was never mapped.  Harmless while the unmap was a stub, but a
   latent bug, and exactly the class of mistake Jan predicted in the
   message quoted above when he objected to the mapping being
   invisible at the use sites.
 - Reworded the commit message.
 - Unmap before raising #GP for a reserved MXCSR bit in blk_fxrstor:
   generate_exception_if() leaves through the done: label, past the
   unmap.
---
 xen/arch/x86/x86_emulate/blk.c | 36 +++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/blk.c b/xen/arch/x86/x86_emulate/blk.c
index 9fddf649ee..b3055c8084 100644
--- a/xen/arch/x86/x86_emulate/blk.c
+++ b/xen/arch/x86/x86_emulate/blk.c
@@ -11,9 +11,12 @@
     !defined(X86EMUL_NO_SIMD)
 # ifdef __XEN__
 #  include <asm/xstate.h>
-#  define FXSAVE_AREA ((void *)&current->arch.xsave_area->fpu_sse)
+/* Has a fastpath for `current`, so there's no actual map */
+#  define MAP_FXSAVE_AREA() ((void *)VCPU_MAP_XSAVE_AREA(current))
+#  define UNMAP_FXSAVE_AREA(x) VCPU_UNMAP_XSAVE_AREA(current, x)
 # else
-#  define FXSAVE_AREA get_fpu_save_area()
+#  define MAP_FXSAVE_AREA() get_fpu_save_area()
+#  define UNMAP_FXSAVE_AREA(x) ((void)(x))
 # endif
 #endif
 
@@ -254,7 +257,7 @@ int x86_emul_blk(
 
     case blk_fxrstor:
     {
-        struct x86_fxsr *fxsr = FXSAVE_AREA;
+        struct x86_fxsr *fxsr = MAP_FXSAVE_AREA();
 
         ASSERT(!data);
         ASSERT(bytes == sizeof(*fxsr));
@@ -277,18 +280,26 @@ int x86_emul_blk(
                               (unsigned int)offsetof(struct x86_fxsr, rsvd)));
         memset(fxsr->rsvd, 0, sizeof(*fxsr) - offsetof(struct x86_fxsr, rsvd));
 
-        generate_exception_if(fxsr->mxcsr & ~mxcsr_mask, X86_EXC_GP, 0);
+        if ( fxsr->mxcsr & ~mxcsr_mask )
+        {
+            UNMAP_FXSAVE_AREA(fxsr);
+            generate_exception(X86_EXC_GP, 0);
+        }
 
         if ( s->rex_prefix & REX_W )
             asm volatile ( "fxrstorq %0" :: "m" (*fxsr) );
         else
             asm volatile ( "fxrstor %0" :: "m" (*fxsr) );
+
+        UNMAP_FXSAVE_AREA(fxsr);
+
         break;
     }
 
     case blk_fxsave:
     {
-        struct x86_fxsr *fxsr = FXSAVE_AREA;
+        struct x86_fxsr *fxsr = MAP_FXSAVE_AREA();
+        struct x86_fxsr *dst = fxsr;
 
         ASSERT(!data);
         ASSERT(bytes == sizeof(*fxsr));
@@ -296,17 +307,20 @@ int x86_emul_blk(
 
         if ( s->op_bytes < sizeof(*fxsr) )
             /* Don't chance consuming uninitialized data. */
-            memset(fxsr, 0, s->op_bytes);
+            memset(dst, 0, s->op_bytes);
         else
-            fxsr = ptr;
+            dst = ptr;
 
         if ( s->rex_prefix & REX_W )
-            asm volatile ( "fxsaveq %0" : "=m" (*fxsr) );
+            asm volatile ( "fxsaveq %0" : "=m" (*dst) );
         else
-            asm volatile ( "fxsave %0" : "=m" (*fxsr) );
+            asm volatile ( "fxsave %0" : "=m" (*dst) );
+
+        if ( dst != ptr ) /* i.e. s->op_bytes < sizeof(*fxsr) */
+            memcpy(ptr, dst, s->op_bytes);
+
+        UNMAP_FXSAVE_AREA(fxsr);
 
-        if ( fxsr != ptr ) /* i.e. s->op_bytes < sizeof(*fxsr) */
-            memcpy(ptr, fxsr, s->op_bytes);
         break;
     }
 
-- 
2.56.0


