From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 49/57] ARM: new VGIC: provide system
 register emulation stub
Date: Fri, 9 Mar 2018 17:53:57 +0000
Message-ID: <d873e13f-f4c0-fd28-4ec6-57d8ae3597ed@arm.com>
References: <20180305160415.16760-1-andre.przywara@linaro.org>
 <20180305160415.16760-50-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=opao=f7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1euMDW-00025I-EE
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 17:54:06 +0000
In-Reply-To: <20180305160415.16760-50-andre.przywara@linaro.org>
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

CgpPbiAwNS8wMy8xOCAxNjowNCwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gVGhlIFhlbiBhcmNo
IGNvZGUgdHJhcHMgc3lzdGVtIHJlZ2lzdGVycyB3cml0ZXMgZnJvbSB0aGUgZ3Vlc3QgYW5kIHdp
bGwKPiByZWxheSBhbnl0aGluZyBHSUMgcmVsYXRlZCB0byB0aGUgVkdJQy4KPiBTaW5jZSB0aGlz
IGFmZmVjdHMgb25seSBHSUN2MyAod2hpY2ggd2UgZG9uJ3QgeWV0IGVtdWxhdGUpLCBwcm92aWRl
IGEKPiBzdHViIGltcGxlbWVudGF0aW9uIG9mIHZnaWNfZW11bGF0ZSgpIGZvciBub3cuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnByenl3YXJhQGxpbmFyby5vcmc+
CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywK
Cj4gLS0tCj4gQ2hhbmdlbG9nIFJGQyAuLi4gdjE6Cj4gLSBubyBjaGFuZ2VzCj4gCj4gICB4ZW4v
YXJjaC9hcm0vdmdpYy92Z2ljLmMgfCA3ICsrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jIGIv
eGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jCj4gaW5kZXggMmEyYjhmZDFlYi4uZTE5NTJjODcyZCAx
MDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMKPiArKysgYi94ZW4vYXJjaC9h
cm0vdmdpYy92Z2ljLmMKPiBAQCAtODEzLDYgKzgxMywxMyBAQCBzdHJ1Y3QgaXJxX2Rlc2MgKnZn
aWNfZ2V0X2h3X2lycV9kZXNjKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2Y3B1ICp2LAo+ICAg
ICAgIHJldHVybiBkZXNjOwo+ICAgfQo+ICAgCj4gK2Jvb2wgdmdpY19lbXVsYXRlKHN0cnVjdCBj
cHVfdXNlcl9yZWdzICpyZWdzLCB1bmlvbiBoc3IgaHNyKQo+ICt7Cj4gKyAgICBBU1NFUlQoY3Vy
cmVudC0+ZG9tYWluLT5hcmNoLnZnaWMudmVyc2lvbiA9PSBHSUNfVjMpOwo+ICsKPiArICAgIHJl
dHVybiBmYWxzZTsKPiArfQo+ICsKPiAgIC8qCj4gICAgKiB3YXM6Cj4gICAgKiAgICAgIGludCBr
dm1fdmdpY19tYXBfcGh5c19pcnEoc3RydWN0IHZjcHUgKnZjcHUsIHUzMiB2aXJ0X2lycSwgdTMy
IHBoeXNfaXJxKQo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
