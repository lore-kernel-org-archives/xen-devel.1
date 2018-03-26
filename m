From: Manish Jaggi <mjaggi@caviumnetworks.com>
Subject: Re: [PATCH v1 04/15] arm64: vgic-v3: Add ICV_BPR1_EL1
 handler
Date: Mon, 26 Mar 2018 18:41:17 +0530
Message-ID: <f053a8a1-419a-0c87-e9ce-337df82a5a2c@caviumnetworks.com>
References: <cover.1521200294.git.manish.jaggi@cavium.com>
 <59180a6af11e97390da557da0a6c17a14c02eb6a.1521200294.git.manish.jaggi@cavium.com>
 <f18456b3-3039-2ff6-d921-5adeaa479f5d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gmfh=gq=cavium.com=manish.jaggi@srs-us1.protection.inumbo.net>)
 id 1f0RuV-0007k7-Sn
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 13:11:39 +0000
In-Reply-To: <f18456b3-3039-2ff6-d921-5adeaa479f5d@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Manish Jaggi <manish.jaggi@cavium.com>, xen-devel@lists.xenproject.org, sstabellini@kernel.org, marc.zyngier@arm.com, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMy8yMS8yMDE4IDAxOjQxIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgTWFuaXNo
LAo+Cj4gT24gMDMvMTYvMjAxOCAxMTo1OCBBTSwgTWFuaXNoIEphZ2dpIHdyb3RlOgo+PiBUaGlz
IHBhdGNoIGlzIHBvcnRlZCB0byB4ZW4gZnJvbSBsaW51eCBjb21taXQKPj4gZDcwYzdiMzFhNjBm
MjQ1OGYzNWMyMjYxMzFmMmEwMWE3YTk4YjZjZgo+Pgo+PiBBZGQgYSBoYW5kbGVyIGZvciByZWFk
aW5nL3dyaXRpbmcgdGhlIGd1ZXN0J3MgdmlldyBvZiB0aGUgSUNDX0JQUjFfRUwxCj4+IHJlZ2lz
dGVyLCB3aGljaCBpcyBsb2NhdGVkIGluIHRoZSBJQ0hfVk1DUl9FTDIuQlBSMSBmaWVsZC4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogTWFuaXNoIEphZ2dpIDxtYW5pc2guamFnZ2lAY2F2aXVtLmNvbT4K
Pgo+IEFzIHlvdSBwb3J0IGNvbW1pdCBieSBjb21taXQsIHBsZWFzZSBhdCBsZWFzdCBtZW50aW9u
IE1hcmMgYXMgaGUgaXMgCj4gdGhlIG9yaWdpbmFsIGF1dGhvciBvZiB0aGF0IHBhdGNoLgpJIGhh
dmUgYSBsaXR0bGUgY29uZnVzaW9uLCBzaG91bGQgYSBzaWdub2ZmIGJlIGFkZGVkIG9uY2UgaXQg
aXMgcmV2aWV3ZWQgCm9yIGV2ZW4gaWYgaXQgaXMgcG9ydGVkPwpJIHRob3VnaHQgb25jZSBpdCBp
cyBhY2tlZCwgd2UgYWRkIHNpZ25vZmYuCgpQbGVhc2Ugc3VnZ2VzdC4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
