From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 04/15] x86/cpu/vpmu: Add Hygon Dhyana and
 AMD Zen support for vPMU
Date: Mon, 01 Apr 2019 02:35:21 -0600
Message-ID: <5CA1CD49020000780022376C@prv1-mh.provo.novell.com>
References: <cover.1553935727.git.puwen@hygon.cn>
 <e82e93b090e004d2b9a679d656de96ca915e92da.1553935727.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hAsPf-0003YQ-P2
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 08:35:27 +0000
In-Reply-To: <e82e93b090e004d2b9a679d656de96ca915e92da.1553935727.git.puwen@hygon.cn>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjAzLjE5IGF0IDExOjQyLCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+IEBAIC04
NzYsNiArODc3LDEwIEBAIHN0YXRpYyBpbnQgX19pbml0IHZwbXVfaW5pdCh2b2lkKQo+ICAgICAg
ICAgIGlmICggYW1kX3ZwbXVfaW5pdCgpICkKPiAgICAgICAgICAgICB2cG11X21vZGUgPSBYRU5Q
TVVfTU9ERV9PRkY7Cj4gICAgICAgICAgYnJlYWs7Cj4gKyAgICBjYXNlIFg4Nl9WRU5ET1JfSFlH
T046Cj4gKyAgICAgICAgaWYgKCBoeWdvbl92cG11X2luaXQoKSApCj4gKyAgICAgICAgICAgdnBt
dV9tb2RlID0gWEVOUE1VX01PREVfT0ZGOwo+ICsgICAgICAgIGJyZWFrOwo+ICAgICAgY2FzZSBY
ODZfVkVORE9SX0lOVEVMOgo+ICAgICAgICAgIGlmICggY29yZTJfdnBtdV9pbml0KCkgKQo+ICAg
ICAgICAgICAgIHZwbXVfbW9kZSA9IFhFTlBNVV9NT0RFX09GRjsKCldoaWxlIEkgcmVhbGl6ZSB0
aGV5J3JlIG1pc3NpbmcgcmlnaHQgbm93LCBJIHdvdWxkIGhhdmUgYXBwcmVjaWF0ZWQKaWYgeW91
IGhhZCB0YWtlbiB0aGUgb3Bwb3J0dW5pdHkgdG8gYWRkIHRoZSBtaXNzaW5nIGJsYW5rIGxpbmVz
CmJldHdlZW4gY2FzZSBibG9ja3MgaGVyZS4KCj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS92cG11
X2FtZC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2NwdS92cG11X2FtZC5jCj4gQEAgLTUzOCwyOCAr
NTM4LDEyIEBAIGludCBzdm1fdnBtdV9pbml0aWFsaXNlKHN0cnVjdCB2Y3B1ICp2KQo+ICAgICAg
cmV0dXJuIDA7Cj4gIH0KPiAgCj4gLWludCBfX2luaXQgYW1kX3ZwbXVfaW5pdCh2b2lkKQo+ICtz
dGF0aWMgaW50IGNvbW1vbl9pbml0KHZvaWQpCgpfX2luaXQKCj4gIHsKPiAgICAgIHVuc2lnbmVk
IGludCBpOwo+ICAKPiAtICAgIHN3aXRjaCAoIGN1cnJlbnRfY3B1X2RhdGEueDg2ICkKPiArICAg
IGlmICghbnVtX2NvdW50ZXJzKQoKU3R5bGUgKG1pc3NpbmcgYmxhbmtzKS4KCj4gQEAgLTU4Niwz
ICs1NzAsNDMgQEAgaW50IF9faW5pdCBhbWRfdnBtdV9pbml0KHZvaWQpCj4gICAgICByZXR1cm4g
MDsKPiAgfQo+ICAKPiAraW50IF9faW5pdCBhbWRfdnBtdV9pbml0KHZvaWQpCj4gK3sKPiArICAg
IHN3aXRjaCAoIGN1cnJlbnRfY3B1X2RhdGEueDg2ICkKPiArICAgIHsKPiArICAgIGNhc2UgMHgx
NToKPiArICAgIGNhc2UgMHgxNzoKPiArICAgICAgICBudW1fY291bnRlcnMgPSBGMTVIX05VTV9D
T1VOVEVSUzsKPiArICAgICAgICBjb3VudGVycyA9IEFNRF9GMTVIX0NPVU5URVJTOwo+ICsgICAg
ICAgIGN0cmxzID0gQU1EX0YxNUhfQ1RSTFM7Cj4gKyAgICAgICAgazdfY291bnRlcnNfbWlycm9y
ZWQgPSAxOwo+ICsgICAgICAgIGJyZWFrOwo+ICsgICAgY2FzZSAweDEwOgoKU2FtZSBhcyBhYm92
ZS4KCkkgd29uJ3QgaW5zaXN0IG9uIHRoZSBmaXJzdCBpdGVtIGdldHRpbmcgYWRkcmVzc2VkLCBi
dXQgdGhlIG90aGVyCnRocmVlIHNob3VsZCBiZS4gVGhleSdyZSBhbGwgbWVjaGFuaWNhbCwgc28g
Y291bGQgYmUgZG9uZSB3aGlsZQpjb21taXR0aW5nLCBhbmQgd2l0aCB0aGVtIGluIHBsYWNlCkFj
a2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
