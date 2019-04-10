Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C26C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 16:01:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F071A206DF
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 16:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F071A206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEFeV-0006Sk-Ax; Wed, 10 Apr 2019 16:00:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEFeU-0006Sb-PW
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 16:00:42 +0000
X-Inumbo-ID: c23b1595-5ba9-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c23b1595-5ba9-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 16:00:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83244059"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23726.4853.466227.501439@mariner.uk.xensource.com>
Date: Wed, 10 Apr 2019 16:59:49 +0100
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
In-Reply-To: <76415ebc-6540-4ea0-d1f4-023a6763cba2@citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
 <20190410142408.22848-56-ian.jackson@eu.citrix.com>
 <76415ebc-6540-4ea0-d1f4-023a6763cba2@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [OSSTEST PATCH 55/62] make-flight: shadow test:
 Disable kpti in guests
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410155949.XAp5-IKurVjf7BPwjRjbtRoZSX0mwQniEeFBGH1dI58@z>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW09TU1RFU1QgUEFUQ0ggNTUvNjJdIG1ha2UtZmxp
Z2h0OiBzaGFkb3cgdGVzdDogRGlzYWJsZSBrcHRpIGluIGd1ZXN0cyIpOgo+IE9uIDEwLzA0LzIw
MTkgMTU6MjQsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gU2luY2UgU3BlY3RyZS9NZWx0ZG93biwg
c2hhZG93IGhhcyBiZWVuIGEgbG90IHNsb3dlciwgZXNwZWNpYWxseSB3aXRoCj4gPiBLUFRJIGlu
IHRoZSBndWVzdC4gIEVtcGlyaWNhbGx5LCB0b28gc2xvdyAod2l0aCB0aGUga2VybmVsIGZyb20g
RGViaWFuCj4gPiBzdHJldGNoKS4KPiAKPiBUaGUgc3BlZWQgb2Ygc2hhZG93IHBhZ2V0YWJsZXMg
aGFzbid0IGNoYW5nZWQgLSBJIGRvbid0IHRoaW5rIHdlIGV2ZW4KPiB0b3VjaGVkIHRoZSBzaGFk
b3cgY29kZSBhdCBhbGwgZm9yIFhTQS0yNTQuCj4gCj4gVGhlIHByb2JsZW0gaXMgdGhlIGNoYW5n
ZSBpbiBndWVzdCBiZWhhdmlvdXIgYXMgYSBjb25zZXF1ZW5jZSBvZiBuZWVkaW5nCj4gS1BUSSBm
b3IgYSBNZWx0ZG93biBtaXRpZ2F0aW9uLgo+IAo+IFRoZSBndWVzdCBub3cgZmx1c2hlcyBpdHMg
cGFnZXRhYmxlcyBvbiBldmVyeQo+IHN5c2NhbGwvaW50ZXJydXB0L2V4Y2VwdGlvbiByYXRoZXIg
dGhhbiBvbmNlIG9uIGEgcHJvY2Vzcz0+cHJvY2Vzcwo+IGNvbnRleHQgc3dpdGNoLCB3aGljaCBp
cyB3aHkgcnVubmluZyBhIGd1ZXN0IHVzaW5nIEtQVEkgaW4gc2hhZG93IG1vZGUKPiBpcyBib2Fy
ZGVybGluZSB1bnVzYWJsZS4KPiAKPiBUaGUgYWN0dWFsIGNoYW5nZSB0byB1c2Ugbm9wdGkgbG9v
a3MgZmluZS4KClRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLiAgVW5mb3J0dW5hdGVseSBmb3Ig
dGhlIHJlYXNvbnMgSSd2ZQpleHBsYWluZWQgSSB3b24ndCBjaGFuZ2UgdGhlIGNvbW1pdCBtZXNz
YWdlIGJlY2F1c2UgdGhhdCB3b3VsZCBpbnZvbHZlCnJld3JpdGluZyB0aGUgY29tbWl0LCBidXQg
aXQgaXMgdXNlZnVsIHRvIGhhdmUgdGhpcyBjb3JyZWN0aW9uIGluIHRoZQphcmNoaXZlcy4KClJl
Z2FyZHMsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
