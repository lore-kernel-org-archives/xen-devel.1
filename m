Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC76CA5FFC
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 09:37:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440651.1658059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDf83-0003Lr-DU; Mon, 05 Oct 2026 09:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440651.1658059; Mon, 05 Oct 2026 09:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDf83-0003Lk-9x; Mon, 05 Oct 2026 09:37:03 +0000
Received: by outflank-mailman (input) for mailman id 1440651;
 Mon, 05 Oct 2026 09:37:02 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1xDf82-0003Le-D7
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 09:37:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDf81-005VN3-1U
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 11:37:01 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6ac36fba-8faa-0a2a0a5109dd-0a2a4508d974-16
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 11:37:00 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6ac36fbb-f659-0a2a45080019-aa0a857c8863-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 11:37:00 +0200
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-664-NDcwWLWuP2eiW956REEg6Q-1; Mon,
 05 Oct 2026 05:36:56 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 961E61802140; Mon,  5 Oct 2026 09:36:54 +0000 (UTC)
Received: from redhat.com (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2144930000E4; Mon,  5 Oct 2026 09:36:51 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791193019;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=unMt6qLPTr1avyGPe2yQEJ/PPmJh/DMbiX+AetxVrf4=;
	b=AtzXtctx3CAPe/WWHzIol7bx8G/XR3EtlJkt/p5rAZNx3FUx1xOzlrsm0fdGRZjTMMLO1B
	aigV1QBnlz4zECrsx4WuDqk3OV3EWuFwnzIfX/ZkNWXzxbL8Ms4gc5BG4zO/YNYQmHqwDl
	C55B/s+FSbLo5JmCQ5EwNDmZVtD7pxc=
X-MC-Unique: NDcwWLWuP2eiW956REEg6Q-1
X-Mimecast-MFC-AGG-ID: NDcwWLWuP2eiW956REEg6Q_1791193014
Date: Mon, 5 Oct 2026 10:36:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 17/28] hw/display: mark bochs, cirrus, qxl, VGA, ramfb as
 secure
Message-ID: <asNvsf98nllmba8v@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-18-berrange@redhat.com>
 <179096166126.3025252.2006364005625327282.b4-review@b4>
MIME-Version: 1.0
In-Reply-To: <179096166126.3025252.2006364005625327282.b4-review@b4>
User-Agent: Mutt/2.4.2 (2026-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: -RxoKNRGurLtlK2cij4mfaie1Lz9qCQrBEQEYPA8w4A_1791193014
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-purgate-ID: tlsNG-c1860d/1791193020-DFCD387B-9869C12A/0/0
X-purgate-type: clean
X-purgate-size: 1309

On Fri, Oct 02, 2026 at 09:21:01PM +0400, marcandre.lureau@redhat.com wrote:
> > Most of the display adapters are emulating old hardware which is not
> > relevant to virtualization use cases.
> > 
> > The exceptions that should be considered secure are Cirrus (PCI, not
> > ISA), Bochs, QXL, RAMFB, VGA (PCI, MMIO, not ISA) and VMWare VGA.
> 
> I don't think we should support all those display devices as security boundaries.

Opps, this bit of the commit message was not quite right, as I did
NOT in fact include VMWare VGA.

The Cirrus & QXL is an area where my downstream wishlist conflicts
with my upstream wishlist, because both were widely used for a long
time in virt scenarios, and they still exist in supported RHEL
versions, even if gone from the latest releases.

> I would shorten the list to: bochs, ramfb, vga, and virtio-gpu*
> (excluding virgl & rutabaga). Anything else has been known to
> have various risks and is much higher complexity..

NB, anything virtio related is handled elsewhere in this series.a



With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


