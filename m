From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v4 03/11] config: introduce
 L1TF_LFENCE option
Date: Wed, 23 Jan 2019 06:39:04 -0700
Message-ID: <5C486E780200007800210705@prv1-mh.provo.novell.com>
References: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
 <1548244285-30813-4-git-send-email-nmanthey@amazon.de>
 <2e60f86f-8bf4-43dc-4343-8074667b6f6d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gmIkH-00059h-Bx
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 13:39:09 +0000
In-Reply-To: <2e60f86f-8bf4-43dc-4343-8074667b6f6d@arm.com>
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

Pj4+IE9uIDIzLjAxLjE5IGF0IDE0OjI0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDIzLzAxLzIwMTkgMTE6NTEsIE5vcmJlcnQgTWFudGhleSB3cm90ZToKPj4gLS0tIGEveGVu
L2luY2x1ZGUveGVuL25vc3BlYy5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9ub3NwZWMuaAo+
PiBAQCAtNjgsMTAgKzY4LDE4IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBsZmVuY2VfdHJ1ZSh2b2lk
KSB7IHJldHVybiB0cnVlOyB9Cj4+ICAgI2VuZGlmCj4+ICAgCj4+ICAgLyoKPj4gLSAqIHByb3Rl
Y3QgZXZhbHVhdGlvbiBvZiBjb25kaXRpb25hbCB3aXRoIHJlc3BlY3QgdG8gc3BlY3VsYXRpb24K
Pj4gKyAqIGFsbG93IHRvIHByb3RlY3QgZXZhbHVhdGlvbiBvZiBjb25kaXRpb25hbCB3aXRoIHJl
c3BlY3QgdG8gc3BlY3VsYXRpb24gb24geDg2Cj4+ICAgICovCj4+IC0jZGVmaW5lIGV2YWx1YXRl
X25vc3BlYyhjb25kaXRpb24pICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4+ICsjaWYgZGVmaW5lZChDT05GSUdfTDFURl9MRkVOQ0VfTk9ORSkgfHwgIWRlZmluZWQoQ09O
RklHX1g4NikKPj4gKyNkZWZpbmUgZXZhbHVhdGVfbm9zcGVjKGNvbmRpdGlvbikgKGNvbmRpdGlv
bikKPj4gKyNlbGlmIGRlZmluZWQoQ09ORklHX0wxVEZfTEZFTkNFX0JPVEgpCj4+ICsjZGVmaW5l
IGV2YWx1YXRlX25vc3BlYyhjb25kaXRpb24pICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4+ICAgICAgICgoKGNvbmRpdGlvbikgJiYgbGZlbmNlX3RydWUoKSkgfHwg
IWxmZW5jZV90cnVlKCkpCj4+ICsjZWxpZiBkZWZpbmVkKENPTkZJR19MMVRGX0xGRU5DRV9UUlVF
KQo+PiArI2RlZmluZSBldmFsdWF0ZV9ub3NwZWMoY29uZGl0aW9uKSAoKGNvbmRpdGlvbikgJiYg
bGZlbmNlX3RydWUoKSkKPj4gKyNlbGlmIGRlZmluZWQoQ09ORklHX0wxVEZfTEZFTkNFX0lOVEVS
TUVESUFURSkKPj4gKyNkZWZpbmUgZXZhbHVhdGVfbm9zcGVjKGNvbmRpdGlvbikgKHsgYm9vbCBy
ZXMgPSAoY29uZGl0aW9uKTsgcm1iKCk7IHJlczsgfSkKPiArI2VuZGlmCj4gCj4gTm9uZSBvZiB0
aGUgY29uZmlncyBhcmUgZGVmaW5lZCBvbiBBcm0sIHNvIGNhbiB0aGlzIGJlIG1vdmVkIGluIGFy
Y2gteDg2PwoKVG8gYmUgaG9uZXN0IEknZCBsaWtlIHRvIGF2b2lkIGludHJvZHVjaW5nIGFzbS9u
b3NwZWMuaCBmb3IgdGhlIHRpbWUKYmVpbmcuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
