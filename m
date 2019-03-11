From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v4 2/8] pygrub/fsimage: drop unused struct
Date: Mon, 11 Mar 2019 18:01:31 +0000
Message-ID: <20190311180137.7805-3-wei.liu2@citrix.com>
References: <20190311180137.7805-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZGF3=RO=citrix.com=prvs=966959e1a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h3PFD-0000Wk-GQ
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 18:01:47 +0000
In-Reply-To: <20190311180137.7805-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Anthony PERARD <anthony.perard@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvcHln
cnViL3NyYy9mc2ltYWdlL2ZzaW1hZ2UuYyB8IDcgLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvcHlncnViL3NyYy9mc2ltYWdlL2ZzaW1h
Z2UuYyBiL3Rvb2xzL3B5Z3J1Yi9zcmMvZnNpbWFnZS9mc2ltYWdlLmMKaW5kZXggNzQzYTNmYjdi
OC4uNzgwMjA3NzkxYyAxMDA2NDQKLS0tIGEvdG9vbHMvcHlncnViL3NyYy9mc2ltYWdlL2ZzaW1h
Z2UuYworKysgYi90b29scy9weWdydWIvc3JjL2ZzaW1hZ2UvZnNpbWFnZS5jCkBAIC00MywxMyAr
NDMsNiBAQCB0eXBlZGVmIHN0cnVjdCBmc2ltYWdlX2ZpbGUgewogCWZzaV9maWxlX3QgKmZpbGU7
CiB9IGZzaW1hZ2VfZmlsZV90OwogCi1zdHJ1Y3QgZm9vIHsKLQlpbnQgcmVmOwotCWludCBzaXpl
OwotCWxvbmcgaGFzaDsKLQlpbnQgc3RhdGU7Ci19OwotCiBzdGF0aWMgUHlPYmplY3QgKgogZnNp
bWFnZV9maWxlX3JlYWQoZnNpbWFnZV9maWxlX3QgKmZpbGUsIFB5T2JqZWN0ICphcmdzLCBQeU9i
amVjdCAqa3dhcmdzKQogewotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
