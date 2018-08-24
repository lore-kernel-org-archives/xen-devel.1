From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] tools: building IPXE should be determined by
 CONFIG_IPXE
Date: Fri, 24 Aug 2018 11:54:04 +0100
Message-ID: <20180824105404.8131-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n8yf=lh=citrix.com=prvs=76773b150=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ft9jD-0002tb-NH
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 10:54:07 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB0b29scy9m
aXJtd2FyZS9NYWtlZmlsZSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2Zpcm13YXJlL01ha2VmaWxlIGIvdG9v
bHMvZmlybXdhcmUvTWFrZWZpbGUKaW5kZXggZWQxYTEzMThmNi4uY2YzMDRmYzU3OCAxMDA2NDQK
LS0tIGEvdG9vbHMvZmlybXdhcmUvTWFrZWZpbGUKKysrIGIvdG9vbHMvZmlybXdhcmUvTWFrZWZp
bGUKQEAgLTE1LDcgKzE1LDcgQEAgU1VCRElSUy0kKENPTkZJR19PVk1GKSArPSBvdm1mLWRpcgog
U1VCRElSUy0kKENPTkZJR19TRUFCSU9TKSArPSBzZWFiaW9zLWRpcgogU1VCRElSUy0kKENPTkZJ
R19ST01CSU9TKSArPSByb21iaW9zCiBTVUJESVJTLSQoQ09ORklHX1JPTUJJT1MpICs9IHZnYWJp
b3MKLVNVQkRJUlMtJChDT05GSUdfUk9NQklPUykgKz0gZXRoZXJib290CitTVUJESVJTLSQoQ09O
RklHX0lQWEUpICs9IGV0aGVyYm9vdAogU1VCRElSUy0kKENPTkZJR19QVl9TSElNKSArPSB4ZW4t
ZGlyCiBTVUJESVJTLXkgKz0gaHZtbG9hZGVyCiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
