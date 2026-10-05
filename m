Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F8DCA5FFC
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 09:29:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440645.1658048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDf0a-0001bY-Mm; Mon, 05 Oct 2026 09:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440645.1658048; Mon, 05 Oct 2026 09:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDf0a-0001bR-K7; Mon, 05 Oct 2026 09:29:20 +0000
Received: by outflank-mailman (input) for mailman id 1440645;
 Mon, 05 Oct 2026 09:29:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1xDf0Z-0001bF-J4
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 09:29:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDf0Y-006jog-S9
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 11:29:19 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6ac36de6-2eae-0a2a0a5409dd-0a2a4504e6a8-14
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 11:29:18 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6ac36ded-b57f-0a2a45040019-aa0a817cc7c7-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 11:29:18 +0200
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-1ZELo3cIMrCOlbnw_6lU1Q-1; Mon,
 05 Oct 2026 05:29:13 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 605A818007E7; Mon,  5 Oct 2026 09:29:12 +0000 (UTC)
Received: from redhat.com (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7F7051956087; Mon,  5 Oct 2026 09:29:10 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791192557;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VWEaBtZdiYhiKz5AQwLJW7nAdhFU5R4j3oWNHV/QcxM=;
	b=EwNL0HLoFKFd3iLhXWMx8jhihS68BGr3kvf5pngTUSQO+3aQba47mPwTmwALuVWcIT0aBE
	I5N1wISrv9J/0soL7YDUeKZfbAg4GDM0qQt2jZccSBd7FkupTMd8WotPR+jywFYnb6alhw
	mzcxSP/4kOAzLeC+WYi4NFy9gnSLQ/g=
X-MC-Unique: 1ZELo3cIMrCOlbnw_6lU1Q-1
X-Mimecast-MFC-AGG-ID: 1ZELo3cIMrCOlbnw_6lU1Q_1791192552
Date: Mon, 5 Oct 2026 10:29:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 03/28] hw: mark all virtio PCI devices as secure
Message-ID: <asNt4xv7ziocHrwq@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-4-berrange@redhat.com>
 <179096166110.3025252.6768256984831473183.b4-review@b4>
MIME-Version: 1.0
In-Reply-To: <179096166110.3025252.6768256984831473183.b4-review@b4>
User-Agent: Mutt/2.4.2 (2026-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: HEfXvylwsgBW1mCJkWKesFV_DSsI5BJUj6R79zJNEm4_1791192552
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1791192558-C1ED6B50-CEEBF26C/0/0
X-purgate-type: clean
X-purgate-size: 2415

On Fri, Oct 02, 2026 at 09:21:01PM +0400, marcandre.lureau@redhat.com wrote:
> > These are all intended for use in a virtualization scenario and must
> > provide a security boundary. This can be done for almost all virtio
> > PCI devices by modifying the common type register helper.
> > 
> > The virtio-gpu devices are unusual in not using the common
> > virtio_pci_types_register() method, so need marking directly.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > Message-ID: <20260911143627.2743803-4-berrange@redhat.com>
> >
> > diff --git a/hw/display/virtio-gpu-pci-rutabaga.c b/hw/display/virtio-gpu-pci-rutabaga.c
> > index 4db77cb868db..a8e5e1d96cf3 100644
> > --- a/hw/display/virtio-gpu-pci-rutabaga.c
> > +++ b/hw/display/virtio-gpu-pci-rutabaga.c
> > @@ -34,6 +34,7 @@ static const TypeInfo virtio_gpu_rutabaga_pci_info[] = {
> >          .parent = TYPE_VIRTIO_GPU_PCI_BASE,
> >          .instance_size = sizeof(VirtIOGPURutabagaPCI),
> >          .instance_init = virtio_gpu_rutabaga_initfn,
> > +        .secure = true,
> 
> This is unusual, I wonder why it's not using the VirtioPCIDeviceTypeInfo

Yeah, I don't know  the reason for that choice.

> 
> >          .interfaces = (const InterfaceInfo[]) {
> >              { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> >              { },
> > diff --git a/hw/display/virtio-gpu-pci.c b/hw/display/virtio-gpu-pci.c
> > index 22659ca196b5..0b0d926a5b95 100644
> > --- a/hw/display/virtio-gpu-pci.c
> > +++ b/hw/display/virtio-gpu-pci.c
> > @@ -75,7 +75,8 @@ static const TypeInfo virtio_gpu_pci_base_info = {
> >      .parent = TYPE_VIRTIO_PCI,
> >      .instance_size = sizeof(VirtIOGPUPCIBase),
> >      .class_init = virtio_gpu_pci_base_class_init,
> > -    .abstract = true
> > +    .abstract = true,
> > +    .secure = true,
> 
> This is a base class, probably doesn't need marking.

Not /yet/.  I have a follow on series to this, not yet  posted,
which will enforce that all parent classes are marked secure,
when any leaf is marked secure.  There will be many more base
classes to add besides this one, which crept in here.


With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


