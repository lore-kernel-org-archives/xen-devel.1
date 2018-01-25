From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/2] x86/clang: fix build with indirect
	thunks
Date: Thu, 25 Jan 2018 09:50:28 +0000
Message-ID: <20180125095028.t4qmg3jtqgl5tqja@MacBook-Pro-de-Roger.local>
References: <20180124154849.84889-1-roger.pau@citrix.com>
 <20180124154849.84889-2-roger.pau@citrix.com>
 <5A68C51802000078001A2121@prv-mh.provo.novell.com>
 <20180124170625.t6fsnfenzp3bqjme@MacBook-Pro-de-Roger.local>
 <5A69B3E802000078001A23DE@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=xhpm=eu=citrix.com=prvs=5564e4040=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eeeB7-0007xR-SV
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2018 09:50:41 +0000
Content-Disposition: inline
In-Reply-To: <5A69B3E802000078001A23DE@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, AndrewCooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMjUsIDIwMTggYXQgMDI6Mzk6MzZBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI0LjAxLjE4IGF0IDE4OjA2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gV2VkLCBKYW4gMjQsIDIwMTggYXQgMDk6NDA6NDBBTSAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDI0LjAxLjE4IGF0IDE2OjQ4LCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gVGhlIGJ1aWxkIHdpdGggY2xhbmcgaXMgY3VycmVudGx5
IGJyb2tlbiBiZWNhdXNlIGNsYW5nIHJlcXVpcmVzIGFzbQo+ID4+ID4gbWFjcm9zIHRvIGJlIGRl
Y2xhcmVkIGluc2lkZSB0aGUgc2FtZSBpbmxpbmUgYXNtIGRlY2xhcmF0aW9uIHdoZXJlCj4gPj4g
PiB0aGV5IGFyZSB1c2VkLgo+ID4+IAo+ID4+IEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGlzOiBXaGF0
IGlmIEkgaGF2ZSB0d28gYXNtKCktcyBuZWVkaW5nIGl0PyBEb2VzCj4gPj4gdGhpcyBuZWVkIHRv
IGJlIGRvbmUgaW4gZWFjaCBvbmU/IEknZCBleHBlY3QgdGhpcyB0byByZXN1bHQgaW4gZHVwbGlj
YXRlCj4gPj4gZGVmaW5pdGlvbnMgb24gZ2FzIHRoZW4gKHdoaWNoIG1heSBvciBtYXkgbm90IGJl
IGJlbmlnbikuCj4gPiAKPiA+IEl0J3MgcXVpdGUgZnVuLCB0aGlzIGFwcHJvYWNoIHdvcmtzIGZp
bmUgd2l0aCBjbGFuZyByZWdhcmRsZXNzIG9mIHRoZQo+ID4gbnVtYmVyIG9mIGFzbSgpLXMgbmVl
ZGluZyBpdC4gSXQgZG9lc24ndCBjb21wbGFpbiBhYm91dCBkdXBsaWNhdGUKPiA+IG1hY3JvcyBv
ciBhbnl0aGluZy4gT1RPSCBnY2MgY29tcGxhaW5zIHdpdGggIkVycm9yOiBNYWNybyBgZm9vJyB3
YXMKPiA+IGFscmVhZHkgZGVmaW5lZCIuCj4gCj4gQW5kIGRvZXMgY2xhbmcgbmVlZCBpdCBpbiBl
YWNoIGFzbSgpPwoKWWVzLiBBRkFJQ1QgLmluY2x1ZGVzIGluc2lkZSBvZiBhc20oKS1zIGluIGNs
YW5nIGFyZSBvbmx5IHZhbGlkIGluc2lkZQp0aGUgc2FtZSBhc20oKS4KCj4gQWxiZWl0IC0gc2lu
Y2UgdGhlIG9yZGVyCj4gZnVuY3Rpb25zIGFyZSBiZWluZyBvdXRwdXQgaXMgdW5kZWZpbmVkLCBp
dCBwcm9iYWJseSBzaG91bGQgZ28gaW50bwo+IGVhY2ggb25lLiBIZW5jZSB0aGUgYW5zd2VyIHdv
dWxkIG9ubHkgYWZmZWN0IHdoZXRoZXIgLi4uCj4gCj4gPiBPbmUgb3B0aW9uIG1pZ2h0IGJlIHRv
IGd1YXJkIGluZGlyZWN0X3RodW5rX2FzbS5oIHdpdGg6Cj4gPiAKPiA+IC5pZm5kZWYgSU5ESVJF
Q1RfVEhVTktfQVNNCj4gPiAuZXF1IElORElSRUNUX1RIVU5LX0FTTSwgMQo+ID4gCj4gPiAuLi4K
PiA+IAo+ID4gLmVuZGlmCj4gCj4gLi4uIHRoaXMgd291bGQgYmUgbmVlZGVkIGNvbmRpdGlvbmFs
bHkgZm9yIGdhcywgb3IgdW5jb25kaXRpb25hbGx5LgoKVGhlIGd1YXJkIGlzIG5lZWRlZCB1bmNv
bmRpdGlvbmFsbHkgZm9yIGdjYywgb3IgZWxzZSBoYXZpbmcgdHdvCmluc3RhbmNlcyBvZiB0aGUg
YXNtKCkgaW4gdGhlIHNhbWUgZmlsZSBpcyBub3QgZ29pbmcgdG8gd29yay4KCkZvciBnY2Mgd2Ug
Y291bGQgYWxzbyBhdm9pZCBkZWZpbmluZyBJTkNMVURFX0lORElSRUNUX1RIVU5LIGFuZCBrZWVw
CnRoZSBzYW1lIGFwcHJvYWNoIHRoYXQncyB1c2VkIGN1cnJlbnRseSwgYnV0IEkgd291bGQgcmF0
aGVyIGhhdmUgZ2NjCmFuZCBjbGFuZyB1c2luZyB0aGUgc2FtZSBhcHByb2FjaCBpZiBwb3NzaWJs
ZS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
