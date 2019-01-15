From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 03/15] x86/cpu/vpmu: Add Hygon Dhyana
 support for vPMU
Date: Tue, 15 Jan 2019 06:01:40 -0700
Message-ID: <5C3DD9B4020000780020DD82@prv1-mh.provo.novell.com>
References: <cover.1545284932.git.puwen@hygon.cn>
 <717bb961700ecc2ebb9d3c424f2f0fea3bb71d00.1545284932.git.puwen@hygon.cn>
 <5C3CB2EC020000780020D68E@prv1-mh.provo.novell.com>
 <b7a0d3ee-aefd-2917-bcd3-a8fac9c773c5@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s15q=PX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gjONb-0002HK-3b
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 13:03:43 +0000
In-Reply-To: <b7a0d3ee-aefd-2917-bcd3-a8fac9c773c5@hygon.cn>
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

Pj4+IE9uIDE1LjAxLjE5IGF0IDEzOjQ5LCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+IE9uIDIw
MTkvMS8xNSAwOjQ3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjAuMTIuMTggYXQgMTQ6
MTIsIDxwdXdlbkBoeWdvbi5jbj4gd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1L3Zw
bXUuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L2NwdS92cG11LmMKPj4+IEBAIC00NzMsNiArNDcz
LDcgQEAgc3RhdGljIGludCB2cG11X2FyY2hfaW5pdGlhbGlzZShzdHJ1Y3QgdmNwdSAqdikKPj4+
ICAgCj4+PiAgICAgICBzd2l0Y2ggKCB2ZW5kb3IgKQo+Pj4gICAgICAgewo+Pj4gKyAgICBjYXNl
IFg4Nl9WRU5ET1JfSFlHT046Cj4+PiAgICAgICBjYXNlIFg4Nl9WRU5ET1JfQU1EOgo+Pj4gICAg
ICAgICAgIHJldCA9IHN2bV92cG11X2luaXRpYWxpc2Uodik7Cj4+PiAgICAgICAgICAgYnJlYWs7
Cj4+PiBAQCAtODkwLDYgKzg5MSw3IEBAIHN0YXRpYyBpbnQgX19pbml0IHZwbXVfaW5pdCh2b2lk
KQo+Pj4gICAKPj4+ICAgICAgIHN3aXRjaCAoIHZlbmRvciApCj4+PiAgICAgICB7Cj4+PiArICAg
IGNhc2UgWDg2X1ZFTkRPUl9IWUdPTjoKPj4+ICAgICAgIGNhc2UgWDg2X1ZFTkRPUl9BTUQ6Cj4+
PiAgICAgICAgICAgaWYgKCBhbWRfdnBtdV9pbml0KCkgKQo+Pj4gICAgICAgICAgICAgIHZwbXVf
bW9kZSA9IFhFTlBNVV9NT0RFX09GRjsKPj4gCj4+IEhlcmUgYW5kIGV2ZXJ5d2hlcmUgZWxzZSwg
bWF5IEkgYXNrIHRoYXQgeW91IGRvIHlvdXIgaW5zZXJ0aW9ucwo+PiBiZWxvdyB0aGUgcmVzcGVj
dGl2ZSBBTUQgb25lcyBpbnN0ZWFkIG9mIGFib3ZlPwo+IAo+IEluIGFsbCB0aGUgc3dpdGNoIGNh
c2VzLCBpZiBIeWdvbiBkaXJlY3RseSBmb2xsb3dlZCBBTUQncyBjYXNlcywgdGhlCj4gaW5zZXJ0
aW9ucyBhcmUgcGxhY2VkIGFib3ZlIHRoZSByZXNwZWN0aXZlIEFNRCBvbmVzLgoKQXMgc2FpZCAt
IHBsZWFzZSBkb24ndCwgaW5zZXJ0IHRoZSBuZXcgb25lcyBhZnRlciBBTUQncy4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
