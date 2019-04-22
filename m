From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 18/20] xen/arm: mm: Check start is always before
 end in {destroy, modify}_xen_mappings
Date: Mon, 22 Apr 2019 17:49:35 +0100
Message-ID: <20190422164937.21350-19-julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc92-0005Ne-NJ
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:50:16 +0000
In-Reply-To: <20190422164937.21350-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

VGhlIHR3byBoZWxwZXJzIHtkZXN0cm95LCBtb2RpZnl9X3hlbl9tYXBwaW5ncyBkb24ndCBjaGVj
ayB0aGF0IHRoZQpzdGFydCBpcyBhbHdheXMgYmVmb3JlIHRoZSBlbmQuIFRoaXMgc2hvdWxkIG5l
dmVyIGhhcHBlbiBidXQgaWYgaXQKaGFwcGVucywgaXQgd2lsbCByZXN1bHQgdG8gdW5leHBlY3Rl
ZCBiZWhhdmlvci4KCkNhdGNoIHN1Y2ggaXNzdWVzIGVhcmxpZXIgb24gYnkgYWRkaW5nIGFuIEFT
U0VSVCBpbiBkZXN0cm95X3hlbl9tYXBwaW5ncwphbmQgbW9kaWZ5X3hlbl9tYXBwaW5ncy4KClNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVu
L2FyY2gvYXJtL21tLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwppbmRleCBl
ZTU0MWEzOGUzLi5kNjE1N2MzNWQ2IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0uYworKysg
Yi94ZW4vYXJjaC9hcm0vbW0uYwpAQCAtMTA3MiwxMSArMTA3MiwxMyBAQCBpbnQgcG9wdWxhdGVf
cHRfcmFuZ2UodW5zaWduZWQgbG9uZyB2aXJ0LCB1bnNpZ25lZCBsb25nIG5yX21mbnMpCiAKIGlu
dCBkZXN0cm95X3hlbl9tYXBwaW5ncyh1bnNpZ25lZCBsb25nIHYsIHVuc2lnbmVkIGxvbmcgZSkK
IHsKKyAgICBBU1NFUlQodiA8PSBlKTsKICAgICByZXR1cm4gY3JlYXRlX3hlbl9lbnRyaWVzKFJF
TU9WRSwgdiwgSU5WQUxJRF9NRk4sIChlIC0gdikgPj4gUEFHRV9TSElGVCwgMCk7CiB9CiAKIGlu
dCBtb2RpZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgcywgdW5zaWduZWQgbG9uZyBlLCB1
bnNpZ25lZCBpbnQgZmxhZ3MpCiB7CisgICAgQVNTRVJUKHMgPD0gZSk7CiAgICAgcmV0dXJuIGNy
ZWF0ZV94ZW5fZW50cmllcyhNT0RJRlksIHMsIElOVkFMSURfTUZOLCAoZSAtIHMpID4+IFBBR0Vf
U0hJRlQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbGFncyk7CiB9Ci0tIAoyLjEx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
