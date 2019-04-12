From: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [edk2-devel] [PATCH v2 19/31]
 OvmfPkg/XenPlatformPei: Introduce XenPvhDetected
Date: Fri, 12 Apr 2019 11:20:08 +0200
Message-ID: <cf21ea86-8e6a-ebb1-dc01-dc364530553a@redhat.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-20-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCWt=SO=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hEsM0-0003i5-Ct
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 09:20:12 +0000
In-Reply-To: <20190409110844.14746-20-anthony.perard@citrix.com>
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

T24gMDQvMDkvMTkgMTM6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IENvbnRyaWJ1dGVkLXVu
ZGVyOiBUaWFub0NvcmUgQ29udHJpYnV0aW9uIEFncmVlbWVudCAxLjEKPiBTaWduZWQtb2ZmLWJ5
OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0KPiAgT3Zt
ZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5oIHwgIDUgKysrKysKPiAgT3ZtZlBrZy9YZW5Q
bGF0Zm9ybVBlaS9YZW4uYyAgICAgIHwgMTMgKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5QbGF0Zm9y
bVBlaS9QbGF0Zm9ybS5oIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5oCj4gaW5k
ZXggYTUyNGMyM2E0My4uYzVhMTM5ZjAxNiAxMDA2NDQKPiAtLS0gYS9Pdm1mUGtnL1hlblBsYXRm
b3JtUGVpL1BsYXRmb3JtLmgKPiArKysgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3Jt
LmgKPiBAQCAtMTA1LDYgKzEwNSwxMSBAQCBYZW5Idm1sb2FkZXJEZXRlY3RlZCAoCj4gICAgVk9J
RAo+ICAgICk7Cj4gIAo+ICtCT09MRUFOCj4gK1hlblB2aERldGVjdGVkICgKPiArICBWT0lECj4g
KyAgKTsKPiArCj4gIFZPSUQKPiAgQW1kU2V2SW5pdGlhbGl6ZSAoCj4gICAgVk9JRAo+IGRpZmYg
LS1naXQgYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jIGIvT3ZtZlBrZy9YZW5QbGF0Zm9y
bVBlaS9YZW4uYwo+IGluZGV4IGIzNmVmZjUyNGQuLjIzZmYzMTAyYjUgMTAwNjQ0Cj4gLS0tIGEv
T3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwo+ICsrKyBiL092bWZQa2cvWGVuUGxhdGZvcm1Q
ZWkvWGVuLmMKPiBAQCAtMjE3LDYgKzIxNywxOSBAQCBYZW5Idm1sb2FkZXJEZXRlY3RlZCAoCj4g
ICAgcmV0dXJuIChtWGVuSHZtbG9hZGVySW5mbyAhPSBOVUxMKTsKPiAgfQo+ICAKPiArQk9PTEVB
Tgo+ICtYZW5QdmhEZXRlY3RlZCAoCj4gKyAgVk9JRAo+ICsgICkKPiArewo+ICsgIC8vCj4gKyAg
Ly8gVGhpcyBmdW5jdGlvbiBzaG91bGQgb25seSBiZSB1c2VkIGFmdGVyIFhlbkNvbm5lY3QKPiAr
ICAvLwo+ICsgIEFTU0VSVCAobVhlbkluZm8uVmVyc2lvbk1ham9yICE9IDApOwo+ICsKPiArICBy
ZXR1cm4gbVhlbkh2bWxvYWRlckluZm8gPT0gTlVMTDsKPiArfQo+ICsKPiAgVk9JRAo+ICBYZW5Q
dWJsaXNoUmFtUmVnaW9ucyAoCj4gICAgVk9JRAo+IAoKKDEpIFBsZWFzZSB3cml0ZSBhIG5vbmVt
cHR5IGNvbW1pdCBtZXNzYWdlIGJvZHkuCgp3aXRoIHRoYXQKCkFja2VkLWJ5OiBMYXN6bG8gRXJz
ZWsgPGxlcnNla0ByZWRoYXQuY29tPgoKVGhhbmtzCkxhc3psbwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
