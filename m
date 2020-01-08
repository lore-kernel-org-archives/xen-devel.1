Return-Path: <SRS0=xJ9Z=25=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D587C282DD
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jan 2020 15:24:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC4B920720
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jan 2020 15:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC4B920720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipDC2-0004t1-JG; Wed, 08 Jan 2020 15:24:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8VWb=25=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1ipDC1-0004sK-J9
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 15:24:21 +0000
X-Inumbo-ID: e50fe5c8-322a-11ea-b1f0-bc764e2007e4
Received: from Galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e50fe5c8-322a-11ea-b1f0-bc764e2007e4;
 Wed, 08 Jan 2020 15:24:00 +0000 (UTC)
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1ipDB8-0001aV-Vt; Wed, 08 Jan 2020 16:23:27 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id C48DA1060B2; Wed,  8 Jan 2020 16:23:25 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Anchal Agarwal <anchalag@amazon.com>, mingo@redhat.com, bp@alien8.de,
 hpa@zytor.com, x86@kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 linux-pm@vger.kernel.org, linux-mm@kvack.org, kamatam@amazon.com,
 sstabellini@kernel.org, konrad.wilk@oracle.co, roger.pau@citrix.com,
 axboe@kernel.dk, davem@davemloft.net, rjw@rjwysocki.net, len.brown@intel.com,
 pavel@ucw.cz, peterz@infradead.org, eduval@amazon.com, sblbir@amazon.com,
 anchalag@amazon.com, xen-devel@lists.xenproject.org, vkuznets@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, dwmw@amazon.co.uk,
 fllinden@amaozn.com
In-Reply-To: <20200107234420.GA18738@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <20200107234420.GA18738@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
Date: Wed, 08 Jan 2020 16:23:25 +0100
Message-ID: <877e22ezv6.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
Subject: Re: [Xen-devel] [RFC PATCH V2 09/11] xen: Clear IRQD_IRQ_STARTED
 flag during shutdown PIRQs
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
Cc: anchalag@amazon.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5jaGFsIEFnYXJ3YWwgPGFuY2hhbGFnQGFtYXpvbi5jb20+IHdyaXRlczoKCj4gc2h1dGRvd25f
cGlycSBpcyBpbnZva2VkIGR1cmluZyBoaWJlcm5hdGlvbiBwYXRoIGFuZCBoZW5jZQo+IFBJUlFz
IHNob3VsZCBiZSByZXN0YXJ0ZWQgZHVyaW5nIHJlc3VtZS4KPiBCZWZvcmUgdGhpcyBjb21taXQn
MDIwZGI5ZDNjMWRjMGEnIHhlbi9ldmVudHM6IEZpeCBpbnRlcnJ1cHQgbG9zdAo+IGR1cmluZyBp
cnFfZGlzYWJsZSBhbmQgaXJxX2VuYWJsZSBzdGFydHVwX3BpcnEgd2FzIGF1dG9tYXRpY2FsbHkK
PiBjYWxsZWQgZHVyaW5nIGlycV9lbmFibGUgaG93ZXZlciwgYWZ0ZXIgdGhpcyBjb21taXQgcGly
cSdzIGRpZCBub3QKPiBnZXQgZXhwbGljaXRseSBzdGFydGVkIG9uY2UgcmVzdW1lZCBmcm9tIGhp
YmVybmF0aW9uLgo+Cj4gY2hpcC0+aXJxX3N0YXJ0dXAgaXMgY2FsbGVkIG9ubHkgaWYgSVJRRF9J
UlFfU1RBUlRFRCBpcyB1bnNldCBkdXJpbmcKPiBpcnFfc3RhcnR1cCBvbiByZXN1bWUuIFRoaXMg
ZmxhZyBnZXRzIGNsZWFyZWQgYnkgZnJlZV9pcnEtPmlycV9zaHV0ZG93bgo+IGR1cmluZyBzdXNw
ZW5kLiBmcmVlX2lycSgpIG5ldmVyIGdldHMgZXhwbGljaXRseSBjYWxsZWQgZm9yIGlvYXBpYy1l
ZGdlCj4gYW5kIGlvYXBpYy1sZXZlbCBpbnRlcnJ1cHRzIGFzIHJlc3BlY3RpdmUgZHJpdmVycyBk
byBub3RoaW5nIGR1cmluZwo+IHN1c3BlbmQvcmVzdW1lLiBTbyB3ZSBzaHV0IHRoZW0gZG93biBl
eHBsaWNpdGx5IGluIHRoZSBmaXJzdCBwbGFjZSBpbgo+IHN5c2NvcmVfc3VzcGVuZCBwYXRoIHRv
IGNsZWFyIElSUTw+ZXZlbnQgY2hhbm5lbCBtYXBwaW5nLiBzaHV0ZG93bl9waXJxCj4gYmVpbmcg
Y2FsbGVkIGV4cGxpY2l0bHkgZHVyaW5nIHN1c3BlbmQgZG9lcyBub3QgY2xlYXIgdGhpcyBmbGFn
cywgaGVuY2UKPiAuaXJxX2VuYWJsZSBpcyBjYWxsZWQgaW4gaXJxX3N0YXJ0dXAgZHVyaW5nIHJl
c3VtZSBpbnN0ZWFkIGFuZCBwaXJxJ3MKPiBuZXZlciBzdGFydCB1cC4KCldoYXQ/IAoKPiArdm9p
ZCBpcnFfc3RhdGVfY2xyX3N0YXJ0ZWQoc3RydWN0IGlycV9kZXNjICpkZXNjKQo+ICB7Cj4gIAlp
cnFkX2NsZWFyKCZkZXNjLT5pcnFfZGF0YSwgSVJRRF9JUlFfU1RBUlRFRCk7Cj4gIH0KPiArRVhQ
T1JUX1NZTUJPTF9HUEwoaXJxX3N0YXRlX2Nscl9zdGFydGVkKTsKClRoaXMgaXMgY29yZSBpbnRl
cm5hbCBzdGF0ZSBhbmQgbm90IHN1cHBvc2VkIHRvIGJlIGZpZGRsZWQgd2l0aCBieQpkcml2ZXJz
LgoKaXJxX2NoaXAgaGFzIGlycV9zdXNwZW5kL3Jlc3VtZS9wbV9zaHV0ZG93biBjYWxsYmFja3Mg
Zm9yIGEgcmVhc29uLgoKVGhhbmtzLAoKICAgICAgIHRnbHgKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
