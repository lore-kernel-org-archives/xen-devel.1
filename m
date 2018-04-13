From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 4/7] add nspin_sleep function to time
 manager
Date: Fri, 13 Apr 2018 14:51:40 +0100
Message-ID: <20180413135140.5vnei4nylsj5nmlh@MacBook-Pro-de-Roger.local>
References: <20180410191701.17203-1-semelpaul@gmail.com>
 <20180410191701.17203-4-semelpaul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=aili=hc=citrix.com=prvs=63401f18f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f6z7M-0000LG-Qv
 for xen-devel@lists.xenproject.org; Fri, 13 Apr 2018 13:51:56 +0000
Content-Disposition: inline
In-Reply-To: <20180410191701.17203-4-semelpaul@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Semel <semelpaul@gmail.com>
Cc: xen-devel@lists.xenproject.org, Paul Semel <phentex@amazon.de>, andrew.cooper3@citrix.com, wipawel@amazon.de
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMTAsIDIwMTggYXQgMDk6MTY6NThQTSArMDIwMCwgUGF1bCBTZW1lbCB3cm90
ZToKPiB0aGlzIGZ1bmN0aW9uIHNwaW4gc2xlZXBzIGZvciB0IG5hbm9zZWNvbmRzCj4gCj4gU2ln
bmVkLW9mZi1ieTogUGF1bCBTZW1lbCA8cGhlbnRleEBhbWF6b24uZGU+Cj4gLS0tCj4gCj4gTm90
ZXM6Cj4gICAgIHY0Ogo+ICAgICAtIG5ldyBwYXRjaCB2ZXJzaW9uCj4gCj4gIGNvbW1vbi90aW1l
LmMgfCAxMiArKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvY29tbW9uL3RpbWUuYyBiL2NvbW1vbi90aW1lLmMKPiBpbmRleCA4
NDg5ZjNiLi4yMzJlMTM0IDEwMDY0NAo+IC0tLSBhL2NvbW1vbi90aW1lLmMKPiArKysgYi9jb21t
b24vdGltZS5jCj4gQEAgLTEzOSw2ICsxMzksMTggQEAgaW50IGdldHRpbWVvZmRheShzdHJ1Y3Qg
dGltZXZhbCAqdHAsIHZvaWQgKnJlc3RyaWN0IHR6cCkKPiAgICAgIHJldHVybiAwOwo+ICB9Cj4g
IAo+ICtzdGF0aWMgaW5saW5lIHZvaWQgbnNwaW5fc2xlZXAodWludDY0X3QgdCkKPiArewo+ICsg
ICAgdWludDY0X3QgY3VyciA9IHNpbmNlX2Jvb3RfdGltZSgpOwo+ICsgICAgdWludDY0X3QgZW5k
ID0gY3VyciArIHQ7Cj4gKwo+ICsgICAgaWYgKCBlbmQgPCBjdXJyICkKPiArICAgICAgICBwYW5p
YygiZW5kIHZhbHVlIG92ZXJmbG93cyBjb3VudGVyXG4iKTsKPiArCj4gKyAgICB3aGlsZSAoIHNp
bmNlX2Jvb3RfdGltZSgpIDwgZW5kICkKPiArICAgICAgICBhc20gdm9sYXRpbGUgKCJwYXVzZSIp
OwoKWW91IGxpa2VseSB3YW50IHRvIGFkZCBhIHBhdXNlIGhlbHBlciB0byBhcmNoL3g4Ni9pbmNs
dWRlL2FyY2gvbGliLmgKaW4gb3JkZXIgdG8gYXZvaWQgb3Blbi1jb2RpbmcgdGhlIGFzbSBpbnN0
cnVjdGlvbiBpbiBjb21tb24gY29kZS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
