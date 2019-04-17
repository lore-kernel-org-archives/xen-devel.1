From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 02/12] xen/arm: fix get_cpu_info() when
 built with clang
Date: Wed, 17 Apr 2019 13:45:18 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1904171340390.1370@sstabellini-ThinkPad-X260>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-3-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CUiA=ST=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGrQl-0002EV-US
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 20:45:19 +0000
In-Reply-To: <20190327184531.30986-3-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org, sstabellini@kernel.org, Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyNyBNYXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IENsYW5nIHVuZGVyc3Rh
bmRzIHRoZSBHQ0Npc20gaW4gdXNlIGhlcmUsIGJ1dCBzdGlsbCBjb21wbGFpbnMgdGhhdCBzcCBp
cwo+IHVuaXRpYWxpc2VkLiBJbiBzdWNoIGNhc2VzLCByZXNvcnQgdG8gdGhlIG9sZGVyIHZlcnNp
b25zIG9mIHRoaXMgY29kZSwKPiB3aGljaCBkaXJlY3RseSByZWFkIHNwIGludG8gdGhlIHRlbXBv
cmFyeSB2YXJpYWJsZS4KPiAKPiBOb3RlIHRoYXQgd2Ugc3RpbGwga2VlcCB0aGUgR0NDaXNtIGlu
IHRoZSBkZWZhdWx0IGNhc2UsIGFzIGl0IGNhdXNlcyBHQ0MKPiB0byBjcmVhdGUgcmF0aGVyIGJl
dHRlciBhc3NlbWJseS4KPiAKPiBUaGlzIGlzIGJhc2VkIG9uIHRoZSB4ODYgY291bnRlcnBhcnQu
CgpJIHVuZGVyc3RhbmQgdGhpcyBpcyBiYXNlZCBvbiBhbiBleGlzdGluZyBhcHByb2FjaCBidXQg
d2hhdCBhYm91dCBvdGhlcgpjb21waWxlcnM/IEkgaGF2ZSBhIHN1Z2dlc3Rpb24gYmVsb3cuCgoK
PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0t
LQo+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL2N1cnJlbnQuaCB8IDEwICsrKysrKysrKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2N1cnJlbnQuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0v
Y3VycmVudC5oCj4gaW5kZXggYzRhZjY2ZmJiOS4uNmI3YzFkZjY0ZCAxMDA2NDQKPiAtLS0gYS94
ZW4vaW5jbHVkZS9hc20tYXJtL2N1cnJlbnQuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0v
Y3VycmVudC5oCj4gQEAgLTI4LDggKzI4LDE2IEBAIHN0cnVjdCBjcHVfaW5mbyB7Cj4gIAo+ICBz
dGF0aWMgaW5saW5lIHN0cnVjdCBjcHVfaW5mbyAqZ2V0X2NwdV9pbmZvKHZvaWQpCj4gIHsKPiAr
I2lmZGVmIF9fY2xhbmdfXwo+ICsgICAgdW5zaWduZWQgbG9uZyBzcDsKPiArCj4gKyAgICBhc20g
KCJtb3YgJTAsIHNwIiA6ICI9ciIgKHNwKSk7Cj4gKyNlbHNlCj4gICAgICByZWdpc3RlciB1bnNp
Z25lZCBsb25nIHNwIGFzbSAoInNwIik7Cj4gLSAgICByZXR1cm4gKHN0cnVjdCBjcHVfaW5mbyAq
KSgoc3AgJiB+KFNUQUNLX1NJWkUgLSAxKSkgKyBTVEFDS19TSVpFIC0gc2l6ZW9mKHN0cnVjdCBj
cHVfaW5mbykpOwo+ICsjZW5kaWYKPiArCj4gKyAgICByZXR1cm4gKHN0cnVjdCBjcHVfaW5mbyAq
KSgoc3AgJiB+KFNUQUNLX1NJWkUgLSAxKSkgKwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgU1RBQ0tfU0laRSAtIHNpemVvZihzdHJ1Y3QgY3B1X2luZm8pKTsKPiAgfQoKSSB0aGlu
ayBpdCBtYWtlcyBzZW5zZSB0byBzd2l0Y2ggdGhlICNpZmRlZiBhcm91bmQ6CgojaWZkZWYgX19H
TlVDX18KICAgIC8qIGdjYyBzcGVjaWZpYyBvcHRpbWl6YXRpb24gKi8KI2Vsc2UKICAgLyogcmVn
dWxhciBpbXBsZW1lbnRhdGlvbiAqLwojZW5kaWYKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
