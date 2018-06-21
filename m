From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [PATCH] xen: Remove unnecessary BUG_ON from
 __unbind_from_irq()
Date: Thu, 21 Jun 2018 13:29:44 -0400
Message-ID: <1529602184-2861-1-git-send-email-boris.ostrovsky__43500.1809768893$1529601664$gmane$org@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dgab=jh=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fW3HT-0008Ki-Hf
 for xen-devel@lists.xenproject.org; Thu, 21 Jun 2018 17:21:59 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, ben.hutchings@codethink.co.uk, Boris Ostrovsky <boris.ostrovsky@oracle.com>, stable@vger.kernel.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IDkxMGY4YmVmZGY1YiAoInhlbi9waXJxOiBmaXggZXJyb3IgcGF0aCBjbGVhbnVwIHdo
ZW4gYmluZGluZwpNU0lzIikgZml4ZWQgYSBjb3VwbGUgb2YgZXJyb3JzIGluIGVycm9yIGNsZWFu
dXAgcGF0aCBvZgp4ZW5fYmluZF9waXJxX21zaV90b19pcnEoKS4gVGhpcyBjbGVhbnVwIGFsbG93
ZWQgYSBjYWxsIHRvCl9fdW5iaW5kX2Zyb21faXJxKCkgd2l0aCBhbiB1bmJvdW5kIGlycSwgd2hp
Y2ggd291bGQgcmVzdWx0IGluCnRyaWdnZXJpbmcgdGhlIEJVR19PTiB0aGVyZS4KClNpbmNlIHRo
ZXJlIGlzIHJlYWxseSBubyByZWFzb24gZm9yIHRoZSBCVUdfT04gKHhlbl9mcmVlX2lycSgpIGNh
bgpvcGVyYXRlIG9uIHVuYm91bmQgaXJxcykgd2UgY2FuIHJlbW92ZSBpdC4KClJlcG9ydGVkLWJ5
OiBCZW4gSHV0Y2hpbmdzIDxiZW4uaHV0Y2hpbmdzQGNvZGV0aGluay5jby51az4KU2lnbmVkLW9m
Zi1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcKLS0tCiBkcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2Uu
YyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jIGIvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50
c19iYXNlLmMKaW5kZXggNzYyMzc4Zi4uMDhlNGFmMCAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4v
ZXZlbnRzL2V2ZW50c19iYXNlLmMKKysrIGIvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNl
LmMKQEAgLTYyOCw4ICs2MjgsNiBAQCBzdGF0aWMgdm9pZCBfX3VuYmluZF9mcm9tX2lycSh1bnNp
Z25lZCBpbnQgaXJxKQogCQl4ZW5faXJxX2luZm9fY2xlYW51cChpbmZvKTsKIAl9CiAKLQlCVUdf
T04oaW5mb19mb3JfaXJxKGlycSktPnR5cGUgPT0gSVJRVF9VTkJPVU5EKTsKLQogCXhlbl9mcmVl
X2lycShpcnEpOwogfQogCi0tIAoxLjguMy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
