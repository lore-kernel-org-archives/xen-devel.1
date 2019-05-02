From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/HVM: p2m_ram_ro is incompatible with
 device pass-through
Date: Thu, 02 May 2019 06:56:15 -0600
Message-ID: <5CCAE8EF020000780022B38F@prv1-mh.provo.novell.com>
References: <5CCAE2A5020000780022B35E@prv1-mh.provo.novell.com>
 <d0a25517faf54b6aabd1460d385d40f8@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMBGE-0000fk-E7
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 12:56:26 +0000
In-Reply-To: <d0a25517faf54b6aabd1460d385d40f8@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, george.dunlap@citrix.com, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA1LjE5IGF0IDE0OjQ3LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAwMiBNYXkgMjAxOSAxMzoyOQo+PiAKPj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9kbS5jCj4+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vZG0uYwo+PiBAQCAtMjU1LDE2ICsyNTUsMzIgQEAgc3Rh
dGljIGludCBzZXRfbWVtX3R5cGUoc3RydWN0IGRvbWFpbiAqZAo+PiAKPj4gICAgICBtZW1fdHlw
ZSA9IGFycmF5X2luZGV4X25vc3BlYyhkYXRhLT5tZW1fdHlwZSwgQVJSQVlfU0laRShtZW10eXBl
KSk7Cj4+IAo+PiAtICAgIGlmICggbWVtX3R5cGUgPT0gSFZNTUVNX2lvcmVxX3NlcnZlciApCj4+
ICsgICAgc3dpdGNoICggbWVtX3R5cGUgKQo+PiAgICAgIHsKPj4gICAgICAgICAgdW5zaWduZWQg
aW50IGZsYWdzOwo+PiAKPj4gKyAgICBjYXNlIEhWTU1FTV9pb3JlcV9zZXJ2ZXI6Cj4+ICAgICAg
ICAgIGlmICggIWhhcF9lbmFibGVkKGQpICkKPj4gICAgICAgICAgICAgIHJldHVybiAtRU9QTk9U
U1VQUDsKPj4gCj4+ICAgICAgICAgIC8qIERvIG5vdCBjaGFuZ2UgdG8gSFZNTUVNX2lvcmVxX3Nl
cnZlciBpZiBubyBpb3JlcSBzZXJ2ZXIgbWFwcGVkLiAqLwo+PiAgICAgICAgICBpZiAoICFwMm1f
Z2V0X2lvcmVxX3NlcnZlcihkLCAmZmxhZ3MpICkKPj4gICAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOwo+PiArCj4+ICsgICAgICAgIGJyZWFrOwo+PiArCj4+ICsgICAgY2FzZSBIVk1NRU1fcmFt
X3JvOgo+PiArICAgICAgICAvKiBwMm1fcmFtX3JvIGNhbid0IGJlIHJlcHJlc2VudGVkIGluIElP
TU1VIG1hcHBpbmdzLiAqLwo+PiArICAgICAgICBkb21haW5fbG9jayhkKTsKPj4gKyAgICAgICAg
aWYgKCBoYXNfaW9tbXVfcHQoZCkgKQo+PiArICAgICAgICAgICAgcmMgPSAtRVhERVY7Cj4+ICsg
ICAgICAgIGQtPmFyY2guaHZtLnAybV9yYW1fcm9fdXNlZCA9IHRydWU7Cj4gCj4gRG8geW91IHJl
YWxseSB3YW50IHRvIHNldCB0aGlzIHRvIHRydWUgZXZlbiBpZiB0aGUgb3Agd2lsbCBmYWlsPwoK
T2gsIGdvb2QgcG9pbnQgLSB0aGVyZSBzaG91bGQgYmUgYW4gImVsc2UiIHRoZXJlLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
