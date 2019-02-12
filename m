From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v6 5/9] nospec: introduce
 evaluate_nospec
Date: Tue, 12 Feb 2019 06:50:36 -0700
Message-ID: <5C62CF2C0200007800215F03@prv1-mh.provo.novell.com>
References: <1c2b8322-1b66-ccc6-9ba9-e86eafb0227a@amazon.de>
 <1549633489-12724-1-git-send-email-nmanthey@amazon.de>
 <1549633489-12724-6-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <0101E7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <5C532AC00200007800212EA2@prv1-mh.provo.novell.com>
 <A18FF6C80200006BB1E090C7@prv1-mh.provo.novell.com>
 <01CCAAAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <01CFEAAF02000039B1E090C7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gtYSR-0002wU-4J
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 13:50:43 +0000
In-Reply-To: <01CFEAAF02000039B1E090C7@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjAyLjE5IGF0IDE0OjQ0LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ub3NwZWMuaAo+IEBAIC0w
LDAgKzEsMzkgQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPiAr
LyogQ29weXJpZ2h0IDIwMTggQW1hem9uLmNvbSwgSW5jLiBvciBpdHMgYWZmaWxpYXRlcy4gQWxs
IFJpZ2h0cyBSZXNlcnZlZC4gCj4gKi8KPiArCj4gKyNpZm5kZWYgX0FTTV9YODZfTk9TUEVDX0gK
PiArI2RlZmluZSBfQVNNX1g4Nl9OT1NQRUNfSAo+ICsKPiArI2luY2x1ZGUgPGFzbS9hbHRlcm5h
dGl2ZS5oPgo+ICsjaW5jbHVkZSA8YXNtL3N5c3RlbS5oPgo+ICsKPiArLyogQWxsb3cgdG8gaW5z
ZXJ0IGEgcmVhZCBtZW1vcnkgYmFycmllciBpbnRvIGNvbmRpdGlvbmFscyAqLwo+ICtzdGF0aWMg
YWx3YXlzX2lubGluZSBib29sIGFyY2hfYmFycmllcl9ub3NwZWNfdHJ1ZSh2b2lkKQoKTm93IHRo
YXQgdGhpcyBpcyB4ODYtc3BlY2lmaWMgKGFuZCBub3QgdXNlZCBieSBjb21tb24gY29kZSksCkkg
ZG9uJ3QgdGhpbmsgdGhlIGFyY2hfIHByZWZpeCBpcyB3YXJyYW50ZWQgYW55bW9yZS4KCj4gK3sK
PiArI2lmIGRlZmluZWQoQ09ORklHX0hWTSkKCkhlcmUgYW5kIGJlbG93IEknZCBwcmVmZXIgaWYg
eW91IHVzZWQgdGhlIHNob3J0ZXIgI2lmZGVmLgoKPiArICAgIGFsdGVybmF0aXZlKCIiLCAibGZl
bmNlIiwgWDg2X0ZFQVRVUkVfU0NfTDFURl9WVUxOKTsKPiArI2VuZGlmCj4gKyAgICByZXR1cm4g
dHJ1ZTsKPiArfQo+ICsKPiArLyogQWxsb3cgdG8gcHJvdGVjdCBldmFsdWF0aW9uIG9mIGNvbmRp
dGlvbmFhc2wgd2l0aCByZXNwZWN0IHRvIHNwZWN1bGF0aW9uIAo+ICovCj4gKyNpZiBkZWZpbmVk
KENPTkZJR19IVk0pCj4gKyNkZWZpbmUgZXZhbHVhdGVfbm9zcGVjKGNvbmRpdGlvbikgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICgoY29uZGl0aW9uKSA/
IGFyY2hfYmFycmllcl9ub3NwZWNfdHJ1ZSgpIDogIWFyY2hfYmFycmllcl9ub3NwZWNfdHJ1ZSgp
KQo+ICsjZWxzZQo+ICsjZGVmaW5lIGV2YWx1YXRlX25vc3BlYyhjb25kaXRpb24pIChjb25kaXRp
b24pCj4gKyNlbmRpZgo+ICsKPiArLyogQWxsb3cgdG8gYmxvY2sgc3BlY3VsYXRpdmUgZXhlY3V0
aW9uIGluIGdlbmVyaWMgY29kZSAqLwo+ICsjZGVmaW5lIGJsb2NrX3NwZWN1bGF0aW9uKCkgKHZv
aWQpYXJjaF9iYXJyaWVyX25vc3BlY190cnVlKCkKCkknbSBwcmV0dHkgc3VyZSB0aGF0IEkgZGlk
IHBvaW50IG91dCBiZWZvcmUgdGhhdCB0aGlzIGxhY2tzIGFuCm91dGVyIHBhaXIgb2YgcGFyZW50
aGVzZXMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
