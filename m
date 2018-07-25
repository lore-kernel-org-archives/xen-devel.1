From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v6] automation: introduce a script for build
 test
Date: Wed, 25 Jul 2018 16:08:39 +0100
Message-ID: <20180725150838.2jsv5lyjhizkzbjy@citrix.com>
References: <20180725092424.31707-1-wei.liu2@citrix.com>
 <20180725135432.wgg7iwe6tsfs72fq@doug-macbook.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m8ai=kj=citrix.com=prvs=737e41906=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fiLPF-0003BP-9d
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 15:08:49 +0000
Content-Disposition: inline
In-Reply-To: <20180725135432.wgg7iwe6tsfs72fq@doug-macbook.localdomain>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMjUsIDIwMTggYXQgMDg6NTQ6MzJBTSAtMDUwMCwgRG91ZyBHb2xkc3RlaW4g
d3JvdGU6Cj4gT24gV2VkLCBKdWwgMjUsIDIwMTggYXQgMTA6MjQ6MjRBTSArMDEwMCwgV2VpIExp
dSB3cm90ZToKPiA+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5j
aXRyaXguY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KPiA+IC0tLQo+ID4gVGhpcyBpcyBhIHNjcmlwdCBJIHdyb3RlIHByZXZpb3VzbHkgZm9yIGJ1
aWxkIHRlc3QuCj4gPiAKPiA+IEdpdmVuIGl0IGJhc2ljYWxseSBydW5zIGEgc2V0IG9mIGNvbW1h
bmRzIG9uIGV2ZXJ5IGNvbW1pdCwgbWF5YmUgaXQgc2hvdWxkCj4gPiBiZSBuYW1lZCBmb3ItZWFj
aC1jb21taXQuc2ggPwo+IAo+IFNvIGlmIHdlIGRvIHRoYXQgY2FuIHdlIG1ha2UgaXQgY2xlYXIg
dGhhdCB0aGVyZSdzIGEgZGVmYXVsdCBhY3Rpb24KPiB0aGF0J3MgZ29pbmcgdG8gYmUgcnVuPyBN
ZW50YWxseSBJJ2QgZXhwZWN0IGEgc2NyaXB0IGNhbGxlZCBsaWtlIHRoYXQKPiB3b3VsZCByZXF1
aXJlIGEgY29tbWFuZCB0aGF0IGl0IHdvdWxkIGV4ZWN1dGUgYnV0IHlvdSBkbyBoYXZlIGEgZGVm
YXVsdC4KPiAKCkkgdGhpbmsgSSB3aWxsIGtlZXAgdGhlIG9sZCBuYW1lIGZvciBub3cuIFNlZSBt
eSByZXBseSB0byBHZW9yZ2UuCgo+ID4gKwo+ID4gK3doaWxlIHJlYWQgbnVtIHJldjsgZG8KPiA+
ICsgICAgZWNobyAiVGVzdGluZyAkbnVtICRyZXYiCj4gPiArCj4gPiArICAgIGdpdCBjaGVja291
dCAkcmV2Cj4gPiArICAgIHJldD0kPwo+ID4gKyAgICBpZiB0ZXN0ICRyZXQgLW5lIDA7IHRoZW4K
PiA+ICsgICAgICAgIGVjaG8gIkZhaWxlZCB0byBjaGVja291dCAkbnVtICRyZXYgd2l0aCAkcmV0
Igo+ID4gKyAgICAgICAgYnJlYWsKPiA+ICsgICAgZmkKPiA+ICsKPiA+ICsgICAgaWYgdGVzdCAk
IyAtZXEgMCA7IHRoZW4KPiA+ICsgICAgICAgIGdpdCBjbGVhbiAtZmR4ICYmIC4vY29uZmlndXJl
ICYmIG1ha2UgLWo0Cj4gCj4gbWF5YmUgc29tZSBjb21tZW50IGluIHRoZSBjb2RlIGxpa2UgImhl
eSBzb21lb25lIHJlYWRpbmcgbWUgdGhpcyBpcyB0aGUKPiBkZWZhdWx0IGNvbW1hbmQiCj4gCgpJ
IHdvdWxkIGFkZCB0aGUgZm9sbG93aW5nIHRvIHRoZSBzY3JpcHQgdXNhZ2Ugb3V0cHV0IGF0IHRo
ZSBiZWdpbm5pbmcuCgogIGVjaG8gIklmIFtDTURdIGlzIG5vdCBzcGVjaWZpZWQsIHJ1biB0aGUg
ZGVmYXVsdCBjb21tYW5kIGBnaXQgY2xlYW4gLWZkeCAmJiAuL2NvbmZpZ3VyZSAmJiBtYWtlIC1q
NGAiCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
