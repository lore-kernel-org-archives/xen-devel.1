From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH for-4.12 v2 7/8] xenalyze: Build for Both ARM
 and x86 Platforms
Date: Thu, 20 Dec 2018 19:23:37 +0000
Message-ID: <20181220192338.17526-8-julien.grall@arm.com>
References: <20181220192338.17526-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZIHg=O5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ga3vJ-0001yZ-Vi
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 19:23:58 +0000
In-Reply-To: <20181220192338.17526-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Wei Liu <wei.liu2@citrix.com>, Benjamin Sanda <ben.sanda@dornerworks.com>, George Dunlap <george.dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQmVuamFtaW4gU2FuZGEgPGJlbi5zYW5kYUBkb3JuZXJ3b3Jrcy5jb20+CgpNb2RpZmll
ZCB0byBwcm92aWRlIGJ1aWxkaW5nIG9mIHRoZSB4ZW5hbHl6ZSBiaW5hcnkgZm9yIGJvdGggQVJN
IGFuZAp4ODYgcGxhdGZvcm1zLiBUaGUgeGVuYWx5emUgYmluYXJ5IGlzIG5vdyBidWlsdCBhcyBw
YXJ0IG9mIHRoZSBCSU4KbGlzdCBmb3IgYm90aCBwbGF0Zm9ybXMuCgpTaWduZWQtb2ZmLWJ5OiBC
ZW5qYW1pbiBTYW5kYSA8YmVuLnNhbmRhQGRvcm5lcndvcmtzLmNvbT4KU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQWNrZWQtYnk6IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+CgotLS0KICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBBZGQg
V2VpJ3MgYWNrZWQtYnkKLS0tCiB0b29scy94ZW50cmFjZS9NYWtlZmlsZSB8IDMgKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
dG9vbHMveGVudHJhY2UvTWFrZWZpbGUgYi90b29scy94ZW50cmFjZS9NYWtlZmlsZQppbmRleCAw
YmFkOTQyYmRmLi45ZmI3ZmM5NmU3IDEwMDY0NAotLS0gYS90b29scy94ZW50cmFjZS9NYWtlZmls
ZQorKysgYi90b29scy94ZW50cmFjZS9NYWtlZmlsZQpAQCAtOSw4ICs5LDcgQEAgTERMSUJTICs9
ICQoTERMSUJTX2xpYnhlbmV2dGNobikKIExETElCUyArPSAkKExETElCU19saWJ4ZW5jdHJsKQog
TERMSUJTICs9ICQoQVJHUF9MREZMQUdTKQogCi1CSU4tJChDT05GSUdfWDg2KSA9IHhlbmFseXpl
Ci1CSU4gICAgICA9ICQoQklOLXkpCitCSU4gICAgICA9IHhlbmFseXplCiBTQklOICAgICA9IHhl
bnRyYWNlIHhlbnRyYWNlX3NldHNpemUKIExJQkJJTiAgID0geGVuY3R4CiBTQ1JJUFRTICA9IHhl
bnRyYWNlX2Zvcm1hdAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
