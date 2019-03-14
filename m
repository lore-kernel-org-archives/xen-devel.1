From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] xen/debug: make debugtrace more clever
 regarding repeating entries
Date: Thu, 14 Mar 2019 15:28:10 +0100
Message-ID: <ba20dba4-51b8-584d-1cc1-c5e766aae955@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=X/If=RR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h4RLD-0003n8-0u
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 14:28:15 +0000
References: =?UTF-8?B?PDIwMTkwMzE0MDkzNzMzLjE4MTc177+9Me+/vWpncm9zc0BzdXNl?=
 =?UTF-8?B?LmNvbT4gPDIwMTkwMzE0MDkzNzMzLjE4MTc177+9M++/vWpncm9zc0BzdXNlLmNv?=
 =?UTF-8?Q?m=3e_=3c5C8A5842020000780021EA3E=40suse=2ecom=3e_=3c98776ed5?=
 =?UTF-8?B?77+9NDJmN++/vTJjNDLvv71hYWNi77+9YWNjOWI1NDk1OThmQHN1c2UuY29tPiA8?=
 =?UTF-8?Q?cdc2be3d-b1ed-f95b-782b-a7601912c2d0=40citrix=2ecom=3e_=3c5C8A61C?=
 =?UTF-8?Q?B020000780021EB19=40suse=2ecom=3e?=
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMjAxOSAxNToxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTQuMDMuMTkg
YXQgMTQ6NDAsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMTQvMDMv
MjAxOSAxMzozOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+IE9uIDE0LzAzLzIwMTkgMTQ6MzMs
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDE0LjAzLjE5IGF0IDEwOjM3LCA8amdyb3Nz
QHN1c2UuY29tPiB3cm90ZToKPj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMK
Pj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKPj4+Pj4gQEAgLTEyMjUsMTMg
KzEyMjUsMjggQEAgdm9pZCBkZWJ1Z3RyYWNlX2R1bXAodm9pZCkKPj4+Pj4gICAgICB3YXRjaGRv
Z19lbmFibGUoKTsKPj4+Pj4gIH0KPj4+Pj4gIAo+Pj4+PiArc3RhdGljIHZvaWQgZGVidWd0cmFj
ZV9hZGRfdG9fYnVmKGNoYXIgKmJ1ZikKPj4+Pj4gK3sKPj4+Pj4gKyAgICBjaGFyICpwOwo+Pj4+
PiArCj4+Pj4+ICsgICAgZm9yICggcCA9IGJ1ZjsgKnAgIT0gJ1wwJzsgcCsrICkKPj4+Pj4gKyAg
ICB7Cj4+Pj4+ICsgICAgICAgIGRlYnVndHJhY2VfYnVmW2RlYnVndHJhY2VfcHJkKytdID0gKnA7
Cj4+Pj4+ICsgICAgICAgIC8qIEFsd2F5cyBsZWF2ZSBhIG51bCBieXRlIGF0IHRoZSBlbmQgb2Yg
dGhlIGJ1ZmZlci4gKi8KPj4+Pj4gKyAgICAgICAgaWYgKCBkZWJ1Z3RyYWNlX3ByZCA9PSAoZGVi
dWd0cmFjZV9ieXRlcyAtIDEpICkKPj4+Pj4gKyAgICAgICAgICAgIGRlYnVndHJhY2VfcHJkID0g
MDsKPj4+Pj4gKyAgICB9Cj4+Pj4+ICt9Cj4+Pj4+ICsKPj4+Pj4gIHZvaWQgZGVidWd0cmFjZV9w
cmludGsoY29uc3QgY2hhciAqZm10LCAuLi4pCj4+Pj4+ICB7Cj4+Pj4+IC0gICAgc3RhdGljIGNo
YXIgICAgYnVmWzEwMjRdOwo+Pj4+PiAtICAgIHN0YXRpYyB1MzIgY291bnQ7Cj4+Pj4+ICsgICAg
c3RhdGljIGNoYXIgYnVmWzEwMjRdOwo+Pj4+PiArICAgIHN0YXRpYyBjaGFyIGxhc3RfYnVmWzEw
MjRdOwo+Pj4+PiArICAgIHN0YXRpYyB1MzIgY291bnQsIGxhc3RfY291bnQ7Cj4+Pj4gUGxlYXNl
IGNoYW5nZSB0byB1aW50MzJfdCBvciBldmVuIGJldHRlciBzaW1wbHkgdG8gdW5zaWduZWQgaW50
Lgo+Pj4gT2theS4KPj4+Cj4+Pj4+IEBAIC0xMjQzLDI1ICsxMjU4LDMyIEBAIHZvaWQgZGVidWd0
cmFjZV9wcmludGsoY29uc3QgY2hhciAqZm10LCAuLi4pCj4+Pj4+ICAKPj4+Pj4gICAgICBBU1NF
UlQoZGVidWd0cmFjZV9idWZbZGVidWd0cmFjZV9ieXRlcyAtIDFdID09IDApOwo+Pj4+PiAgCj4+
Pj4+IC0gICAgc25wcmludGYoYnVmLCBzaXplb2YoYnVmKSwgIiV1ICIsICsrY291bnQpOwo+Pj4+
PiAtCj4+Pj4+ICAgICAgdmFfc3RhcnQoYXJncywgZm10KTsKPj4+Pj4gLSAgICAodm9pZCl2c25w
cmludGYoYnVmICsgc3RybGVuKGJ1ZiksIHNpemVvZihidWYpIC0gc3RybGVuKGJ1ZiksIGZtdCwg
YXJncyk7Cj4+Pj4+ICsgICAgKHZvaWQpdnNucHJpbnRmKGJ1Ziwgc2l6ZW9mKGJ1ZiksIGZtdCwg
YXJncyk7Cj4+Pj4gUGxlYXNlIHRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBkcm9wIHRoZSBzdHJh
eSBjYXN0Lgo+Pj4gV2lsbCBkby4KPj4KPj4gQm90aCBjYW4gYmUgZG9uZSBvbiBjb21taXQsIHN1
cmVseT8KPiAKPiBQZXJoYXBzLCBhbGJlaXQgaWlyYyB0aGUgZmlyc3Qgd291bGQgYW1vdW50IHRv
IG1vcmUgdGhhbiBqdXN0IHMvdTMyLy4uLi8KPiBvbiB0aGUgbGluZSBpbiBxdWVzdGlvbi4KCldo
YXQgZWxzZSB3b3VsZCB5b3Ugd2FudCB0byBkbz8KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
