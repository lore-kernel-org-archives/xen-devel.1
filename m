From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 2/4] xen/arm: initialize access
Date: Wed, 17 Oct 2018 15:40:55 +0100
Message-ID: <4f30290f-7c65-912e-3d60-cc3a7e858f3f@arm.com>
References: <alpine.DEB.2.10.1810172229070.3835@sstabellini-ThinkPad-X260>
 <1539786676-8797-2-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6/n1=m5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gCn0M-0006Mu-OG
 for xen-devel@lists.xenproject.org; Wed, 17 Oct 2018 14:40:58 +0000
In-Reply-To: <1539786676-8797-2-git-send-email-sstabellini@kernel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefanos@xilinx.com>, Tamas K Lengyel <tamas@tklengyel.com>, rcojocaru@bitdefender.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxNy8xMC8yMDE4IDE1OjMxLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gSW5pdGlh
bGl6ZSB2YXJpYWJsZSAqYWNjZXNzIGJlZm9yZSByZXR1cm5pbmcgaXQgYmFjayB0byB0aGUgY2Fs
bGVyLgo+IEl0IG1ha2VzIHRoZSBjb2RlIGEgYml0IG5pY2VyIGFuZCBpdCBpcyBhIHNhZmV0eSBj
ZXJ0aWZpY2F0aW9uCj4gcmVxdWlyZW1lbnQuCgpTYW1lIGFzIHByZXZpb3VzIHBhdGNoLgoKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+
Cj4gQ0M6IHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20KPiBDQzogVGFtYXMgSyBMZW5neWVsIDx0
YW1hc0B0a2xlbmd5ZWwuY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjI6Cj4gLSBpbXByb3ZlIGNv
bW1lbnQKPiAtIHVzZSBwMm0tPmRlZmF1bHRfYWNjZXNzCj4gLS0tCj4gICB4ZW4vYXJjaC9hcm0v
bWVtX2FjY2Vzcy5jIHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAK
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21lbV9hY2Nlc3MuYyBiL3hlbi9hcmNoL2FybS9t
ZW1fYWNjZXNzLmMKPiBpbmRleCBiYTRlYzc4Li44NmYwODgyIDEwMDY0NAo+IC0tLSBhL3hlbi9h
cmNoL2FybS9tZW1fYWNjZXNzLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vbWVtX2FjY2Vzcy5jCj4g
QEAgLTQ3LDYgKzQ3LDcgQEAgc3RhdGljIGludCBfX3AybV9nZXRfbWVtX2FjY2VzcyhzdHJ1Y3Qg
ZG9tYWluICpkLCBnZm5fdCBnZm4sCj4gICAgICAgfTsKPiAgIAo+ICAgICAgIEFTU0VSVChwMm1f
aXNfbG9ja2VkKHAybSkpOwo+ICsgICAgKmFjY2VzcyA9IHAybS0+ZGVmYXVsdF9hY2Nlc3M7Cj4g
ICAKPiAgICAgICAvKiBJZiBubyBzZXR0aW5nIHdhcyBldmVyIHNldCwganVzdCByZXR1cm4gcnd4
LiAqLwo+ICAgICAgIGlmICggIXAybS0+bWVtX2FjY2Vzc19lbmFibGVkICkKPiAKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
