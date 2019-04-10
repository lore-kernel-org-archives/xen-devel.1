Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D35C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 16:25:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B3B420830
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 16:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B3B420830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEG2i-00006I-7O; Wed, 10 Apr 2019 16:25:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Da5p=SM=citrix.com=prvs=9966e4c82=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hEG2h-00004y-2l
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 16:25:43 +0000
X-Inumbo-ID: 47ceb7ee-5bad-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 47ceb7ee-5bad-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 16:25:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,334,1549929600"; d="scan'208";a="83247891"
Date: Wed, 10 Apr 2019 17:25:04 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190410162503.GI1435@perard.uk.xensource.com>
References: <20190104165755.73674a27.olaf@aepfle.de>
 <20190104174831.271161e5.olaf@aepfle.de>
 <20190107110737.1ef0a0ef.olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190107110737.1ef0a0ef.olaf@aepfle.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] status of non-live migration of HVM with libvirt
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410162504.uRGIF6dpgw7fszTw8kDh16AiXA99qFfYXvUN913nMVI@z>

T24gTW9uLCBKYW4gMDcsIDIwMTkgYXQgMTE6MDc6NDNBTSArMDEwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gRnJpLCA0IEphbiAyMDE5IDE3OjQ4OjMxICswMTAwCj4gc2NocmllYiBPbGFmIEhl
cmluZyA8b2xhZkBhZXBmbGUuZGU+Ogo+IAo+ID4gQW0gRnJpLCA0IEphbiAyMDE5IDE2OjU3OjU1
ICswMTAwCj4gPiBzY2hyaWViIE9sYWYgSGVyaW5nIDxvbGFmQGFlcGZsZS5kZT46Cj4gPiAKPiA+
ID4gd29ydGgga2VlcGluZyAoYW5kIGZpeGluZykgdGhlIGNvbmNlcHQgb2YgYW4gIm9mZmxpbmUg
bWlncmF0aW9uIiAgCj4gPiAKPiA+IEFuZCByZWdhcmRpbmcgdGhlIGZpeCwgaXQgbG9va3MgbGlr
ZSBxbXBfeGVuX3NhdmVfZGV2aWNlc19zdGF0ZSBkb2VzIG5vdCBuZWVkIHRoZSBjb25jZXB0IG9m
ICJsaXZlIi4gSnVzdCBzaHV0ZG93biB0aGUgYmxvY2tkZXZpY2VzIGFuZCBiZSBkb25lIHdpdGgg
aXQ/Cj4gCj4gQW50aG9ueSwgaXQgbG9va3MgbGlrZSA1ZDZjNTk5ZmUxICgibWlncmF0aW9uLCB4
ZW46IEZpeCBibG9jayBpbWFnZQo+IGxvY2sgaXNzdWUgb24gbGl2ZSBtaWdyYXRpb24iKSB3ZW50
IHRvbyBmYXIuIFdoeSBkb2VzIHN0b3BwaW5nIHRoZQo+IGRpc2tzIGF0IHRoZSB2ZXJ5IGVuZCBv
ZiB0aGUgc2F2ZS9taWdyYXRlIHByb2Nlc3MgZGVwZW5kIG9uICJsaXZlIj8KCkJlY2F1c2UgIlNu
YXBzaG90cyBkb24ndCBuZWVkIHRvIGluYWN0aXZhdGUgaW1hZ2VzIiwgc2VlOgpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTctMTAvbXNnMDI3
ODIuaHRtbAoKSSBoYWQgdG8gYWRkIHRoZSBgbGl2ZScgcGFyYW1ldGVyIHRvIGZpeCB0aGUgbG9j
ayBpc3N1ZS4KCj4gRHVyaW5nIGEgbWlncmF0aW9uIHRoZSBkaXNrcyBoYXZlIHRvIGJlIHJlbGVh
c2VkIGVpdGhlciB3YXkuIER1cmluZyAieGwgc2F2ZSIgdGhlIGRvbVUgbWF5IGNvbnRpbnVlIHRv
IHJ1biwgaWYgJy1jJyB3YXMgc3BlY2lmaWVkLiAKCnhsIHNhdmUgLWMgaXMgYSBzbmFwc2hvdCwg
cmlnaHQ/IFRoZXJlIGlzbid0IGEgc2Vjb25kIFFFTVUgcHJvY2VzcyB0aGF0CmlzIGdvaW5nIHRv
IHJlYWQvd3JpdGUgdGhlIHNhbWUgZGlzay4KCj4gSXQgc2VlbXMgdGhlICdsaXZlJyBwYXJhbWV0
ZXIgZm9yIHhlbi1zYXZlLWRldmljZXMtc3RhdGUgaXMgbm90IG5lZWRlZC4KPiAKPiBPbGFmCgoK
Ci0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
