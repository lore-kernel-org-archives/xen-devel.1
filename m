From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.12 v2 11/17] xen/arm: p2m: Extend
 p2m_get_entry to return the value of bit[0] (valid bit)
Date: Thu, 6 Dec 2018 14:32:16 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1812061431320.18779@sstabellini-ThinkPad-X260>
References: <20181204202651.8836-1-julien.grall@arm.com>
 <20181204202651.8836-12-julien.grall@arm.com>
 <2616ff32-a45e-9ff2-b7f4-5d36f5174637@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ba80=OP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gV2Bv-0008MX-3h
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 22:32:19 +0000
In-Reply-To: <2616ff32-a45e-9ff2-b7f4-5d36f5174637@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, Tamas K Lengyel <tamas@tklengyel.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCA0IERlYyAyMDE4LCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4gT24gMTIvNC8xOCAx
MDoyNiBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gV2l0aCB0aGUgcmVjZW50IGNoYW5nZXMs
IGEgUDJNIGVudHJ5IG1heSBiZSBwb3B1bGF0ZWQgYnV0IG1heSBhcyBub3QKPiA+IHZhbGlkLiBJ
biBzb21lIHNpdHVhdGlvbiwgaXQgd291bGQgYmUgdXNlZnVsIHRvIGtub3cgd2hldGhlciB0aGUg
ZW50cnkKPiAKPiBJIHRoaW5rIHlvdSBtZWFuIHRvIHNheSAibWF5IG5vdCBiZSB2YWxpZCI/Cj4g
Cj4gPiBoYXMgYmVlbiBtYXJrZWQgYXZhaWxhYmxlIHRvIGd1ZXN0IGluIG9yZGVyIHRvIHBlcmZv
cm0gYSBzcGVjaWZpYwo+ID4gYWN0aW9uLiBTbyBleHRlbmQgcDJtX2dldF9lbnRyeSB0byByZXR1
cm4gdGhlIHZhbHVlIG9mIGJpdFswXSAodmFsaWQgYml0KS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAKPiBPdGhlciB0aGFuIHRo
YXQsCj4gCj4gQWNrZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVy
LmNvbT4KClNhbWUgaGVyZToKClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
