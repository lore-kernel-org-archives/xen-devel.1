From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH SpectreV1+L1TF v4 03/11] config: introduce
 L1TF_LFENCE option
Date: Wed, 23 Jan 2019 13:44:03 +0000
Message-ID: <38cbf2d4-63fb-cafa-7007-cba7fee03786@arm.com>
References: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
 <1548244285-30813-4-git-send-email-nmanthey@amazon.de>
 <2e60f86f-8bf4-43dc-4343-8074667b6f6d@arm.com>
 <5C486E780200007800210705@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MDDu=P7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gmIpB-00064b-GV
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 13:44:13 +0000
In-Reply-To: <5C486E780200007800210705@prv1-mh.provo.novell.com>
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, nmanthey@amazon.de, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, David Woodhouse <dwmw@amazon.co.uk>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMjMvMDEvMjAxOSAxMzozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MjMuMDEuMTkgYXQgMTQ6MjQsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IE9uIDIz
LzAxLzIwMTkgMTE6NTEsIE5vcmJlcnQgTWFudGhleSB3cm90ZToKPj4+IC0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9ub3NwZWMuaAo+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL25vc3BlYy5oCj4+PiBA
QCAtNjgsMTAgKzY4LDE4IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBsZmVuY2VfdHJ1ZSh2b2lkKSB7
IHJldHVybiB0cnVlOyB9Cj4+PiAgICAjZW5kaWYKPj4+ICAgIAo+Pj4gICAgLyoKPj4+IC0gKiBw
cm90ZWN0IGV2YWx1YXRpb24gb2YgY29uZGl0aW9uYWwgd2l0aCByZXNwZWN0IHRvIHNwZWN1bGF0
aW9uCj4+PiArICogYWxsb3cgdG8gcHJvdGVjdCBldmFsdWF0aW9uIG9mIGNvbmRpdGlvbmFsIHdp
dGggcmVzcGVjdCB0byBzcGVjdWxhdGlvbiBvbiB4ODYKPj4+ICAgICAqLwo+Pj4gLSNkZWZpbmUg
ZXZhbHVhdGVfbm9zcGVjKGNvbmRpdGlvbikgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPj4+ICsjaWYgZGVmaW5lZChDT05GSUdfTDFURl9MRkVOQ0VfTk9ORSkgfHwgIWRl
ZmluZWQoQ09ORklHX1g4NikKPj4+ICsjZGVmaW5lIGV2YWx1YXRlX25vc3BlYyhjb25kaXRpb24p
IChjb25kaXRpb24pCj4+PiArI2VsaWYgZGVmaW5lZChDT05GSUdfTDFURl9MRkVOQ0VfQk9USCkK
Pj4+ICsjZGVmaW5lIGV2YWx1YXRlX25vc3BlYyhjb25kaXRpb24pICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCj4+PiAgICAgICAgKCgoY29uZGl0aW9uKSAmJiBsZmVu
Y2VfdHJ1ZSgpKSB8fCAhbGZlbmNlX3RydWUoKSkKPj4+ICsjZWxpZiBkZWZpbmVkKENPTkZJR19M
MVRGX0xGRU5DRV9UUlVFKQo+Pj4gKyNkZWZpbmUgZXZhbHVhdGVfbm9zcGVjKGNvbmRpdGlvbikg
KChjb25kaXRpb24pICYmIGxmZW5jZV90cnVlKCkpCj4+PiArI2VsaWYgZGVmaW5lZChDT05GSUdf
TDFURl9MRkVOQ0VfSU5URVJNRURJQVRFKQo+Pj4gKyNkZWZpbmUgZXZhbHVhdGVfbm9zcGVjKGNv
bmRpdGlvbikgKHsgYm9vbCByZXMgPSAoY29uZGl0aW9uKTsgcm1iKCk7IHJlczsgfSkKPj4gKyNl
bmRpZgo+Pgo+PiBOb25lIG9mIHRoZSBjb25maWdzIGFyZSBkZWZpbmVkIG9uIEFybSwgc28gY2Fu
IHRoaXMgYmUgbW92ZWQgaW4gYXJjaC14ODY/Cj4gCj4gVG8gYmUgaG9uZXN0IEknZCBsaWtlIHRv
IGF2b2lkIGludHJvZHVjaW5nIGFzbS9ub3NwZWMuaCBmb3IgdGhlIHRpbWUKPiBiZWluZy4KCkhv
dyBhYm91dCBhZGRpbmcgdGhlbSBpbiBzeXN0ZW0uaCBhcyB3ZSBkaWQgZm9yIGFycmF5X2luZGV4
X21hc2tfbm9zcGVjPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
