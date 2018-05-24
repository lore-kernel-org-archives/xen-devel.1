From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 3/5] tools: link arch-shared directory
Date: Thu, 24 May 2018 17:05:20 +0100
Message-ID: <20180524160522.757-4-wei.liu2@citrix.com>
References: <20180524160522.757-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yzin=il=citrix.com=prvs=675a57d20=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fLska-0000kQ-R6
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 16:06:00 +0000
In-Reply-To: <20180524160522.757-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: sergey.dyasli@citrix.com, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCkNjOiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiAuZ2l0aWdub3JlICAgICAg
ICAgICAgIHwgMSArCiB0b29scy9pbmNsdWRlL01ha2VmaWxlIHwgNSArKysrLQogMiBmaWxlcyBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS8uZ2l0
aWdub3JlIGIvLmdpdGlnbm9yZQppbmRleCA3MDA0MzQ5ZDVhLi44MDhmNGY1NDk3IDEwMDY0NAot
LS0gYS8uZ2l0aWdub3JlCisrKyBiLy5naXRpZ25vcmUKQEAgLTE5OCw2ICsxOTgsNyBAQCB0b29s
cy9ob3RwbHVnL0xpbnV4L3hlbmRvbWFpbnMKIHRvb2xzL2hvdHBsdWcvTmV0QlNEL3JjLmQveGVu
Y29tbW9ucwogdG9vbHMvaG90cGx1Zy9OZXRCU0QvcmMuZC94ZW5kcml2ZXJkb21haW4KIHRvb2xz
L2luY2x1ZGUvYWNwaQordG9vbHMvaW5jbHVkZS9hcmNoLXNoYXJlZAogdG9vbHMvaW5jbHVkZS94
ZW4vKgogdG9vbHMvaW5jbHVkZS94ZW4teHNtLyoKIHRvb2xzL2luY2x1ZGUveGVuLWZvcmVpZ24v
Ki4oY3xofHNpemUpCmRpZmYgLS1naXQgYS90b29scy9pbmNsdWRlL01ha2VmaWxlIGIvdG9vbHMv
aW5jbHVkZS9NYWtlZmlsZQppbmRleCA2NjY1MTA1MzBlLi4yYzBhN2Y2ZTNjIDEwMDY0NAotLS0g
YS90b29scy9pbmNsdWRlL01ha2VmaWxlCisrKyBiL3Rvb2xzL2luY2x1ZGUvTWFrZWZpbGUKQEAg
LTIxLDYgKzIxLDkgQEAgeGVuLy5kaXI6CiAJbG4gLXNmICQoYWRkcHJlZml4ICQoWEVOX1JPT1Qp
L3hlbi9pbmNsdWRlL3hlbi8sbGliZWxmLmggZWxmc3RydWN0cy5oKSB4ZW4vbGliZWxmLwogCWxu
IC1zIC4uL3hlbi1mb3JlaWduIHhlbi9mb3JlaWduCiAJbG4gLXNmICQoWEVOX1JPT1QpL3hlbi9p
bmNsdWRlL2FjcGkgYWNwaQoraWZlcSAoJChDT05GSUdfWDg2KSx5KQorCWxuIC1zZiAkKFhFTl9S
T09UKS94ZW4vaW5jbHVkZS9hc20teDg2L2FyY2gtc2hhcmVkIGFyY2gtc2hhcmVkCitlbmRpZgog
CXRvdWNoICRACiAKICMgTm90IHhlbi94c20gYXMgdGhhdCBjbGFzaGVzIHdpdGggbGluayB0bwpA
QCAtNjUsNyArNjgsNyBAQCB1bmluc3RhbGw6CiAKIC5QSE9OWTogY2xlYW4KIGNsZWFuOgotCXJt
IC1yZiB4ZW4geGVuLXhzbSBhY3BpCisJcm0gLXJmIHhlbiB4ZW4teHNtIGFjcGkgYXJjaC1zaGFy
ZWQKIAkkKE1BS0UpIC1DIHhlbi1mb3JlaWduIGNsZWFuCiAKIC5QSE9OWTogZGlzdAotLSAKMi4x
MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
