From: Adrian Pop <apop@bitdefender.com>
Subject: Re: [PATCH] x86/altp2m: Add a subop for obtaining the
 mem access of a page
Date: Wed, 4 Jul 2018 16:20:15 +0300
Message-ID: <20180704132015.GA12259@hel>
References: <20180628130036.23241-1-apop@bitdefender.com>
 <5B36529202000078001CF466@prv1-mh.provo.novell.com>
 <20180704122045.GA3652@hel>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9iov=ju=bitdefender.com=apop@srs-us1.protection.inumbo.net>)
 id 1fahhh-0001B6-QE
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 13:20:17 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id D1A363086298
 for <xen-devel@lists.xenproject.org>; Wed,  4 Jul 2018 17:36:27 +0300 (EEST)
Received: from smtp01.buh.bitdefender.com (smtp.bitdefender.biz [10.17.80.75])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 003677FC89
 for <xen-devel@lists.xenproject.org>; Wed,  4 Jul 2018 16:20:15 +0300 (EEST)
Content-Disposition: inline
In-Reply-To: <20180704122045.GA3652@hel>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, tamas@tklengyel.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMDQsIDIwMTggYXQgMDM6MjA6NDVQTSArMDMwMCwgQWRyaWFuIFBPUCB3cm90
ZToKPiBPbiBGcmksIEp1biAyOSwgMjAxOCBhdCAwOTozODo1OEFNIC0wNjAwLCBKYW4gQmV1bGlj
aCB3cm90ZToKPiA+ID4gLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwo+ID4gPiAr
KysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jCj4gPiA+IEBAIC0zMiwxNyArMzIsMTAg
QEAKPiA+ID4gIAo+ID4gPiAgI2luY2x1ZGUgIm1tLWxvY2tzLmgiCj4gPiA+ICAKPiA+ID4gLS8q
Cj4gPiA+IC0gKiBHZXQgYWNjZXNzIHR5cGUgZm9yIGEgZ2ZuLgo+ID4gPiAtICogSWYgZ2ZuID09
IElOVkFMSURfR0ZOLCBnZXRzIHRoZSBkZWZhdWx0IGFjY2VzcyB0eXBlLgo+ID4gPiAtICovCj4g
PiA+IC1zdGF0aWMgaW50IF9wMm1fZ2V0X21lbV9hY2Nlc3Moc3RydWN0IHAybV9kb21haW4gKnAy
bSwgZ2ZuX3QgZ2ZuLAo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHhlbm1l
bV9hY2Nlc3NfdCAqYWNjZXNzKQo+ID4gPiArc3RhdGljIGludCBwMm1fYWNjZXNzX3RvX3hlbm1l
bV9hY2Nlc3Moc3RydWN0IHAybV9kb21haW4gKnAybSwKPiA+IAo+ID4gVGhpcyBpcyBub3QgZXZl
biBwMm0gY29kZSAtIHdoeSB0aGUgcDJtXyBwcmVmaXg/Cj4gCj4gVGhlcmUncyBpbmRlZWQgbm8g
cmVhc29uIGZvciB0aGlzIHRvIGhhdmUgdGhlIHAybV8gcHJlZml4LiAgV2lsbCByZW1vdmUKPiBp
dC4KCk9oIEkgcmVtZW1iZXIgbm93LiAgVGhlIHAybV8gcHJlZml4IHdhcyBhZGRlZCB0aGVyZSBi
ZWNhdXNlIHRoZSBoZWxwZXIKZnVuY3Rpb24gY29udmVydHMgYSBwMm1fYWNjZXNzX3QgdG8gYSB4
ZW5tZW1fYWNjZXNzX3QsIHNvCnAybV9hY2Nlc3NfdG9feGVubWVtX2FjY2VzcygpLiAgVG9vayB0
aGUgbmFtaW5nIGZyb20gdGhlIGNvbXBsZW1lbnRhcnkKZnVuY3Rpb24sIHhlbm1lbV9hY2Nlc3Nf
dG9fcDJtX2FjY2VzcygpLiAgSSBjb3VsZCBhZGQgYSBjb21tZW50IHRvCmNsYXJpZnkgdGhpcy4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
