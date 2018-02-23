From: Colin King <colin.king@canonical.com>
Subject: [PATCH][next] xen-netback: make function xenvif_rx_skb
	static
Date: Fri, 23 Feb 2018 17:16:57 +0000
Message-ID: <20180223171657.5748-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fvpg=fr=canonical.com=colin.king@srs-us1.protection.inumbo.net>)
 id 1epGxw-0008Lz-6O
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 17:17:00 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSBmdW5j
dGlvbiB4ZW52aWZfcnhfc2tiIGlzIGxvY2FsIHRvIHRoZSBzb3VyY2UgYW5kIGRvZXMgbm90IG5l
ZWQKdG8gYmUgaW4gZ2xvYmFsIHNjb3BlLCBzbyBtYWtlIGl0IHN0YXRpYy4KCkNsZWFucyB1cCBz
cGFyc2Ugd2FybmluZzoKZHJpdmVycy9uZXQveGVuLW5ldGJhY2svcnguYzo0MjI6Njogd2Fybmlu
Zzogc3ltYm9sICd4ZW52aWZfcnhfc2tiJwp3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUg
c3RhdGljPwoKU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25p
Y2FsLmNvbT4KLS0tCiBkcml2ZXJzL25ldC94ZW4tbmV0YmFjay9yeC5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9uZXQveGVuLW5ldGJhY2svcnguYyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL3J4LmMK
aW5kZXggYjFjZjdjNmY0MDdhLi5lZjU4ODcwMzdiMjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0
L3hlbi1uZXRiYWNrL3J4LmMKKysrIGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svcnguYwpAQCAt
NDE5LDcgKzQxOSw3IEBAIHN0YXRpYyB2b2lkIHhlbnZpZl9yeF9leHRyYV9zbG90KHN0cnVjdCB4
ZW52aWZfcXVldWUgKnF1ZXVlLAogCUJVRygpOwogfQogCi12b2lkIHhlbnZpZl9yeF9za2Ioc3Ry
dWN0IHhlbnZpZl9xdWV1ZSAqcXVldWUpCitzdGF0aWMgdm9pZCB4ZW52aWZfcnhfc2tiKHN0cnVj
dCB4ZW52aWZfcXVldWUgKnF1ZXVlKQogewogCXN0cnVjdCB4ZW52aWZfcGt0X3N0YXRlIHBrdDsK
IAotLSAKMi4xNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
