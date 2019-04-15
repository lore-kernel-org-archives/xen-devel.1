From: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [edk2-devel] [PATCH v2 25/31]
 OvmfPkg/PlatformBootManagerLib: Handle the absence of PCI bus on Xen PVH
Date: Mon, 15 Apr 2019 15:33:25 +0200
Message-ID: <318fa5c9-c86c-166a-ffa8-0b2219c3de2a@redhat.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-26-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DCQv=SR=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hG1kH-0000n3-8D
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 13:34:01 +0000
In-Reply-To: <20190409110844.14746-26-anthony.perard@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: devel@edk2.groups.io, anthony.perard@citrix.com
Cc: Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDkvMTkgMTM6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFdoZW4gcnVubmluZyBv
biBQVkggd2l0aG91dCBQQ0kgYnVzLCB0aGUgWGVuUGxhdGZvcm1QZWkgd2lsbCBzZXQKPiBQY2RP
dm1mSG9zdEJyaWRnZVBjaURldklkIHRvIFhFTl9QVkhfUENJX0hPU1RfQlJJREdFX0RFVklDRV9J
RC4KPiAKPiBDb250cmlidXRlZC11bmRlcjogVGlhbm9Db3JlIENvbnRyaWJ1dGlvbiBBZ3JlZW1l
bnQgMS4xCj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNp
dHJpeC5jb20+Cj4gLS0tCj4gIE92bWZQa2cvTGlicmFyeS9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGli
L0Jkc1BsYXRmb3JtLmMgfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9MaWJyYXJ5L1BsYXRmb3JtQm9vdE1hbmFnZXJM
aWIvQmRzUGxhdGZvcm0uYyBiL092bWZQa2cvTGlicmFyeS9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGli
L0Jkc1BsYXRmb3JtLmMKPiBpbmRleCAxMjMwM2ZiMGYxLi4xYTZkNDc3MzJlIDEwMDY0NAo+IC0t
LSBhL092bWZQa2cvTGlicmFyeS9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGliL0Jkc1BsYXRmb3JtLmMK
PiArKysgYi9Pdm1mUGtnL0xpYnJhcnkvUGxhdGZvcm1Cb290TWFuYWdlckxpYi9CZHNQbGF0Zm9y
bS5jCj4gQEAgLTEyMTMsNiArMTIxMywxMSBAQCBQY2lBY3BpSW5pdGlhbGl6YXRpb24gKAo+ICAg
ICAgICBQY2lXcml0ZTggKFBDSV9MSUJfQUREUkVTUyAoMCwgMHgxZiwgMCwgMHg2YSksIDB4MGIp
OyAvLyBHCj4gICAgICAgIFBjaVdyaXRlOCAoUENJX0xJQl9BRERSRVNTICgwLCAweDFmLCAwLCAw
eDZiKSwgMHgwYik7IC8vIEgKPiAgICAgICAgYnJlYWs7Cj4gKyAgICBjYXNlIFhFTl9QVkhfUENJ
X0hPU1RfQlJJREdFX0RFVklDRV9JRDoKPiArICAgICAgLy8KPiArICAgICAgLy8gVGhlcmUgYXJl
IG5vIFBDSSBidXMgaW4gdGhpcyBjYXNlLgoKKDEpIHMvYXJlL2lzLywgcGxlYXNlCgp3aXRoIHRo
YXQ6CgpSZXZpZXdlZC1ieTogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KClRoYW5r
cwpMYXN6bG8KCj4gKyAgICAgIC8vCj4gKyAgICAgIHJldHVybjsKPiAgICAgIGRlZmF1bHQ6Cj4g
ICAgICAgIERFQlVHICgoRUZJX0RfRVJST1IsICIlYTogVW5rbm93biBIb3N0IEJyaWRnZSBEZXZp
Y2UgSUQ6IDB4JTA0eFxuIiwKPiAgICAgICAgICBfX0ZVTkNUSU9OX18sIG1Ib3N0QnJpZGdlRGV2
SWQpKTsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
