From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 35/57] ARM: new VGIC: Add GICv2 MMIO
	handling framework
Date: Wed, 7 Mar 2018 15:00:37 +0000
Message-ID: <ef3675df-ebe1-4913-5373-846de57433f1@arm.com>
References: <20180305160415.16760-1-andre.przywara@linaro.org>
 <20180305160415.16760-36-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=+hct=f5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1etaYg-0003ft-QO
 for xen-devel@lists.xenproject.org; Wed, 07 Mar 2018 15:00:46 +0000
In-Reply-To: <20180305160415.16760-36-andre.przywara@linaro.org>
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

SGkgQW5kcmUsCgpPbiAwMy8wNS8yMDE4IDA0OjAzIFBNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToK
PiBDcmVhdGUgdmdpYy1tbWlvLXYyLmMgdG8gZGVzY3JpYmUgR0lDdjIgZW11bGF0aW9uIHNwZWNp
ZmljIGhhbmRsZXJzCj4gdXNpbmcgdGhlIGluaXRpYWxpemVyIG1hY3JvcyBwcm92aWRlZCBieSB0
aGUgVkdJQyBNTUlPIGZyYW1ld29yay4KPiBQcm92aWRlIGEgZnVuY3Rpb24gdG8gcmVnaXN0ZXIg
dGhlIEdJQ3YyIGRpc3RyaWJ1dG9yIHJlZ2lzdGVycyB0bwo+IHRoZSBYZW4gTU1JTyBmcmFtZXdv
cmsuCj4gVGhlIGFjdHVhbCBoYW5kbGVyIGZ1bmN0aW9ucyBhcmUgc3RpbGwgc3R1YnMgaW4gdGhp
cyBwYXRjaC4KPiAKPiBUaGlzIGlzIGJhc2VkIG9uIExpbnV4IGNvbW1pdCBmYjg0OGRiMzk2NjEs
IHdyaXR0ZW4gYnkgQW5kcmUgUHJ6eXdhcmEuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmUgUHJ6
eXdhcmEgPGFuZHJlLnByenl3YXJhQGxpbmFyby5vcmc+CgpSZXZpZXdlZC1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
