From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH v4 01/15] x86/cpu: Create Hygon Dhyana
 architecture support file
Date: Tue, 2 Apr 2019 21:09:59 +0800
Message-ID: <46fb804d-8d80-72ed-cd96-2281682c107f@hygon.cn>
References: <cover.1553935727.git.puwen@hygon.cn>
 <eb635da990e92443a91b2ae598ed354e35975efa.1553935727.git.puwen@hygon.cn>
 <4c59b3c9-cf52-275f-85c2-30a98fbeb275@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tiqP=SE=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1hBJGE-0000jw-NV
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 13:15:30 +0000
In-Reply-To: <4c59b3c9-cf52-275f-85c2-30a98fbeb275@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOS80LzIgMjA6MTYsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMzAvMDMvMjAxOSAx
MDo0MiwgUHUgV2VuIHdyb3RlOgo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBjcHVfZGV2IGh5Z29u
X2NwdV9kZXYgPSB7Cj4+ICsJLmNfdmVuZG9yCT0gIkh5Z29uIiwKPj4gKwkuY19pZGVudCAJPSB7
ICJIeWdvbkdlbnVpbmUiIH0sCj4+ICsJLmNfZWFybHlfaW5pdAk9IGVhcmx5X2luaXRfYW1kLAo+
PiArCS5jX2luaXQJCT0gaW5pdF9oeWdvbiwKPj4gK307Cj4+ICsKPj4gK2ludCBfX2luaXQgaHln
b25faW5pdF9jcHUodm9pZCkKPj4gK3sKPj4gKwljcHVfZGV2c1tYODZfVkVORE9SX0hZR09OXSA9
ICZoeWdvbl9jcHVfZGV2Owo+PiArCXJldHVybiAwOwo+PiArfQo+PiBkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni94ODYtdmVuZG9ycy5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni94ODYt
dmVuZG9ycy5oCj4+IGluZGV4IDM4YTgxYzMuLmZhMWNiYjQgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9p
bmNsdWRlL2FzbS14ODYveDg2LXZlbmRvcnMuaAo+PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2
L3g4Ni12ZW5kb3JzLmgKPj4gQEAgLTksNiArOSw3IEBACj4+ICAgI2RlZmluZSBYODZfVkVORE9S
X0FNRCAyCj4+ICAgI2RlZmluZSBYODZfVkVORE9SX0NFTlRBVVIgMwo+PiAgICNkZWZpbmUgWDg2
X1ZFTkRPUl9TSEFOR0hBSSA0Cj4+IC0jZGVmaW5lIFg4Nl9WRU5ET1JfTlVNIDUKPj4gKyNkZWZp
bmUgWDg2X1ZFTkRPUl9IWUdPTiA1Cj4+ICsjZGVmaW5lIFg4Nl9WRU5ET1JfTlVNIDYKPiAKPiBU
aGlzIGNoYW5nZSB3aWxsIG5lZWQgcmViYXNpbmcgb3Zlcgo+IGh0dHA6Ly94ZW5iaXRzLnhlbi5v
cmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1jb21taXRkaWZmO2g9ZTcyMzA5ZmZiZTdjNGU1MDc2NDlj
NzQ3NDlmMTMwY2RhNjkxMTMxYwo+ICwgd2hpY2ggaGFzIGRyb3BwZWQgdGhlIC5jX2lkZW50IGZp
ZWxkIGZvciBhIG1vcmUgZWZmaWNpZW50IGxvb2t1cAoKT2gsIHRoaXMgaXMgYWxyZWFkeSBpbiB0
aGUgc3RhZ2luZyBicmFuY2ghCgo+IG1lY2hhbmlzbS4KPiAKPiBIb3BlZnVsbHkgdGhlIGFkanVz
dG1lbnRzIGFyZSBhbGwgb2J2aW91cy7CoCBJZiBub3QsIEkgY2FuIGRyYWZ0IGEgcGF0Y2guCgpJ
J2xsIHRyeSB0byByZXdvcmsgdGhpcyBwYXRjaCByZWJhc2luZyBvdmVyIHRoZSBsYXRlc3Qgc3Rh
Z2luZyBicmFuY2gKZm9yIHlvdXIgcmV2aWV3LiBUaGFua3MuCgotLSAKUmVnYXJkcywKUHUgV2Vu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
