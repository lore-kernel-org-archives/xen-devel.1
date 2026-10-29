Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10E6606A322
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 10:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=z06qXT2u
Received: from list by lists.xenproject.org with outflank-mailman.1464358.1675050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMN3E-0006sW-Pk; Thu, 29 Oct 2026 10:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464358.1675050; Thu, 29 Oct 2026 10:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMN3E-0006sP-N0; Thu, 29 Oct 2026 10:08:04 +0000
Received: by outflank-mailman (input) for mailman id 1464358;
 Thu, 29 Oct 2026 10:08:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xMN3D-0006sJ-ON
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 10:08:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xMN3D-00000002PB4-2FGS;
 Thu, 29 Oct 2026 10:08:03 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xMN3C-000000012kX-46yx;
 Thu, 29 Oct 2026 10:08:03 +0000
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
	bh=JWt7RjLtDFAj1Twt2mVWYcZJUcmbBZY2oIoGpwJlSWc=; b=z06qXT2uuI8qN98a0dJqjk9a37
	fHnz6Vv5OF34HmZlS2JhkXrG+VumPJetdYbm2W5pN7IvJOc0+9ed3NMHbnlaQIJq04EkBcV9FKjUL
	a/6lyovM6vq6qlmR24S1AjvYLxJgiNBMPJSN8HEn2eEBi0lyeSrHtHKoxMFfm/VinLqg=;
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
Subject: [PATCH] x86/irq: further gate PIRQ usage for HVM domains
Date: Thu, 29 Oct 2026 11:07:41 +0100
Message-ID: <20261029100741.42711-1-roger@xenproject.org>
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

Further restrict PIRQ usage for HVM domains not having the ability to route
device interrupts over event channels.

It's still possible for HVM domains without PIRQ support to exercise the
vector == 0 path in hvm_inject_msi(), which is intended to be used only
when the guest has PIRQ support.  Taking the PIRQ path in hvm_inject_msi()
inhibits the local APIC from raising an ESR error when the MSI vector is
0, since an MSI with vector == 0 is always processed as a PIRQ.  Introduce
a has_pirq() check in hvm_inject_msi().

EVTCHNOP_bind_pirq is also not outright blocked for HVM domains without
PIRQ support, so guests could attempt to bind device interrupts to event
channels.  Short-circuit evtchn_bind_pirq() early if the domain has no PIRQ
support.

Additionally introduce an assert in map_domain_emuirq_pirq() to ensure it's
never called from HVM domains without PIRQ support.

Finally add an extra check in hvm_domain_use_pirq() so it returns false
unconditionally if the domain has no PIRQ support.  Also convert the
is_hvm_domain() check into an ASSERT(); this helper is never called against
a PV domain.

Fixes: b96b50004804 ("x86: remove XENFEAT_hvm_pirqs for PVHv2 guests")
Signed-off-by: Roger Pau Monné <roger@xenproject.org>
---
 xen/arch/x86/hvm/irq.c     | 5 +++--
 xen/arch/x86/irq.c         | 2 ++
 xen/common/event_channel.c | 3 +++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 5f643611130f..50a43143149b 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -19,7 +19,8 @@
 
 bool hvm_domain_use_pirq(const struct domain *d, const struct pirq *pirq)
 {
-    return is_hvm_domain(d) && pirq && pirq->arch.hvm.emuirq != IRQ_UNBOUND;
+    ASSERT(is_hvm_domain(d));
+    return has_pirq(d) && pirq && pirq->arch.hvm.emuirq != IRQ_UNBOUND;
 }
 
 /* Must be called with hvm_domain->irq_lock hold */
@@ -382,7 +383,7 @@ int hvm_inject_msi(struct domain *d, uint64_t addr, uint32_t data)
         >> MSI_DATA_TRIGGER_SHIFT;
     uint8_t vector = data & MSI_DATA_VECTOR_MASK;
 
-    if ( !vector )
+    if ( has_pirq(d) && !vector )
     {
         unsigned int pirq = ((addr >> 32) & 0xffffff00U) | dest;
 
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index c58d2eb9227c..32a75f77a46d 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2814,6 +2814,8 @@ int map_domain_emuirq_pirq(struct domain *d, int pirq, int emuirq)
     if ( !is_hvm_domain(d) )
         return -EINVAL;
 
+    ASSERT(has_pirq(d));
+
     if ( pirq < 0 || pirq >= d->nr_pirqs ||
             emuirq == IRQ_UNBOUND || emuirq >= (int) nr_irqs )
     {
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index bd03e094d096..97104bea15fc 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -681,6 +681,9 @@ static int evtchn_bind_pirq(evtchn_bind_pirq_t *bind)
     int            port = 0, rc;
     unsigned int   pirq = bind->pirq;
 
+    if ( is_hvm_domain(d) && !has_pirq(d) )
+        return -EOPNOTSUPP;
+
     if ( pirq >= d->nr_pirqs )
         return -EINVAL;
 
-- 
2.55.0


