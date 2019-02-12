From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] xen-scsiback: mark expected switch fall-through
Date: Tue, 12 Feb 2019 14:40:35 -0600
Message-ID: <20190212204035.GA8037__29521.8427128688$1550004095$gmane$org@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OyS0=QT=embeddedor.com=gustavo@srs-us1.protection.inumbo.net>)
 id 1gterD-0005gr-DT
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 20:40:43 +0000
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway23.websitewelcome.com (Postfix) with ESMTP id A722A2B5D0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Feb 2019 14:40:38 -0600 (CST)
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: xen-devel@lists.xenproject.org

SW4gcHJlcGFyYXRpb24gdG8gZW5hYmxpbmcgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCwgbWFyayBz
d2l0Y2gKY2FzZXMgd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2guCgpUaGlz
IHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZzoKCmRyaXZlcnMveGVuL3hlbi1zY3Np
YmFjay5jOiBJbiBmdW5jdGlvbiDigJhzY3NpYmFja19mcm9udGVuZF9jaGFuZ2Vk4oCZOgpkcml2
ZXJzL3hlbi94ZW4tc2NzaWJhY2suYzoxMTg1OjY6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1h
eSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQogICBpZiAoeGVuYnVzX2Rl
dl9pc19vbmxpbmUoZGV2KSkKICAgICAgXgpkcml2ZXJzL3hlbi94ZW4tc2NzaWJhY2suYzoxMTg4
OjI6IG5vdGU6IGhlcmUKICBjYXNlIFhlbmJ1c1N0YXRlVW5rbm93bjoKICBefn5+CgpXYXJuaW5n
IGxldmVsIDMgd2FzIHVzZWQ6IC1XaW1wbGljaXQtZmFsbHRocm91Z2g9MwoKTm90aWNlIHRoYXQs
IGluIHRoaXMgcGFydGljdWxhciBjYXNlLCB0aGUgY29kZSBjb21tZW50IGlzIG1vZGlmaWVkCmlu
IGFjY29yZGFuY2Ugd2l0aCB3aGF0IEdDQyBpcyBleHBlY3RpbmcgdG8gZmluZC4KClRoaXMgcGF0
Y2ggaXMgcGFydCBvZiB0aGUgb25nb2luZyBlZmZvcnRzIHRvIGVuYWJsZQotV2ltcGxpY2l0LWZh
bGx0aHJvdWdoLgoKU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b0Bl
bWJlZGRlZG9yLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi94ZW4tc2NzaWJhY2suYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMveGVuL3hlbi1zY3NpYmFjay5jIGIvZHJpdmVycy94ZW4veGVuLXNjc2liYWNrLmMK
aW5kZXggZTU5OTM3MjkzYTMyLi5iYTA5NDJlNDgxYmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVu
L3hlbi1zY3NpYmFjay5jCisrKyBiL2RyaXZlcnMveGVuL3hlbi1zY3NpYmFjay5jCkBAIC0xMTg0
LDcgKzExODQsNyBAQCBzdGF0aWMgdm9pZCBzY3NpYmFja19mcm9udGVuZF9jaGFuZ2VkKHN0cnVj
dCB4ZW5idXNfZGV2aWNlICpkZXYsCiAJCXhlbmJ1c19zd2l0Y2hfc3RhdGUoZGV2LCBYZW5idXNT
dGF0ZUNsb3NlZCk7CiAJCWlmICh4ZW5idXNfZGV2X2lzX29ubGluZShkZXYpKQogCQkJYnJlYWs7
Ci0JCS8qIGZhbGwgdGhyb3VnaCBpZiBub3Qgb25saW5lICovCisJCS8qIGZhbGwgdGhyb3VnaCAt
IGlmIG5vdCBvbmxpbmUgKi8KIAljYXNlIFhlbmJ1c1N0YXRlVW5rbm93bjoKIAkJZGV2aWNlX3Vu
cmVnaXN0ZXIoJmRldi0+ZGV2KTsKIAkJYnJlYWs7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
