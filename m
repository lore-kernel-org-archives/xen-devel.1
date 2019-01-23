From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC] arm/p2m: call iommu iotlb flush if iommu
 exists and enabled
Date: Wed, 23 Jan 2019 11:33:38 +0000
Message-ID: <c861a2f4-25a4-e5a4-f112-42853cba84e3@arm.com>
References: <1548238334-23168-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MDDu=P7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gmGmt-0000Aw-3e
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 11:33:43 +0000
In-Reply-To: <1548238334-23168-1-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

KCsgUGF1bCkKCkhlbGxvLAoKT24gMjMvMDEvMjAxOSAxMDoxMiwgQW5kcmlpIEFuaXNvdiB3cm90
ZToKPiBGcm9tOiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+IAo+IFRh
a2luZyBkZWNpc3Npb24gYnkgYG5lZWRfaW9tbXVfcHRfc3luYygpYCBtYWtlIHVzIG5ldmVyIGtp
Y2tpbmcKCnMvZGVjaXNzaW9uL2RlY2lzaW9uLwoKPiBgaW9tbXVfaW90bGJfZmx1c2goKWAgZm9y
IElPTU1VcyB3aGljaCBkbyBzaGFyZSBUTEIgd2l0aCBDUFUuCgpJIGFtIG5vdCBhd2FyZSBvZiBw
bGF0Zm9ybSB3aGVyZSB3ZSBzaGFyZSB0aGUgVExCIHdpdGggdGhlIENQVS4gRG8geW91IG1lYW4g
CnNoYXJpbmcgdGhlIFAyTT8KCj4gU28gY2hlY2sgYGhhc19pb21tdV9wdCgpYCBpbnN0ZWFkLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+
Cj4gCj4gLS0tCj4gCj4gSnVsaWVuLAo+IAo+IENvdWxkIHlvdSBwbGVhc2UgbG9vayBhdCB0aGlz
LCBJTU8gdGhlcmUgaXMgYSBtaXN0YWtlIGhlcmUuCj4geDg2IHVzZXMgYG5lZWRfaW9tbXVfcHRf
c3luYygpYCB0byBtYWtlIGRlY2lzc2lvbiBpZiBpb21tdSdzIG1hcC91bm1hcCBzaG91bGQgYmUg
YWRkaXRpb25hbGx5IGNhbGxlZC4KPiBCdXQgQVJNIGhhcyBubyBub24tc2hhcmVkIHB0IHN1cHBv
cnQgaW4gdGhlIG1haW5saW5lLCBzbyB1c2luZyBgbmVlZF9pb21tdV9wdF9zeW5jKClgIHNlZW1z
IHRvIGJlIG9kZC4KPiAKPiAgIHhlbi9hcmNoL2FybS9wMm0uYyB8IDIgKy0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vcDJtLmMgYi94ZW4vYXJjaC9hcm0vcDJtLmMKPiBpbmRleCAyMzk0Zjk3Li4w
NTlhMzkxIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9wMm0uYwo+ICsrKyBiL3hlbi9hcmNo
L2FybS9wMm0uYwo+IEBAIC0xMDE5LDcgKzEwMTksNyBAQCBzdGF0aWMgaW50IF9fcDJtX3NldF9l
bnRyeShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLAo+ICAgICAgICAgICAgIW1mbl9lcShscGFlX2dl
dF9tZm4oKmVudHJ5KSwgbHBhZV9nZXRfbWZuKG9yaWdfcHRlKSkgKQo+ICAgICAgICAgICBwMm1f
ZnJlZV9lbnRyeShwMm0sIG9yaWdfcHRlLCBsZXZlbCk7Cj4gICAKPiAtICAgIGlmICggbmVlZF9p
b21tdV9wdF9zeW5jKHAybS0+ZG9tYWluKSAmJgo+ICsgICAgaWYgKCBoYXNfaW9tbXVfcHQocDJt
LT5kb21haW4pICYmCgpJIHRoaW5rIHRoaXMgbWFrZXMgc2Vuc2UgYmVjYXVzZSB3ZSB3YW50IHRv
IGZsdXNoIHRoZSBUTEIgd2hlbiB0aGUgUDJNIGlzIApzaGFyZWQuIEFsdGhvdWdoLCBJIHdvdWxk
IGxpa2UgdG8gaGVhciBQYXVsJ3Mgb3BpbmlvbiBoZXJlLgoKPiAgICAgICAgICAgIChscGFlX2lz
X3ZhbGlkKG9yaWdfcHRlKSB8fCBscGFlX2lzX3ZhbGlkKCplbnRyeSkpICkKPiAgICAgICB7Cj4g
ICAgICAgICAgIHVuc2lnbmVkIGludCBmbHVzaF9mbGFncyA9IDA7ID4KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
