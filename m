From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/compat: fix compilation errors with
	clang 6
Date: Tue, 23 Jan 2018 13:54:06 +0000
Message-ID: <20180123135406.5rwdpzln7wosis2o@MacBook-Pro-de-Roger.local>
References: <20180123123824.69979-1-roger.pau@citrix.com>
 <5A67480402000078001A190D@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=mf4d=es=citrix.com=prvs=55426a86e=roger.pau@srs-us1.protection.inumbo.net>)
 id 1edz1r-0006z9-HB
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 13:54:23 +0000
Content-Disposition: inline
In-Reply-To: <5A67480402000078001A190D@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMjMsIDIwMTggYXQgMDY6MzQ6NDRBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIzLjAxLjE4IGF0IDEzOjM4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gRml4IHRoaXMgYnkgdXNpbmcgcHJhZ21hIHB1c2gvcG9wIGluIG9yZGVyIHRvIHN0
b3JlIHRoZSBjdXJyZW50IHByYWdtYQo+ID4gdmFsdWUgaW4gdGhlIGNvbXBpbGVyIHN0YWNrIGFu
ZCBsYXRlciByZXN0b3JpbmcgaXQuCj4gCj4gRm9yIExpbnV4IHRoaXMgaXMgZmluZSBhbGwgdGhl
IHdheSBiYWNrIHRvIGdjYyA0LjEgYWZhaWN0LCBidXQgd2hhdAo+IGFib3V0IG90aGVyIE9TZXMg
dXNpbmcgZ2NjPyBJbiA0LjEsIG9ubHkgY29uZmlnL2xpbnV4LmggYW5kIGEgZmV3Cj4gc3BlY2lh
bCBjb25maWcvaTM4Ni8qLmggZGVmaW5lIHRoZSBuZWNlc3NhcnkgbWFjcm8KPiAoSEFORExFX1BS
QUdNQV9QQUNLX1BVU0hfUE9QKS4KCk9LLCB0aGVuIEkgaGF2ZSB0aGUgZm9sbG93aW5nIHZlcnNp
b246CgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvTWFrZWZpbGUgYi94ZW4vaW5jbHVkZS9NYWtl
ZmlsZQppbmRleCAxMjk5YjE5NjJmLi4xOTA2NmEzM2EwIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVk
ZS9NYWtlZmlsZQorKysgYi94ZW4vaW5jbHVkZS9NYWtlZmlsZQpAQCAtMzUsOCArMzUsMTMgQEAg
Y3BwZmxhZ3MteSAgICAgICAgICAgICAgICA6PSAtaW5jbHVkZSBwdWJsaWMveGVuLWNvbXBhdC5o
IC1EWEVOX0dFTkVSQVRJTkdfQ09NUEEKIGNwcGZsYWdzLSQoQ09ORklHX1g4NikgICAgKz0gLW0z
MgogCiAjIDgtYnl0ZSB0eXBlcyBhcmUgNC1ieXRlIGFsaWduZWQgb24geDg2XzMyIC4uLgoraWZl
cSAoJChjbGFuZykseSkKK3ByZWZpeC0kKENPTkZJR19YODYpICAgICAgOj0gXCNwcmFnbWEgcGFj
ayhwdXNoLCA0KQorc3VmZml4LSQoQ09ORklHX1g4NikgICAgICA6PSBcI3ByYWdtYSBwYWNrKHBv
cCkKK2Vsc2UKIHByZWZpeC0kKENPTkZJR19YODYpICAgICAgOj0gXCNwcmFnbWEgcGFjayg0KQog
c3VmZml4LSQoQ09ORklHX1g4NikgICAgICA6PSBcI3ByYWdtYSBwYWNrKCkKK2VuZGlmCiAKIGVu
ZGlmCiAKClNpbmNlIEFUTSB0aGF0J3MgYSBjbGFuZyBvbmx5IGlzc3VlIEkgZ3Vlc3Mgd2UgY2Fu
IGxlYXZlIGl0IGxpa2UgdGhhdC4KSSdtIG5vdCBhd2FyZSBvZiBhbnl3YXkgdG8ga25vdyB3aGV0
aGVyIHRoZSBjb21waWxlciBzdXBwb3J0cyBwcmFnbWEKcGFjayB3aXRoIHBzdWgvcG9wLgoKTGV0
IG1lIGtub3cgaWYgdGhhdCdzIGZpbmUgYW5kIEkgd2lsbCBzZW5kIG91dCBhIGZvcm1hbCB2Mi4K
ClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
