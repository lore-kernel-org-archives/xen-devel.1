From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] shim: update config after vpci patches
Date: Tue, 27 Mar 2018 15:41:57 +0100
Message-ID: <20180327144157.6mimsobc65ke6bmr@MacBook-Pro-de-Roger.local>
References: <20180327135813.8887-1-wei.liu2@citrix.com>
 <20180327140942.wbihz4xspqbvljhf@MacBook-Pro-de-Roger.local>
 <20180327141235.32cfa42jbpyqmgzd@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jyqu=gr=citrix.com=prvs=617bf0025=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f0po9-0003VX-Sc
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 14:42:41 +0000
Content-Disposition: inline
In-Reply-To: <20180327141235.32cfa42jbpyqmgzd@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjcsIDIwMTggYXQgMDM6MTI6MzVQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUdWUsIE1hciAyNywgMjAxOCBhdCAwMzowOTo0MlBNICswMTAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gT24gVHVlLCBNYXIgMjcsIDIwMTggYXQgMDI6NTg6MTNQTSArMDEwMCwg
V2VpIExpdSB3cm90ZToKPiA+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KPiA+ID4gLS0tCj4gPiA+ICB0b29scy9maXJtd2FyZS94ZW4tZGlyL3NoaW0uY29u
ZmlnIHwgMSArCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+ID4gCj4g
PiA+IGRpZmYgLS1naXQgYS90b29scy9maXJtd2FyZS94ZW4tZGlyL3NoaW0uY29uZmlnIGIvdG9v
bHMvZmlybXdhcmUveGVuLWRpci9zaGltLmNvbmZpZwo+ID4gPiBpbmRleCA0ZDU2MzBmODdhLi4w
NTA3MWJmNDM2IDEwMDY0NAo+ID4gPiAtLS0gYS90b29scy9maXJtd2FyZS94ZW4tZGlyL3NoaW0u
Y29uZmlnCj4gPiA+ICsrKyBiL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvc2hpbS5jb25maWcKPiA+
ID4gQEAgLTY3LDYgKzY3LDcgQEAgQ09ORklHX0hBU19FSENJPXkKPiA+ID4gIENPTkZJR19IQVNf
Q1BVRlJFUT15Cj4gPiA+ICBDT05GSUdfSEFTX1BBU1NUSFJPVUdIPXkKPiA+ID4gIENPTkZJR19I
QVNfUENJPXkKPiA+ID4gK0NPTkZJR19IQVNfVlBDST15Cj4gPiAKPiA+IElmIHRoZSBQVl9TSElN
X0VYQ0xVU0lWRSBvcHRpb24gaXMgc2VsZWN0ZWQgSEFTX1ZQQ0kgc2hvdWxkIGJlIGZvcmNlZAo+
ID4gdG8gbiwgYnV0IHRoaXMgcmVxdWlyZXMgZnVydGhlciBjaGFuZ2VzIHRvIEtjb25maWcuCj4g
Cj4gSSBhZ3JlZS4gUENJLCBQQVNTVEhST1VHSCBhbmQgYnVuY2ggb2Ygb3RoZXJzIHNob3VsZCBh
bHNvIGJlIG4uICBCdXQgSQo+IGRvbid0IHRoaW5rIHdlIGNhbiBnZXQgdGhlcmUgYW55IHRpbWUg
c29vbi4KCldoYXQgYWJvdXQgdXNpbmcgc29tZXRoaW5nIGxpa2UgdGhlIGZvbGxvd2luZzoKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvS2NvbmZpZyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnCmlu
ZGV4IGM0MDVjNGJmNGYuLmY2NGZjNTY3MzkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9LY29u
ZmlnCisrKyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnCkBAIC0yMyw3ICsyMyw3IEBAIGNvbmZpZyBY
ODYKIAlzZWxlY3QgSEFTX1BDSQogCXNlbGVjdCBIQVNfUERYCiAJc2VsZWN0IEhBU19VQlNBTgot
CXNlbGVjdCBIQVNfVlBDSQorCXNlbGVjdCBIQVNfVlBDSSBpZiAhUFZfU0hJTV9FWENMVVNJVkUK
IAlzZWxlY3QgTlVNQQogCiBjb25maWcgQVJDSF9ERUZDT05GSUcKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
