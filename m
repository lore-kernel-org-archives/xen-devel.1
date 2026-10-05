Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30CECA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 09:39:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440657.1658066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDfA8-00044e-QG; Mon, 05 Oct 2026 09:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440657.1658066; Mon, 05 Oct 2026 09:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDfA8-00044X-NT; Mon, 05 Oct 2026 09:39:12 +0000
Received: by outflank-mailman (input) for mailman id 1440657;
 Mon, 05 Oct 2026 09:39:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1xDfA7-00044M-CD
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 09:39:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDfA6-006m8r-7B
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 11:39:10 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6ac3703b-8faa-0a2a0a5109dd-0a2a4507c638-6
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 11:39:09 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6ac3703c-b4ea-0a2a45070019-aa0a857cd47b-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 11:39:09 +0200
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-574-eIPyz1uXNNe0JUYtKo6Ylw-1; Mon,
 05 Oct 2026 05:39:07 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BFAF519539BA; Mon,  5 Oct 2026 09:39:05 +0000 (UTC)
Received: from redhat.com (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CA95C30000E4; Mon,  5 Oct 2026 09:39:03 +0000 (UTC)
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
	s=mimecast20190719; t=1791193148;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=XTD33Ze437RIyD1HN/Z7Ka/Uk5oV0YYG4eEC0r6aeQc=;
	b=NmD8RtJjATHT8up/yn6n6Hclh72gqQalC60Fis1TT0R/aZXIjvrUxKzEi9zCR9mfUuroMk
	KqDJScO2Ad7woEZGH+E1HTavaf4XlPamunIiZkI+0Q33kx1RnIwv9tz69TsCeZVIPLW1wh
	XXd8i4xEGU3rJRdj0ZW7nvFqM3HsZtA=
X-MC-Unique: eIPyz1uXNNe0JUYtKo6Ylw-1
X-Mimecast-MFC-AGG-ID: eIPyz1uXNNe0JUYtKo6Ylw_1791193146
Date: Mon, 5 Oct 2026 10:39:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 10/28] hw/usb: mark commonly used USB devices/hosts as
 secure
Message-ID: <asNwNM5DgooeSn27@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-11-berrange@redhat.com>
 <179096166117.3025252.2297105460212965387.b4-review@b4>
MIME-Version: 1.0
In-Reply-To: <179096166117.3025252.2297105460212965387.b4-review@b4>
User-Agent: Mutt/2.4.2 (2026-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: kQ0pJsUGUiOpfTZlIsMdvg0saiG40zMLq3gpUmMoy4k_1791193146
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-purgate-ID: tlsNG-ef75cf/1791193149-376D2AE4-310E3B9B/0/0
X-purgate-type: clean
X-purgate-size: 1045

On Fri, Oct 02, 2026 at 09:21:01PM +0400, marcandre.lureau@redhat.com wrote:
> > Most of the standardized  USB1/2/3 host controllers are relevant
> > for virtualization use cases, so should be declared secure. The
> > "NEC" XHCI variant is slightly non-standard, but since it is a
> > trivial sub-class of the generic XHCI, there's no reason to
> > exclude it.
> > 
> > The set of devices that are expected to be used is HID (mouse,
> > tablet, keyboard), host passthrough, CCID (smartcard), hub,
> > storage and the redirect tunnelling.
> 
> Can't we exclude uhci/ehci nowadays?

RHEL-10 still ships both, so there's still a demand from a downstream
POV, but USB is in an awkward place with its lack of maintainership,
and arguably these should be considered obsolete.


With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


