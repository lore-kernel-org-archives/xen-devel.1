From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4 4/7] x86/mm: put HVM only code under
 CONFIG_HVM
Date: Fri, 21 Sep 2018 16:50:06 +0100
Message-ID: <20180921155006.3zik5gcy5zrlplgx@zion.uk.xensource.com>
References: <cover.f883694550a3da3b95e2bf2a6f6777297b851b43.1536856592.git-series.wei.liu2@citrix.com>
 <72552d1b145e82b94e2b7560b126d82803879d18.1536856592.git-series.wei.liu2@citrix.com>
 <CABfawh=XbVdQDdnqmRT1Xi1igb+ApAnm6jMS2GubucmjuJpdFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4pl1=md=citrix.com=prvs=7953d62ed=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g3Nh5-00055O-0L
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 15:50:11 +0000
Content-Disposition: inline
In-Reply-To: <CABfawh=XbVdQDdnqmRT1Xi1igb+ApAnm6jMS2GubucmjuJpdFw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBTZXAgMTMsIDIwMTggYXQgMTA6NTA6NDVBTSAtMDYwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+ID4gQEAgLTQ4MywxMiArNDk1LDE1IEBAIGludCBwMm1fZ2V0X21lbV9hY2Nlc3Mo
c3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLCB4ZW5tZW1fYWNjZXNzX3QgKmFjY2VzcykKPiA+
Cj4gPiAgdm9pZCBhcmNoX3AybV9zZXRfYWNjZXNzX3JlcXVpcmVkKHN0cnVjdCBkb21haW4gKmQs
IGJvb2wgYWNjZXNzX3JlcXVpcmVkKQo+ID4gIHsKPiA+ICsjaWZkZWYgQ09ORklHX0hWTQo+ID4g
ICAgICB1bnNpZ25lZCBpbnQgaTsKPiA+ICsjZW5kaWYKPiAKPiBQZXJoYXBzIHRoaXMgd291bGQg
bG9vayBhIGxpdHRsZSBuaWNlciB3aXRoIGEgbWlub3IgcmVzdHJ1Y3R1cmUgc28KPiB0aGF0IHRo
ZXJlIGFyZSBubyB0d28gaWZkZWZzIHdpdGhpbiB0aGlzIGZ1bmN0aW9uLi4KPiAKPiA+Cj4gPiAg
ICAgIEFTU0VSVChhdG9taWNfcmVhZCgmZC0+cGF1c2VfY291bnQpKTsKPiA+Cj4gPiAgICAgIHAy
bV9nZXRfaG9zdHAybShkKS0+YWNjZXNzX3JlcXVpcmVkID0gYWNjZXNzX3JlcXVpcmVkOwo+ID4K
PiA+ICsjaWZkZWYgQ09ORklHX0hWTQo+ID4gICAgICBpZiAoICFhbHRwMm1fYWN0aXZlKGQpICkK
PiAKPiAuLiBieSBjaGFuZ2luZyB0aGlzIGlzIGludG8gaWYgKCBhbHRwMm1fYWN0aXZlKGQpICkg
YW5kIG1vdmluZyB0aGUKPiB1bnNpZ25lZCBpbnQgaSBkZWNsYXJhdGlvbiBhZnRlcndhcmRzLiBJ
IHVuZGVyc3RhbmQgaG93ZXZlciBpZiB5b3UKPiB3YW50IHRvIGtlZXAgdGhpcyBwYXRjaCBtZWNo
YW5pY2FsLgoKRG9uZS4KCj4gCj4gPiAgICAgICAgICByZXR1cm47Cj4gPgo+ID4gQEAgLTQ5OSw2
ICs1MTQsNyBAQCB2b2lkIGFyY2hfcDJtX3NldF9hY2Nlc3NfcmVxdWlyZWQoc3RydWN0IGRvbWFp
biAqZCwgYm9vbCBhY2Nlc3NfcmVxdWlyZWQpCj4gPiAgICAgICAgICBpZiAoIHAybSApCj4gPiAg
ICAgICAgICAgICAgcDJtLT5hY2Nlc3NfcmVxdWlyZWQgPSBhY2Nlc3NfcmVxdWlyZWQ7Cj4gPiAg
ICAgIH0KPiA+ICsjZW5kaWYKPiA+ICB9Cj4gCj4gU28gd2l0aCBvciB3aXRob3V0IHRoYXQgY2hh
bmdlOgo+IEFja2VkLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CgpU
aGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
