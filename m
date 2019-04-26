Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10023C43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 00:14:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFF22206BA
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 00:14:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="vbqmiCH4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFF22206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJoUn-00038V-4I; Fri, 26 Apr 2019 00:13:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jv+f=S4=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hJoUm-00038Q-03
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 00:13:40 +0000
X-Inumbo-ID: 237d3c04-67b8-11e9-8658-6f5a7d11dc3c
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 237d3c04-67b8-11e9-8658-6f5a7d11dc3c;
 Fri, 26 Apr 2019 00:13:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556237618; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=KI2SJUUCF2cmSmjv1R+B3OTPTFidE0ASofbbVJXReRY=;
 b=vbqmiCH4/t9rGG/vqCoWUSDu6a0By0B58YNmD/vKoaqJSjdgb07yCjLeeyaobBE5ghQj3k2k
 LUZNgiFXzkBYqSpfeP1NNqaCuwTnTCc3xBV77tgArErXqiY+hwdqQoGCR9pjwGztuo0rqSYX
 n8+YlBHos9jKARDhyOHJ08oncrQ=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mxa.mailgun.org with ESMTP id 5cc24d30.7fa79482c970-smtp-out-n01;
 Fri, 26 Apr 2019 00:13:36 -0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id j13so1458572wmh.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2019 17:13:36 -0700 (PDT)
X-Gm-Message-State: APjAAAUuE7CbLGdgLQg7G989j40e59xBXrLTKqXtngCV5Yf/5WT67yo3
 8QrRtRDrrrmo9V7Xvae+14RmBmaQlRwGqwzKGd0=
X-Google-Smtp-Source: APXvYqxih9B1dJr+ogo6tX+3KBKbY5A+Eg6ZSFouREbacGL62qhJtuL9rbZjQiJqH6rP3NM4Jlpwm9L6RTC76thyt9M=
X-Received: by 2002:a1c:43c2:: with SMTP id q185mr5545980wma.53.1556237614850; 
 Thu, 25 Apr 2019 17:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190425153252.14795-1-tamas@tklengyel.com>
 <20190425153252.14795-2-tamas@tklengyel.com>
 <ced3d7b5-e683-f17c-b068-2d372f59c498@citrix.com>
 <CABfawhn4eS2aB8+aZjo10ixmtzsOrSfugEz7ELMM9uMqC-6dSw@mail.gmail.com>
 <495a1395-06d4-2ce3-7216-1417ba41fe07@citrix.com>
In-Reply-To: <495a1395-06d4-2ce3-7216-1417ba41fe07@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 25 Apr 2019 18:12:58 -0600
X-Gmail-Original-Message-ID: <CABfawhm8KxHwY4PB8u-EBqw0K+G1Hv9S9iTC_RYaqOY15bxX4A@mail.gmail.com>
Message-ID:
 <CABfawhm8KxHwY4PB8u-EBqw0K+G1Hv9S9iTC_RYaqOY15bxX4A@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH 2/3] x86/mem_sharing: replace use of
 page_lock/unlock with our own lock
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426001258.ZQ8zBJzoscqxkNiFU8v0hwJM5G91TjEUeHrklaXO8eA@z>

T24gVGh1LCBBcHIgMjUsIDIwMTkgYXQgMjowMSBQTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDI1LzA0LzIwMTkgMjA6NTcsIFRhbWFzIEsg
TGVuZ3llbCB3cm90ZToKPiA+IE9uIFRodSwgQXByIDI1LCAyMDE5IGF0IDEyOjU4IFBNIEFuZHJl
dyBDb29wZXIKPiA+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPiA+PiBPbiAy
NS8wNC8yMDE5IDE2OjMyLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPj4+IGRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS9hc20teDg2L21tLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKPiA+
Pj4gaW5kZXggNmZhYTU2MzE2Ny4uNTk0ZGU2MTQ4ZiAxMDA2NDQKPiA+Pj4gLS0tIGEveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9tbS5oCj4gPj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAo+
ID4+PiBAQCAtMTMzLDcgKzEzMywxMCBAQCBzdHJ1Y3QgcGFnZV9pbmZvCj4gPj4+ICAgICAgICAg
ICAqIG9mIHNoYXJpbmcgc2hhcmUgdGhlIHZlcnNpb24gdGhleSBleHBlY3QgdG8uCj4gPj4+ICAg
ICAgICAgICAqIFRoaXMgbGlzdCBpcyBhbGxvY2F0ZWQgYW5kIGZyZWVkIHdoZW4gYSBwYWdlIGlz
IHNoYXJlZC91bnNoYXJlZC4KPiA+Pj4gICAgICAgICAgICovCj4gPj4+IC0gICAgICAgIHN0cnVj
dCBwYWdlX3NoYXJpbmdfaW5mbyAqc2hhcmluZzsKPiA+Pj4gKyAgICAgICAgc3RydWN0IHsKPiA+
Pj4gKyAgICAgICAgICAgIHN0cnVjdCBwYWdlX3NoYXJpbmdfaW5mbyAqaW5mbzsKPiA+Pj4gKyAg
ICAgICAgICAgIHJ3bG9ja190IGxvY2s7Cj4gPj4+ICsgICAgICAgIH0gc2hhcmluZzsKPiA+Pj4g
ICAgICB9Owo+ID4+Pgo+ID4+PiAgICAgIC8qIFJlZmVyZW5jZSBjb3VudCBhbmQgdmFyaW91cyBQ
R0NfeHh4IGZsYWdzIGFuZCBmaWVsZHMuICovCj4gPj4gSSdtIGFmcmFpZCB0aGlzIGlzIGEgbm8t
Z28sIGJ1dCBmb3Igc29tZSByZWFzb25zIHdoaWNoIGFyZSByYXRoZXIgbW9yZQo+ID4+IHN1YnRs
ZSB0aGF0IHRoZXkgYXBwZWFyIGhlcmUuCj4gPj4KPiA+PiBUaGVyZSBpcyBvbmUgc3RydWN0IHBh
Z2VfaW5mbyBwZXIgNGsgZnJhbWUsIGFuZCB5b3UndmUgYWRkZWQgYW4gZXh0cmEgMTYKPiA+PiBi
eXRlcywgdGFraW5nIGl0IGZyb20gMzIgYnl0ZXMgdG8gNDggYnl0ZXMuCj4gPj4KPiA+PiBPdGhl
ciB0aGFuIG1ha2luZyBpdCBhIG5vbi1wb3dlci1vZi0yIChuZXQgZGlmZnN0YXQgZ3Jvdy9zaHJp
bms6IDI1Ni8yNwo+ID4+IHVwL2Rvd246IDc3NTAvLTU2OTYgKDIwNTQpIGR1ZSB0byBsZXNzIGVm
ZmljaWVudCBhcml0aG1ldGljWzFdKSwgdGhlCj4gPj4gZnJhbXRhYmxlIGhhcyBhIGZpeGVkIHZp
cnR1YWwgc2l6ZSAoMTI4RyBieSBkZWZhdWx0KSwgc28geW91J3ZlIGVuZGVkIHVwCj4gPj4gZHJv
cHBpbmcgWGVuJ3MgbWVtb3J5IGxpbWl0ICgxNlRCIGJ5IGRlZmF1bHQpIGJ5IDEvMy4KPiA+IElu
dGVyZXN0aW5nLCBJJ20gbm90IHN1cmUgSSBjb21wbGV0ZWx5IGZvbGxvdyBidXQgZG9lcyB0aGlz
IG1lYW4gdGhhdAo+ID4gdGhpcyBzdHJ1Y3R1cmUgaXMgbm93IG5vdCBhbGxvd2VkIHRvIGdyb3cs
IGxpa2UgZXZlciwgb3IgdGhhdCBJIGp1c3QKPiA+IG5lZWQgdG8gYWRkIHBhZGRpbmcgdG8gZml4
IHVwIGl0cyBhbGlnbm1lbnQ/Cj4KPiBCYXNpY2FsbHksIGl0IG5lZWRzIGV4Y2VlZGluZ2x5IGdv
b2QgcmVhc29ucyB0byBncm93LiAgRXZlbiAic3VwcG9ydGluZwo+IG1vcmUgdGhhbiAxNlQgb2Yg
UkFNIiB3YXNuJ3QgYSBnb29kIGVub3VnaCByZWFzb24gdG8gZ3JvdyBpdCBmcm9tIDMyIHRvCj4g
NjQgYnl0ZXMsIHdoaWNoIGlzIHdoeSBDT05GSUdfQklHTUVNIGV4aXN0cyBhbmQgaXMgb2ZmIGJ5
IGRlZmF1bHQuCj4KPiBBdCB0aGUgbW9tZW50LCBJIGRvbid0IGhhdmUgYSBnb29kIHNvbHV0aW9u
IGZvciB5b3VyIHByb2JsZW0gdG8gc3VnZ2VzdC4KPgoKSSB3b3VsZCBiZSBPSyB3aXRoIHB1dHRp
bmcgdGhlIHdob2xlIHRoaW5nIGJlaGluZApDT05GSUdfSEFTX01FTV9TSEFSSU5HIGFuZCBoYXZp
bmcgdGhhdCBiZSBvZmYgYnkgZGVmYXVsdC4gSXMgdGhhdCBhCmZlYXNpYmxlIHJvdXRlIGZyb20g
eW91ciBQT1Y/CgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
