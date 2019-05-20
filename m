From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 03/14] xen/x86: Make mfn_to_gfn typesafe
Date: Mon, 20 May 2019 16:13:44 +0100
Message-ID: <423c2750-ca33-501f-cdc2-988bb58038b6@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-4-julien.grall@arm.com>
 <5CD5620E020000780022D7CF@prv1-mh.provo.novell.com>
 <4cef7816-74da-b6e6-6f7d-e327edb083da@arm.com>
 <5CD57B78020000780022D888@prv1-mh.provo.novell.com>
 <b0dc05a5-3b2e-669a-a955-1a543b3e7581@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DuAc=TU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hSjz2-0003bB-8q
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 15:13:48 +0000
In-Reply-To: <b0dc05a5-3b2e-669a-a955-1a543b3e7581@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMC8wNS8yMDE5IDE0OjI1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gCj4gCj4gT24g
MTAvMDUvMjAxOSAxNDoyNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDEwLjA1LjE5IGF0
IDE1OjAyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pgo+Pj4KPj4+IE9uIDEwLzA1
LzIwMTkgMTI6MzUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDA3LjA1LjE5IGF0IDE3
OjE0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+PiAtLS0gYS94ZW4vYXJjaC94
ODYvbW0vc2hhZG93L2NvbW1vbi5jCj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cv
Y29tbW9uLmMKPj4+Pj4gQEAgLTQ3NCw3ICs0NzQsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdHJh
Y2VfcmVzeW5jKGludCBldmVudCwgbWZuX3QgZ21mbikKPj4+Pj4gwqDCoMKgwqDCoMKgIGlmICgg
dGJfaW5pdF9kb25lICkKPj4+Pj4gwqDCoMKgwqDCoMKgIHsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLyogQ29udmVydCBnbWZuIHRvIGdmbiAqLwo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgdW5z
aWduZWQgbG9uZyBnZm4gPSBtZm5fdG9fZ2ZuKGN1cnJlbnQtPmRvbWFpbiwgZ21mbik7Cj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGdmbiA9IGdmbl94KG1mbl90b19nZm4oY3Vy
cmVudC0+ZG9tYWluLCBnbWZuKSk7Cj4+Pj4+ICsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAg
X190cmFjZV92YXIoZXZlbnQsIDAvKiF0c2MqLywgc2l6ZW9mKGdmbiksICZnZm4pOwo+Pj4+PiDC
oMKgwqDCoMKgwqAgfQo+Pj4+Cj4+Pj4gQ2FuJ3QgeW91IHVzZSBnZm5fdCBoZXJlLCBhbmQgaGVu
Y2UgYXZvaWQgdGhlIGdmbl94KCk/IFNhbWUgYWdhaW4gZnVydGhlcgo+Pj4+IGRvd24uCj4+PiBC
ZWNhdXNlIF9fdHJhY2VfdmFyIHdpbGwgZXhwb3J0IHRoZSB2YWx1ZSB0byB0aGUgZ3Vlc3QuIEkg
d2Fzbid0IHN1cmUKPj4+IHdoZXRoZXIgd2UKPj4+IGNhbiBzYWZlbHkgY29uc2lkZXIgdGhhdCBn
Zm5fdCBpcyBleGFjdGx5IHRoZSBzYW1lIGFzIHVuc2lnbmVkIGxvbmcgaW4KPj4+IGRlYnVnLWJ1
aWxkLgo+Pgo+PiBIbW0sIHdlbGwgLSBzZWUgdGhlIGRlZmluaXRpb24gb2YgZ2ZuX3QuIEdlb3Jn
ZSwgd2hhdCBkbyB5b3UgdGhpbms/Cj4gCj4gSSBrbm93IHdoYXQncyB0aGUgY3VycmVudCBkZWZp
bml0aW9uLiBNeSBwb2ludCBpcyB3ZSBuZXZlciBtYWRlIHRoYXQgYXNzdW1wdGlvbiAKPiBiZWZv
cmUuIEluIGFsbCBob25lc3R5LCBzdXJlIGFzc3VtcHRpb24gd291bGQgZGVmaW5pdGVseSBoZWxw
IGluIGEgZmV3IHBsYWNlcywgCj4gYnV0IEkgdGhpbmsgd2Ugb3VnaHQgdG8gc2FmZWd1YXJkIHdp
dGggQlVJTERfQlVHKC4uLikuCgpHZW9yZ2UsIGRvIHlvdSBoYXZlIGFueSBvcGluaW9ucz8KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
