From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v7 04/15] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Thu, 31 Jan 2019 17:05:19 +0100
Message-ID: <20190131160519.l4h75wgctcqkdyx6@mac>
References: <1548908900-1128-1-git-send-email-christopher.w.clark@gmail.com>
 <1548908900-1128-5-git-send-email-christopher.w.clark@gmail.com>
 <20190131144914.qfoyz2uu4prpkpbo@mac>
 <5C5310970200007800212D5A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KPPl=QH=citrix.com=prvs=927f2c6f3=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gpF4I-0006LF-P1
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 16:19:58 +0000
Content-Disposition: inline
In-Reply-To: <5C5310970200007800212D5A@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMzEsIDIwMTkgYXQgMDg6MTM6MjdBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDMxLjAxLjE5IGF0IDE1OjQ5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gV2VkLCBKYW4gMzAsIDIwMTkgYXQgMDg6Mjg6MDlQTSAtMDgwMCwgQ2hyaXN0
b3BoZXIgQ2xhcmsgd3JvdGU6Cj4gPj4gK3N0YXRpYyBzdHJ1Y3QgYXJnb19yaW5nX2luZm8gKgo+
ID4+ICtmaW5kX3JpbmdfaW5mbyhjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCBjb25zdCBzdHJ1Y3Qg
YXJnb19yaW5nX2lkICppZCkKPiA+PiArewo+ID4+ICsgICAgc3RydWN0IGFyZ29fcmluZ19pbmZv
ICpyaW5nX2luZm87Cj4gPj4gKyAgICBjb25zdCBzdHJ1Y3QgbGlzdF9oZWFkICpidWNrZXQ7Cj4g
Pj4gKwo+ID4+ICsgICAgQVNTRVJUKExPQ0tJTkdfUmVhZF9yaW5nc19MMihkKSk7Cj4gPj4gKwo+
ID4+ICsgICAgLyogTGlzdCBpcyBub3QgbW9kaWZpZWQgaGVyZS4gU2VhcmNoIGFuZCByZXR1cm4g
dGhlIG1hdGNoIGlmIGZvdW5kLiAqLwo+ID4+ICsgICAgYnVja2V0ID0gJmQtPmFyZ28tPnJpbmdf
aGFzaFtoYXNoX2luZGV4KGlkKV07Cj4gPj4gKwo+ID4+ICsgICAgbGlzdF9mb3JfZWFjaF9lbnRy
eShyaW5nX2luZm8sIGJ1Y2tldCwgbm9kZSkKPiA+IAo+ID4gSSdtIG5vdCBzdXJlIHdoYXQncyB0
aGUgcG9saWN5IHJlZ2FyZGluZyBsaXN0XyBtYWNyb3MsIHNob3VsZCBzcGFjZXMKPiA+IGJlIGFk
ZGVkIGJldHdlZW4gdGhlIHBhcmVudGhlc2VzPwo+ID4gCj4gPiBsaXN0X2Zvcl9lYWNoX2VudHJ5
ICggcmluZ19pbmZvLCBidWNrZXQsIG5vZGUgKQo+ID4gCj4gPiBJIGRvbid0IGhhdmUgYSBzdHJv
bmcgb3BpbmlvbiBlaXRoZXIgd2F5Lgo+IAo+IFdlIHVzZSBhIG1peCwgYmVjYXVzZSBpdCdzIG5v
dCByZWFsbHkgY2xlYXIgd2hldGhlciB0byBjb25zaWRlciBzdWNoCj4gImtpbmQtb2Yta2V5d29y
ZHMiLgo+IAo+ID4+ICtzdGF0aWMgdm9pZAo+ID4+ICtwZW5kaW5nX3JlbW92ZV9hbGwoY29uc3Qg
c3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGFyZ29fcmluZ19pbmZvICpyaW5nX2luZm8pCj4gPj4g
K3sKPiA+PiArICAgIHN0cnVjdCBwZW5kaW5nX2VudCAqZW50LCAqbmV4dDsKPiA+PiArCj4gPj4g
KyAgICBBU1NFUlQoTE9DS0lOR19MMyhkLCByaW5nX2luZm8pKTsKPiA+PiArCj4gPj4gKyAgICAv
KiBEZWxldGUgYWxsIHBlbmRpbmcgbm90aWZpY2F0aW9ucyBmcm9tIHRoaXMgcmluZydzIGxpc3Qu
ICovCj4gPj4gKyAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoZW50LCBuZXh0LCAmcmluZ19p
bmZvLT5wZW5kaW5nLCBub2RlKQo+ID4gCj4gPiBsaXN0X2ZpcnN0X2VudHJ5X29yX251bGwgYW5k
IHlvdSBjYW4gZ2V0IHJpZCBvZiBuZXh0Lgo+IAo+IFdlbGwsIHRoYXQncyBhIHN1YnN0aXR1dGlv
biBJIHdvdWxkbid0IGxpa2UgdG8gZG8gd2hpbGUgY29tbWl0dGluZywKPiBhcyBpdCBtZWFucyBk
b2luZyBhIGxpdHRsZSBtb3JlIHRoYW4gYSBzaW1wbGUgdGV4dCByZXBsYWNlbWVudC4KCkZyb20g
YSBmdW5jdGlvbmFsaXR5IFBvViB0aGUgY29kZSBkb2VzIGV4YWN0bHkgdGhlIHNhbWUsIEkganVz
dCB0aGluawpsaXN0X2ZpcnN0X2VudHJ5X29yX251bGwgaXMgbW9yZSBzdWl0YWJsZSBhbmQgSSBo
YXZlbid0IGJlZW4gY29udmluY2VkCmJ5IHRoZSBhcmd1bWVudCBwb3N0ZWQgb24gdjUuCgpIb3dl
dmVyIHNpbmNlIHRoaXMgaXMgYXJnb3Mgc3BlY2lmaWMgY29kZSBJIGRvbid0IGhhdmUgc3VjaCBh
IHN0cm9uZwpvcGluaW9uLCBhbmQgaXQgY2FuIGFsd2F5cyBiZSBpbXByb3ZlZCBsYXRlciBieSBh
IGZvbGxvd3VwIHBhdGNoLiBNeQpSQiBzdGFuZHMgZGVzcGl0ZSB0aGUgdXNhZ2Ugb2YgbGlzdF9m
b3JfZWFjaF9lbnRyeV9zYWZlLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
