From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 4/7] add nspin_sleep function to time manager
Date: Mon, 9 Apr 2018 10:37:43 +0100
Message-ID: <20180409093743.33jxiw5zxmj2ocfy@MacBook-Pro-de-Roger.local>
References: <20180404155054.99335-1-wipawel@amazon.de>
 <20180404155054.99335-4-wipawel@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zyed=g6=citrix.com=prvs=630451c49=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f5TFH-0005zz-3Z
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 09:37:51 +0000
Content-Disposition: inline
In-Reply-To: <20180404155054.99335-4-wipawel@amazon.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pawel Wieczorkiewicz <wipawel@amazon.de>
Cc: semelpaul@gmail.com, xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBcHIgMDQsIDIwMTggYXQgMDM6NTA6NTFQTSArMDAwMCwgUGF3ZWwgV2llY3pvcmtp
ZXdpY3ogd3JvdGU6Cj4gRnJvbTogUGF1bCBTZW1lbCA8cGhlbnRleEBhbWF6b24uZGU+CgpNaXNz
aW5nIGNvbW1pdCBsb2c/Cgo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgU2VtZWwgPHBoZW50ZXhAYW1h
em9uLmRlPgo+IAo+IGNyIGh0dHBzOi8vY29kZS5hbWF6b24uY29tL3Jldmlld3MvQ1ItODM2NTM5
Cj4gLS0tCj4gIGNvbW1vbi90aW1lLmMgfCAxOCArKysrKysrKysrKysrKysrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvY29tbW9uL3RpbWUu
YyBiL2NvbW1vbi90aW1lLmMKPiBpbmRleCBjODBiYzExLi5kYjI4ZDc4IDEwMDY0NAo+IC0tLSBh
L2NvbW1vbi90aW1lLmMKPiArKysgYi9jb21tb24vdGltZS5jCj4gQEAgLTEwNiw2ICsxMDYsMjQg
QEAgaW50IGdldHRpbWVvZmRheShzdHJ1Y3QgdGltZXZhbCAqdHApCj4gICAgICByZXR1cm4gMDsK
PiAgfQo+ICAKPiArI2lmIGRlZmluZWQoX19pMzg2X18pCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBu
c3Bpbl9zbGVlcCh1aW50MzJfdCB0KQo+ICsjZWxzZQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgbnNw
aW5fc2xlZXAodWludDY0X3QgdCkKPiArI2VuZGlmCj4gK3sKPiArI2lmIGRlZmluZWQoX19pMzg2
X18pCj4gKyAgICB1aW50MzJfdCBjdXJyID0gc2luY2VfYm9vdF90aW1lKCk7Cj4gKyAgICB1aW50
MzJfdCBlbmQgPSBjdXJyICsgdDsKPiArI2Vsc2UKPiArICAgIHVpbnQ2NF90IGN1cnIgPSBzaW5j
ZV9ib290X3RpbWUoKTsKPiArICAgIHVpbnQ2NF90IGVuZCA9IGN1cnIgKyB0Owo+ICsjZW5kaWYK
CkFnYWluIHNhbWUgY29tbWVudCBhcyBiZWZvcmUgcmVnYXJkaW5nIHRoZSAzMiB2cyA2NGJpdCB0
eXBlcy4KCllvdSB3b3VsZCBwcm9iYWJseSB3YW50IHNvbWV0aGluZyBsaWtlOgoKaWYgKCBlbmQg
PCBjdXJyICkKICAgIHBhbmljKCJlbmQgdmFsdWUgb3ZlcmZsb3dzIGNvdW50ZXJcbiIpOwoKPiAr
Cj4gKyAgICB3aGlsZSAoIGN1cnIgPCBlbmQgKQo+ICsgICAgICAgIGN1cnIgPSBzaW5jZV9ib290
X3RpbWUoKTsKCkFuZCB5b3UgbGlrZWx5IHdhbnQgdGhpcyB0byBiZToKCndoaWxlICggZW5kIDwg
c2luY2VfYm9vdF90aW1lKCkgKQogICAgYXNtIHZvbGF0aWxlICgicGF1c2UiKTsKCkknbSBhY3R1
YWxseSB0cnlpbmcgdG8gYWRkIGEgInBhdXNlIiBpbnN0cnVjdGlvbiBoZWxwZXIgaW46CgpodHRw
czovL21hcmMuaW5mby8/bD14ZW4tZGV2ZWwmbT0xNTIyNDEzNjQ1MTA4NDAKClRoYW5rcywgUm9n
ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
