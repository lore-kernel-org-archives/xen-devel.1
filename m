From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 7/8] xenalyze: Build for Both ARM and x86
 Platforms
Date: Tue,  6 Nov 2018 19:14:53 +0000
Message-ID: <20181106191454.22143-8-julien.grall@arm.com>
References: <20181106191454.22143-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7q02=nr=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gK6oj-0003dL-Bp
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 19:15:13 +0000
In-Reply-To: <20181106191454.22143-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: sstabellini@kernel.org, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Benjamin Sanda <ben.sanda@dornerworks.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQmVuamFtaW4gU2FuZGEgPGJlbi5zYW5kYUBkb3JuZXJ3b3Jrcy5jb20+CgpNb2RpZmll
ZCB0byBwcm92aWRlIGJ1aWxkaW5nIG9mIHRoZSB4ZW5hbHl6ZSBiaW5hcnkgZm9yIGJvdGggQVJN
IGFuZAp4ODYgcGxhdGZvcm1zLiBUaGUgeGVuYWx5emUgYmluYXJ5IGlzIG5vdyBidWlsdCBhcyBw
YXJ0IG9mIHRoZSBCSU4KbGlzdCBmb3IgYm90aCBwbGF0Zm9ybXMuCgpTaWduZWQtb2ZmLWJ5OiBC
ZW5qYW1pbiBTYW5kYSA8YmVuLnNhbmRhQGRvcm5lcndvcmtzLmNvbT4KU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB0b29scy94ZW50cmFjZS9N
YWtlZmlsZSB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMveGVudHJhY2UvTWFrZWZpbGUgYi90b29scy94ZW50
cmFjZS9NYWtlZmlsZQppbmRleCAwYmFkOTQyYmRmLi45ZmI3ZmM5NmU3IDEwMDY0NAotLS0gYS90
b29scy94ZW50cmFjZS9NYWtlZmlsZQorKysgYi90b29scy94ZW50cmFjZS9NYWtlZmlsZQpAQCAt
OSw4ICs5LDcgQEAgTERMSUJTICs9ICQoTERMSUJTX2xpYnhlbmV2dGNobikKIExETElCUyArPSAk
KExETElCU19saWJ4ZW5jdHJsKQogTERMSUJTICs9ICQoQVJHUF9MREZMQUdTKQogCi1CSU4tJChD
T05GSUdfWDg2KSA9IHhlbmFseXplCi1CSU4gICAgICA9ICQoQklOLXkpCitCSU4gICAgICA9IHhl
bmFseXplCiBTQklOICAgICA9IHhlbnRyYWNlIHhlbnRyYWNlX3NldHNpemUKIExJQkJJTiAgID0g
eGVuY3R4CiBTQ1JJUFRTICA9IHhlbnRyYWNlX2Zvcm1hdAotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
