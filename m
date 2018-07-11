From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 11/13] memory: add get_paged_gfn() as a
 wrapper...
Date: Wed, 11 Jul 2018 14:04:32 +0100
Message-ID: <a063b04a-f729-5430-6ab0-4d19503aec66@citrix.com>
References: <20180707110526.35822-1-paul.durrant@citrix.com>
 <20180707110526.35822-12-paul.durrant@citrix.com>
 <0d1f50ab-941b-48e5-78d8-1308835a81de@citrix.com>
 <c536e2f1a58a4132b93c82a2367f8780@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lp25=j3=citrix.com=prvs=7234a998f=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1fdEnm-0004hw-7Y
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 13:05:02 +0000
In-Reply-To: <c536e2f1a58a4132b93c82a2367f8780@AMSPEX02CL03.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTEvMjAxOCAwMTozMSBQTSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4gZGlmZiAtLWdp
dCBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwo+
Pj4gaW5kZXggYzZiOTljNDExNi4uNTEwZjM3ZjEwMCAxMDA2NDQKPj4+IC0tLSBhL3hlbi9jb21t
b24vZ3JhbnRfdGFibGUuYwo+Pj4gKysrIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCj4+PiBA
QCAtMzc1LDM5ICszNzUsMjMgQEAgc3RhdGljIGludCBnZXRfcGFnZWRfZnJhbWUodW5zaWduZWQg
bG9uZyBnZm4sCj4+IG1mbl90ICptZm4sCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IHBhZ2VfaW5mbyAqKnBhZ2UsIGJvb2wgcmVhZG9ubHksCj4+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IGRvbWFpbiAqcmQpCj4+PiAgewo+Pj4gLSAgICBpbnQgcmMg
PSBHTlRTVF9va2F5Owo+Pj4gLSAgICBwMm1fdHlwZV90IHAybXQ7Cj4+PiAtCj4+PiAtICAgICpt
Zm4gPSBJTlZBTElEX01GTjsKPj4+IC0gICAgKnBhZ2UgPSBnZXRfcGFnZV9mcm9tX2dmbihyZCwg
Z2ZuLCAmcDJtdCwKPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWFkb25seSA/
IFAyTV9BTExPQyA6IFAyTV9VTlNIQVJFKTsKPj4+IC0gICAgaWYgKCAhKnBhZ2UgKQo+Pj4gLSAg
ICB7Cj4+PiAtI2lmZGVmIFAyTV9TSEFSRURfVFlQRVMKPj4+IC0gICAgICAgIGlmICggcDJtX2lz
X3NoYXJlZChwMm10KSApCj4+PiAtICAgICAgICAgICAgcmV0dXJuIEdOVFNUX2VhZ2FpbjsKPj4+
IC0jZW5kaWYKPj4+IC0jaWZkZWYgUDJNX1BBR0VTX1RZUEVTCj4+PiAtICAgICAgICBpZiAoIHAy
bV9pc19wYWdpbmcocDJtdCkgKQo+Pj4gLSAgICAgICAgewo+Pj4gLSAgICAgICAgICAgIHAybV9t
ZW1fcGFnaW5nX3BvcHVsYXRlKHJkLCBnZm4pOwo+Pj4gLSAgICAgICAgICAgIHJldHVybiBHTlRT
VF9lYWdhaW47Cj4+PiAtICAgICAgICB9Cj4+PiAtI2VuZGlmCj4+PiAtICAgICAgICByZXR1cm4g
R05UU1RfYmFkX3BhZ2U7Cj4+PiAtICAgIH0KPj4+ICsgICAgaW50IHJjOwo+Pj4KPj4+IC0gICAg
aWYgKCBwMm1faXNfZm9yZWlnbihwMm10KSApCj4+IFtzbmlwXQo+Pj4gICAgICB7Cj4+IFtzbmlw
XQo+Pj4gLSAgICAgICAgcHV0X3BhZ2UoKnBhZ2UpOwo+Pj4gLSAgICAgICAgKnBhZ2UgPSBOVUxM
Owo+Pj4gLQo+Pgo+PiBDb21wYXJpbmcgYmVmb3JlLWFuZC1hZnRlciwgdGhpcyBzZWVtcyB0byBy
ZW1vdmUgdGhpcyAncDJtX2lzX2ZvcmVpZ24oKScKPj4gY2hlY2suICBBbSBJIG1pc3Npbmcgc29t
ZXRoaW5nPwo+Pgo+IAo+IEkgbWF5IGJlLiBJIHRob3VnaHQgcDJtX2lzX3JhbSgpIHJ1bGVkIG91
dCBmb3JlaWduIHBhZ2VzIChwMm1faXNfYW55X3JhbSgpIGJlaW5nIHRoZSB3YXkgdG8gaW5jbHVk
ZSBmb3JlaWduIG1hcHMgaWYgcmVxdWlyZWQpLiBJJ2xsIGNoZWNrLgoKTG9va3MgbGlrZSB5b3Un
cmUgcmlnaHQuICBCdXQgdGhlbiwgYXJlIHlvdSBzdXJlIHRoYXQncyB3aGF0IHdlIHdhbnQgZm9y
CnRoZSBvdGhlciBjYWxsZXJzPyAgTWlnaHQgd2Ugbm90IG5lZWQgdG8gZG8gYW4gZW11bGF0aW9u
IHRoYXQgZW5kcyB1cAp3cml0aW5nIGludG8gYSBmb3JlaWduIG1hcHBpbmcsIGZvciBpbnN0YW5j
ZT8KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
