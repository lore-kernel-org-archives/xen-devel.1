From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 36/57] ARM: new VGIC: Add CTLR,
	TYPER and IIDR handlers
Date: Wed, 7 Mar 2018 16:48:14 +0000
Message-ID: <9ee5f08d-9090-2d4a-ae24-89c1c9775f11@arm.com>
References: <20180305160415.16760-1-andre.przywara@linaro.org>
 <20180305160415.16760-37-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=+hct=f5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1etcEq-0005bC-UK
 for xen-devel@lists.xenproject.org; Wed, 07 Mar 2018 16:48:24 +0000
In-Reply-To: <20180305160415.16760-37-andre.przywara@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmUsCgpPbiAwMy8wNS8yMDE4IDA0OjAzIFBNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToK
PiArc3RhdGljIHZvaWQgdmdpY19tbWlvX3dyaXRlX3YyX21pc2Moc3RydWN0IHZjcHUgKnZjcHUs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZGRyX3QgYWRkciwgdW5z
aWduZWQgaW50IGxlbiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyB2YWwpCj4gK3sKPiArICAgIHN0cnVjdCB2Z2ljX2Rpc3QgKmRpc3QgPSAmdmNw
dS0+ZG9tYWluLT5hcmNoLnZnaWM7Cj4gKyAgICBib29sIGVuYWJsZWQ7Cj4gKwo+ICsgICAgc3dp
dGNoICggYWRkciAmIDB4MGMgKSAgICAgIC8qIGZpbHRlciBmb3IgdGhlIDQgcmVnaXN0ZXJzIGhh
bmRsZWQgaGVyZSAqLwo+ICsgICAgewo+ICsgICAgY2FzZSBHSUNEX0NUTFI6Cj4gKyAgICAgICAg
ZG9tYWluX2xvY2sodmNwdS0+ZG9tYWluKTsKPiArICAgICAgICBlbmFibGVkID0gZGlzdC0+ZW5h
YmxlZDsKPiArICAgICAgICBkaXN0LT5lbmFibGVkID0gdmFsICYgR0lDRF9DVExfRU5BQkxFOwo+
ICsgICAgICAgIGVuYWJsZWQgPSAhZW5hYmxlZCAmJiBkaXN0LT5lbmFibGVkOwo+ICsgICAgICAg
IGRvbWFpbl91bmxvY2sodmNwdS0+ZG9tYWluKTsKPiArCj4gKyAgICAgICAgaWYgKGVuYWJsZWQp
CgppZiAoIC4uLiApCgpBbHNvLCBpdCB0b29rIG1lIGEgYml0IG9mIHRpbWUgdG8gdW5kZXJzdGFu
ZCB3aGF0IGlzIHRoZSBiZWhhdmlvciBvZiAKZW5hYmxlIGhlcmUuIElmIEkgYW0gbm90IG1pc3Rh
a2UgaXQgd2lsbCBiZSB0cnVlIG9ubHkgd2hlbiB0b2dnbGUgZnJvbSAKZGlzYWJsZSAtPiBlbmFi
bGUsIHJpZ2h0PyBJZiBzbywgSSBjYW4geW91IHBsZWFzZSBlaXRoZXIgcmV3b3JrIHRoZSBjb2Rl
IAp0byBtYWtlIGl0IG1vcmUgb2J2aW91cyAobWF5YmUgYSBuZXcgdmFyaWFibGUpIG9yIGFkZCBt
b3JlIGNvbW1lbnQ/Cgo+ICsgICAgICAgICAgICB2Z2ljX2tpY2tfdmNwdXModmNwdS0+ZG9tYWlu
KTsKPiArCj4gKyAgICAgICAgYnJlYWs7Cj4gKyAgICBjYXNlIEdJQ0RfVFlQRVI6Cj4gKyAgICBj
YXNlIEdJQ0RfSUlEUjoKPiArICAgICAgICAvKiByZWFkLW9ubHksIHdyaXRlcyBpZ25vcmVkICov
Cj4gKyAgICAgICAgcmV0dXJuOwo+ICsgICAgfQo+ICt9Cj4gKwoKQ2hlZXJzLAoKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
