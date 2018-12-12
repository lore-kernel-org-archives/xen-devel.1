From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 14/25] argo: implement the unregister op
Date: Wed, 12 Dec 2018 02:51:09 -0700
Message-ID: <5C10DA0D02000078002055DF@prv1-mh.provo.novell.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-15-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KCT2=OV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gX1Ah-0000Kh-FK
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 09:51:15 +0000
In-Reply-To: <1543627984-21394-15-git-send-email-christopher.w.clark@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <voreekf@madingley.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjEyLjE4IGF0IDAyOjMyLCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IC0tLSBhL3hlbi9jb21tb24vYXJnby5jCj4gKysrIGIveGVuL2NvbW1vbi9hcmdv
LmMKPiBAQCAtNTEwLDYgKzUxMCw1OSBAQCBhcmdvX3JpbmdfZmluZF9pbmZvKGNvbnN0IHN0cnVj
dCBkb21haW4gKmQsIGNvbnN0IHN0cnVjdCBhcmdvX3JpbmdfaWQgKmlkKQo+ICB9Cj4gIAo+ICBz
dGF0aWMgbG9uZwo+ICthcmdvX3VucmVnaXN0ZXJfcmluZyhzdHJ1Y3QgZG9tYWluICpkLAo+ICsg
ICAgICAgICAgICAgICAgICAgICBYRU5fR1VFU1RfSEFORExFX1BBUkFNKGFyZ29fcmluZ190KSBy
aW5nX2huZCkKPiArewo+ICsgICAgc3RydWN0IGFyZ29fcmluZyByaW5nOwo+ICsgICAgc3RydWN0
IGFyZ29fcmluZ19pbmZvICpyaW5nX2luZm87Cj4gKyAgICBpbnQgcmV0ID0gMDsKPiArCj4gKyAg
ICByZWFkX2xvY2soJmFyZ29fbG9jayk7Cj4gKwo+ICsgICAgZG8gewo+ICsgICAgICAgIGlmICgg
IWQtPmFyZ28gKQo+ICsgICAgICAgIHsKPiArICAgICAgICAgICAgcmV0ID0gLUVOT0RFVjsKPiAr
ICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAgfQo+ICsKPiArICAgICAgICByZXQgPSBjb3B5
X2Zyb21fZ3Vlc3RfZXJybm8oJnJpbmcsIHJpbmdfaG5kLCAxKTsKPiArICAgICAgICBpZiAoIHJl
dCApCj4gKyAgICAgICAgICAgIGJyZWFrOwo+ICsKPiArICAgICAgICBpZiAoIHJpbmcubWFnaWMg
IT0gQVJHT19SSU5HX01BR0lDICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIGFyZ29fZHBy
aW50aygKPiArICAgICAgICAgICAgICAgICJyaW5nLm1hZ2ljKCUiUFJJeDY0IikgIT0gQVJHT19S
SU5HX01BR0lDKCVsbHgpLCBFSU5WQUxcbiIsCj4gKyAgICAgICAgICAgICAgICByaW5nLm1hZ2lj
LCBBUkdPX1JJTkdfTUFHSUMpOwo+ICsgICAgICAgICAgICByZXQgPSAtRUlOVkFMOwo+ICsgICAg
ICAgICAgICBicmVhazsKPiArICAgICAgICB9Cj4gKwo+ICsgICAgICAgIHJpbmcuaWQuYWRkci5k
b21haW5faWQgPSBkLT5kb21haW5faWQ7CgpXaHkgdGhlIG92ZXJyaWRlPwoKPiArICAgICAgICB3
cml0ZV9sb2NrKCZkLT5hcmdvLT5sb2NrKTsKPiArCj4gKyAgICAgICAgcmluZ19pbmZvID0gYXJn
b19yaW5nX2ZpbmRfaW5mbyhkLCAmcmluZy5pZCk7Cj4gKyAgICAgICAgaWYgKCByaW5nX2luZm8g
KQo+ICsgICAgICAgICAgICBhcmdvX3JpbmdfcmVtb3ZlX2luZm8oZCwgcmluZ19pbmZvKTsKPiAr
Cj4gKyAgICAgICAgd3JpdGVfdW5sb2NrKCZkLT5hcmdvLT5sb2NrKTsKPiArCj4gKyAgICAgICAg
aWYgKCAhcmluZ19pbmZvICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIGFyZ29fZHByaW50
aygiRU5PRU5UXG4iKTsKPiArICAgICAgICAgICAgcmV0ID0gLUVOT0VOVDsKPiArICAgICAgICAg
ICAgYnJlYWs7Cj4gKyAgICAgICAgfQo+ICsKPiArICAgIH0gd2hpbGUgKCAwICk7Cj4gKwo+ICsg
ICAgcmVhZF91bmxvY2soJmFyZ29fbG9jayk7Cj4gKyAgICByZXR1cm4gcmV0Owo+ICt9CgpCbGFu
ayBsaW5lIGFoZWFkIG9mIHRoZSBtYWluIHJldHVybiBzdGF0ZW1lbnQgb2YgYSBmdW5jdGlvbiBw
bGVhc2UuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
