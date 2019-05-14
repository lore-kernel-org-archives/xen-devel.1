From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH MM-PART2 RESEND v2 18/19] xen/arm: mm: Check
 start is always before end in {destroy, modify}_xen_mappings
Date: Tue, 14 May 2019 13:24:55 +0100
Message-ID: <20190514122456.28559-19-julien.grall@arm.com>
References: <20190514122456.28559-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWUs-00031z-Li
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:25:30 +0000
In-Reply-To: <20190514122456.28559-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHR3byBoZWxwZXJzIHtkZXN0cm95LCBtb2RpZnl9X3hlbl9tYXBwaW5ncyBkb24ndCBjaGVj
ayB0aGF0IHRoZQpzdGFydCBpcyBhbHdheXMgYmVmb3JlIHRoZSBlbmQuIFRoaXMgc2hvdWxkIG5l
dmVyIGhhcHBlbiBidXQgaWYgaXQKaGFwcGVucywgaXQgd2lsbCByZXN1bHQgdG8gdW5leHBlY3Rl
ZCBiZWhhdmlvci4KCkNhdGNoIHN1Y2ggaXNzdWVzIGVhcmxpZXIgb24gYnkgYWRkaW5nIGFuIEFT
U0VSVCBpbiBkZXN0cm95X3hlbl9tYXBwaW5ncwphbmQgbW9kaWZ5X3hlbl9tYXBwaW5ncy4KClNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClJldmlld2Vk
LWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0tCiAgICBDaGFu
Z2VzIGluIHYyOgogICAgICAgIC0gQWRkIEFuZHJpaSdzIHJldmlld2VkLWJ5Ci0tLQogeGVuL2Fy
Y2gvYXJtL21tLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwppbmRleCBlYWNj
MTY0N2UwLi5iNDA4ZGU3Yzc1IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0uYworKysgYi94
ZW4vYXJjaC9hcm0vbW0uYwpAQCAtMTA3NywxMSArMTA3NywxMyBAQCBpbnQgcG9wdWxhdGVfcHRf
cmFuZ2UodW5zaWduZWQgbG9uZyB2aXJ0LCB1bnNpZ25lZCBsb25nIG5yX21mbnMpCiAKIGludCBk
ZXN0cm95X3hlbl9tYXBwaW5ncyh1bnNpZ25lZCBsb25nIHYsIHVuc2lnbmVkIGxvbmcgZSkKIHsK
KyAgICBBU1NFUlQodiA8PSBlKTsKICAgICByZXR1cm4gY3JlYXRlX3hlbl9lbnRyaWVzKFJFTU9W
RSwgdiwgSU5WQUxJRF9NRk4sIChlIC0gdikgPj4gUEFHRV9TSElGVCwgMCk7CiB9CiAKIGludCBt
b2RpZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgcywgdW5zaWduZWQgbG9uZyBlLCB1bnNp
Z25lZCBpbnQgZmxhZ3MpCiB7CisgICAgQVNTRVJUKHMgPD0gZSk7CiAgICAgcmV0dXJuIGNyZWF0
ZV94ZW5fZW50cmllcyhNT0RJRlksIHMsIElOVkFMSURfTUZOLCAoZSAtIHMpID4+IFBBR0VfU0hJ
RlQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbGFncyk7CiB9Ci0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
