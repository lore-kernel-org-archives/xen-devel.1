From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH 1/7] tools: ARM: vGICv3: avoid inserting
 optional DT properties
Date: Wed, 24 Jan 2018 16:08:24 +0000
Message-ID: <72f88f8d-f672-e1c9-7975-0392d0805039@linaro.org>
References: <20180124143517.18469-1-andre.przywara@linaro.org>
 <20180124143517.18469-2-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=szm7=et=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eeNcD-0002BB-TC
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 16:09:34 +0000
Received: by mail-wm0-f67.google.com with SMTP id g1so9419551wmg.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2018 08:09:26 -0800 (PST)
In-Reply-To: <20180124143517.18469-2-andre.przywara@linaro.org>
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

KCsgVG9vbHMgbWFpbnRhaW5lcnMpCgpIaSBBbmRyZSwKCk9uIDI0LzAxLzE4IDE0OjM1LCBBbmRy
ZSBQcnp5d2FyYSB3cm90ZToKPiBXaGVuIGNyZWF0aW5nIGEgR0lDdjMgZGV2aWNldHJlZSBub2Rl
LCB3ZSBjdXJyZW50bHkgaW5zZXJ0IHRoZQo+IHJlZGlzdHJpYnV0b3Itc3RyaWRlIGFuZCAjcmVk
aXN0cmlidXRvci1yZWdpb25zIHByb3BlcnRpZXMsIHdpdGggZml4ZWQKPiB2YWx1ZXMgd2hpY2gg
YXJlIGFjdHVhbGx5IHRoZSBhcmNoaXRlY3RlZCBvbmVzLiBCdXQgdGhvc2UgcHJvcGVydGllcyBh
cmUKPiBvcHRpb25hbCBhbmQgb25seSBuZWVkZWQgdG8gY292ZXIgZm9yIGJyb2tlbiBwbGF0Zm9y
bXMsIHdoZXJlIHRoZSB2YWx1ZXMKPiBkaWZmZXIgZnJvbSB0aGUgYXJjaGl0ZWN0ZWQgb25lLiBU
aGlzIHdpbGwgbmV2ZXIgYmUgdGhlIGNhc2UgZm9yIHRoZQoKSSB1bmRlcnN0YW5kIHRoYXQgdGhl
IHN0cmlkZSBpcyBkZWZpbmVkIGJ5IEdJQ3YzLiBCdXQgSSBkb24ndCB0aGluayB0aGlzIAppcyB0
cnVlIGZvciB0aGUgbnVtYmVyIG9mIHJlZ2lvbnMuIExvb2tpbmcgYXQgdGhlIHNwZWMsIG11bHRp
cGxlIHJlZ2lvbnMgCnNlZW1zIHRvIGJlIGFsbG93ZWQgKHNlZSBHSUNSX1RZUEVSLkxhc3QpLiBE
aWQgSSBtaXNzIGFueXRoaW5nPwoKVGhlIHJlc3QgbG9va3MgZ29vZCB0byBtZS4KCj4gY29uc3Ry
dWN0ZWQgRG9tVSBtZW1vcnkgbWFwLgo+IFNvIHdlIGRyb3AgdGhvc2UgcHJvcGVydGllcyBhbHRv
Z2V0aGVyIGFuZCBwcm92aWRlIGEgY2xlYW4gYW5kIGFyY2hpdGVjdGVkCj4gR0lDdjMgRFQgbm9k
ZSBmb3IgRG9tVXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnBy
enl3YXJhQGxpbmFyby5vcmc+Cj4gLS0tCj4gICB0b29scy9saWJ4bC9saWJ4bF9hcm0uYyB8IDgg
LS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS90b29scy9saWJ4bC9saWJ4bF9hcm0uYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2FybS5jCj4g
aW5kZXggM2U0NjU1NDMwMS4uYjViYmEzY2QzMyAxMDA2NDQKPiAtLS0gYS90b29scy9saWJ4bC9s
aWJ4bF9hcm0uYwo+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2FybS5jCj4gQEAgLTUyNCwxNCAr
NTI0LDYgQEAgc3RhdGljIGludCBtYWtlX2dpY3YzX25vZGUobGlieGxfX2djICpnYywgdm9pZCAq
ZmR0KQo+ICAgICAgIHJlcyA9IGZkdF9wcm9wZXJ0eShmZHQsICJpbnRlcnJ1cHQtY29udHJvbGxl
ciIsIE5VTEwsIDApOwo+ICAgICAgIGlmIChyZXMpIHJldHVybiByZXM7Cj4gICAKPiAtICAgIHJl
cyA9IGZkdF9wcm9wZXJ0eV9jZWxsKGZkdCwgInJlZGlzdHJpYnV0b3Itc3RyaWRlIiwKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIEdVRVNUX0dJQ1YzX1JESVNUX1NUUklERSk7Cj4gLSAg
ICBpZiAocmVzKSByZXR1cm4gcmVzOwo+IC0KPiAtICAgIHJlcyA9IGZkdF9wcm9wZXJ0eV9jZWxs
KGZkdCwgIiNyZWRpc3RyaWJ1dG9yLXJlZ2lvbnMiLAo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgR1VFU1RfR0lDVjNfUkRJU1RfUkVHSU9OUyk7Cj4gLSAgICBpZiAocmVzKSByZXR1cm4g
cmVzOwo+IC0KPiAgICAgICByZXMgPSBmZHRfcHJvcGVydHlfcmVncyhnYywgZmR0LCBST09UX0FE
RFJFU1NfQ0VMTFMsIFJPT1RfU0laRV9DRUxMUywKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAyLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdpY2RfYmFzZSwgZ2ljZF9z
aXplLAo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
