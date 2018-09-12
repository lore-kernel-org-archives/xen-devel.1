From: zhong jiang <zhongjiang@huawei.com>
Subject: [PATCH] drivers/block/xen-blkback/common.h: use
 DIV_ROUND_UP instead of reimplementing its function
Date: Wed, 12 Sep 2018 13:45:00 +0800
Message-ID: <1536731100-56054-1-git-send-email-zhongjiang__20455.6525488899$1536731784$gmane$org@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=u/vq=l2=huawei.com=zhongjiang@srs-us1.protection.inumbo.net>)
 id 1fzy9Q-00051M-IS
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 05:57:20 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: axboe@kernel.dk
Cc: linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, konrad.wilk@oracle.com, linux-kernel@vger.kernel.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

RElWX1JPVU5EX1VQIGhhcyBpbXBsZW1lbnRlZCB0aGUgY29kZS1vcGVuZWQgZnVuY3Rpb24uIFRo
ZXJlZm9yZSwganVzdApyZXBsYWNlIHRoZSBpbXBsZW1lbnRhdGlvbiB3aXRoIERJVl9ST1VORF9V
UC4KClNpZ25lZC1vZmYtYnk6IHpob25nIGppYW5nIDx6aG9uZ2ppYW5nQGh1YXdlaS5jb20+Ci0t
LQogZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9jb21tb24uaCB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
YmxvY2sveGVuLWJsa2JhY2svY29tbW9uLmggYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2Nv
bW1vbi5oCmluZGV4IDFkMzAwMmQuLjg3NDYxM2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2sv
eGVuLWJsa2JhY2svY29tbW9uLmgKKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9jb21t
b24uaApAQCAtNjUsNyArNjUsNyBAQAogCShYRU5fUEFHRVNfUEVSX0lORElSRUNUX0ZSQU1FIC8g
WEVOX1BBR0VTX1BFUl9TRUdNRU5UKQogCiAjZGVmaW5lIE1BWF9JTkRJUkVDVF9QQUdFUyBcCi0J
KChNQVhfSU5ESVJFQ1RfU0VHTUVOVFMgKyBTRUdTX1BFUl9JTkRJUkVDVF9GUkFNRSAtIDEpL1NF
R1NfUEVSX0lORElSRUNUX0ZSQU1FKQorCQlESVZfUk9VTkRfVVAoTUFYX0lORElSRUNUX1NFR01F
TlRTLCBTRUdTX1BFUl9JTkRJUkVDVF9GUkFNRSkKICNkZWZpbmUgSU5ESVJFQ1RfUEFHRVMoX3Nl
Z3MpIERJVl9ST1VORF9VUChfc2VncywgWEVOX1BBR0VTX1BFUl9JTkRJUkVDVF9GUkFNRSkKIAog
LyogTm90IGEgcmVhbCBwcm90b2NvbC4gIFVzZWQgdG8gZ2VuZXJhdGUgcmluZyBzdHJ1Y3RzIHdo
aWNoIGNvbnRhaW4KLS0gCjEuNy4xMi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
