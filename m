From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 6/6] drop "domain_" prefix from struct
 domain's dirty CPU mask
Date: Mon, 22 Jan 2018 03:06:46 -0700
Message-ID: <5A65C5C602000078001A0F7B@prv-mh.provo.novell.com>
References: <5A62238B02000078001A0768@prv-mh.provo.novell.com>
 <5A6225C902000078001A07D8@prv-mh.provo.novell.com>
 <2721e560-8e55-4626-94e0-22103730c480@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=cwx6=er=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1edZ0C-0005iB-R1
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 10:06:56 +0000
In-Reply-To: <2721e560-8e55-4626-94e0-22103730c480@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, GeorgeDunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAxLjE4IGF0IDE4OjU2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTkvMDEvMTggMTY6MDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiAtLS0gYS94ZW4v
YXJjaC94ODYvbW0uYwo+PiArKysgYi94ZW4vYXJjaC94ODYvbW0uYwo+PiBAQCAtMzMyNyw3ICsz
MzI3LDcgQEAgbG9uZyBkb19tbXVleHRfb3AoCj4+ICAgICAgICAgICAgICBpZiAoIHVubGlrZWx5
KGN1cnJkICE9IHBnX293bmVyKSApCj4+ICAgICAgICAgICAgICAgICAgcmMgPSAtRVBFUk07Cj4+
ICAgICAgICAgICAgICBlbHNlIGlmICggX19hZGRyX29rKG9wLmFyZzEubGluZWFyX2FkZHIpICkK
Pj4gLSAgICAgICAgICAgICAgICBmbHVzaF90bGJfb25lX21hc2soY3VycmQtPmRvbWFpbl9kaXJ0
eV9jcHVtYXNrLAo+PiArICAgICAgICAgICAgICAgIGZsdXNoX3RsYl9vbmVfbWFzayhjdXJyZC0+
ZGlydHlfY3B1bWFzaywKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb3Au
YXJnMS5saW5lYXJfYWRkcik7Cj4+ICAgICAgICAgICAgICBicmVhazsKPj4gIAo+PiAtLS0gYS94
ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9z
aGFkb3cvY29tbW9uLmMKPj4gQEAgLTM2MzksNyArMzYzOSw3IEBAIHN0YXRpYyB2b2lkIHNoX3Vu
c2hhZG93X2Zvcl9wMm1fY2hhbmdlKHMKPj4gICAgICAgICAgICAgICAgICAgICAgaWYgKCBzaF9y
ZW1vdmVfYWxsX21hcHBpbmdzKGQsIG9tZm4sCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBfZ2ZuKGdmbiArIChpIDw8IFBBR0VfU0hJRlQpKSkgKQo+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgY3B1bWFza19vcigmZmx1c2htYXNrLCAmZmx1c2ht
YXNrLAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkLT5kb21haW5fZGly
dHlfY3B1bWFzayk7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGQtPmRp
cnR5X2NwdW1hc2spOwo+PiAgICAgICAgICAgICAgICAgIH0KPj4gICAgICAgICAgICAgICAgICBv
bWZuID0gX21mbihtZm5feChvbWZuKSArIDEpOwo+PiAgICAgICAgICAgICAgfQo+Pgo+IAo+IENh
biBlaXRoZXIgb2YgdGhlc2UgaHVua3MgYmUgcmUtZmxvd2VkIG9udG8gYSBzaW5nbGUgbGluZT8K
CkJhcmVseSBzbywgYnV0IHllcyAtIGRvbmUuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
