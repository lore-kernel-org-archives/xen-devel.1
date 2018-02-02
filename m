From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 25/25] x86/shadow: fold
 sh_x86_emulate_{write, cmpxchg}() into their only callers
Date: Fri, 2 Feb 2018 16:52:42 +0000
Message-ID: <b5b83e68-fd48-d715-7e75-24e85dcdfbf3@citrix.com>
References: <5A29550C020000780019585B@prv-mh.provo.novell.com>
 <5A295BE60200007800195997@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=g0dj=e4=citrix.com=prvs=564f8cbd0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ehea2-00074N-P9
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2018 16:52:50 +0000
In-Reply-To: <5A295BE60200007800195997@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTIvMTcgMTQ6MTksIEphbiBCZXVsaWNoIHdyb3RlOgo+IEBAIC0yOTgsMTQgKzMzMiw0
MyBAQCBodm1fZW11bGF0ZV9jbXB4Y2hnKGVudW0geDg2X3NlZ21lbnQgc2VnCj4gICAgICBpZiAo
IHJjICkKPiAgICAgICAgICByZXR1cm4gcmM7Cj4gIAo+ICsgICAgLyogVW5hbGlnbmVkIHdyaXRl
cyBhcmUgb25seSBhY2NlcHRhYmxlIG9uIEhWTSAqLwo+ICsgICAgaWYgKCAoYWRkciAmIChieXRl
cyAtIDEpKSAmJiAhaXNfaHZtX3ZjcHUodikgICkKPiArICAgICAgICByZXR1cm4gWDg2RU1VTF9V
TkhBTkRMRUFCTEU7Cj4gKwo+ICsgICAgcHRyID0gc2hfZW11bGF0ZV9tYXBfZGVzdCh2LCBhZGRy
LCBieXRlcywgc2hfY3R4dCk7Cj4gKyAgICBpZiAoIElTX0VSUihwdHIpICkKPiArICAgICAgICBy
ZXR1cm4gflBUUl9FUlIocHRyKTsKPiArCj4gICAgICBvbGQgPSBuZXcgPSAwOwo+ICAgICAgbWVt
Y3B5KCZvbGQsIHBfb2xkLCBieXRlcyk7Cj4gICAgICBtZW1jcHkoJm5ldywgcF9uZXcsIGJ5dGVz
KTsKPiAgCj4gLSAgICByYyA9IHYtPmFyY2gucGFnaW5nLm1vZGUtPnNoYWRvdy54ODZfZW11bGF0
ZV9jbXB4Y2hnKAo+IC0gICAgICAgICAgICAgdiwgYWRkciwgJm9sZCwgbmV3LCBieXRlcywgc2hf
Y3R4dCk7Cj4gKyAgICBwYWdpbmdfbG9jayh2LT5kb21haW4pOwo+ICsgICAgc3dpdGNoICggYnl0
ZXMgKQo+ICsgICAgewo+ICsgICAgY2FzZSAxOiBwcmV2ID0gY21weGNoZygodWludDhfdCAgKilw
dHIsIG9sZCwgbmV3KTsgYnJlYWs7Cj4gKyAgICBjYXNlIDI6IHByZXYgPSBjbXB4Y2hnKCh1aW50
MTZfdCAqKXB0ciwgb2xkLCBuZXcpOyBicmVhazsKPiArICAgIGNhc2UgNDogcHJldiA9IGNtcHhj
aGcoKHVpbnQzMl90ICopcHRyLCBvbGQsIG5ldyk7IGJyZWFrOwo+ICsgICAgY2FzZSA4OiBwcmV2
ID0gY21weGNoZygodWludDY0X3QgKilwdHIsIG9sZCwgbmV3KTsgYnJlYWs7Cj4gKyAgICBkZWZh
dWx0Ogo+ICsgICAgICAgIFNIQURPV19QUklOVEsoImNtcHhjaGcgc2l6ZSAldSBpcyBub3Qgc3Vw
cG9ydGVkXG4iLCBieXRlcyk7CgpHaXZlbiB0aGUgZWFybGllciBwYXRjaGVzIGluIHRoZSBzZXJp
ZXMsIGlzIGl0IHdvcnRoIGludHJvZHVjaW5nIGNhc2UgMTYKaGVyZT8KCklycmVzcGVjdGl2ZSwg
dGhpcyBkb2Vzbid0IGludGVyZmVyZSB3aXRoIHRoZSBwdXJwb3NlIG9mIHRoZSBwYXRjaCwgc28K
UmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
