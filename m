From: Andre Przywara <andre.przywara@linaro.org>
Subject: [PATCH v3 31/39] ARM: new VGIC: Provide system register
 emulation stub
Date: Wed, 21 Mar 2018 16:32:27 +0000
Message-ID: <20180321163235.12529-32-andre.przywara@linaro.org>
References: <20180321163235.12529-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=p7ro=gl=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1eygfz-0002qc-FF
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 16:33:23 +0000
Received: by mail-wr0-x241.google.com with SMTP id o1so5821353wro.10
 for <xen-devel@lists.xenproject.org>; Wed, 21 Mar 2018 09:33:22 -0700 (PDT)
In-Reply-To: <20180321163235.12529-1-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andre Przywara <andre.przywara@linaro.org>
List-Id: xen-devel@lists.xenproject.org

VGhlIFhlbiBhcmNoIGNvZGUgdHJhcHMgc3lzdGVtIHJlZ2lzdGVycyB3cml0ZXMgZnJvbSB0aGUg
Z3Vlc3QgYW5kIHdpbGwKcmVsYXkgYW55dGhpbmcgR0lDIHJlbGF0ZWQgdG8gdGhlIFZHSUMuClNp
bmNlIHRoaXMgYWZmZWN0cyBvbmx5IEdJQ3YzICh3aGljaCB3ZSBkb24ndCB5ZXQgZW11bGF0ZSks
IHByb3ZpZGUgYQpzdHViIGltcGxlbWVudGF0aW9uIG9mIHZnaWNfZW11bGF0ZSgpIGZvciBub3cu
CgpTaWduZWQtb2ZmLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAbGluYXJvLm9y
Zz4KQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVu
L2FyY2gvYXJtL3ZnaWMvdmdpYy5jIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jIGIveGVuL2Fy
Y2gvYXJtL3ZnaWMvdmdpYy5jCmluZGV4IDc5YzZhNTU1M2QuLmZmYWIwYjI2MzUgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL2FybS92Z2ljL3ZnaWMuYworKysgYi94ZW4vYXJjaC9hcm0vdmdpYy92Z2lj
LmMKQEAgLTgxNCw2ICs4MTQsMTMgQEAgc3RydWN0IGlycV9kZXNjICp2Z2ljX2dldF9od19pcnFf
ZGVzYyhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgdmNwdSAqdiwKICAgICByZXR1cm4gZGVzYzsK
IH0KIAorYm9vbCB2Z2ljX2VtdWxhdGUoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIHVuaW9u
IGhzciBoc3IpCit7CisgICAgQVNTRVJUKGN1cnJlbnQtPmRvbWFpbi0+YXJjaC52Z2ljLnZlcnNp
b24gPT0gR0lDX1YzKTsKKworICAgIHJldHVybiBmYWxzZTsKK30KKwogLyoKICAqIHdhczoKICAq
ICAgICAgaW50IGt2bV92Z2ljX21hcF9waHlzX2lycShzdHJ1Y3QgdmNwdSAqdmNwdSwgdTMyIHZp
cnRfaXJxLCB1MzIgcGh5c19pcnEpCi0tIAoyLjE0LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
