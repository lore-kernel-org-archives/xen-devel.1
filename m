From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/2] x86/dom0: improve paging memory usage
 calculations
Date: Wed, 5 Dec 2018 13:34:51 +0100
Message-ID: <20181205123451.kuq64o4xxvvupp2x@mac>
References: <20181205120629.96767-1-roger.pau@citrix.com>
 <20181205120629.96767-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mify=oo=citrix.com=prvs=870913e8c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gUWOm-0001Lz-Jn
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 12:35:28 +0000
Content-Disposition: inline
In-Reply-To: <20181205120629.96767-3-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, andrei.semenov@bertin.fr, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBEZWMgMDUsIDIwMTggYXQgMDE6MDY6MjlQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYyBiL3hl
bi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCj4gaW5kZXggMmFmMmJkOGMzZC4uNzIxN2IyNDA0
YSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYwo+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCj4gQEAgLTM1OCw2ICszNTgsOSBAQCBzdGF0aWMg
aW50IF9faW5pdCBwdmhfc2V0dXBfcDJtKHN0cnVjdCBkb21haW4gKmQpCj4gIHsKPiAgICAgIHN0
cnVjdCB2Y3B1ICp2ID0gZC0+dmNwdVswXTsKPiAgICAgIHVuc2lnbmVkIGxvbmcgbnJfcGFnZXMg
PSBkb20wX2NvbXB1dGVfbnJfcGFnZXMoZCwgTlVMTCwgMCk7Cj4gKyAgICB1bnNpZ25lZCBsb25n
IHBhZ2luZ19wYWdlcyA9Cj4gKyAgICAgICAgcGFnaW5nX21vZGVfaGFwKGQpID8gZG9tMF9oYXBf
cGFnZXMoZCwgbnJfcGFnZXMpLAoKSSd2ZSBzb21laG93IG1lc3NlZCB1cCB0aGlzIHBhdGNoIHNl
cmllcyBhbmQgc2VudCBhIG5vdCB1cGRhdGVkCnZlcnNpb24sIHdpbGwgc2VuZCB2MiBzaG9ydGx5
LCBzb3JyeS4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
