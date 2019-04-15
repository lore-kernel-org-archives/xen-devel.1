From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 24/31] OvmfPkg/XenPlatformPei: Ignore
 missing PCI Host Bridge on Xen PVH
Date: Mon, 15 Apr 2019 14:37:43 +0100
Message-ID: <f2d0a2b3-57b0-79d3-ae19-137cf111253d@citrix.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-25-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6R5j=SR=citrix.com=prvs=00163ee2b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hG1nw-00019x-Ey
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 13:37:48 +0000
In-Reply-To: <20190409110844.14746-25-anthony.perard@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
Cc: Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>, Laszlo Ersek <lersek@redhat.com>, xen-devel@lists.xenproject.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDQvMjAxOSAxMjowOCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gZGlmZiAtLWdpdCBh
L092bWZQa2cvSW5jbHVkZS9Pdm1mUGxhdGZvcm1zLmggYi9Pdm1mUGtnL0luY2x1ZGUvT3ZtZlBs
YXRmb3Jtcy5oCj4gaW5kZXggY2M2N2Y0MGE4OC4uMWNlNzFlMThlYyAxMDA2NDQKPiAtLS0gYS9P
dm1mUGtnL0luY2x1ZGUvT3ZtZlBsYXRmb3Jtcy5oCj4gKysrIGIvT3ZtZlBrZy9JbmNsdWRlL092
bWZQbGF0Zm9ybXMuaAo+IEBAIC00Myw0ICs0MywxMCBAQAo+ICAvLwo+ICAjZGVmaW5lIEFDUElf
VElNRVJfT0ZGU0VUIDB4OAo+ICAKPiArLy8KPiArLy8gV2hlbiBydW5uaW5nIE9WTUYgb24gYSBY
ZW4gUFZIIGd1ZXN0IHRoZXJlIGlzIG5vIFBDSSwKPiArLy8gc28gLTEgaXMgcmV0dXJuIGZvciB0
aGUgSG9zdCBCcmlkZ2UgRGV2aWNlIElELgo+ICsvLwo+ICsjZGVmaW5lIFhFTl9QVkhfUENJX0hP
U1RfQlJJREdFX0RFVklDRV9JRCAweEZGRkYKClRoaXMgaXNuJ3QgYW55dGhpbmcgWGVuIHNwZWNp
ZmljIC0gaXQgaXMgYSBwcm9wZXJ0eSBvZiBob3cgUENJIGNvbmZpZwpjeWNsZXMgd29yay4KCj4g
Kwo+ICAjZW5kaWYKPiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9y
bS5jIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5jCj4gaW5kZXggNWU2ZDU1M2Fk
NS4uZDkxY2Q5OGJmNCAxMDA2NDQKPiAtLS0gYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRm
b3JtLmMKPiArKysgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmMKPiBAQCAtMjc4
LDYgKzI3OCwxMyBAQCBNaXNjSW5pdGlhbGl6YXRpb24gKAo+ICAgICAgICBBY3BpRW5CaXQgID0g
SUNIOV9BQ1BJX0NOVExfQUNQSV9FTjsKPiAgICAgICAgYnJlYWs7Cj4gICAgICBkZWZhdWx0Ogo+
ICsgICAgICBpZiAoWGVuUHZoRGV0ZWN0ZWQgKCkpIHsKPiArICAgICAgICAvLwo+ICsgICAgICAg
IC8vIFRoZXJlIGlzIG5vIFBDSSBidXMgaW4gdGhpcyBjYXNlCj4gKyAgICAgICAgLy8KPiArICAg
ICAgICBQY2RTZXQxNlMgKFBjZE92bWZIb3N0QnJpZGdlUGNpRGV2SWQsIFhFTl9QVkhfUENJX0hP
U1RfQlJJREdFX0RFVklDRV9JRCk7CgpUaGlzIGlzIG5vdCBjb3JyZWN0LgoKVGhlcmUgbWF5IGJl
IG5vIFBDSSBidXMsIGFuZCBPVk1GIG5lZWRzIHRvIGNvcGUgd2l0aCB0aGlzIGNhc2UsIGJ1dAp0
aGVyZSBtYXkgYWxzbyBiZSBvbmUgKGVzcGVjaWFsbHkgb25jZSB3ZSBnZXQgYXJvdW5kIHRvIG1h
a2luZyBQQ0kKUGFzc3Rocm91Z2ggd29yayB3aXRoIFBWSCBndWVzdHMpLsKgIFRoYXQgY2FzZSBu
ZWVkcyB0byB3b3JrIHRvby4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
