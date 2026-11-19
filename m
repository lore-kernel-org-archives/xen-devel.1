Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1F4606A337
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=CAR/50bC
Received: from list by lists.xenproject.org with outflank-mailman.1497140.1695647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9in-0002vn-4I; Thu, 19 Nov 2026 21:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497140.1695647; Thu, 19 Nov 2026 21:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9il-0002oa-7T; Thu, 19 Nov 2026 21:31:07 +0000
Received: by outflank-mailman (input) for mailman id 1497140;
 Thu, 19 Nov 2026 21:30:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xU9i0-0001ET-1k
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:30:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9hz-00000006tK8-2fCS;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9MM-0000000CVBH-1U15;
 Thu, 19 Nov 2026 21:07:58 +0000
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
	bh=xMTLrvxxwpwmKfoWs2RiIcYg6g+Liai9ytC5nmpdgLQ=; b=CAR/50bCIb+XQ2zmY6h4Cru7sT
	+1DxcUFm/9auP8NDoG6wDbJ1jUhzWyVXSYpGgrmnWNeHZVvMY7Oc2uGOldqXw/YMbaxvCmWevpiFW
	GdZkKlOrjJejWv6SJDPdhfZfw4nTd0e9y3L31TD+obV+y2E4ZYKihe5RmhUY24jauDEE=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v7 11/50] x86/hvm: clear the vCPU's copy of an emulated I/O request once consumed
Date: Thu, 19 Nov 2026 21:07:02 +0000
Message-ID: <20261119-asi-hvm-v7-11-6551b6d5c879@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119-asi-hvm-v7-0-6551b6d5c879@xenproject.org>
References: <20261119-asi-hvm-v7-0-6551b6d5c879@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

hvmemul_do_io() keeps the request it is emulating in the vCPU's struct
vcpu_io: the data written, or the response once a device model has
supplied it, with the address and repeat count.  Once the access is done
only the state is set back to STATE_IOREQ_NONE, so the operand stays in
struct vcpu, a xenheap page mapped in every context, until the next
emulated I/O overwrites it.

Drop the copy wherever it is done with: when the response has been taken
into hvmemul_do_io()'s local copy on the instruction's re-execution,
when Xen's own handlers have completed the access, when the request is
retried, suspended or not sent, and in hvmemul_cancel().  A request sent
to a device model stays while it is in flight: the re-execution checks
it, and the port-I/O completion reads its address and size before
re-issuing it.  One which needs no completion -- a port write, or a
request whose data is a guest buffer's address -- loses its address,
data and count as soon as it is sent: the device model has its own copy,
and the completion path reads only the state, type, direction and
data_is_ptr.  Nothing reads the copy after STATE_IOREQ_NONE.

Only the x86 emulator changes.  struct vcpu_io is common code, and Arm's
MMIO completion reads the response from it.  Moving the in-flight copy
out of struct vcpu belongs with narrowing the ioreq server pages, which
carry the same operand while a device model handles it.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v5:
- New in this version.
---
 xen/arch/x86/hvm/emulate.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index e2cf982c25..da7c08b5d9 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -167,6 +167,16 @@ static const struct hvm_io_handler ioreq_server_handler = {
     .ops = &ioreq_server_ops
 };
 
+/*
+ * The vCPU's copy of an emulated I/O request is done with: nothing reads it
+ * before the next request overwrites it.  Clear it all, so that the operand
+ * and the address do not stay in struct vcpu.
+ */
+static void ioreq_done(struct vcpu_io *vio)
+{
+    vio->req = (ioreq_t){ .state = STATE_IOREQ_NONE };
+}
+
 /*
  * Drop all records of in-flight emulation. This is needed whenever a vCPU's
  * register state may have changed behind the emulator's back.
@@ -175,7 +185,7 @@ void hvmemul_cancel(struct vcpu *v)
 {
     struct hvm_vcpu_io *hvio = &v->arch.hvm.hvm_io;
 
-    v->io.req.state = STATE_IOREQ_NONE;
+    ioreq_done(&v->io);
     v->io.completion = VIO_no_completion;
     hvio->mmio_cache_count = 0;
     hvio->mmio_insn_bytes = 0;
@@ -265,8 +275,9 @@ static int hvmemul_do_io(
     case STATE_IOREQ_NONE:
         break;
     case STATE_IORESP_READY:
-        vio->req.state = STATE_IOREQ_NONE;
+        /* The local copy carries the response from here. */
         p = vio->req;
+        ioreq_done(vio);
 
         /* Verify the emulation request has been correctly re-issued */
         if ( (p.type != (is_mmio ? IOREQ_TYPE_COPY : IOREQ_TYPE_PIO)) ||
@@ -330,7 +341,7 @@ static int hvmemul_do_io(
     {
     case X86EMUL_OKAY:
     case X86EMUL_RETRY:
-        vio->req.state = STATE_IOREQ_NONE;
+        ioreq_done(vio);
         break;
     case X86EMUL_UNHANDLEABLE:
     {
@@ -383,7 +394,7 @@ static int hvmemul_do_io(
                 if ( s == NULL )
                 {
                     rc = X86EMUL_RETRY;
-                    vio->req.state = STATE_IOREQ_NONE;
+                    ioreq_done(vio);
                     break;
                 }
 
@@ -394,7 +405,7 @@ static int hvmemul_do_io(
                 if ( dir == IOREQ_READ )
                 {
                     rc = hvm_process_io_intercept(&ioreq_server_handler, &p);
-                    vio->req.state = STATE_IOREQ_NONE;
+                    ioreq_done(vio);
                     break;
                 }
             }
@@ -440,7 +451,7 @@ static int hvmemul_do_io(
                                     paddr_to_pfn(addr));
 
                         rc = X86EMUL_RETRY;
-                        vio->req.state = STATE_IOREQ_NONE;
+                        ioreq_done(vio);
                         break;
                     }
 
@@ -455,15 +466,24 @@ static int hvmemul_do_io(
                              dir ? "read from" : "write to", addr, size);
             }
             rc = hvm_process_io_intercept(&null_handler, &p);
-            vio->req.state = STATE_IOREQ_NONE;
+            ioreq_done(vio);
         }
         else
         {
             rc = ioreq_send(s, &p, 0);
             if ( rc != X86EMUL_RETRY || vio->suspended )
-                vio->req.state = STATE_IOREQ_NONE;
+                ioreq_done(vio);
             else if ( !ioreq_needs_completion(&vio->req) )
+            {
+                /*
+                 * Nothing comes back, and the device model has its own copy
+                 * of the request: keep only what completion checks.
+                 */
+                vio->req.addr = 0;
+                vio->req.data = 0;
+                vio->req.count = 0;
                 rc = X86EMUL_OKAY;
+            }
         }
         break;
     }
-- 
2.56.0


