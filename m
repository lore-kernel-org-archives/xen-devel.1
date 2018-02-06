From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 5/8] ARM: VGIC: factor out
	vgic_connect_hw_irq()
Date: Tue, 6 Feb 2018 14:38:30 +0000
Message-ID: <1564ec34-cec9-43a6-f7dd-0bece725e918@arm.com>
References: <20180205161925.11054-1-andre.przywara@arm.com>
 <20180205161925.11054-6-andre.przywara@arm.com>
 <f736d6ad-c2d3-1103-128c-67732a2aea3f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=xglg=fa=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ej4OO-0004Xc-NV
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2018 14:38:40 +0000
In-Reply-To: <f736d6ad-c2d3-1103-128c-67732a2aea3f@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDYvMjAxOCAwMjoyMSBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEFuZHJlLAo+
IAo+IE9uIDAyLzA1LzIwMTggMDQ6MTkgUE0sIEFuZHJlIFByenl3YXJhIHdyb3RlOgo+PiBBdCB0
aGUgbW9tZW50IHdlIGhhcHBpbHkgYWNjZXNzIFZHSUMgaW50ZXJuYWwgZGF0YSBzdHJ1Y3R1cmVz
IGxpa2UKPj4gdGhlIHJhbmsgYW5kIHN0cnVjdCBwZW5kaW5nX2lycSBpbiBnaWMuYywgd2hpY2gg
c2hvdWxkIGJlIFZHSUMgYWdub3N0aWMuCj4+Cj4+IEZhY3RvciBvdXQgYSBuZXcgZnVuY3Rpb24g
dmdpY19jb25uZWN0X2h3X2lycSgpLCB3aGljaCBhbGxvd3MgYSB2aXJ0dWFsCj4+IElSUSB0byBi
ZSBjb25uZWN0ZWQgdG8gYSBoYXJkd2FyZSBJUlEgKHVzaW5nIHRoZSBodyBiaXQgaW4gdGhlIExS
KS4KPj4KPj4gVGhpcyByZW1vdmVzIHNhaWQgYWNjZXNzZXMgdG8gVkdJQyBkYXRhIHN0cnVjdHVy
ZXMgYW5kIGltcHJvdmVzIAo+PiBhYnN0cmFjdGlvbi4KPiAKPiBJIHdhcyBleHBlY3Rpbmcgc29t
ZSBleHBsYW5hdGlvbiByZWdhcmRpbmcgdGhlIG5ldyBsb2NraW5nIG9yZGVyIGluIHRoZSAKPiBj
b21taXQgbWVzc2FnZS4KCiBGcm9tIGEgcXVpY2sgY2hhdCB3aXRoIEFuZHJlIG9uIElSQywgaXQg
bG9va3MgbGlrZSBmaWd1cmluZyBvdXQgdGhlIApjdXJyZW50IGxvY2tpbmcgbWlnaHQgYmUgdHJp
Y2t5LiBTbyBJIHdvdWxkIGJlIGhhcHB5IGlmIHdlIG9ubHkgcG9pbnQgCm91dCB0aGUgY2hhbmdl
IG9mIGxvY2tpbmcgKCsgYSB3b3JkIG9uIHRoZSBuZXcgbG9ja2luZykgaW4gdGhlIGNvbW1pdCAK
bWVzc2FnZS4KClRoaXMgd291bGQgaGVscCBpbiBjYXNlIHdlIGZpbmQgYSByZWdyZXNzaW9uIGxh
dGVyIG9uLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
