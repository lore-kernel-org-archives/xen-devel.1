Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D85D606A89A
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 23:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ckn0W1Dm
Received: from list by lists.xenproject.org with outflank-mailman.1493392.1693400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTSxE-0004Ei-Ow; Tue, 17 Nov 2026 23:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493392.1693400; Tue, 17 Nov 2026 23:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTSxE-0004Eb-MG; Tue, 17 Nov 2026 23:51:12 +0000
Received: by outflank-mailman (input) for mailman id 1493392;
 Tue, 17 Nov 2026 23:51:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1xTSxD-0004EV-Hc
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 23:51:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTSxC-003SyV-US
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 00:51:10 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6afce84f-2eae-0a2a0a5409dd-0a2a450ca3a8-28
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 00:51:10 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6afce86d-f479-0a2a450c0019-aceafc1fc664-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 00:51:10 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 785D14021E;
 Tue, 17 Nov 2026 23:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6366C1F000C4;
 Tue, 17 Nov 2026 23:51:07 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794959468;
	bh=ylbdZvmIBrKJ2PX5r1SlvlgLszXE281ShWsFIhsn0+s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Ckn0W1DmQ8NGT6HO05PXlyMqDIeY1tw1lG71lYWzPhfU2ZEv0D78BOyuYRxUKMXXy
	 FntNdqBk09ruAtJRW2hwc8F1B/aJvCoEANZ512N9W5NOROd4AhX94T90H2JdA0FcNB
	 v9R5vZV2x4Ans1Lx2uZJD8rU6gM2IOKuixIIqAaLUEVPLU3V7VxkBBsCAUt9eNVyIf
	 tTa0lEGh6DLnt0diHLpPpCkYfHJdRFyR52YkzOLOvSubE6IIpnIAhLfSUT/I863Fti
	 KmZjDKocM6DXUzYQ23P0denAd54pFGfFvhB3tY24bt+Pv9dXvARqEuI+0hQjlViUYX
	 jcmrNMhFKfoBQ==
Date: Tue, 17 Nov 2026 15:51:02 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
To: "Orzel, Michal" <michal.orzel@amd.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: vpl011: record the virq only once it is
 reserved
In-Reply-To: <a1dea481-c2e8-4a6f-9a2c-9468b20144f0@amd.com>
Message-ID: <3481ff47-f05f-17a1-9593-1b57cb8d0ed6@kernel.org>
References: <20261114020040.4154189-1-stefano.stabellini@amd.com> <a1dea481-c2e8-4a6f-9a2c-9468b20144f0@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-d25034/1794959470-022C0A5B-C1B10353/0/0
X-purgate-type: clean
X-purgate-size: 3821
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 16 Nov 2026, Orzel, Michal wrote:
> On 14-Nov-26 03:00, Stefano Stabellini wrote:
> > domain_vpl011_init() sets vpl011->virq before vgic_reserve_virq() claims
> > it, and both a refused reservation and a failed
> > alloc_unbound_xen_event_channel() take the out1 error path into
> > domain_vpl011_deinit(), which frees vpl011->virq. That clears the
> > allocation bit of an interrupt the vPL011 never reserved, so an
> > interrupt held by another user can be handed out a second time.
> Who is the other user here? The virq is either GUEST_VPL011_SPI or the
> Xen UART IRQ. libxl rejects a passthrough IRQ that matches the vpl011
> SPI, dom0less reserves the vpl011 virq before passthrough and panics
> on failure, and the Xen UART cannot be assigned. AFAICT there is no issue as of
> today and this should be explained in the commit msg.
 
Yes, I can explain this in the commit message.

Just one note though: Xen itself doesn't enforce it.
XEN_DOMCTL_bind_pt_irq accepts GUEST_VPL011_SPI. A toolstack that binds
a passthrough IRQ there before XEN_DOMCTL_vuart_op would see the vpl011
error path free that passthrough virq. I'll explain this in the commit
message.


> > Record the virq only after the reservation succeeds.
> > 
> > Fixes: 08bbc1c02d38 ("xen/arm: vpl011: Fix domain_vpl011_init error path")
> The SHA is wrong - unknown revision. That said, I think this should be
> 1ee1e4b0d1ff instead.

Thanks! I can use that

---

xen/arm: vpl011: record the virq only once it is reserved

domain_vpl011_init() sets vpl011->virq before reserving it. If the
reservation or the event channel allocation fails, the error path frees
vpl011->virq, which the vPL011 never reserved.

libxl and dom0less never hit this with a virq held by someone else, but
Xen does not enforce it: XEN_DOMCTL_bind_pt_irq accepts
GUEST_VPL011_SPI, so a passthrough IRQ bound there before
XEN_DOMCTL_vuart_op would lose its reservation.

Record the virq only after the reservation succeeds.

Fixes: 1ee1e4b0d1ff ("xen/arm: Allow vpl011 to be used by DomU")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- explain in the commit message why libxl and dom0less never hit
  this, and that Xen itself does not enforce it
- Fixes: tag now points to 1ee1e4b0d1ff

 xen/arch/arm/vpl011.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index d0d17c76b7..a37e88a8b4 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -640,6 +640,7 @@ static void vpl011_notification(struct vcpu *v, unsigned int port)
 int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
 {
     int rc;
+    unsigned int virq;
     struct vpl011 *vpl011 = &d->arch.vpl011;
 
     if ( vpl011->backend.dom.ring_buf )
@@ -659,7 +660,7 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
         if ( (uart != NULL) && (vpl011_irq > 0) )
         {
             vpl011->base_addr = uart->base_addr;
-            vpl011->virq = vpl011_irq;
+            virq = vpl011_irq;
         }
         else
         {
@@ -685,7 +686,7 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
     else
     {
         vpl011->base_addr = GUEST_PL011_BASE;
-        vpl011->virq = GUEST_VPL011_SPI;
+        virq = GUEST_VPL011_SPI;
     }
 
     /*
@@ -724,12 +725,12 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
         }
     }
 
-    rc = vgic_reserve_virq(d, vpl011->virq);
-    if ( !rc )
+    if ( !vgic_reserve_virq(d, virq) )
     {
         rc = -EINVAL;
         goto out1;
     }
+    vpl011->virq = virq;
 
     vpl011->uartfr = TXFE | RXFE;
 
-- 
2.47.3

