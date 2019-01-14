From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 03/15] x86/cpu/vpmu: Add Hygon Dhyana
 support for vPMU
Date: Mon, 14 Jan 2019 09:03:56 -0700
Message-ID: <5C3CB2EC020000780020D68E@prv1-mh.provo.novell.com>
References: <cover.1545284932.git.puwen@hygon.cn>
 <717bb961700ecc2ebb9d3c424f2f0fea3bb71d00.1545284932.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gj4kS-0005r8-94
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 16:06:00 +0000
In-Reply-To: <717bb961700ecc2ebb9d3c424f2f0fea3bb71d00.1545284932.git.puwen@hygon.cn>
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

Pj4+IE9uIDIwLjEyLjE4IGF0IDE0OjEyLCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9jcHUvdnBtdS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2NwdS92cG11LmMK
PiBAQCAtNDczLDYgKzQ3Myw3IEBAIHN0YXRpYyBpbnQgdnBtdV9hcmNoX2luaXRpYWxpc2Uoc3Ry
dWN0IHZjcHUgKnYpCj4gIAo+ICAgICAgc3dpdGNoICggdmVuZG9yICkKPiAgICAgIHsKPiArICAg
IGNhc2UgWDg2X1ZFTkRPUl9IWUdPTjoKPiAgICAgIGNhc2UgWDg2X1ZFTkRPUl9BTUQ6Cj4gICAg
ICAgICAgcmV0ID0gc3ZtX3ZwbXVfaW5pdGlhbGlzZSh2KTsKPiAgICAgICAgICBicmVhazsKPiBA
QCAtODkwLDYgKzg5MSw3IEBAIHN0YXRpYyBpbnQgX19pbml0IHZwbXVfaW5pdCh2b2lkKQo+ICAK
PiAgICAgIHN3aXRjaCAoIHZlbmRvciApCj4gICAgICB7Cj4gKyAgICBjYXNlIFg4Nl9WRU5ET1Jf
SFlHT046Cj4gICAgICBjYXNlIFg4Nl9WRU5ET1JfQU1EOgo+ICAgICAgICAgIGlmICggYW1kX3Zw
bXVfaW5pdCgpICkKPiAgICAgICAgICAgICB2cG11X21vZGUgPSBYRU5QTVVfTU9ERV9PRkY7CgpI
ZXJlIGFuZCBldmVyeXdoZXJlIGVsc2UsIG1heSBJIGFzayB0aGF0IHlvdSBkbyB5b3VyIGluc2Vy
dGlvbnMKYmVsb3cgdGhlIHJlc3BlY3RpdmUgQU1EIG9uZXMgaW5zdGVhZCBvZiBhYm92ZT8KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
