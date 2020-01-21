Return-Path: <SRS0=mnwC=3K=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D8EC2D0CE
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jan 2020 09:36:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30E56217F4
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jan 2020 09:36:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LVWnG/Sp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30E56217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itpxO-00019P-PW; Tue, 21 Jan 2020 09:36:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zbT7=3K=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1itpxN-00019K-EA
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 09:36:21 +0000
X-Inumbo-ID: 76271b16-3c31-11ea-9fd7-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 76271b16-3c31-11ea-9fd7-bc764e2007e4;
 Tue, 21 Jan 2020 09:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579599371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v3ejH+F1snfAozezFNc5c7vdqT48VnQHGH9Shn1K2Eg=;
 b=LVWnG/SpCiRtSc9475W4iPe8VRyjNlklkbH4qnJOMQ/vMeWLpm7OkeqXxQYfo+djAN1E+2
 hyfbQTgYIPYrxYkS4dk63V9DM9tMrwpkkDjixelgKryKi2PhOOqIUD31xvA+KAfY4jaSWI
 X/FP7QHWomyJLB8tNHx4LGgtxtGvEMA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-WGhMKxUGM8qMmG1iPee1dQ-1; Tue, 21 Jan 2020 04:36:10 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98598108442D;
 Tue, 21 Jan 2020 09:36:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com
 [10.36.116.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68F515C545;
 Tue, 21 Jan 2020 09:36:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8E5D416E36; Tue, 21 Jan 2020 10:36:04 +0100 (CET)
Date: Tue, 21 Jan 2020 10:36:04 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20200121093604.ruclkfho5gmflasq@sirius.home.kraxel.org>
References: <20200120122051.25178-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200120122051.25178-1-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: WGhMKxUGM8qMmG1iPee1dQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 0/4] Use no_vblank property for drivers
 without VBLANK
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
Cc: david@lechnology.com, oleksandr_andrushchenko@epam.com, airlied@linux.ie,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 noralf@tronnes.org, laurent.pinchart@ideasonboard.com, daniel@ffwll.ch,
 xen-devel@lists.xenproject.org, sean@poorly.run, emil.velikov@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgMDE6MjA6NDdQTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSW5zdGVhZCBvZiBmYWtpbmcgVkJMQU5LIGV2ZW50cyBieSB0aGVtc2VsdmVz
LCBkcml2ZXJzIHdpdGhvdXQgVkJMQU5LCj4gc3VwcG9ydCBjYW4gZW5hYmxlIGRybV9jcnRjX3Zi
bGFuay5ub192YmxhbmsgYW5kIGxldCBEUk0gZG8gdGhlIHJlc3QuCj4gVGhlIHBhdGNoc2V0IG1h
a2VzIHRoaXMgb2ZmaWNpYWwgYW5kIGNvbnZlcnRzIG92ZXIgZHJpdmVycy4KPiAKPiBUaGUgY3Vy
cmVudCBpbXBsZW1lbnRhdGlvbiBsb29rcyBhdCB0aGUgbnVtYmVyIG9mIGluaXRpYWxpemVkIENS
VENzCj4gd3J0IHZibGFua2luZy4gSWYgdmJsYW5raW5nIGhhcyBiZWVuIGluaXRpYWxpemVkIGZv
ciBhIENSVEMsIHRoZSBkcml2ZXIKPiBpcyByZXNwb25zaWJsZSBmb3Igc2VuZGluZyBvdXQgVkJM
QU5LIGV2ZW50cy4gT3RoZXJ3aXNlLCBEUk0gd2lsbCBzZW5kCj4gb3V0IHRoZSBldmVudC4gVGhl
IGJlaGF2aW91ciBzZWxlY3RlZCBieSBpbml0aWFsaXppbmcgbm9fdmJsYW5rIGFzIHBhcnQKPiBv
ZiBkcm1fYXRvbWljX2hlbHBlcl9jaGVja19tb2Rlc2V0KCkuCj4gCj4gSSB3ZW50IHRocm91Z2gg
YWxsIGRyaXZlcnMsIGxvb2tpbmcgZm9yIHRob3NlIHRoYXQgY2FsbCBzZW5kIG91dCBWQkxBTksK
PiBldmVudHMgYnV0IGRvIG5vdCBjYWxsIGRybV92YmxhbmtfaW5pdCgpLiBUaGVzZSBhcmUgY29u
dmVydGVkIHRvIHRoZSBuZXcKPiBzZW1hbnRpY3MuIFRoaXMgYWZmZWN0cyB0aW55IGRyaXZlcnM7
IGRyaXZlcnMgZm9yIHZpcnR1YWwgaGFyZHdhcmU7IGFuZAo+IGEgZmV3IG90aGVycywgd2hpY2gg
ZG8gbm90IHN1cHBvcnQgaW50ZXJydXB0cy4gWGVuIGNvbWVzIHdpdGggaXRzCj4gb3duIFZCTEFO
SyBsb2dpYyBhbmQgZGlzYWJsZXMgbm9fdmJsYW5rIGV4cGxpY3RseS4KCkFja2VkLWJ5OiBHZXJk
IEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
