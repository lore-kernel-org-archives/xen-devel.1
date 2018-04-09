From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 5/7] add spin_sleep function to time manager
Date: Mon, 9 Apr 2018 10:38:43 +0100
Message-ID: <20180409093843.7pr7xmpkkmhtq4tl@MacBook-Pro-de-Roger.local>
References: <20180404155054.99335-1-wipawel@amazon.de>
 <20180404155054.99335-5-wipawel@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zyed=g6=citrix.com=prvs=630451c49=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f5TGD-000664-TU
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 09:38:49 +0000
Content-Disposition: inline
In-Reply-To: <20180404155054.99335-5-wipawel@amazon.de>
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

T24gV2VkLCBBcHIgMDQsIDIwMTggYXQgMDM6NTA6NTJQTSArMDAwMCwgUGF3ZWwgV2llY3pvcmtp
ZXdpY3ogd3JvdGU6Cj4gRnJvbTogUGF1bCBTZW1lbCA8cGhlbnRleEBhbWF6b24uZGU+CgpNaXNz
aW5nIGNvbW1pdCBsb2cuCgo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgU2VtZWwgPHBoZW50ZXhAYW1h
em9uLmRlPgo+IAo+IGNyIGh0dHBzOi8vY29kZS5hbWF6b24uY29tL3Jldmlld3MvQ1ItNzg2MjI2
Cj4gLS0tCj4gIGNvbW1vbi90aW1lLmMgfCAxNCArKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMTQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9jb21tb24vdGltZS5jIGIv
Y29tbW9uL3RpbWUuYwo+IGluZGV4IGRiMjhkNzguLjZhYTE2NDggMTAwNjQ0Cj4gLS0tIGEvY29t
bW9uL3RpbWUuYwo+ICsrKyBiL2NvbW1vbi90aW1lLmMKPiBAQCAtMTI0LDYgKzEyNCwyMCBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgbnNwaW5fc2xlZXAodWludDY0X3QgdCkKPiAgICAgICAgICBjdXJy
ID0gc2luY2VfYm9vdF90aW1lKCk7Cj4gIH0KPiAgCj4gKyNpZiBkZWZpbmVkKF9faTM4Nl9fKQo+
ICtzdGF0aWMgaW5saW5lIHZvaWQgc3Bpbl9zbGVlcCh1aW50MzJfdCB0KQo+ICsjZWxzZQo+ICtz
dGF0aWMgaW5saW5lIHZvaWQgc3Bpbl9zbGVlcCh1aW50NjRfdCB0KQo+ICsjZW5kaWYKPiArewo+
ICsjaWYgZGVmaW5lZChfX2kzODZfXykKPiArICAgIHVpbnQzMl90IG5zZWMgPSB0ICogMTAwMDAw
MDAwMDsKPiArI2Vsc2UKPiArICAgIHVpbnQ2NF90IG5zZWMgPSB0ICogMTAwMDAwMDAwMHVsOwoK
VGhpcyB2YWx1ZSBzaG91bGQgYmUgaW4gYSBkZWZpbmUgd2l0aCBhIHByb3BlciBuYW1lLgoKVGhh
bmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
