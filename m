From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v6 04/14] iommu: don't domain_crash() inside
 iommu_map/unmap_page()
Date: Tue, 4 Sep 2018 10:39:18 +0000
Message-ID: <42219eab0e8b452a82ed7d0a3fdc8c68@AMSPEX02CL03.citrite.net>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-5-paul.durrant@citrix.com>
 <5B8E608D02000078001E512D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kh5z=ls=citrix.com=prvs=7788b8ed3=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fx8jy-0008P6-Eo
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 10:39:22 +0000
In-Reply-To: <5B8E608D02000078001E512D@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMDQgU2VwdGVtYmVyIDIwMTggMTE6MzgKPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogSnVsaWVuIEdyYWxs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEFuZHJldyBDb29wZXIKPiA8QW5kcmV3LkNvb3BlcjNA
Y2l0cml4LmNvbT47IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+OyBHZW9yZ2UKPiBEdW5s
YXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBj
aXRyaXguY29tPjsKPiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+OyBLZXZp
biBUaWFuCj4gPGtldmluLnRpYW5AaW50ZWwuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPjsgeGVuLQo+IGRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsKPiA8a29ucmFkLndpbGtAb3JhY2xlLmNv
bT47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYg
MDQvMTRdIGlvbW11OiBkb24ndCBkb21haW5fY3Jhc2goKSBpbnNpZGUKPiBpb21tdV9tYXAvdW5t
YXBfcGFnZSgpCj4gCj4gPj4+IE9uIDIzLjA4LjE4IGF0IDExOjQ3LCA8cGF1bC5kdXJyYW50QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4gLS0tIGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCj4gPiAr
KysgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKPiA+IEBAIC0xMTU0LDYgKzExNTQsNyBAQCBt
YXBfZ3JhbnRfcmVmKAo+ID4gICAgICAgICAgfQo+ID4gICAgICAgICAgaWYgKCBlcnIgKQo+ID4g
ICAgICAgICAgewo+ID4gKyAgICAgICAgICAgIGRvbXVfY3Jhc2gobGQpOwo+ID4gICAgICAgICAg
ICAgIGRvdWJsZV9ndF91bmxvY2sobGd0LCByZ3QpOwo+IAo+IFlvdSBjcmFzaCB0aGUgZG9tYWlu
IHdpdGggYm90aCBsb2NrcyBoZWxkIGhlcmUsIGJ1dCAuLi4KPiAKPiA+IEBAIC0xNDA2LDcgKzE0
MDcsMTAgQEAgdW5tYXBfY29tbW9uKAo+ID4gICAgICAgICAgZG91YmxlX2d0X3VubG9jayhsZ3Qs
IHJndCk7Cj4gPgo+ID4gICAgICAgICAgaWYgKCBlcnIgKQo+ID4gKyAgICAgICAgewo+ID4gKyAg
ICAgICAgICAgIGRvbXVfY3Jhc2gobGQpOwo+ID4gICAgICAgICAgICAgIHJjID0gR05UU1RfZ2Vu
ZXJhbF9lcnJvcjsKPiA+ICsgICAgICAgIH0KPiAKPiAuLi4gb3V0c2lkZSBvZiB0aGUgbG9ja2Vk
IHJlZ2lvbiBoZXJlLiBJIHRoaW5rIHRoZSBsYXR0ZXIgaXMgZmluZSwgYW5kCj4gaGVuY2UgdGhl
IGZvcm1lciBzaG91bGQgYmUgY2hhbmdlZC4KClN1cmUuIFdpbGwgZG8uCgo+IAo+IFdpdGggdGhh
dAo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCgpUaGFu
a3MsCgogIFBhdWwKCj4gSmFuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
