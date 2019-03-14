From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] xen/debug: make debugtrace more clever
 regarding repeating entries
Date: Thu, 14 Mar 2019 14:38:56 +0100
Message-ID: <98776ed5-42f7-2c42-aacb-acc9b549598f@suse.com>
References: <20190314093733.18175-1-jgross@suse.com>
 <20190314093733.18175-3-jgross@suse.com> <5C8A5842020000780021EA3E@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=X/If=RR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h4QZY-0005qn-Gi
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 13:39:00 +0000
In-Reply-To: <5C8A5842020000780021EA3E@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMjAxOSAxNDozMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTQuMDMuMTkg
YXQgMTA6MzcsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiAtLS0gYS94ZW4vZHJpdmVycy9j
aGFyL2NvbnNvbGUuYwo+PiArKysgYi94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYwo+PiBAQCAt
MTIyNSwxMyArMTIyNSwyOCBAQCB2b2lkIGRlYnVndHJhY2VfZHVtcCh2b2lkKQo+PiAgICAgIHdh
dGNoZG9nX2VuYWJsZSgpOwo+PiAgfQo+PiAgCj4+ICtzdGF0aWMgdm9pZCBkZWJ1Z3RyYWNlX2Fk
ZF90b19idWYoY2hhciAqYnVmKQo+PiArewo+PiArICAgIGNoYXIgKnA7Cj4+ICsKPj4gKyAgICBm
b3IgKCBwID0gYnVmOyAqcCAhPSAnXDAnOyBwKysgKQo+PiArICAgIHsKPj4gKyAgICAgICAgZGVi
dWd0cmFjZV9idWZbZGVidWd0cmFjZV9wcmQrK10gPSAqcDsKPj4gKyAgICAgICAgLyogQWx3YXlz
IGxlYXZlIGEgbnVsIGJ5dGUgYXQgdGhlIGVuZCBvZiB0aGUgYnVmZmVyLiAqLwo+PiArICAgICAg
ICBpZiAoIGRlYnVndHJhY2VfcHJkID09IChkZWJ1Z3RyYWNlX2J5dGVzIC0gMSkgKQo+PiArICAg
ICAgICAgICAgZGVidWd0cmFjZV9wcmQgPSAwOwo+PiArICAgIH0KPj4gK30KPj4gKwo+PiAgdm9p
ZCBkZWJ1Z3RyYWNlX3ByaW50ayhjb25zdCBjaGFyICpmbXQsIC4uLikKPj4gIHsKPj4gLSAgICBz
dGF0aWMgY2hhciAgICBidWZbMTAyNF07Cj4+IC0gICAgc3RhdGljIHUzMiBjb3VudDsKPj4gKyAg
ICBzdGF0aWMgY2hhciBidWZbMTAyNF07Cj4+ICsgICAgc3RhdGljIGNoYXIgbGFzdF9idWZbMTAy
NF07Cj4+ICsgICAgc3RhdGljIHUzMiBjb3VudCwgbGFzdF9jb3VudDsKPiAKPiBQbGVhc2UgY2hh
bmdlIHRvIHVpbnQzMl90IG9yIGV2ZW4gYmV0dGVyIHNpbXBseSB0byB1bnNpZ25lZCBpbnQuCgpP
a2F5LgoKPiAKPj4gQEAgLTEyNDMsMjUgKzEyNTgsMzIgQEAgdm9pZCBkZWJ1Z3RyYWNlX3ByaW50
ayhjb25zdCBjaGFyICpmbXQsIC4uLikKPj4gIAo+PiAgICAgIEFTU0VSVChkZWJ1Z3RyYWNlX2J1
ZltkZWJ1Z3RyYWNlX2J5dGVzIC0gMV0gPT0gMCk7Cj4+ICAKPj4gLSAgICBzbnByaW50ZihidWYs
IHNpemVvZihidWYpLCAiJXUgIiwgKytjb3VudCk7Cj4+IC0KPj4gICAgICB2YV9zdGFydChhcmdz
LCBmbXQpOwo+PiAtICAgICh2b2lkKXZzbnByaW50ZihidWYgKyBzdHJsZW4oYnVmKSwgc2l6ZW9m
KGJ1ZikgLSBzdHJsZW4oYnVmKSwgZm10LCBhcmdzKTsKPj4gKyAgICAodm9pZCl2c25wcmludGYo
YnVmLCBzaXplb2YoYnVmKSwgZm10LCBhcmdzKTsKPiAKPiBQbGVhc2UgdGFrZSB0aGUgb3Bwb3J0
dW5pdHkgYW5kIGRyb3AgdGhlIHN0cmF5IGNhc3QuCgpXaWxsIGRvLgoKCkp1ZXJnZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
