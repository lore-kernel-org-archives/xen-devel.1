From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 02/39] ARM: GIC: add GIC_INVALID to enum
 gic_version
Date: Thu, 22 Mar 2018 01:39:12 +0000
Message-ID: <cc66865e-9116-b0f1-6e1e-0b41618981be@arm.com>
References: <20180321163235.12529-1-andre.przywara@linaro.org>
 <20180321163235.12529-3-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rlws=gm=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eypCJ-0004mE-MS
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 01:39:19 +0000
In-Reply-To: <20180321163235.12529-3-andre.przywara@linaro.org>
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

SGkgQW5kcmUsCgpPbiAwMy8yMS8yMDE4IDA0OjMxIFBNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToK
PiBUaGUgZW51bSBnaWNfdmVyc2lvbiBhdCB0aGUgbW9tZW50IGp1c3QgY29udGFpbnMgR0lDX1Yy
IGFuZCBHSUNfVjMsCj4gd2hlcmUgR0lDX1YyIGhhcHBlbnMgdG8gbWFwIHRvIDAuIFNvIHdpdGhv
dXQgaGF2aW5nIGluaXRpYWxpc2VkIGEKPiB2YXJpYWJsZSBvZiB0aGF0IHR5cGUsIHdlIHdpbGwg
cmVhZCBiYWNrIEdJQ19WMiAod2hlbiBhbGxvY2F0ZWQgd2l0aCB6ZXJvaW5nCj4gdGhlIG1lbW9y
eSkuCj4gVG8gcHJldmVudCBhbWJpZ3VpdGllcyBhbmQgdG8gZ2l2ZSBhbiBleHBsaWNpdGx5IHVu
aW5pdGlhbGlzZWQgc3RhdGUsIGFkZAo+IGEgbmV3IGZpcnN0IG1lbWJlcjogR0lDX0lOVkFMSUQu
IEFsc28gbWFrZSBpdCBvYnZpb3VzIHRoYXQgdGhpcyBoYXMgYQo+ICIwIiBlbmNvZGluZy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAbGluYXJvLm9y
Zz4KCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJz
LAoKPiAtLS0KPiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vZ2ljLmggfCAxICsKPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20t
YXJtL2dpYy5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9naWMuaAo+IGluZGV4IDU2NWIwODc1Y2Eu
LjMwNzkzODdlMDYgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9naWMuaAo+ICsr
KyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ2ljLmgKPiBAQCAtMjI3LDYgKzIyNyw3IEBAIHN0cnVj
dCBnaWNfbHIgewo+ICAgfTsKPiAgIAo+ICAgZW51bSBnaWNfdmVyc2lvbiB7Cj4gKyAgICBHSUNf
SU5WQUxJRCA9IDAsICAgIC8qIHRoZSBkZWZhdWx0IHVudGlsIGV4cGxpY2l0bHkgc2V0IHVwICov
Cj4gICAgICAgR0lDX1YyLAo+ICAgICAgIEdJQ19WMywKPiAgIH07Cj4gCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
