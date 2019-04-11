From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v3 1/3] x86/mm: Introduce
 altp2m_get_gfn_type_access
Date: Thu, 11 Apr 2019 07:28:03 -0600
Message-ID: <CABfawhkn-uSRtNWpSJKxoz0dFcxmDupVhOg1FxYWca9eRx1wTA@mail.gmail.com>
References: <20190409120324.13940-1-aisaila@bitdefender.com>
 <28c52232-536f-d007-4072-fbce95b44d8c@citrix.com>
 <7a64b16b-b7df-2af8-219b-5d3c4a3bf381@bitdefender.com>
 <21a454d7-fc0e-5d44-9991-680582752989@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O6VX=SN=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hEZkx-0003Oj-Qq
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 13:28:43 +0000
Received: by mail-wr1-f41.google.com with SMTP id h4so7365377wre.7
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2019 06:28:41 -0700 (PDT)
In-Reply-To: <21a454d7-fc0e-5d44-9991-680582752989@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, Alexandru Stefan ISAILA <aisaila@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgMTEsIDIwMTkgYXQgNjo1MCBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gNC8xMS8xOSAxOjE3IFBNLCBBbGV4YW5kcnUg
U3RlZmFuIElTQUlMQSB3cm90ZToKPiA+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9w
Mm0uYyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+ID4+PiBpbmRleCBiOWJiYjhmNDg1Li5kMzhk
N2MyOWNhIDEwMDY0NAo+ID4+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiA+Pj4gKysr
IGIveGVuL2FyY2gveDg2L21tL3AybS5jCj4gPj4+IEBAIC0yNjI2LDYgKzI2MjYsNyBAQCBpbnQg
cDJtX2NoYW5nZV9hbHRwMm1fZ2ZuKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBpZHgs
Cj4gPj4+ICAgICAgIG1mbl90IG1mbjsKPiA+Pj4gICAgICAgdW5zaWduZWQgaW50IHBhZ2Vfb3Jk
ZXI7Cj4gPj4+ICAgICAgIGludCByYyA9IC1FSU5WQUw7Cj4gPj4+ICsgICAgYm9vbCBjb3BpZWRf
ZnJvbV9ob3N0cDJtOwo+ID4+Pgo+ID4+PiAgICAgICBpZiAoIGlkeCA+PSBNQVhfQUxUUDJNIHx8
IGQtPmFyY2guYWx0cDJtX2VwdHBbaWR4XSA9PSBtZm5feChJTlZBTElEX01GTikgKQo+ID4+PiAg
ICAgICAgICAgcmV0dXJuIHJjOwo+ID4+PiBAQCAtMjYzNiw3ICsyNjM3LDcgQEAgaW50IHAybV9j
aGFuZ2VfYWx0cDJtX2dmbihzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgaWR4LAo+ID4+
PiAgICAgICBwMm1fbG9jayhocDJtKTsKPiA+Pj4gICAgICAgcDJtX2xvY2soYXAybSk7Cj4gPj4+
Cj4gPj4+IC0gICAgbWZuID0gYXAybS0+Z2V0X2VudHJ5KGFwMm0sIG9sZF9nZm4sICZ0LCAmYSwg
MCwgTlVMTCwgTlVMTCk7Cj4gPj4+ICsgICAgbWZuID0gYWx0cDJtX2dldF9nZm5fdHlwZV9hY2Nl
c3MoYXAybSwgb2xkX2dmbiwgJnQsICZhLCAmcGFnZV9vcmRlciwgJmNvcGllZF9mcm9tX2hvc3Rw
Mm0pOwo+ID4+Cj4gPj4gQmVmb3JlLCBpZiBuZXdfZ2ZuIHdhcyBJTlZBTElEX0dGTiwgdGhlbiB0
aGUgaG9zdCBwMm0gd2Fzbid0IHJlYWQgYXQKPiA+PiBhbGwuICBOb3csIHRoZSBob3N0cDJtIHdp
bGwgaGF2ZSBfX2dldF9nZm5fdHlwZV9hY2Nlc3MoKSBjYWxsZWQgd2l0aAo+ID4+IFAyTV9BTExP
QyB8IFAyTV9VTlNIQVJFLiAgSXMgdGhhdCBjaGFuZ2UgaW50ZW50aW9uYWwsIGFuZCBpZiBzbywg
d2h5Pwo+ID4KPiA+IFRoaXMgaGFzIGJlZW4gcmVxdWVzdGVkIGJ5IFRhbWFzIGluIHYyLgo+Cj4g
VGhhdCdzIG5pY2UsIGJ1dCAxKSB5b3Ugc3RpbGwgaGF2ZW4ndCBhbnN3ZXJlZCB0aGUgcXVlc3Rp
b24sIGFuZCAyKSBpdCdzCj4gbm90IGluIHRoZSBjaGFuZ2Vsb2cuCgpXaGF0IEkgcmVxdWVzdGVk
IHdhcyB0aGF0IGlmIHJlbWFwcGluZyBpcyBiZWluZyBkb25lIHRoZW4gYm90aCB0aGUgb2xkCmFu
ZCBuZXcgZ2ZuJ3Mgc2hvdWxkIGJlIHVuc2hhcmVkIGluIHRoZSBob3N0cDJtIGZvciBrZWVwaW5n
IHRoaW5ncwpjb25zaXN0ZW50LiBUaGUgcGFnZSB0eXBlIG9mIG9sZF9nZm4gd2FzIGFscmVhZHkg
Y2hlY2tlZCB3aGV0aGVyIGl0J3MKcDJtX3JhbV9ydyBhbmQgYmFpbCBpZiBpdCB3YXNuJ3Qgc28g
ZnVuY3Rpb25hbGl0eS13aXNlIHRoaXMganVzdApzaW1wbGlmaWVzIHRoaW5ncyBhcyBhIHVzZXIg
ZG9uJ3QgaGF2ZSB0byByZXF1ZXN0IHVuc2hhcmluZyBtYW51YWxseQpiZWZvcmUgcmVtYXBwaW5n
LiBOb3csIGlmIHRoZSBuZXdfZ2ZuIGlzIGludmFsaWQgaXQgc2hvdWxkbid0IHF1ZXJ5CnRoZSBo
b3N0cDJtIGFzIHRoYXQgaXMgZWZmZWN0aXZlbHkgYSByZXF1ZXN0IHRvIHJlbW92ZSB0aGUgZW50
cnkgZnJvbQp0aGUgYWx0cDJtLiBCdXQgcHJvdmlkZWQgdGhhdCBzY2VuYXJpbyBpcyB1c2VkIG9u
bHkgd2hlbiByZW1vdmluZwplbnRyaWVzIHRoYXQgd2VyZSBwcmV2aW91c2x5IHJlbWFwcGVkL2Nv
cGllZCB0byB0aGUgYWx0cDJtLCB0aG9zZQplbnRyaWVzIGFscmVhZHkgd2VudCB0aHJvdWdoIFAy
TV9BTExPQyB8IFAyTV9VTlNIQVJFIGJlZm9yZSwgc28gaXQKd29uJ3QgaGF2ZSBhbiBhZmZlY3Qu
IEJ1dCBpdCdzIGFsc28gcG9pbnRsZXNzLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
