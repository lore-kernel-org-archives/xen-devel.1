From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v4 03/11] config: introduce
 L1TF_LFENCE option
Date: Wed, 23 Jan 2019 07:45:47 -0700
Message-ID: <5C487E1B020000780021078C@prv1-mh.provo.novell.com>
References: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
 <1548244285-30813-4-git-send-email-nmanthey@amazon.de>
 <2e60f86f-8bf4-43dc-4343-8074667b6f6d@arm.com>
 <5C486E780200007800210705@prv1-mh.provo.novell.com>
 <38cbf2d4-63fb-cafa-7007-cba7fee03786@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gmJmr-00039e-1v
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 14:45:53 +0000
In-Reply-To: <38cbf2d4-63fb-cafa-7007-cba7fee03786@arm.com>
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, nmanthey@amazon.de, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, David Woodhouse <dwmw@amazon.co.uk>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAxLjE5IGF0IDE0OjQ0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDIzLzAxLzIwMTkgMTM6MzksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyMy4wMS4x
OSBhdCAxNDoyNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IE9uIDIzLzAxLzIw
MTkgMTE6NTEsIE5vcmJlcnQgTWFudGhleSB3cm90ZToKPj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94
ZW4vbm9zcGVjLmgKPj4+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbm9zcGVjLmgKPj4+PiBAQCAt
NjgsMTAgKzY4LDE4IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBsZmVuY2VfdHJ1ZSh2b2lkKSB7IHJl
dHVybiB0cnVlOyB9Cj4+Pj4gICAgI2VuZGlmCj4+Pj4gICAgCj4+Pj4gICAgLyoKPj4+PiAtICog
cHJvdGVjdCBldmFsdWF0aW9uIG9mIGNvbmRpdGlvbmFsIHdpdGggcmVzcGVjdCB0byBzcGVjdWxh
dGlvbgo+Pj4+ICsgKiBhbGxvdyB0byBwcm90ZWN0IGV2YWx1YXRpb24gb2YgY29uZGl0aW9uYWwg
d2l0aCByZXNwZWN0IHRvIHNwZWN1bGF0aW9uIG9uIHg4Ngo+Pj4+ICAgICAqLwo+Pj4+IC0jZGVm
aW5lIGV2YWx1YXRlX25vc3BlYyhjb25kaXRpb24pICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4+Pj4gKyNpZiBkZWZpbmVkKENPTkZJR19MMVRGX0xGRU5DRV9OT05FKSB8
fCAhZGVmaW5lZChDT05GSUdfWDg2KQo+Pj4+ICsjZGVmaW5lIGV2YWx1YXRlX25vc3BlYyhjb25k
aXRpb24pIChjb25kaXRpb24pCj4+Pj4gKyNlbGlmIGRlZmluZWQoQ09ORklHX0wxVEZfTEZFTkNF
X0JPVEgpCj4+Pj4gKyNkZWZpbmUgZXZhbHVhdGVfbm9zcGVjKGNvbmRpdGlvbikgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+PiAgICAgICAgKCgoY29uZGl0aW9u
KSAmJiBsZmVuY2VfdHJ1ZSgpKSB8fCAhbGZlbmNlX3RydWUoKSkKPj4+PiArI2VsaWYgZGVmaW5l
ZChDT05GSUdfTDFURl9MRkVOQ0VfVFJVRSkKPj4+PiArI2RlZmluZSBldmFsdWF0ZV9ub3NwZWMo
Y29uZGl0aW9uKSAoKGNvbmRpdGlvbikgJiYgbGZlbmNlX3RydWUoKSkKPj4+PiArI2VsaWYgZGVm
aW5lZChDT05GSUdfTDFURl9MRkVOQ0VfSU5URVJNRURJQVRFKQo+Pj4+ICsjZGVmaW5lIGV2YWx1
YXRlX25vc3BlYyhjb25kaXRpb24pICh7IGJvb2wgcmVzID0gKGNvbmRpdGlvbik7IHJtYigpOyBy
ZXM7IH0pCj4+PiArI2VuZGlmCj4+Pgo+Pj4gTm9uZSBvZiB0aGUgY29uZmlncyBhcmUgZGVmaW5l
ZCBvbiBBcm0sIHNvIGNhbiB0aGlzIGJlIG1vdmVkIGluIGFyY2gteDg2Pwo+PiAKPj4gVG8gYmUg
aG9uZXN0IEknZCBsaWtlIHRvIGF2b2lkIGludHJvZHVjaW5nIGFzbS9ub3NwZWMuaCBmb3IgdGhl
IHRpbWUKPj4gYmVpbmcuCj4gCj4gSG93IGFib3V0IGFkZGluZyB0aGVtIGluIHN5c3RlbS5oIGFz
IHdlIGRpZCBmb3IgYXJyYXlfaW5kZXhfbWFza19ub3NwZWM/CgpUbyB0ZWxsIHlvdSB0aGUgdHJ1
dGgsIHRoYXQncyB3aGVyZSBOb3JiZXJ0IGhhZCBpdCBvcmlnaW5hbGx5LgpJIHRoaW5rIHRoYXQn
cyBub3QgdGhlIHJpZ2h0IHBsYWNlIHRob3VnaCAoYWxzbyBmb3IKYXJyYXlfaW5kZXhfbWFza19u
b3NwZWMoKSkuIEJ1dCBJJ2xsIGxpc3RlbiB0byBhIG1ham9yaXR5CnRoaW5raW5nIGRpZmZlcmVu
dGx5LCBhdCBsZWFzdCBhcyBmYXIgYXMgd2hhdCBpcyBjdXJyZW50bHkKbGZlbmNlX3RydWUoKSBn
b2VzLiBldmFsdWF0ZV9ub3NwZWMoKSwgb3RvaCwgYmVsb25ncyB3aGVyZQppdCBpcyBub3csIEkg
dGhpbmsuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
