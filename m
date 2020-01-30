Return-Path: <SRS0=pEfl=3T=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA5AC2D0DB
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jan 2020 16:51:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF16020661
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jan 2020 16:51:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dUgaosEo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF16020661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixD2B-0001uq-Lf; Thu, 30 Jan 2020 16:51:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g8om=3T=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1ixD2A-0001uj-1v
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 16:51:14 +0000
X-Inumbo-ID: b8c8ef20-4380-11ea-b211-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b8c8ef20-4380-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 16:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580403072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nz6HePjNQp6rCqGWZUzhSMOBg9IwDDzcsesnJJ/nZYU=;
 b=dUgaosEo/hEvFO739uoOx5ZJnrCKz8QbURYC00MSmhiwL5NA1G619jObQCcRo5ngLonCCQ
 y2/LM5uRUzHJeamyE/zyM4geZrVeSHQ1Le9SAeZ6IZBb4Evgq1DQStiCnfJK3DCZDuCMFg
 gCOFRaylpsVeRYeR+OYRWIpEC9kw9fs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-EX0pY2qBPfWuIxWn8RuwIQ-1; Thu, 30 Jan 2020 11:51:07 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4D7C8010F6;
 Thu, 30 Jan 2020 16:51:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-131.ams2.redhat.com
 [10.36.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA20087B30;
 Thu, 30 Jan 2020 16:50:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6D2B81138404; Thu, 30 Jan 2020 17:50:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20200110194158.14190-1-vsementsov@virtuozzo.com>
 <95d4bf85-b52d-b076-e1fe-8237a28c9d25@virtuozzo.com>
Date: Thu, 30 Jan 2020 17:50:54 +0100
In-Reply-To: <95d4bf85-b52d-b076-e1fe-8237a28c9d25@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 30 Jan 2020 15:36:55 +0300")
Message-ID: <87d0b0nb0x.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: EX0pY2qBPfWuIxWn8RuwIQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH v6 00/11] error: auto propagated local_err
 part I
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3
cml0ZXM6Cgo+IE1hcmt1cywgd2hhdCBhYm91dCB0aGlzPyBTaG91bGQgSSByZXNwaW4/CgpJIHN0
aWxsIGhhdmVuJ3QgbG9va2VkIGF0IHRoaXMsIG11c3QgYmUgZnJ1c3RyYXRpbmcgZm9yIHlvdSwg
c29ycnkhCkkndmUgYmVlbiB1bmRlciB3YXRlciBldmVyIHNpbmNlIG15IENocmlzdG1hcyB2YWNh
dGlvbi4uLiAgSWYgeW91IHJhdGhlcgp3YW50IG1lIHRvIGxvb2sgYXQgYSB2NyB0aGF0IGFkZHJl
c3NlcyB0aGUgcmV2aWV3IGNvbW1lbnRzIGZyb20gb3RoZXJzLAp0aGVuIGdvIGFoZWFkIGFuZCBy
ZXNwaW4uCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
