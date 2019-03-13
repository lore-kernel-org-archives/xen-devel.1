From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-next 9/9] xen: Remove mfn_to_gmfn macro
Date: Wed, 13 Mar 2019 15:48:57 +0000
Message-ID: <e5f62bfe-d31e-53b3-41c2-493960742890@arm.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-10-julien.grall@arm.com>
 <5C892053020000780021E3A3@prv1-mh.provo.novell.com>
 <d99d0f41-9f56-be1b-96eb-de34fce812ee@arm.com>
 <5C892459020000780021E3FF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4ZEN=RQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h467o-0007Yc-VX
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 15:49:01 +0000
In-Reply-To: <5C892459020000780021E3FF@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMy8wMy8yMDE5IDE1OjQwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxMy4w
My4xOSBhdCAxNjoyNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gT24gMTMvMDMv
MjAxOSAxNToyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAxOC4wMi4xOSBhdCAxMjoz
NiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9h
c20tYXJtL21tLmgKPj4+PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgKPj4+PiBAQCAt
MzIxLDEwICszMjEsOCBAQCBzdHJ1Y3QgcGFnZV9pbmZvICpnZXRfcGFnZV9mcm9tX2d2YShzdHJ1
Y3QgdmNwdSAqdiwgdmFkZHJfdCB2YSwKPj4+PiAgICAjZGVmaW5lIFNIQVJFRF9NMlBfRU5UUlkg
ICAgICAgICAofjBVTCAtIDFVTCkKPj4+PiAgICAjZGVmaW5lIFNIQVJFRF9NMlAoX2UpICAgICAg
ICAgICAoKF9lKSA9PSBTSEFSRURfTTJQX0VOVFJZKQo+Pj4+ICAgIAo+Pj4+IC0vKiBYZW4gYWx3
YXlzIG93bnMgUDJNIG9uIEFSTSAqLwo+Pj4+ICsvKiBXZSBkb24ndCBoYXZlIGEgTTJQIG9uIEFy
bSAqLwo+Pj4+ICAgICNkZWZpbmUgc2V0X2dwZm5fZnJvbV9tZm4obWZuLCBwZm4pIGRvIHsgKHZv
aWQpIChtZm4pLCAodm9pZCkocGZuKTsgfSB3aGlsZSAoMCkKPj4+PiAtI2RlZmluZSBtZm5fdG9f
Z21mbihfZCwgbWZuKSAgKG1mbikKPj4+Cj4+PiBTbyBpcyB0aGUgcGxhbiB0byByZW1vdmUgdGhl
IG90aGVyIG1hY3JvIGZyb20gQXJtIHRoZW4gYXMgd2VsbD8KPj4KPj4gRG8geW91IG1lYW4gbWZu
X3RvX2dmbj8gSWYgc28gaXQgZG9lcyBub3QgZXhpc3Qgb24gQXJtLgo+IAo+IE5vLCBJIG1lYW4g
dGhlIG9uZSBpbiBjb250ZXh0IGFib3ZlIC0gc2V0X2dwZm5fZnJvbV9tZm4oKS4KCkl0IGlzIHVz
ZWQgaW4gY29tbW9uIGNvZGUsIHNvIHdlIHdvdWxkIG5lZWQgdG8gI2lkZWYgdGhlIGNhbGxlci4K
CkkgdGhpbmsgaXQgaXMgYmV0dGVyIHRvIHByb3ZpZGUgYSBOT1AgaW1wbGVtZW50YXRpb24uIENv
dWxkIGJlIG1vdmVkIHNvbWV3aGVyZSAKaW4gdGhlIGNvbW1vbiBoZWFkZXIgdGhvdWdoLiBBbnkg
b3BpbmlvbnM/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
