From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/3] xen/arm: fix mask calculation in
 init_pdx
Date: Tue, 07 May 2019 01:40:44 -0600
Message-ID: <5CD1367C020000780022C597@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1905031347520.3722@sstabellini-ThinkPad-X260>
 <1556916614-21512-3-git-send-email-sstabellini@kernel.org>
 <5CCFF915020000780022C158@prv1-mh.provo.novell.com>
 <4d68ea2c-ee87-6ae4-41d5-502bf475bdb4@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNuif-0004ZX-2l
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 07:40:57 +0000
In-Reply-To: <4d68ea2c-ee87-6ae4-41d5-502bf475bdb4@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Stefano Stabellini <stefanos@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjA1LjE5IGF0IDE3OjI2LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDUvNi8xOSAxMDowNiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDAzLjA1LjE5
IGF0IDIyOjUwLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4+PiAtLS0gYS94ZW4v
YXJjaC9hcm0vc2V0dXAuYwo+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3NldHVwLmMKPj4+IEBAIC00
ODEsMTAgKzQ4MSwxNSBAQCBzdGF0aWMgcGFkZHJfdCBfX2luaXQgbmV4dF9tb2R1bGUocGFkZHJf
dCBzLCBwYWRkcl90ICplbmQpCj4+PiAgIHN0YXRpYyB2b2lkIF9faW5pdCBpbml0X3BkeCh2b2lk
KQo+Pj4gICB7Cj4+PiAgICAgICBwYWRkcl90IGJhbmtfc3RhcnQsIGJhbmtfc2l6ZSwgYmFua19l
bmQ7Cj4+PiAtCj4+PiAtICAgIHU2NCBtYXNrID0gcGR4X2luaXRfbWFzayhib290aW5mby5tZW0u
YmFua1swXS5zdGFydCk7Cj4+PiArICAgIHU2NCBtYXNrOwo+Pj4gICAgICAgaW50IGJhbms7Cj4+
PiAgIAo+Pj4gKyAgICAvKgo+Pj4gKyAgICAgKiBXZSBhbHdheXMgbWFwIHRoZSBmaXJzdCAxPDxN
QVhfT1JERVIgb2YgUkFNLCBoZW5jZSwgdGhleSBhcmUgbGVmdAo+PiAKPj4gIi4uLiBwYWdlcyBv
ZiBSQU0uIiA/Cj4+IAo+Pj4gKyAgICAgKiB1bmNvbXByZXNzZWQuCj4+PiArICAgICAqLwo+Pj4g
KyAgICBtYXNrID0gcGR4X2luaXRfbWFzaygxVUxMIDw8IChNQVhfT1JERVIgKyBQQUdFX1NISUZU
KSk7Cj4+IAo+PiBQQUdFX1NJWkUgPDwgTUFYX09SREVSPwo+IAo+IEhtbW0sIEkgYW0gbm90IGVu
dGlyZWx5IGNvbnZpbmNlIHRoaXMgd2lsbCBnaXZlIHRoZSBjb3JyZWN0IHZhbHVlIAo+IGJlY2F1
c2UgUEFHRV9TSVpFIGlzIGRlZmluZWQgYXMgKF9BQygxLCBMKSA8PCBQQUdFX1NISUZULgoKT2gs
IGluZGVlZCwgZm9yIGFuIGFic3RyYWN0IDMyLWJpdCBhcmNoIHRoaXMgd291bGQgZGUtZ2VuZXJh
dGUsIGR1ZQp0byBNQVhfT1JERVIgYmVpbmcgMjAuIE5ldmVydGhlbGVzcyBJIHRoaW5rIHRoZSBl
eHByZXNzaW9uIHVzZWQKaW52aXRlcyBmb3IgImNsZWFuaW5nIHVwIiAobWFraW5nIHRoZSBzYW1l
IG1pc3Rha2UgSSd2ZSBtYWRlKSwgYW5kCnNpbmNlIHRoaXMgaXMgaW4gQXJtLXNwZWNpZmljIGNv
ZGUgKHdoZXJlIE1BWF9PUkRFUiBpcyAxOCkgSSB0aGluayBpdAp3b3VsZCBzdGlsbCBiZSBiZXR0
ZXIgdG8gdXNlIHRoZSBzdWdnZXN0ZWQgYWx0ZXJuYXRpdmUuCgo+PiBJIHdvbmRlciB3aGV0aGVy
IHBkeF9pbml0X21hc2soKSBpdHNlbGYgd291bGRuJ3QgYmV0dGVyIGFwcGx5IHRoaXMKPj4gKGxv
d2VyKSBjYXAKPiAKPiBEbyB5b3UgbWVhbiBhbHdheXMgcmV0dXJuaW5nIChQQUdFX1NJWkUgPDwg
TUFYX09SREVSKSBvciBjYXBwaW5nIHRoZSAKPiBpbml0IG1hc2s/Cj4gCj4gTm90ZSB0aGF0IHRo
ZSBsYXRlciB3aWxsIG5vdCBwcm9kdWNlIHRoZSBzYW1lIGJlaGF2aW9yIGFzIHRoaXMgcGF0Y2gu
CgpTaW5jZSBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4gd2l0aCAiY2Fw
cGluZyB0aGUKaW5pdCBtYXNrIiwgSSdtIGFsc28gdW5jZXJ0YWluIHdoYXQgYWx0ZXJuYXRpdmUg
YmVoYXZpb3IgeW91J3JlCnRoaW5raW5nIG9mLiBXaGF0IEknbSBzdWdnZXN0aW5nIGlzCgp1NjQg
X19pbml0IHBkeF9pbml0X21hc2sodTY0IGJhc2VfYWRkcikKewogICAgcmV0dXJuIGZpbGxfbWFz
ayhtYXgoYmFzZV9hZGRyLCAodWludDY0X3QpUEFHRV9TSVpFIDw8IE1BWF9PUkRFUikgLSAxKTsK
fQoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
