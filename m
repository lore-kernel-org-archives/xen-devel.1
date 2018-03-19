From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 28/45] ARM: new VGIC: Add PRIORITY
	registers handlers
Date: Mon, 19 Mar 2018 09:40:00 +0000
Message-ID: <d2575c79-e43f-c9a3-5ecb-b02e8578e110@arm.com>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-29-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wrgj=gj=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1exrHe-000053-3W
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 09:40:50 +0000
In-Reply-To: <20180315203050.19791-29-andre.przywara@linaro.org>
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

SGkgQW5kcmUsCgpPbiAwMy8xNS8yMDE4IDA4OjMwIFBNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToK
PiBUaGUgcHJpb3JpdHkgcmVnaXN0ZXIgaGFuZGxlcnMgYXJlIHNoYXJlZCBiZXR3ZWVuIHRoZSB2
MiBhbmQgdjMgZW11bGF0aW9uLAo+IHNvIHRoZWlyIGltcGxlbWVudGF0aW9uIGdvZXMgaW50byB2
Z2ljLW1taW8uYywgdG8gYmUgZWFzaWx5IHJlZmVyZW5jZWQKPiBmcm9tIHRoZSB2MyBlbXVsYXRp
b24gYXMgd2VsbCBsYXRlci4KPiAKPiBUaGlzIGlzIGJhc2VkIG9uIExpbnV4IGNvbW1pdCAwNTU2
NThiZjQ4ZmMsIHdyaXR0ZW4gYnkgQW5kcmUgUHJ6eXdhcmEuCj4gCj4gU2lnbmVkLW9mZi1ieTog
QW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnByenl3YXJhQGxpbmFyby5vcmc+CgpSZXZpZXdlZC1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
