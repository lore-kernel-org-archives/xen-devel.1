Return-Path: <SRS0=/O7i=SW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F386C282E0
	for <xen-devel@archiver.kernel.org>; Sat, 20 Apr 2019 00:03:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D15FB2183F
	for <xen-devel@archiver.kernel.org>; Sat, 20 Apr 2019 00:03:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCittxan"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D15FB2183F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHdTD-0006Tk-KR; Sat, 20 Apr 2019 00:03:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lVJj=SW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hHdTC-0006Te-Ks
 for xen-devel@lists.xenproject.org; Sat, 20 Apr 2019 00:03:02 +0000
X-Inumbo-ID: a930dd4a-62ff-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a930dd4a-62ff-11e9-92d7-bc764e045a96;
 Sat, 20 Apr 2019 00:03:01 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A9D82183F;
 Sat, 20 Apr 2019 00:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555718580;
 bh=vqLUQ17roqOleqCNku/56jWbDqz0Um9YIQbiGqI7Y+4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=PCittxan496NLafGsoY0J2442BVg0GxPNNAm8Xsohk8kdOydNtqNlXML9+f7buOb7
 J7exK3E+GRs7ctISF9TiuQE+0l9VuoK+h17D66w0NM2XVNOn3Rsy8Rr8QgZ3b0n/oC
 MBV1Nyn0y2xWHiIKT2ml/AfQ8Ozs7t3RlgxTIlwA=
Date: Fri, 19 Apr 2019 17:02:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <Julien.Grall@arm.com>
In-Reply-To: <d3020727-f29c-5485-75a4-d96b3a9b0a92@arm.com>
Message-ID: <alpine.DEB.2.10.1904191632380.1370@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <1551222427-21749-1-git-send-email-sstabellini@kernel.org>
 <d3020727-f29c-5485-75a4-d96b3a9b0a92@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/6] xen: extend XEN_DOMCTL_memory_mapping
 to handle cacheability
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "JBeulich@suse.com" <JBeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190420000259.DsmmaB6l-sWPsJPoj_o19-mVpUt0a8gDEi7CAnyqO4M@z>

T24gVHVlLCAyNiBGZWIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDI2
LzAyLzIwMTkgMjM6MDcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IFJldXNlIHRoZSBl
eGlzdGluZyBwYWRkaW5nIGZpZWxkIHRvIHBhc3MgY2FjaGVhYmlsaXR5IGluZm9ybWF0aW9uIGFi
b3V0Cj4gPiB0aGUgbWVtb3J5IG1hcHBpbmcsIHNwZWNpZmljYWxseSwgd2hldGhlciB0aGUgbWVt
b3J5IHNob3VsZCBiZSBtYXBwZWQgYXMKPiA+IG5vcm1hbCBtZW1vcnkgb3IgYXMgZGV2aWNlIG1l
bW9yeSAodGhpcyBpcyB3aGF0IHdlIGhhdmUgdG9kYXkpLgo+ID4gCj4gPiBBZGQgYSBjYWNoZWFi
aWxpdHkgcGFyYW1ldGVyIHRvIG1hcF9tbWlvX3JlZ2lvbnMuIDAgbWVhbnMgZGV2aWNlCj4gPiBt
ZW1vcnksIHdoaWNoIGlzIHdoYXQgd2UgaGF2ZSB0b2RheS4KPiA+IAo+ID4gT24gQVJNLCBtYXAg
ZGV2aWNlIG1lbW9yeSBhcyBwMm1fbW1pb19kaXJlY3RfZGV2IChhcyBpdCBpcyBhbHJlYWR5IGRv
bmUKPiA+IHRvZGF5KSBhbmQgbm9ybWFsIG1lbW9yeSBhcyBwMm1fcmFtX3J3Lgo+ID4gCj4gPiBP
biB4ODYsIHJldHVybiBlcnJvciBpZiB0aGUgY2FjaGVhYmlsaXR5IHJlcXVlc3RlZCBpcyBub3Qg
ZGV2aWNlIG1lbW9yeS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzdGVmYW5vc0B4aWxpbnguY29tPgo+ID4gQ0M6IEpCZXVsaWNoQHN1c2UuY29tCj4gPiBDQzog
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbQo+ID4gLS0tCj4gPiAgIHhlbi9hcmNoL2FybS9naWMt
djIuYyAgICAgICAgICAgIHwgIDMgKystCj4gPiAgIHhlbi9hcmNoL2FybS9wMm0uYyAgICAgICAg
ICAgICAgIHwgMTkgKysrKysrKysrKysrKysrKystLQo+ID4gICB4ZW4vYXJjaC9hcm0vcGxhdGZv
cm1zL2V4eW5vczUuYyB8ICA0ICsrLS0KPiA+ICAgeGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9vbWFw
NS5jICAgfCAgOCArKysrLS0tLQo+ID4gICB4ZW4vYXJjaC9hcm0vdmdpYy12Mi5jICAgICAgICAg
ICB8ICAyICstCj4gPiAgIHhlbi9hcmNoL2FybS92Z2ljL3ZnaWMtdjIuYyAgICAgIHwgIDIgKy0K
PiA+ICAgeGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMgICAgfCAgNyArKysrKy0tCj4gPiAg
IHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyAgICAgICAgICAgIHwgIDYgKysrKystCj4gPiAgIHhlbi9j
b21tb24vZG9tY3RsLmMgICAgICAgICAgICAgIHwgIDggKysrKystLS0KPiA+ICAgeGVuL2RyaXZl
cnMvdnBjaS9oZWFkZXIuYyAgICAgICAgfCAgMyArKy0KPiA+ICAgeGVuL2luY2x1ZGUvcHVibGlj
L2RvbWN0bC5oICAgICAgfCAgNCArKystCj4gPiAgIHhlbi9pbmNsdWRlL3hlbi9wMm0tY29tbW9u
LmggICAgIHwgIDMgKystCj4gPiAgIDEyIGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyks
IDIwIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy12
Mi5jIGIveGVuL2FyY2gvYXJtL2dpYy12Mi5jCj4gPiBpbmRleCBlN2ViMDFmLi4xZWEzZGEyIDEw
MDY0NAo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2dpYy12Mi5jCj4gPiArKysgYi94ZW4vYXJjaC9h
cm0vZ2ljLXYyLmMKPiA+IEBAIC02OTAsNyArNjkwLDggQEAgc3RhdGljIGludCBnaWN2Ml9tYXBf
aHdkb3duX2V4dHJhX21hcHBpbmdzKHN0cnVjdCBkb21haW4gKmQpCj4gPiAgIAo+ID4gICAgICAg
ICAgIHJldCA9IG1hcF9tbWlvX3JlZ2lvbnMoZCwgZ2FkZHJfdG9fZ2ZuKHYybV9kYXRhLT5hZGRy
KSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBGTl9VUCh2Mm1fZGF0YS0+
c2l6ZSksCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1hZGRyX3RvX21mbih2
Mm1fZGF0YS0+YWRkcikpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYWRk
cl90b19tZm4odjJtX2RhdGEtPmFkZHIpLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBDQUNIRUFCSUxJVFlfREVWTUVNKTsKPiA+ICAgICAgICAgICBpZiAoIHJldCApCj4gPiAg
ICAgICAgICAgewo+ID4gICAgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiR0lDdjI6IE1h
cCB2Mm0gZnJhbWUgdG8gZCVkIGZhaWxlZC5cbiIsCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL3AybS5jIGIveGVuL2FyY2gvYXJtL3AybS5jCj4gPiBpbmRleCAzMGNmYjAxLi41YjhmY2M1
IDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL3AybS5jCj4gPiArKysgYi94ZW4vYXJjaC9h
cm0vcDJtLmMKPiA+IEBAIC0xMDY4LDkgKzEwNjgsMjQgQEAgaW50IHVubWFwX3JlZ2lvbnNfcDJt
dChzdHJ1Y3QgZG9tYWluICpkLAo+ID4gICBpbnQgbWFwX21taW9fcmVnaW9ucyhzdHJ1Y3QgZG9t
YWluICpkLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICBnZm5fdCBzdGFydF9nZm4sCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbnIsCj4gPiAtICAgICAgICAgICAg
ICAgICAgICAgbWZuX3QgbWZuKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIG1mbl90IG1mbiwK
PiA+ICsgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBjYWNoZV9wb2xpY3kpCj4gPiAgIHsK
PiA+IC0gICAgcmV0dXJuIHAybV9pbnNlcnRfbWFwcGluZyhkLCBzdGFydF9nZm4sIG5yLCBtZm4s
IHAybV9tbWlvX2RpcmVjdF9kZXYpOwo+ID4gKyAgICBwMm1fdHlwZV90IHQ7Cj4gPiArCj4gPiAr
ICAgIHN3aXRjaCAoIGNhY2hlX3BvbGljeSApCj4gPiArICAgIHsKPiA+ICsgICAgY2FzZSBDQUNI
RUFCSUxJVFlfTUVNT1JZOgo+ID4gKyAgICAgICAgdCA9IHAybV9yYW1fcnc7Cj4gCj4gUG90ZW50
aWFsbHksIHlvdSB3YW50IHRvIGNsZWFuIHRoZSBjYWNoZSBoZXJlLgoKV2UgaGF2ZSBiZWVuIHRh
bGtpbmcgYWJvdXQgdGhpcyBhbmQgSSBoYXZlIGJlZW4gbG9va2luZyB0aHJvdWdoIHRoZQpjb2Rl
LiBJIGFtIHN0aWxsIG5vdCBleGFjdGx5IHN1cmUgaG93IHRvIHByb2NlZWQuCgpJcyB0aGVyZSBh
IHJlYXNvbiB3aHkgY2FjaGVhYmxlIHJlc2VydmVkX21lbW9yeSBwYWdlcyBzaG91bGQgYmUgdHJl
YXRlZApkaWZmZXJlbnRseSBmcm9tIG5vcm1hbCBtZW1vcnksIGluIHJlZ2FyZHMgdG8gY2xlYW5p
bmcgdGhlIGNhY2hlPyBJdApzZWVtcyB0byBtZSB0aGF0IHRoZXkgc2hvdWxkIGJlIHRoZSBzYW1l
IGluIHRlcm1zIG9mIGNhY2hlIGlzc3Vlcz8KCklzIHRoZXJlIGEgcGxhY2Ugd2hlcmUgd2UgY2xl
YW4gdGhlIGRjYWNoZSBmb3Igbm9ybWFsIHBhZ2VzLCBvbmUgdGhhdCBpcwpub3QgdGllZCB0byBw
Mm0tPmNsZWFuX3B0ZSwgd2hpY2ggaXMgZGlmZmVyZW50IChpdCBpcyB0aGVyZSBmb3IgaW9tbXUK
cmVhc29ucyk/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
