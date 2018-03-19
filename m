From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 26/45] ARM: new VGIC: Add PENDING
	registers handlers
Date: Mon, 19 Mar 2018 08:25:32 +0000
Message-ID: <f604b8d1-03b6-b36f-189f-68fb4f1ec4cf@arm.com>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-27-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wrgj=gj=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1exq7V-0002aa-40
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 08:26:17 +0000
In-Reply-To: <20180315203050.19791-27-andre.przywara@linaro.org>
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
PiBUaGUgcGVuZGluZyByZWdpc3RlciBoYW5kbGVycyBhcmUgc2hhcmVkIGJldHdlZW4gdGhlIHYy
IGFuZCB2Mwo+IGVtdWxhdGlvbiwgc28gdGhlaXIgaW1wbGVtZW50YXRpb24gZ29lcyBpbnRvIHZn
aWMtbW1pby5jLCB0byBiZSBlYXNpbHkKPiByZWZlcmVuY2VkIGZyb20gdGhlIHYzIGVtdWxhdGlv
biBhcyB3ZWxsIGxhdGVyLgo+IEZvciBsZXZlbCB0cmlnZ2VyZWQgaW50ZXJydXB0cyB0aGUgcmVh
bCBsaW5lIGxldmVsIGlzIHVuYWZmZWN0ZWQgYnkKPiB0aGlzIHdyaXRlLCBzbyB3ZSBrZWVwIHRo
aXMgc3RhdGUgc2VwYXJhdGUgYW5kIGNvbWJpbmUgaXQgd2l0aCB0aGUKPiBkZXZpY2UncyBsZXZl
bCB0byBnZXQgdGhlIGFjdHVhbCBwZW5kaW5nIHN0YXRlLgo+IEhhcmR3YXJlIG1hcHBlZCBJUlFz
IG5lZWQgc29tZSBzcGVjaWFsIGhhbmRsaW5nLCBhcyB0aGVpciBoYXJkd2FyZSBzdGF0ZQo+IGhh
cyB0byBiZSBjb29yZGluYXRlZCB3aXRoIHRoZSB2aXJ0dWFsIHBlbmRpbmcgYml0IHRvIGF2b2lk
IGhhbmdpbmcKPiBvciBtYXNrZWQgaW50ZXJydXB0cy4KPiAKPiBUaGlzIGlzIGJhc2VkIG9uIExp
bnV4IGNvbW1pdCA5NmIyOTgwMDBkYjQsIHdyaXR0ZW4gYnkgQW5kcmUgUHJ6eXdhcmEuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnByenl3YXJhQGxpbmFyby5vcmc+
CgpSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
