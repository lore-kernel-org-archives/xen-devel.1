From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] shim: update config after vpci patches
Date: Tue, 27 Mar 2018 15:43:12 +0100
Message-ID: <20180327144312.ru6gjryjx3eydl5v@citrix.com>
References: <20180327135813.8887-1-wei.liu2@citrix.com>
 <20180327140942.wbihz4xspqbvljhf@MacBook-Pro-de-Roger.local>
 <20180327141235.32cfa42jbpyqmgzd@citrix.com>
 <20180327144157.6mimsobc65ke6bmr@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xo86=gr=citrix.com=prvs=61733587f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1f0pqX-0003dJ-Cw
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 14:45:09 +0000
Content-Disposition: inline
In-Reply-To: <20180327144157.6mimsobc65ke6bmr@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjcsIDIwMTggYXQgMDM6NDE6NTdQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUdWUsIE1hciAyNywgMjAxOCBhdCAwMzoxMjozNVBNICswMTAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gVHVlLCBNYXIgMjcsIDIwMTggYXQgMDM6MDk6NDJQTSArMDEwMCwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gT24gVHVlLCBNYXIgMjcsIDIwMTggYXQgMDI6
NTg6MTNQTSArMDEwMCwgV2VpIExpdSB3cm90ZToKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICB0b29scy9maXJt
d2FyZS94ZW4tZGlyL3NoaW0uY29uZmlnIHwgMSArCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQo+ID4gPiA+IAo+ID4gPiA+IGRpZmYgLS1naXQgYS90b29scy9maXJtd2Fy
ZS94ZW4tZGlyL3NoaW0uY29uZmlnIGIvdG9vbHMvZmlybXdhcmUveGVuLWRpci9zaGltLmNvbmZp
Zwo+ID4gPiA+IGluZGV4IDRkNTYzMGY4N2EuLjA1MDcxYmY0MzYgMTAwNjQ0Cj4gPiA+ID4gLS0t
IGEvdG9vbHMvZmlybXdhcmUveGVuLWRpci9zaGltLmNvbmZpZwo+ID4gPiA+ICsrKyBiL3Rvb2xz
L2Zpcm13YXJlL3hlbi1kaXIvc2hpbS5jb25maWcKPiA+ID4gPiBAQCAtNjcsNiArNjcsNyBAQCBD
T05GSUdfSEFTX0VIQ0k9eQo+ID4gPiA+ICBDT05GSUdfSEFTX0NQVUZSRVE9eQo+ID4gPiA+ICBD
T05GSUdfSEFTX1BBU1NUSFJPVUdIPXkKPiA+ID4gPiAgQ09ORklHX0hBU19QQ0k9eQo+ID4gPiA+
ICtDT05GSUdfSEFTX1ZQQ0k9eQo+ID4gPiAKPiA+ID4gSWYgdGhlIFBWX1NISU1fRVhDTFVTSVZF
IG9wdGlvbiBpcyBzZWxlY3RlZCBIQVNfVlBDSSBzaG91bGQgYmUgZm9yY2VkCj4gPiA+IHRvIG4s
IGJ1dCB0aGlzIHJlcXVpcmVzIGZ1cnRoZXIgY2hhbmdlcyB0byBLY29uZmlnLgo+ID4gCj4gPiBJ
IGFncmVlLiBQQ0ksIFBBU1NUSFJPVUdIIGFuZCBidW5jaCBvZiBvdGhlcnMgc2hvdWxkIGFsc28g
YmUgbi4gIEJ1dCBJCj4gPiBkb24ndCB0aGluayB3ZSBjYW4gZ2V0IHRoZXJlIGFueSB0aW1lIHNv
b24uCj4gCj4gV2hhdCBhYm91dCB1c2luZyBzb21ldGhpbmcgbGlrZSB0aGUgZm9sbG93aW5nOgo+
IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvS2NvbmZpZyBiL3hlbi9hcmNoL3g4Ni9LY29u
ZmlnCj4gaW5kZXggYzQwNWM0YmY0Zi4uZjY0ZmM1NjczOSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJj
aC94ODYvS2NvbmZpZwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnCj4gQEAgLTIzLDcgKzIz
LDcgQEAgY29uZmlnIFg4Ngo+ICAJc2VsZWN0IEhBU19QQ0kKPiAgCXNlbGVjdCBIQVNfUERYCj4g
IAlzZWxlY3QgSEFTX1VCU0FOCj4gLQlzZWxlY3QgSEFTX1ZQQ0kKPiArCXNlbGVjdCBIQVNfVlBD
SSBpZiAhUFZfU0hJTV9FWENMVVNJVkUKCkxvb2tzIE9LIHRvIG1lLgoKV2VpLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
