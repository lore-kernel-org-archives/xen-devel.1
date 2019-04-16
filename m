Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D36C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 14:26:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6F3321773
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 14:26:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="Eevki0XZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6F3321773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGP2h-0004U1-LY; Tue, 16 Apr 2019 14:26:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zBlx=SS=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hGP2g-0004Tw-MR
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 14:26:34 +0000
X-Inumbo-ID: a0b3ee00-6053-11e9-b952-a3ec5e2f62ec
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0b3ee00-6053-11e9-b952-a3ec5e2f62ec;
 Tue, 16 Apr 2019 14:26:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1555424790; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=tISqkfLttshvYu3DlOwICDVW456KqaANNVIuHaqVyHo=;
 b=Eevki0XZuc3Z/8mK9lbBdSxptODZN5M9GvkuozxL3EHeflVwfedYfGxzAdlqvCzKZvt1ce9T
 k3X2cclMCgSfwGgPQ0vFcrP5Uqe7gu2xRCFA+QbpW+WPpsKuhszlUkZN2gpEQkcLR1yMxrw5
 dyI9loXz6HkIATK95Tha+X8JUXo=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mxa.mailgun.org with ESMTP id 5cb5e615.7f3b44526e70-smtp-out-n03;
 Tue, 16 Apr 2019 14:26:29 -0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 4so25652251wmf.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2019 07:26:29 -0700 (PDT)
X-Gm-Message-State: APjAAAX/LPjA8G6+cddcqIpV3e5VQBpP0FZKi5lRBZogN/1oSAgvix5/
 uv6VdK3fz3fnXRSB4ON6APfifbDcHqUcbMC/huw=
X-Google-Smtp-Source: APXvYqytZ1H5/kUdZrTfTY76AWltDNLukv3rmsducoPcpr/BrOjUaITT0gQ2dqCemEYF5hhMMu9jpvfzo2wPxyBtegw=
X-Received: by 2002:a1c:d7:: with SMTP id 206mr25813850wma.69.1555424788706;
 Tue, 16 Apr 2019 07:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190416084531.5084-1-aisaila@bitdefender.com>
 <CABfawhncF-r0ZYwd-V9D4UkpmqA22+kca5YTeuMVHm2A4xSCOg@mail.gmail.com>
 <55fc24f5-8f6e-08d5-3e9d-946de804d83b@citrix.com>
 <92ff12b3-259f-d0d2-8ec7-e1554f5e4190@citrix.com>
In-Reply-To: <92ff12b3-259f-d0d2-8ec7-e1554f5e4190@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 16 Apr 2019 08:25:52 -0600
X-Gmail-Original-Message-ID: <CABfawhniLgxxid8Kw7mhmoN9m4zSxdHd10CK+HvvtTDQyFdBVQ@mail.gmail.com>
Message-ID:
 <CABfawhniLgxxid8Kw7mhmoN9m4zSxdHd10CK+HvvtTDQyFdBVQ@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v5] x86/altp2m: Aggregate get entry and
 populate into common funcs
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
Cc: "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416142552.XWJivmSy8L00i5OmWPja-kYa_Bmw7TClyIL9lhylpTk@z>

T24gVHVlLCBBcHIgMTYsIDIwMTkgYXQgNzo1OCBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gNC8xNi8xOSAyOjUxIFBNLCBBbmRyZXcgQ29v
cGVyIHdyb3RlOgo+ID4gT24gMTYvMDQvMjAxOSAxNDo0NCwgVGFtYXMgSyBMZW5neWVsIHdyb3Rl
Ogo+ID4+Cj4gPj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oIGIveGVu
L2luY2x1ZGUvYXNtLXg4Ni9wMm0uaAo+ID4+PiBpbmRleCAyODAxYThjY2NhLi44ZGM0MzUzNjQ1
IDEwMDY0NAo+ID4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oCj4gPj4+ICsrKyBi
L3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgKPiA+Pj4gQEAgLTUxNCw2ICs1MTQsMjMgQEAgc3Rh
dGljIGlubGluZSB1bnNpZ25lZCBsb25nIG1mbl90b19nZm4oc3RydWN0IGRvbWFpbiAqZCwgbWZu
X3QgbWZuKQo+ID4+PiAgICAgICAgICByZXR1cm4gbWZuX3gobWZuKTsKPiA+Pj4gIH0KPiA+Pj4K
PiA+Pj4gK2ludCBhbHRwMm1fZ2V0X2VudHJ5KHN0cnVjdCBwMm1fZG9tYWluICphcDJtLCBnZm5f
dCBnZm4sIG1mbl90ICptZm4sCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICBwMm1fdHlwZV90
ICp0LCBwMm1fYWNjZXNzX3QgKmEsIGJvb2wgcHJlcG9wdWxhdGUpOwo+ID4+PiArCj4gPj4+ICtz
dGF0aWMgaW5saW5lIGludCBhbHRwMm1fZ2V0X2VudHJ5X2RpcmVjdChzdHJ1Y3QgcDJtX2RvbWFp
biAqYXAybSwKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGdmbl90IGdmbiwgbWZuX3QgKm1mbiwKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHAybV90eXBlX3QgKnQsIHAybV9hY2Nlc3NfdCAqYSkKPiA+Pj4gK3sK
PiA+Pj4gKyAgICByZXR1cm4gYWx0cDJtX2dldF9lbnRyeShhcDJtLCBnZm4sIG1mbiwgdCwgYSwg
ZmFsc2UpOwo+ID4+PiArfQo+ID4+PiArCj4gPj4+ICtzdGF0aWMgaW5saW5lIGludCBhbHRwMm1f
Z2V0X2VudHJ5X3ByZXBvcHVsYXRlKHN0cnVjdCBwMm1fZG9tYWluICphcDJtLAo+ID4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnZm5fdCBnZm4sIG1m
bl90ICptZm4sCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHAybV90eXBlX3QgKnQsIHAybV9hY2Nlc3NfdCAqYSkKPiA+Pj4gK3sKPiA+Pj4gKyAg
ICByZXR1cm4gYWx0cDJtX2dldF9lbnRyeShhcDJtLCBnZm4sIG1mbiwgdCwgYSwgdHJ1ZSk7Cj4g
Pj4+ICt9Cj4gPj4gQXJlIHRoZXNlIHdyYXBwZXJzIHJlYWxseSByZXF1aXJlZD8gSSBkb24ndCB0
aGluayB0aGV5IGFkZCBhbnl0aGluZyB0bwo+ID4+IHJlYWRhYmlsaXR5LCBpdCdzIGp1c3QgeWV0
IGFub3RoZXIgbGF5ZXIgdGhhdCBkb2VzIGFsbW9zdCBub3RoaW5nLgo+ID4KPiA+IEZyb20gYSBy
ZWFkYWJpbGl0eSBwb2ludCBvZiB2aWV3LCBib29sZWFuIHBhcmFtZXRlcnMgYXJlIGFib3V0IGFz
IG9wYXF1ZQo+ID4gYXMgdGhleSBjb21lLiAgVGhlIHNhbWUgZ29lcyBmb3IgYWxsIG90aGVyIHNj
YWxhciBwYXJhbWV0ZXJzIHdoaWNoIGRvbid0Cj4gPiBoYXZlIGEgbW5lbW9uaWMuCj4gPgo+ID4g
Rm9yIHNvbWVvbmUgd2hvIGlzIG5vdCBhbiBleHBlcnQgb2YgdGhlIGludHJpY2FjaWVzIG9mIHRo
ZSBzdWJzeXN0ZW0sCj4gPiBoYXZpbmcgdGhlIG9wdGlvbnMgc3BlbHQgb3V0IGluIHdyYXBwZXJz
IGxpa2UgdGhpcyBpcyBleHRyZW1lbHkgaGVscGZ1bAo+ID4gdG8gcmVkdWNlIHRoZSBjb2duaXRp
dmUgbG9hZCBvZiB0cnlpbmcgdG8gZm9sbG93IHRoZSBjb2RlLgo+Cj4gVGhpcyBpcyBleGFjdGx5
IHdoeSBJIGRpZCBpdCB0aGlzIHdheS4KPgo+IFRoZSBvdGhlciBwYXR0ZXJuIEkgdGhpbmsgaXMg
dG9sZXJhYmxlIGlzIGhhdmluZyBhICNkZWZpbmUgdG8gdXNlIGFzIGFuCj4gYXJndW1lbnQ7IGZv
ciBleGFtcGxlOgo+Cj4gI2RlZmluZSBBUDJNR0VUX3ByZXBvcHVsYXRlIHRydWUKPiAjZGVmaW5l
IEFQMk1HRVRfcGVlayAgICAgICAgZmFsc2UKPgo+IFRoZW4geW91IGdldDoKPgo+ICAgbWZuID0g
YWx0cDJtX2dldF9lbnRyeSguLi4sIEFQMk1HRVRfcHJlcG9wdWxhdGUpOwo+Cj4gQnV0IHRoZW4g
eW91IHJ1biBpbnRvIG5hbWVzcGFjaW5nIGlzc3VlcyB3aXRoIHRoZSBwcmVmaXhlcy4KPgo+IEkg
d291bGRuJ3Qgb2JqZWN0IHRvIGRvaW5nIGl0IHRoZSBhYm92ZSB3YXksIGJ1dCBJIHRoaW5rIHRo
ZSB3cmFwcGVycyBpcwo+IHByb2JhYmx5IHNpbXBsZXIgYW5kIGNsZWFyZXIgZm9yIHRoaXMgY2Fz
ZS4gIEkgZG8gb2JqZWN0IHRvIHBhc3NpbmcgaW4KPiBuYWtlZCBib29sZWFucy4KCkZhaXIgZW5v
dWdoLiBJIHBlcnNvbmFsbHkgcHJlZmVyIHRoZSAjZGVmaW5lIHJvdXRlIHRob3VnaCwgaXQganVz
dAphdm9pZHMgY3JlYXRpbmcgbGFzYWduYSBjb2RlLiBXaXRoIHdyYXBwZXJzIGJ5IHRoZSB0aW1l
IEkgZGlnIHRocm91Z2gKdGhlbSB0cnlpbmcgdG8gZmlndXJlIG91dCB3aGVyZSB0aGV5IGFjdHVh
bGx5IGxhbmQgSSB0ZW5kIHRvIGZvcmdldAp3aHkgSSB3YXMgbG9va2luZyBmb3IgaXQgaW4gdGhl
IGZpcnN0IHBsYWNlLiBQZXJoYXBzIHRoYXQncyBqdXN0IG1lLi4KClRhbWFzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
