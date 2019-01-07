From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/3] string: remove memscan()
Date: Mon, 7 Jan 2019 10:50:21 +0100
Message-ID: <c974fae4-6d6b-8167-6260-2f7db789207e@suse.com>
References: <5C331C51020000780020AB3F@prv1-mh.provo.novell.com>
 <5C331E59020000780020AB53@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AFjD=PP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ggRY7-0000fm-N9
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 09:50:23 +0000
In-Reply-To: <5C331E59020000780020AB53@prv1-mh.provo.novell.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDEvMjAxOSAxMDozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSXQgaGFzIG5vIHVzZXJz
LCBzbyByYXRoZXIgdGhhbiBmaXhpbmcgaXRzIHVzZSBvZiB0eXBlcyAoZmlyc3QgYW5kCj4gZm9y
ZW1vc3QgYyB3b3VsZCBuZWVkIHRvIGJlIGNhc3QgdG8gdW5zaWduZWQgY2hhciBpbiB0aGUgY29t
cGFyaXNvbgo+IGV4cHJlc3Npb24pIGRyb3AgaXQgYWx0b2dldGhlci4gbWVtY2hyKCkgb3VnaHQg
dG8gYmUgZmluZSBmb3IgYWxsCj4gcHVycG9zZXMuCj4gCj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkg
YW5kIGFsc28gZG8gc29tZSBzdHlsaXN0aWMgYWRqdXN0bWVudHMgdG8gaXRzCj4gc3Vydml2aW5n
IHNpYmxpbmcgZnVuY3Rpb24gbWVtY2hyKCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IC0tLSBhL3hlbi9jb21tb24vc3RyaW5nLmMKPiAr
KysgYi94ZW4vY29tbW9uL3N0cmluZy5jCj4gQEAgLTM4MCwzMCArMzgwLDYgQEAgaW50IChtZW1j
bXApKGNvbnN0IHZvaWQgKmNzLCBjb25zdCB2b2lkCj4gIH0KPiAgI2VuZGlmCj4gIAo+IC0jaWZu
ZGVmIF9fSEFWRV9BUkNIX01FTVNDQU4KPiAtLyoqCj4gLSAqIG1lbXNjYW4gLSBGaW5kIGEgY2hh
cmFjdGVyIGluIGFuIGFyZWEgb2YgbWVtb3J5Lgo+IC0gKiBAYWRkcjogVGhlIG1lbW9yeSBhcmVh
Cj4gLSAqIEBjOiBUaGUgYnl0ZSB0byBzZWFyY2ggZm9yCj4gLSAqIEBzaXplOiBUaGUgc2l6ZSBv
ZiB0aGUgYXJlYS4KPiAtICoKPiAtICogcmV0dXJucyB0aGUgYWRkcmVzcyBvZiB0aGUgZmlyc3Qg
b2NjdXJyZW5jZSBvZiBAYywgb3IgMSBieXRlIHBhc3QKPiAtICogdGhlIGFyZWEgaWYgQGMgaXMg
bm90IGZvdW5kCj4gLSAqLwo+IC12b2lkICogbWVtc2Nhbih2b2lkICogYWRkciwgaW50IGMsIHNp
emVfdCBzaXplKQo+IC17Cj4gLQl1bnNpZ25lZCBjaGFyICogcCA9ICh1bnNpZ25lZCBjaGFyICop
IGFkZHI7Cj4gLQo+IC0Jd2hpbGUgKHNpemUpIHsKPiAtCQlpZiAoKnAgPT0gYykKPiAtCQkJcmV0
dXJuICh2b2lkICopIHA7Cj4gLQkJcCsrOwo+IC0JCXNpemUtLTsKPiAtCX0KPiAtICAJcmV0dXJu
ICh2b2lkICopIHA7Cj4gLX0KPiAtI2VuZGlmCj4gLQo+ICAjaWZuZGVmIF9fSEFWRV9BUkNIX1NU
UlNUUgo+ICAvKioKPiAgICogc3Ryc3RyIC0gRmluZCB0aGUgZmlyc3Qgc3Vic3RyaW5nIGluIGEg
JU5VTCB0ZXJtaW5hdGVkIHN0cmluZwo+IEBAIC00NDEsMTQgKzQxNywxMyBAQCBjaGFyICooc3Ry
c3RyKShjb25zdCBjaGFyICpzMSwgY29uc3QgY2hhCj4gIHZvaWQgKihtZW1jaHIpKGNvbnN0IHZv
aWQgKnMsIGludCBjLCBzaXplX3QgbikKPiAgewo+ICAJY29uc3QgdW5zaWduZWQgY2hhciAqcCA9
IHM7Cj4gLQl3aGlsZSAobi0tICE9IDApIHsKPiAtICAgICAgICAJaWYgKCh1bnNpZ25lZCBjaGFy
KWMgPT0gKnArKykgewo+IC0JCQlyZXR1cm4gKHZvaWQgKikocC0xKTsKPiAtCQl9Cj4gLQl9Cj4g
Kwo+ICsJd2hpbGUgKG4tLSkKPiArICAgICAgICAJaWYgKCh1bnNpZ25lZCBjaGFyKWMgPT0gKnAr
KykKCldoaXRlIHNwYWNlIGRhbWFnZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
