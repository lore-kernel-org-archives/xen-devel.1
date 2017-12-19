From: Dongwon Kim <dongwon.kim@intel.com>
Subject: [RFC PATCH 59/60] hyper_dmabuf: freeing hy_drv_priv
	when drv init fails (v2)
Date: Tue, 19 Dec 2017 11:30:15 -0800
Message-ID: <1513711816-2618-59-git-send-email-dongwon.kim__11915.0023944259$1513712145$gmane$org@intel.com>
References: <1513711816-2618-1-git-send-email-dongwon.kim@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=edeo=dp=intel.com=dongwon.kim@srs-us1.protection.inumbo.net>)
 id 1eRNhY-00068E-Pt
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 19:37:20 +0000
In-Reply-To: <1513711816-2618-1-git-send-email-dongwon.kim@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org, Kai Chen <kai.chen@intel.com>, mateuszx.potrola@intel.com, dri-devel@lists.freedesktop.org, dongwon.kim@intel.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogS2FpIENoZW4gPGthaS5jaGVuQGludGVsLmNvbT4KCk1ha2Ugc3VyZSBoeV9kcnZfcHJp
diBpcyBmcmVlZCBiZWZvcmUgZXhpdGluZyBpbiBzZXZlcmFsIHBsYWNlcwppbiBoeXBlcl9kbWFi
dWZfZHJ2X2luaXQuCgp2MjogdW5sb2NraW5nIG11dGV4IGJlZm9yZSBmcmVlaW5nIGh5X2Rydl9w
cml2IHdoZW4gYmtuZF9vcHMtPmluaXQKZmFpbHMKClNpZ25lZC1vZmYtYnk6IEthaSBDaGVuIDxr
YWkuY2hlbkBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IERvbmd3b24gS2ltIDxkb25nd29uLmtp
bUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy94ZW4vaHlwZXJfZG1hYnVmL2h5cGVyX2RtYWJ1Zl9k
cnYuYyB8IDcgKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2h5cGVyX2RtYWJ1Zi9oeXBlcl9kbWFi
dWZfZHJ2LmMgYi9kcml2ZXJzL3hlbi9oeXBlcl9kbWFidWYvaHlwZXJfZG1hYnVmX2Rydi5jCmlu
ZGV4IGJiYjM0MTQuLmVlYWQ0YzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL2h5cGVyX2RtYWJ1
Zi9oeXBlcl9kbWFidWZfZHJ2LmMKKysrIGIvZHJpdmVycy94ZW4vaHlwZXJfZG1hYnVmL2h5cGVy
X2RtYWJ1Zl9kcnYuYwpAQCAtMjcxLDggKzI3MSwxMCBAQCBzdGF0aWMgaW50IF9faW5pdCBoeXBl
cl9kbWFidWZfZHJ2X2luaXQodm9pZCkKIAkJcmV0dXJuIC1FTk9NRU07CiAKIAlyZXQgPSByZWdp
c3Rlcl9kZXZpY2UoKTsKLQlpZiAocmV0IDwgMCkKKwlpZiAocmV0IDwgMCkgeworCQlrZnJlZSho
eV9kcnZfcHJpdik7CiAJCXJldHVybiByZXQ7CisJfQogCiAvKiBjdXJyZW50bHkgb25seSBzdXBw
b3J0cyBYRU4gaHlwZXJ2aXNvciAqLwogI2lmZGVmIENPTkZJR19IWVBFUl9ETUFCVUZfWEVOCkBA
IC0yODQsNiArMjg2LDcgQEAgc3RhdGljIGludCBfX2luaXQgaHlwZXJfZG1hYnVmX2Rydl9pbml0
KHZvaWQpCiAKIAlpZiAoaHlfZHJ2X3ByaXYtPmJrbmRfb3BzID09IE5VTEwpIHsKIAkJcHJpbnRr
KEtFUk5fRVJSICJIeXBlcl9kbWFidWY6IG5vIGJhY2tlbmQgZm91bmRcbiIpOworCQlrZnJlZSho
eV9kcnZfcHJpdik7CiAJCXJldHVybiAtMTsKIAl9CiAKQEAgLTMzNiw2ICszMzksOCBAQCBzdGF0
aWMgaW50IF9faW5pdCBoeXBlcl9kbWFidWZfZHJ2X2luaXQodm9pZCkKIAkJaWYgKHJldCA8IDAp
IHsKIAkJCWRldl9kYmcoaHlfZHJ2X3ByaXYtPmRldiwKIAkJCQkiZmFpbGVkIHRvIGluaXRpYWxp
emUgYmFja2VuZC5cbiIpOworCQkJbXV0ZXhfdW5sb2NrKCZoeV9kcnZfcHJpdi0+bG9jayk7CisJ
CQlrZnJlZShoeV9kcnZfcHJpdik7CiAJCQlyZXR1cm4gcmV0OwogCQl9CiAJfQotLSAKMi43LjQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
