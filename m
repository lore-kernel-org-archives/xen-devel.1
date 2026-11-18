Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F54606A889
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 07:03:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1493803.1693545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTZgi-0000Ku-0P; Wed, 18 Nov 2026 07:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493803.1693545; Wed, 18 Nov 2026 07:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTZgh-0000Km-PB; Wed, 18 Nov 2026 07:02:35 +0000
Received: by outflank-mailman (input) for mailman id 1493803;
 Wed, 18 Nov 2026 07:02:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lin.liu01@citrix.com>) id 1xTZgh-0000Kg-C7
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 07:02:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTZgg-00DIrP-5e
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 08:02:34 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6afd4d81-8faa-0a2a0a5109dd-0a2a45048976-32
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 08:02:34 +0100
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6afd4d89-b57f-0a2a45040019-a0658309c6cc-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 08:02:33 +0100
Received: from cdev-nkg (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 7047184DAD49;
 Wed, 18 Nov 2026 02:01:04 -0500 (EST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Lin Liu <lin.liu01@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Lin Liu <lin.liu01@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/hvm: Don't save or load HVM context of a domain with no vCPUs
Date: Wed, 18 Nov 2026 07:02:26 +0000
Message-ID: <0ccd6c2bb95cfdd80f430aebf62d788c825ae939.1794985346.git.lin.liu01@citrix.com>
X-Mailer: git-send-email 2.52.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1794985353-C06DAB50-26240DE1/0/0
X-purgate-type: clean
X-purgate-size: 3161
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

XEN_DOMCTL_createdomain allocates d->vcpu[] but the vCPUs themselves are
only created by a later XEN_DOMCTL_max_vcpus.  In that window
XEN_DOMCTL_gethvmcontext{,_partial} on the domain reach the per-domain
save handlers with d->vcpu[0] == NULL.  A dom0 tool polling xen-hvmctx
across all domains while a VM was being restored took the host down:

  (XEN) HVM d25 save: PIC
  (XEN) RIP:    e008:[<ffff82d04030dc98>] arch/x86/hvm/vpic.c#vpic_save+0x8/0x8f
  (XEN) rdi: 0000000000000000
  (XEN) Xen call trace:
  (XEN)    [<ffff82d04030dc98>] R arch/x86/hvm/vpic.c#vpic_save+0x8/0x8f
  (XEN)    [<ffff82d04021009f>] S arch/x86/hvm/save.c#hvm_save.cold+0x9b/0xf7
  (XEN)    [<ffff82d04036d99c>] S arch_do_domctl+0x1a2c/0x28a6
  (XEN)    [<ffff82d04025341a>] S do_domctl+0x139a/0x1642
  (XEN)    [<ffff82d04033331e>] S pv_hypercall+0x3ae/0x59a
  (XEN)    [<ffff82d0402003b5>] S lstar_enter+0x105/0x10a
  (XEN)
  (XEN) Panic on CPU 0:
  (XEN) FATAL PAGE FAULT
  (XEN) [error_code=0000]
  (XEN) Faulting linear address: 0000000000000018

XEN_DOMCTL_sethvmcontext has the same problem on the load side, e.g.
pit_load() uses d->vcpu[0] for the guest time.

Refuse to save or load the whole context until vCPU 0 exists, and look up
the vCPU in hvm_save_one() with domain_vcpu(), failing with -ENOENT as
for other absent vCPUs.

Fixes: d0d8980138c4 ("x86/hvm: remove redundant save functions")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Lin Liu <lin.liu01@citrix.com>
---
 xen/arch/x86/hvm/save.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/save.c b/xen/arch/x86/hvm/save.c
index 8ab6405706..48f8229061 100644
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -139,12 +139,11 @@ int hvm_save_one(struct domain *d, unsigned int typecode, unsigned int instance,
          !hvm_sr_handlers[typecode].save )
         return -EINVAL;
 
-    if ( hvm_sr_handlers[typecode].kind != HVMSR_PER_VCPU )
-        v = d->vcpu[0];
-    else if ( instance >= d->max_vcpus || !d->vcpu[instance] )
+    /* Per-domain records are saved via vCPU 0, absent before max_vcpus. */
+    v = domain_vcpu(d, hvm_sr_handlers[typecode].kind == HVMSR_PER_VCPU
+                       ? instance : 0);
+    if ( !v )
         return -ENOENT;
-    else
-        v = d->vcpu[instance];
     ctxt.size = hvm_sr_handlers[typecode].size;
     ctxt.data = xmalloc_bytes(ctxt.size);
     if ( !ctxt.data )
@@ -203,7 +202,8 @@ int hvm_save(struct domain *d, hvm_domain_context_t *h)
     struct hvm_save_end end;
     unsigned int i;
 
-    if ( d->is_dying )
+    /* Per-domain handlers are passed vCPU 0. */
+    if ( d->is_dying || !d->vcpu[0] )
         return -EINVAL;
 
     hdr.magic = HVM_FILE_MAGIC;
@@ -291,7 +291,8 @@ int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h)
     struct hvm_save_descriptor *desc;
     int rc;
 
-    if ( d->is_dying )
+    /* Some per-domain loaders use vCPU 0. */
+    if ( d->is_dying || !d->vcpu[0] )
         return -EINVAL;
 
     /* Get at the save header, which must be first */
-- 
2.52.0


