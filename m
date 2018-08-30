From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 17/23] x86/mm: put
 paging_update_nestedmode under CONFIG_HVM
Date: Thu, 30 Aug 2018 02:35:37 -0600
Message-ID: <5B87AC5902000078001E36A7@prv1-mh.provo.novell.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <4f2a5de72552edce4bafe5d049ee89a18531ed1f.1535285866.git-series.wei.liu2@citrix.com>
 <5B8528ED02000078001E2870@prv1-mh.provo.novell.com>
 <20180830074226.qfcxcwllii4cyanz@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wyq4=ln=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fvIQW-0001Nx-56
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 08:35:40 +0000
In-Reply-To: <20180830074226.qfcxcwllii4cyanz@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA4LjE4IGF0IDA5OjQyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBBdWcgMjgsIDIwMTggYXQgMDQ6NTA6MjFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAyNi4wOC4xOCBhdCAxNDoxOSwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wYWdpbmcuYwo+PiA+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9tbS9wYWdpbmcuYwo+PiA+IEBAIC05MTksNiArOTE5LDcgQEAgY29uc3Qgc3RydWN0
IHBhZ2luZ19tb2RlICpwYWdpbmdfZ2V0X21vZGUoc3RydWN0IHZjcHUgCj4gKnYpCj4+ID4gICAg
ICByZXR1cm4gcGFnaW5nX2dldF9uZXN0ZWRtb2RlKHYpOwo+PiA+ICB9Cj4+ID4gIAo+PiA+ICsj
aWZkZWYgQ09ORklHX0hWTQo+PiA+ICB2b2lkIHBhZ2luZ191cGRhdGVfbmVzdGVkbW9kZShzdHJ1
Y3QgdmNwdSAqdikKPj4gPiAgewo+PiA+ICAgICAgQVNTRVJUKG5lc3RlZGh2bV9lbmFibGVkKHYt
PmRvbWFpbikpOwo+PiA+IEBAIC05MzAsNiArOTMxLDcgQEAgdm9pZCBwYWdpbmdfdXBkYXRlX25l
c3RlZG1vZGUoc3RydWN0IHZjcHUgKnYpCj4+ID4gICAgICAgICAgdi0+YXJjaC5wYWdpbmcubmVz
dGVkbW9kZSA9IE5VTEw7Cj4+ID4gICAgICBodm1fYXNpZF9mbHVzaF92Y3B1KHYpOwo+PiA+ICB9
Cj4+ID4gKyNlbmRpZgo+PiAKPj4gSnVzdCBhIGNvbnNpZGVyYXRpb24gKG5vIG9iamVjdGlvbik6
IFdvdWxkIGl0IGJlIHdvcnRod2hpbGUgdG8KPj4gaW50cm9kdWNlIENPTkZJR19ORVNURURfSFZN
IGF0IHRoZSBzYW1lIHRpbWUgKGZvciBub3cgaGFyZAo+PiBjb2RlZCB0byBZLCBhbmQgb2YgY291
cnNlIGRlcGVuZGluZyBvbiBIVk0pIHRvIGF2b2lkIGhhdmluZyB0bwo+PiB0b3VjaCBhbGwgc3Vj
aCBwbGFjZXMgYSBzZWNvbmQgdGltZSBsYXRlciBvbj8KPiAKPiBJZiB3ZSBwbGFuIHRvIG1ha2Ug
bmVzdGVkIGh2bSBjb25maWd1cmFibGUgaW4gdGhlIGZ1dHVyZSwgdGhhdCB3b3VsZCBiZQo+IGEg
d29ydGh3aGlsZSB0aGluZyB0byBkbzsgb3RoZXJ3aXNlIGl0IGlzIGp1c3QgYW5vdGhlciBjb25j
ZXB0IHRoYXQKPiB1c2VycyBuZWVkIHRvIGNhcmUgYWJvdXQsIHdoaWNoIGNyZWF0ZXMgc29tZSBt
ZW50YWwgYnVyZGVuLgoKQW5kcmV3LCBkbyB5b3UgaGF2ZSBhbnkgb3BpbmlvbiAvIHByZWZlcmVu
Y2UgZWl0aGVyIHdheT8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
