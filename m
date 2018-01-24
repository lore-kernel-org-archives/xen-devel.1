From: Andre Przywara <andre.przywara@linaro.org>
Subject: [PATCH 3/7] ARM: GICv3: emit optional DT property only
	when necessary
Date: Wed, 24 Jan 2018 14:35:13 +0000
Message-ID: <20180124143517.18469-4-andre.przywara@linaro.org>
References: <20180124143517.18469-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=5dpo=et=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1eeM93-00016I-El
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 14:35:21 +0000
Received: by mail-wr0-x243.google.com with SMTP id d9so4262979wre.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2018 06:35:19 -0800 (PST)
In-Reply-To: <20180124143517.18469-1-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@linaro.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGhlIEFSTSBHSUN2MyBEVCBwcm9wZXJ0eSAiI3JlZGlzdHJpYnV0b3ItcmVnaW9ucyIgaXMgb3B0
aW9uYWwgYW5kIG9ubHkKdXNlZnVsIGlmIGl0IGhhcyBhbnkgb3RoZXIgdmFsdWVzIHRoYW4gdGhl
IGFyY2hpdGVjdGVkICIxIi4KS2VlcCBvdXIgZ2VuZXJhdGVkIERUIG5vZGUgY2xlYW4gYnkgZW1p
dHRpbmcgdGhpcyBwcm9wZXJ0eSBvbmx5IGlmIHdlCmFjdHVhbGx5IG5lZWQgbW9yZSB0aGFuIG9u
ZSByZWdpb24uCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFA
bGluYXJvLm9yZz4KLS0tCiB4ZW4vYXJjaC9hcm0vZ2ljLXYzLmMgfCAxMSArKysrKysrLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vZ2ljLXYzLmMgYi94ZW4vYXJjaC9hcm0vZ2ljLXYzLmMKaW5kZXgg
YTBkMjkwYjU1Yy4uOWFkMGNkMTllZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2dpYy12My5j
CisrKyBiL3hlbi9hcmNoL2FybS9naWMtdjMuYwpAQCAtMTE2OCwxMCArMTE2OCwxMyBAQCBzdGF0
aWMgaW50IGdpY3YzX21ha2VfaHdkb21fZHRfbm9kZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkLAog
ICAgIGlmICggcmVzICkKICAgICAgICAgcmV0dXJuIHJlczsKIAotICAgIHJlcyA9IGZkdF9wcm9w
ZXJ0eV9jZWxsKGZkdCwgIiNyZWRpc3RyaWJ1dG9yLXJlZ2lvbnMiLAotICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGQtPmFyY2gudmdpYy5ucl9yZWdpb25zKTsKLSAgICBpZiAoIHJlcyApCi0g
ICAgICAgIHJldHVybiByZXM7CisgICAgaWYgKCBkLT5hcmNoLnZnaWMubnJfcmVnaW9ucyA+IDEg
KQorICAgIHsKKyAgICAgICAgcmVzID0gZmR0X3Byb3BlcnR5X2NlbGwoZmR0LCAiI3JlZGlzdHJp
YnV0b3ItcmVnaW9ucyIsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGQtPmFyY2gu
dmdpYy5ucl9yZWdpb25zKTsKKyAgICAgICAgaWYgKCByZXMgKQorICAgICAgICAgICAgcmV0dXJu
IHJlczsKKyAgICB9CiAKICAgICBsZW4gPSBkdF9jZWxsc190b19zaXplKGR0X25fYWRkcl9jZWxs
cyhnaWMpICsgZHRfbl9zaXplX2NlbGxzKGdpYykpOwogICAgIC8qCi0tIAoyLjE0LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
