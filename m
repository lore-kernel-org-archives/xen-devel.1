From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH net-next] net: xen-netback: fix return type of
 ndo_start_xmit function
Date: Wed, 26 Sep 2018 17:18:14 +0800
Message-ID: <20180926091814.11104-1-yuehaibing__31204.4393890121$1537953489$gmane$org@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=znwl=mi=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1g55yf-000170-4d
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 09:19:25 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: davem@davemloft.net, wei.liu2@citrix.com, paul.durrant@citrix.com
Cc: netdev@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGhlIG1ldGhvZCBuZG9fc3RhcnRfeG1pdCgpIGlzIGRlZmluZWQgYXMgcmV0dXJuaW5nIGFuICdu
ZXRkZXZfdHhfdCcsCndoaWNoIGlzIGEgdHlwZWRlZiBmb3IgYW4gZW51bSB0eXBlLCBzbyBtYWtl
IHN1cmUgdGhlIGltcGxlbWVudGF0aW9uIGluCnRoaXMgZHJpdmVyIGhhcyByZXR1cm5zICduZXRk
ZXZfdHhfdCcgdmFsdWUsIGFuZCBjaGFuZ2UgdGhlIGZ1bmN0aW9uCnJldHVybiB0eXBlIHRvIG5l
dGRldl90eF90LgoKRm91bmQgYnkgY29jY2luZWxsZS4KClNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJp
bmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+Ci0tLQogZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaW50ZXJmYWNlLmMgfCAzICsr
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2ludGVyZmFjZS5jIGIvZHJpdmVycy9uZXQv
eGVuLW5ldGJhY2svaW50ZXJmYWNlLmMKaW5kZXggOTIyNzRjMi4uN2UzZWEzOSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaW50ZXJmYWNlLmMKKysrIGIvZHJpdmVycy9uZXQv
eGVuLW5ldGJhY2svaW50ZXJmYWNlLmMKQEAgLTE2NSw3ICsxNjUsOCBAQCBzdGF0aWMgdTE2IHhl
bnZpZl9zZWxlY3RfcXVldWUoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwgc3RydWN0IHNrX2J1ZmYg
KnNrYiwKIAlyZXR1cm4gdmlmLT5oYXNoLm1hcHBpbmdbc2tiX2dldF9oYXNoX3Jhdyhza2IpICUg
c2l6ZV07CiB9CiAKLXN0YXRpYyBpbnQgeGVudmlmX3N0YXJ0X3htaXQoc3RydWN0IHNrX2J1ZmYg
KnNrYiwgc3RydWN0IG5ldF9kZXZpY2UgKmRldikKK3N0YXRpYyBuZXRkZXZfdHhfdAoreGVudmlm
X3N0YXJ0X3htaXQoc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5ldF9kZXZpY2UgKmRldikK
IHsKIAlzdHJ1Y3QgeGVudmlmICp2aWYgPSBuZXRkZXZfcHJpdihkZXYpOwogCXN0cnVjdCB4ZW52
aWZfcXVldWUgKnF1ZXVlID0gTlVMTDsKLS0gCjEuOC4zLjEKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
