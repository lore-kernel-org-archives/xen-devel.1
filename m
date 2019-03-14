From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] xen/debug: make debugtrace more clever
 regarding repeating entries
Date: Thu, 14 Mar 2019 08:14:35 -0600
Message-ID: <5C8A61CB020000780021EB19@prv1-mh.provo.novell.com>
References: <20190314093733.18175-1-jgross@suse.com>
 <20190314093733.18175-3-jgross@suse.com>
 <5C8A5842020000780021EA3E@suse.com>
 <98776ed5-42f7-2c42-aacb-acc9b549598f@suse.com>
 <cdc2be3d-b1ed-f95b-782b-a7601912c2d0@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U6t1=RR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4R85-00021Q-Su
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 14:14:41 +0000
In-Reply-To: <cdc2be3d-b1ed-f95b-782b-a7601912c2d0@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE5IGF0IDE0OjQwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTQvMDMvMjAxOSAxMzozOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMTQv
MDMvMjAxOSAxNDozMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAxNC4wMy4xOSBhdCAx
MDozNywgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvY2hh
ci9jb25zb2xlLmMKPj4+PiArKysgYi94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYwo+Pj4+IEBA
IC0xMjI1LDEzICsxMjI1LDI4IEBAIHZvaWQgZGVidWd0cmFjZV9kdW1wKHZvaWQpCj4+Pj4gICAg
ICB3YXRjaGRvZ19lbmFibGUoKTsKPj4+PiAgfQo+Pj4+ICAKPj4+PiArc3RhdGljIHZvaWQgZGVi
dWd0cmFjZV9hZGRfdG9fYnVmKGNoYXIgKmJ1ZikKPj4+PiArewo+Pj4+ICsgICAgY2hhciAqcDsK
Pj4+PiArCj4+Pj4gKyAgICBmb3IgKCBwID0gYnVmOyAqcCAhPSAnXDAnOyBwKysgKQo+Pj4+ICsg
ICAgewo+Pj4+ICsgICAgICAgIGRlYnVndHJhY2VfYnVmW2RlYnVndHJhY2VfcHJkKytdID0gKnA7
Cj4+Pj4gKyAgICAgICAgLyogQWx3YXlzIGxlYXZlIGEgbnVsIGJ5dGUgYXQgdGhlIGVuZCBvZiB0
aGUgYnVmZmVyLiAqLwo+Pj4+ICsgICAgICAgIGlmICggZGVidWd0cmFjZV9wcmQgPT0gKGRlYnVn
dHJhY2VfYnl0ZXMgLSAxKSApCj4+Pj4gKyAgICAgICAgICAgIGRlYnVndHJhY2VfcHJkID0gMDsK
Pj4+PiArICAgIH0KPj4+PiArfQo+Pj4+ICsKPj4+PiAgdm9pZCBkZWJ1Z3RyYWNlX3ByaW50ayhj
b25zdCBjaGFyICpmbXQsIC4uLikKPj4+PiAgewo+Pj4+IC0gICAgc3RhdGljIGNoYXIgICAgYnVm
WzEwMjRdOwo+Pj4+IC0gICAgc3RhdGljIHUzMiBjb3VudDsKPj4+PiArICAgIHN0YXRpYyBjaGFy
IGJ1ZlsxMDI0XTsKPj4+PiArICAgIHN0YXRpYyBjaGFyIGxhc3RfYnVmWzEwMjRdOwo+Pj4+ICsg
ICAgc3RhdGljIHUzMiBjb3VudCwgbGFzdF9jb3VudDsKPj4+IFBsZWFzZSBjaGFuZ2UgdG8gdWlu
dDMyX3Qgb3IgZXZlbiBiZXR0ZXIgc2ltcGx5IHRvIHVuc2lnbmVkIGludC4KPj4gT2theS4KPj4K
Pj4+PiBAQCAtMTI0MywyNSArMTI1OCwzMiBAQCB2b2lkIGRlYnVndHJhY2VfcHJpbnRrKGNvbnN0
IGNoYXIgKmZtdCwgLi4uKQo+Pj4+ICAKPj4+PiAgICAgIEFTU0VSVChkZWJ1Z3RyYWNlX2J1Zltk
ZWJ1Z3RyYWNlX2J5dGVzIC0gMV0gPT0gMCk7Cj4+Pj4gIAo+Pj4+IC0gICAgc25wcmludGYoYnVm
LCBzaXplb2YoYnVmKSwgIiV1ICIsICsrY291bnQpOwo+Pj4+IC0KPj4+PiAgICAgIHZhX3N0YXJ0
KGFyZ3MsIGZtdCk7Cj4+Pj4gLSAgICAodm9pZCl2c25wcmludGYoYnVmICsgc3RybGVuKGJ1Ziks
IHNpemVvZihidWYpIC0gc3RybGVuKGJ1ZiksIGZtdCwgYXJncyk7Cj4+Pj4gKyAgICAodm9pZCl2
c25wcmludGYoYnVmLCBzaXplb2YoYnVmKSwgZm10LCBhcmdzKTsKPj4+IFBsZWFzZSB0YWtlIHRo
ZSBvcHBvcnR1bml0eSBhbmQgZHJvcCB0aGUgc3RyYXkgY2FzdC4KPj4gV2lsbCBkby4KPiAKPiBC
b3RoIGNhbiBiZSBkb25lIG9uIGNvbW1pdCwgc3VyZWx5PwoKUGVyaGFwcywgYWxiZWl0IGlpcmMg
dGhlIGZpcnN0IHdvdWxkIGFtb3VudCB0byBtb3JlIHRoYW4ganVzdCBzL3UzMi8uLi4vCm9uIHRo
ZSBsaW5lIGluIHF1ZXN0aW9uLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
