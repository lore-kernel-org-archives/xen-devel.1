From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 09/25] x86emul: support XOP insns
Date: Fri, 02 Feb 2018 08:17:28 -0700
Message-ID: <5A748F1802000078001A4A1B@prv-mh.provo.novell.com>
References: <5A29550C020000780019585B@prv-mh.provo.novell.com>
 <5A29589402000078001958F4@prv-mh.provo.novell.com>
 <746d7022-5c6e-9df4-bb4a-4235600bc956@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=z1uz=e4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ehd5n-0005lf-H0
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2018 15:17:31 +0000
In-Reply-To: <746d7022-5c6e-9df4-bb4a-4235600bc956@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjAyLjE4IGF0IDEzOjAzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDcvMTIvMTcgMTQ6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBAQCAtODAyNyw2
ICs4MDYwLDEzIEBAIHg4Nl9lbXVsYXRlKAo+PiAgICAgICAgICBnZW5lcmF0ZV9leGNlcHRpb25f
aWYodmV4LncsIEVYQ19VRCk7Cj4+ICAgICAgICAgIGdvdG8gc2ltZF8wZl9pbW04X2F2eDsKPj4g
IAo+PiArICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYzYSwgMHg0OCk6IC8qIHZwZXJt
aWwycHMgJGltbSx7eCx5fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0se3gseX1tbSAqLwo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHZwZXJtaWwycHMgJGlt
bSx7eCx5fW1tLHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLwo+PiArICAgIGNhc2UgWDg2
RU1VTF9PUENfVkVYXzY2KDB4MGYzYSwgMHg0OSk6IC8qIHZwZXJtaWwycGQgJGltbSx7eCx5fW1t
L21lbSx7eCx5fW1tLHt4LHl9bW0se3gseX1tbSAqLwo+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC8qIHZwZXJtaWwycGQgJGltbSx7eCx5fW1tLHt4LHl9bW0v
bWVtLHt4LHl9bW0se3gseX1tbSAqLwo+PiArICAgICAgICBob3N0X2FuZF92Y3B1X211c3RfaGF2
ZSh4b3ApOwo+PiArICAgICAgICBnb3RvIHNpbWRfMGZfaW1tOF95bW07Cj4gCj4gSXMgdGhpcyBj
b3JyZWN0PyAgVkVYLlcgc2VsZWN0cyB3aGljaCBvcGVyYW5kIG1heSBiZSB0aGUgbWVtb3J5IG9w
ZXJhbmQsCj4gYW5kIEkgZG9uJ3Qgc2VlIGFueXRoaW5nIGluIHRoZSBkZWNvZGUgd2hpY2ggY29w
ZXMsIG9yIGFueXRoaW5nIGluIHRoZQo+IHN0dWIgd2hpY2ggYWRqdXN0cyAuVy4KClRoYXQncyB0
aGUgbmljZSB0aGluZyBoZXJlIC0gYnkgcmUtdXNpbmcgdGhlIG9yaWdpbmFsIGluc3RydWN0aW9u
IGluCnRoZSBzdHViICh3aXRoIG9ubHkgR1BSIG51bWJlcnMgYWRqdXN0ZWQgaWYgbmVjZXNzYXJ5
KSB3ZSBzaW1wbHkKZG9uJ3QgY2FyZSB3aGljaCBvZiB0aGUgb3BlcmFuZHMgaXQgdGhlIG1lbW9y
eSBvbmUsIGFzIGxvbmcgYXMKdGhlIGFjY2VzcyB3aWR0aCBkb2VzIG5vdCBkaWZmZXIgKGFuZCBp
dCBkb2Vzbid0KS4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
