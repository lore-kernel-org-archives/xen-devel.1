From: manish.jaggi@linaro.org
Subject: [RFC 11/11] Add to_pci_dev macro
Date: Tue,  2 Jan 2018 14:58:09 +0530
Message-ID: <20180102092809.1841-12-manish.jaggi@linaro.org>
References: <20180102092809.1841-1-manish.jaggi@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=aiit=d5=linaro.org=manish.jaggi@srs-us1.protection.inumbo.net>)
 id 1eWIsm-0002rI-Ln
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2018 09:29:16 +0000
Received: by mail-pl0-x243.google.com with SMTP id b96so28335661pli.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2018 01:29:15 -0800 (PST)
In-Reply-To: <20180102092809.1841-1-manish.jaggi@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, julien.grall@linaro.org, sameer.goel@linaro.org, andre.przywara@linaro.org
Cc: Manish Jaggi <manish.jaggi@linaro.org>, manish.jaggi@cavium.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogTWFuaXNoIEphZ2dpIDxtYW5pc2guamFnZ2lAbGluYXJvLm9yZz4KClRoaXMgcGF0Y2gg
YWRkcyB0b19wY2lfZGV2IG1hY3JvCgpTaWduZWQtb2ZmLWJ5OiBNYW5pc2ggSmFnZ2kgPG1hbmlz
aC5qYWdnaUBsaW5hcm8ub3JnPgotLS0KIHhlbi9pbmNsdWRlL3hlbi9wY2kuaCB8IDMgKysrCiAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUv
eGVuL3BjaS5oIGIveGVuL2luY2x1ZGUveGVuL3BjaS5oCmluZGV4IDQzZjIxMjUxYTUuLjRjN2Zm
NGRkMTAgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wY2kuaAorKysgYi94ZW4vaW5jbHVk
ZS94ZW4vcGNpLmgKQEAgLTkyLDggKzkyLDExIEBAIHN0cnVjdCBwY2lfZGV2IHsKICNkZWZpbmUg
UFRfRkFVTFRfVEhSRVNIT0xEIDEwCiAgICAgfSBmYXVsdDsKICAgICB1NjQgdmZfcmxlbls2XTsK
KyAgICBzdHJ1Y3QgZGV2aWNlIGRldjsKIH07CiAKKyNkZWZpbmUgdG9fcGNpX2RldihwKSBjb250
YWluZXJfb2YocCwgc3RydWN0IHBjaV9kZXYsIGRldikKKyNkZWZpbmUgcGNpX2RvbWFpbl9ucihk
ZXYpIGRldi0+c2VnCiAjZGVmaW5lIGZvcl9lYWNoX3BkZXYoZG9tYWluLCBwZGV2KSBcCiAgICAg
bGlzdF9mb3JfZWFjaF9lbnRyeShwZGV2LCAmKGRvbWFpbi0+YXJjaC5wZGV2X2xpc3QpLCBkb21h
aW5fbGlzdCkKIAotLSAKMi4xNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
