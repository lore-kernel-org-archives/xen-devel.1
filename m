From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 15/15] xen/arm: traps: Move the
 implementation of GUEST_BUG_ON in traps.h
Date: Thu, 16 Aug 2018 09:54:48 +0100
Message-ID: <1a6b5113-3ad5-50e2-1c0f-b9d532ec0b81@arm.com>
References: <20180716172712.20294-1-julien.grall@arm.com>
 <20180716172712.20294-16-julien.grall@arm.com>
 <alpine.DEB.2.10.1808141442070.15066@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bd9+=k7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fqE3Q-0003lO-CS
 for xen-devel@lists.xenproject.org; Thu, 16 Aug 2018 08:54:52 +0000
In-Reply-To: <alpine.DEB.2.10.1808141442070.15066@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@linaro.org>
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDA4LzE0LzIwMTggMTA6NDMgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3
cm90ZToKPiBPbiBNb24sIDE2IEp1bCAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEdVRVNU
X0JVR19PTiBtYXkgYmUgdXNlZCBpbiBvdGhlciBmaWxlcyBkb2luZyBndWVzdCBlbXVsYXRpb24u
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGxpbmFyby5v
cmc+Cj4gCj4gR2l2ZW4gdGhhdCBHVUVTVF9CVUdfT04gaXMgbm90IGFjdHVhbGx5IHVzZWQgaW4g
YW55IG90aGVyIGZpbGVzIGluIHRoaXMKPiBwYXRjaCBzZXJpZXMsIEkgYXNzdW1lIHlvdSBhcmUg
cmVmZXJyaW5nIHRvIG9uZSBvZiB5b3VyIGZ1dHVyZSBzZXJpZXM/CgpJdCBpcyBnb2luZyB0byBi
ZSB1c2VkIGxhdGVyLiBIb3dldmVyLCBJIGRvbid0IHJlYWxseSByZWZlciB0byBhbnkgCnNlcmll
cyBpbiBwYXJ0aWN1bGFyLiBJdCBpcyBqdXN0IHRoYXQgdGhpcyBtYWNyb3MgY291bGQgYmUgaGVs
cGZ1bCBpbiAKYW55IGVtdWxhdGlvbiBjb2RlIHRvIGNhdGNoIHdoYXQgd2UgdGhpbmsgaXMgYSBp
bnZhbGlkIGFyY2hpdGVjdHVyYWwgCmJlaGF2aW9yLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
