From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] xen/debug: make debugtrace more clever
 regarding repeating entries
Date: Thu, 14 Mar 2019 08:31:37 -0600
Message-ID: <5C8A65C9020000780021EBA3@prv1-mh.provo.novell.com>
References: <20190314093733.18175*1*jgross@suse.com>
 <20190314093733.18175*3*jgross@suse.com>
 <5C8A5842020000780021EA3E@suse.com>
 <98776ed5*42f7*2c42*aacb*acc9b549598f@suse.com>
 <cdc2be3d-b1ed-f95b-782b-a7601912c2d0@citrix.com>
 <5C8A61CB020000780021EB19@suse.com>
 <ba20dba4-51b8-584d-1cc1-c5e766aae955@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U6t1=RR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4ROX-0004XM-GT
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 14:31:41 +0000
In-Reply-To: <ba20dba4-51b8-584d-1cc1-c5e766aae955@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE5IGF0IDE1OjI4LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAx
NC8wMy8yMDE5IDE1OjE0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMTQuMDMuMTkgYXQg
MTQ6NDAsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4+IE9uIDE0LzAzLzIw
MTkgMTM6MzgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4gT24gMTQvMDMvMjAxOSAxNDozMywg
SmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4+IE9uIDE0LjAzLjE5IGF0IDEwOjM3LCA8amdyb3Nz
QHN1c2UuY29tPiB3cm90ZToKPj4+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5j
Cj4+Pj4+PiArKysgYi94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYwo+Pj4+Pj4gQEAgLTEyMjUs
MTMgKzEyMjUsMjggQEAgdm9pZCBkZWJ1Z3RyYWNlX2R1bXAodm9pZCkKPj4+Pj4+ICAgICAgd2F0
Y2hkb2dfZW5hYmxlKCk7Cj4+Pj4+PiAgfQo+Pj4+Pj4gIAo+Pj4+Pj4gK3N0YXRpYyB2b2lkIGRl
YnVndHJhY2VfYWRkX3RvX2J1ZihjaGFyICpidWYpCj4+Pj4+PiArewo+Pj4+Pj4gKyAgICBjaGFy
ICpwOwo+Pj4+Pj4gKwo+Pj4+Pj4gKyAgICBmb3IgKCBwID0gYnVmOyAqcCAhPSAnXDAnOyBwKysg
KQo+Pj4+Pj4gKyAgICB7Cj4+Pj4+PiArICAgICAgICBkZWJ1Z3RyYWNlX2J1ZltkZWJ1Z3RyYWNl
X3ByZCsrXSA9ICpwOwo+Pj4+Pj4gKyAgICAgICAgLyogQWx3YXlzIGxlYXZlIGEgbnVsIGJ5dGUg
YXQgdGhlIGVuZCBvZiB0aGUgYnVmZmVyLiAqLwo+Pj4+Pj4gKyAgICAgICAgaWYgKCBkZWJ1Z3Ry
YWNlX3ByZCA9PSAoZGVidWd0cmFjZV9ieXRlcyAtIDEpICkKPj4+Pj4+ICsgICAgICAgICAgICBk
ZWJ1Z3RyYWNlX3ByZCA9IDA7Cj4+Pj4+PiArICAgIH0KPj4+Pj4+ICt9Cj4+Pj4+PiArCj4+Pj4+
PiAgdm9pZCBkZWJ1Z3RyYWNlX3ByaW50ayhjb25zdCBjaGFyICpmbXQsIC4uLikKPj4+Pj4+ICB7
Cj4+Pj4+PiAtICAgIHN0YXRpYyBjaGFyICAgIGJ1ZlsxMDI0XTsKPj4+Pj4+IC0gICAgc3RhdGlj
IHUzMiBjb3VudDsKPj4+Pj4+ICsgICAgc3RhdGljIGNoYXIgYnVmWzEwMjRdOwo+Pj4+Pj4gKyAg
ICBzdGF0aWMgY2hhciBsYXN0X2J1ZlsxMDI0XTsKPj4+Pj4+ICsgICAgc3RhdGljIHUzMiBjb3Vu
dCwgbGFzdF9jb3VudDsKPj4+Pj4gUGxlYXNlIGNoYW5nZSB0byB1aW50MzJfdCBvciBldmVuIGJl
dHRlciBzaW1wbHkgdG8gdW5zaWduZWQgaW50Lgo+Pj4+IE9rYXkuCj4+Pj4KPj4+Pj4+IEBAIC0x
MjQzLDI1ICsxMjU4LDMyIEBAIHZvaWQgZGVidWd0cmFjZV9wcmludGsoY29uc3QgY2hhciAqZm10
LCAuLi4pCj4+Pj4+PiAgCj4+Pj4+PiAgICAgIEFTU0VSVChkZWJ1Z3RyYWNlX2J1ZltkZWJ1Z3Ry
YWNlX2J5dGVzIC0gMV0gPT0gMCk7Cj4+Pj4+PiAgCj4+Pj4+PiAtICAgIHNucHJpbnRmKGJ1Ziwg
c2l6ZW9mKGJ1ZiksICIldSAiLCArK2NvdW50KTsKPj4+Pj4+IC0KPj4+Pj4+ICAgICAgdmFfc3Rh
cnQoYXJncywgZm10KTsKPj4+Pj4+IC0gICAgKHZvaWQpdnNucHJpbnRmKGJ1ZiArIHN0cmxlbihi
dWYpLCBzaXplb2YoYnVmKSAtIHN0cmxlbihidWYpLCBmbXQsIGFyZ3MpOwo+Pj4+Pj4gKyAgICAo
dm9pZCl2c25wcmludGYoYnVmLCBzaXplb2YoYnVmKSwgZm10LCBhcmdzKTsKPj4+Pj4gUGxlYXNl
IHRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBkcm9wIHRoZSBzdHJheSBjYXN0Lgo+Pj4+IFdpbGwg
ZG8uCj4+Pgo+Pj4gQm90aCBjYW4gYmUgZG9uZSBvbiBjb21taXQsIHN1cmVseT8KPj4gCj4+IFBl
cmhhcHMsIGFsYmVpdCBpaXJjIHRoZSBmaXJzdCB3b3VsZCBhbW91bnQgdG8gbW9yZSB0aGFuIGp1
c3Qgcy91MzIvLi4uLwo+PiBvbiB0aGUgbGluZSBpbiBxdWVzdGlvbi4KPiAKPiBXaGF0IGVsc2Ug
d291bGQgeW91IHdhbnQgdG8gZG8/CgpGb2xkIGl0IHdpdGggdGhlIGFkamFjZW50IHVuc2lnbmVk
IGludCBkZWNsYXJhdGlvbiAoaWlyYyB0aGVyZSB3YXMgb25lKS4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
