Return-Path: <SRS0=oX/+=76=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9BBC433E0
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jun 2020 12:26:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F5E120CC7
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jun 2020 12:26:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FfTPbND0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F5E120CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlX8s-0006ry-Ko; Wed, 17 Jun 2020 12:26:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UiE7=76=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1jlX8r-0006rt-58
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 12:26:09 +0000
X-Inumbo-ID: b8a0e804-b095-11ea-b7bb-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b8a0e804-b095-11ea-b7bb-bc764e2007e4;
 Wed, 17 Jun 2020 12:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592396768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i7Fhq/nMTPV4L9BtCZvLvgrxeMBQxohyRbXdk/P9aBA=;
 b=FfTPbND0+3jKZBT/Ko254KUxPHfWfNfIukIG2OMwjxQpun40O4XLHLV6IjxP9lh7v+X9Mf
 sDRgD8sGkQIc2ViTd8sToWPV47eKHrjlJIJG0Hz/ylqBkpQvAimoyS742W4/6N1LGpF4Uc
 /oDYRiO3jfapYqMuLWPhiapgyXuK91Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-EzyBSljVMdCehpHK2qf3Dw-1; Wed, 17 Jun 2020 08:26:06 -0400
X-MC-Unique: EzyBSljVMdCehpHK2qf3Dw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14EED8CE68E;
 Wed, 17 Jun 2020 12:25:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EDC279332;
 Wed, 17 Jun 2020 12:25:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 025DE16E16; Wed, 17 Jun 2020 14:25:23 +0200 (CEST)
Date: Wed, 17 Jun 2020 14:25:22 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/4] microvm: memory config tweaks
Message-ID: <20200617122522.wvkpkifysdpixzml@sirius.home.kraxel.org>
References: <20200529073957.8018-1-kraxel@redhat.com>
 <20200608132507.snzujn4yb37z3xmj@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20200608132507.snzujn4yb37z3xmj@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 imammedo@redhat.com, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 08, 2020 at 03:25:07PM +0200, Gerd Hoffmann wrote:

> Ping.  Anyone going to pick this up?  MAINTAINERS lists Sergio+Paolo ...
> Or should I send a pull req myself?

Hmm, no reply.  I guess that means "send a pull req" ...

take care,
  Gerd


