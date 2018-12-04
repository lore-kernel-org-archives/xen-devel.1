From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH for-4.12 v2 11/17] xen/arm: p2m: Extend
 p2m_get_entry to return the value of bit[0] (valid bit)
Date: Tue, 4 Dec 2018 22:35:44 +0200
Message-ID: <2616ff32-a45e-9ff2-b7f4-5d36f5174637@bitdefender.com>
References: <20181204202651.8836-1-julien.grall@arm.com>
 <20181204202651.8836-12-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zvm8=ON=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gUHQv-0002JT-5E
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 20:36:41 +0000
In-Reply-To: <20181204202651.8836-12-julien.grall@arm.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Tamas K Lengyel <tamas@tklengyel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvNC8xOCAxMDoyNiBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFdpdGggdGhlIHJlY2Vu
dCBjaGFuZ2VzLCBhIFAyTSBlbnRyeSBtYXkgYmUgcG9wdWxhdGVkIGJ1dCBtYXkgYXMgbm90Cj4g
dmFsaWQuIEluIHNvbWUgc2l0dWF0aW9uLCBpdCB3b3VsZCBiZSB1c2VmdWwgdG8ga25vdyB3aGV0
aGVyIHRoZSBlbnRyeQoKSSB0aGluayB5b3UgbWVhbiB0byBzYXkgIm1heSBub3QgYmUgdmFsaWQi
PwoKPiBoYXMgYmVlbiBtYXJrZWQgYXZhaWxhYmxlIHRvIGd1ZXN0IGluIG9yZGVyIHRvIHBlcmZv
cm0gYSBzcGVjaWZpYwo+IGFjdGlvbi4gU28gZXh0ZW5kIHAybV9nZXRfZW50cnkgdG8gcmV0dXJu
IHRoZSB2YWx1ZSBvZiBiaXRbMF0gKHZhbGlkIGJpdCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCk90aGVyIHRoYW4gdGhhdCwKCkFja2Vk
LWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CgoKVGhhbmtz
LApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
