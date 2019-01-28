From: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2 for-4.12] gic-vgic: fix an assert
 condition
Date: Mon, 28 Jan 2019 09:42:58 +0000
Message-ID: <20190128094258.4136b5aa@donnerap.cambridge.arm.com>
References: <1548435962-29797-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+agi=QE=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1go3RY-0007Ud-Vk
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 09:43:05 +0000
In-Reply-To: <1548435962-29797-1-git-send-email-andrii.anisov@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Stefan Nuernberger <snu@amazon.de>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyNSBKYW4gMjAxOSAxOTowNjowMiArMDIwMApBbmRyaWkgQW5pc292IDxhbmRyaWku
YW5pc292QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEZyb206IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9h
bmlzb3ZAZXBhbS5jb20+Cj4gCj4gQ3VycmVudGx5LCB0aGF0IGFzc2VydCBjb25kaXRpb24gZG9l
cyBub3QgY29ycmVzcG9uZCB0byBhIGNvbW1lbnQKPiBhYm92ZSBhbmQgbWFrZXMgYXNzZXJ0aW9u
IGZhaWxlZCBvbiBIVyBJUlEgZGlzY29ubmVjdGlvbi4KPiBGaXggdGhlIGNvbmRpdGlvbiBzbyBp
dCBjb3JyZXNwb25kcyB0byB0aGUgY29tbWVudCBhbmQgYWxsb3dzIElSUQo+IGRpc2Nvbm5lY3Rp
b24gb24gZGVidWcgYnVpbGRzLgo+IAo+IEZpeGVzOiBlYzJhMmYxICgiQVJNOiBWR0lDOiBmYWN0
b3Igb3V0IHZnaWNfY29ubmVjdF9od19pcnEoKSIpCj4gU2lnbmVkLW9mZi1ieTogQW5kcmlpIEFu
aXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KPiBTdWdnZXN0ZWQtYnk6IFN0ZWZhbiBOdWVy
bmJlcmdlciA8c251QGFtYXpvbi5kZT4KClJldmlld2VkLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5k
cmUucHJ6eXdhcmFAYXJtLmNvbT4KCkNoZWVycywKQW5kcmUuCgo+IC0tLQo+IGluIHYyOgo+ICAt
IHVwZGF0ZWQgY29uZGl0aW9uIGFzIHN1Z2dlc3RlZCBieSBTdGVmYW4KPiAgLSBwcm92aWRlZCBk
ZXRhaWxlZCBjb21taXQgbWVzc2FnZQo+ICAtIGFkZGVkIFN1Z2dlc3RlZC1ieSBmcm9tIFN0ZWZh
bgo+ICAtIHJlZmVycmVkIGEgY29tbWl0IGludHJvZHVjZWQgdGhlIGlzc3VlCj4gCj4gIHhlbi9h
cmNoL2FybS9naWMtdmdpYy5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy12Z2lj
LmMgYi94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYwo+IGluZGV4IDQ4OTIyZjUuLmEzYmJhODUgMTAw
NjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMKPiArKysgYi94ZW4vYXJjaC9hcm0v
Z2ljLXZnaWMuYwo+IEBAIC00NDMsNyArNDQzLDcgQEAgaW50IHZnaWNfY29ubmVjdF9od19pcnEo
c3RydWN0IGRvbWFpbiAqZCwgc3RydWN0Cj4gdmNwdSAqdiwgdW5zaWduZWQgaW50IHZpcnEsIGlu
dCByZXQgPSAwOwo+ICAKPiAgICAgIC8qICJkZXNjIiBpcyBvcHRpb25hbCB3aGVuIHdlIGRpc2Nv
bm5lY3QgYW4gSVJRLiAqLwo+IC0gICAgQVNTRVJUKGNvbm5lY3QgJiYgZGVzYyk7Cj4gKyAgICBB
U1NFUlQoIWNvbm5lY3QgfHwgZGVzYyk7Cj4gIAo+ICAgICAgLyogV2UgYXJlIHRha2luZyB0byBy
YW5rIGxvY2sgdG8gcHJldmVudCBwYXJhbGxlbCBjb25uZWN0aW9ucy4gKi8KPiAgICAgIHZnaWNf
bG9ja19yYW5rKHZfdGFyZ2V0LCByYW5rLCBmbGFncyk7CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
