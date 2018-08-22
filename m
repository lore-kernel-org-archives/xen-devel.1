From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] libxl: make sure string is null-terminated in
 libxl__prepare_sockaddr_un
Date: Wed, 22 Aug 2018 11:21:55 +0100
Message-ID: <20180822102155.990-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=om3v=lf=citrix.com=prvs=7650e4d92=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fsQH1-0007ZA-Og
 for xen-devel@lists.xenproject.org; Wed, 22 Aug 2018 10:21:59 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q292ZXJpdHktSUQ6IDE0Mzg0NzIKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KLS0tCkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4K
LS0tCiB0b29scy9saWJ4bC9saWJ4bF91dGlscy5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhs
L2xpYnhsX3V0aWxzLmMgYi90b29scy9saWJ4bC9saWJ4bF91dGlscy5jCmluZGV4IDU4NTQ3MTdi
MTEuLmUwNmY3NjU2OTkgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX3V0aWxzLmMKKysr
IGIvdG9vbHMvbGlieGwvbGlieGxfdXRpbHMuYwpAQCAtMTIzOCw2ICsxMjM4LDggQEAgaW50IGxp
YnhsX19wcmVwYXJlX3NvY2thZGRyX3VuKGxpYnhsX19nYyAqZ2MsCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IHNvY2thZGRyX3VuICp1biwgY29uc3QgY2hhciAqcGF0aCwK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICp3aGF0KQogeworICAg
IHNpemVfdCBzeiA9IHNpemVvZih1bi0+c3VuX3BhdGgpOworCiAgICAgaWYgKHNpemVvZih1bi0+
c3VuX3BhdGgpIDw9IHN0cmxlbihwYXRoKSkgewogICAgICAgICBMT0coRVJST1IsICJVTklYIHNv
Y2tldCBwYXRoICclcycgaXMgdG9vIGxvbmcgZm9yICVzIiwgcGF0aCwgd2hhdCk7CiAgICAgICAg
IExPRyhERUJVRywgIlBhdGggbXVzdCBiZSBsZXNzIHRoYW4gJXp1IGJ5dGVzIiwgc2l6ZW9mKHVu
LT5zdW5fcGF0aCkpOwpAQCAtMTI0NSw3ICsxMjQ3LDggQEAgaW50IGxpYnhsX19wcmVwYXJlX3Nv
Y2thZGRyX3VuKGxpYnhsX19nYyAqZ2MsCiAgICAgfQogICAgIG1lbXNldCh1biwgMCwgc2l6ZW9m
KHN0cnVjdCBzb2NrYWRkcl91bikpOwogICAgIHVuLT5zdW5fZmFtaWx5ID0gQUZfVU5JWDsKLSAg
ICBzdHJuY3B5KHVuLT5zdW5fcGF0aCwgcGF0aCwgc2l6ZW9mKHVuLT5zdW5fcGF0aCkpOworICAg
IHN0cm5jcHkodW4tPnN1bl9wYXRoLCBwYXRoLCBzeik7CisgICAgdW4tPnN1bl9wYXRoW3N6IC0g
MV0gPSAnXDAnOwogICAgIHJldHVybiAwOwogfQogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
