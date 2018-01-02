From: manish.jaggi@linaro.org
Subject: [RFC 08/11] Add ACPI_IORT config
Date: Tue,  2 Jan 2018 14:58:06 +0530
Message-ID: <20180102092809.1841-9-manish.jaggi@linaro.org>
References: <20180102092809.1841-1-manish.jaggi@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=aiit=d5=linaro.org=manish.jaggi@srs-us1.protection.inumbo.net>)
 id 1eWIsY-0002eN-Kd
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2018 09:29:02 +0000
Received: by mail-pg0-x241.google.com with SMTP id b70so804573pga.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2018 01:29:00 -0800 (PST)
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

RnJvbTogTWFuaXNoIEphZ2dpIDxtYW5pc2guamFnZ2lAbGluYXJvLm9yZz4KCkFkZCBBQ1BJX0lP
UlQgY29uZmlnCgpTaW5nZWQtb2ZmLWJ5OiBNYW5pc2ggSmFnZ2kgPG1hbmlzaC5qYWdnaUBsaW5h
cm8ub3JnPgotLS0KIHhlbi9hcmNoL2FybS9LY29uZmlnICAgICB8IDUgKysrKysKIHhlbi9kcml2
ZXJzL2FjcGkvS2NvbmZpZyB8IDMgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9LY29uZmlnIGIveGVuL2FyY2gvYXJtL0tjb25m
aWcKaW5kZXggZjU4MDE5ZDZlZC4uZDQ3NjdkNmVhMyAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJt
L0tjb25maWcKKysrIGIveGVuL2FyY2gvYXJtL0tjb25maWcKQEAgLTQyLDYgKzQyLDExIEBAIGNv
bmZpZyBBQ1BJCiAJICBBZHZhbmNlZCBDb25maWd1cmF0aW9uIGFuZCBQb3dlciBJbnRlcmZhY2Ug
KEFDUEkpIHN1cHBvcnQgZm9yIFhlbiBpcwogCSAgYW4gYWx0ZXJuYXRpdmUgdG8gZGV2aWNlIHRy
ZWUgb24gQVJNNjQuCiAKK2NvbmZpZyBBQ1BJX0lPUlQKKwlib29sCisJcHJvbXB0ICJBQ1BJIElP
UlQgU3VwcG9ydCIgaWYgRVhQRVJUID0gInkiCisJZGVwZW5kcyBvbiBBQ1BJCisKIGNvbmZpZyBI
QVNfR0lDVjMKIAlib29sCiAKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL2FjcGkvS2NvbmZpZyBi
L3hlbi9kcml2ZXJzL2FjcGkvS2NvbmZpZwppbmRleCBiNjRkMzczMWZiLi4xNWFlOTgxNDBjIDEw
MDY0NAotLS0gYS94ZW4vZHJpdmVycy9hY3BpL0tjb25maWcKKysrIGIveGVuL2RyaXZlcnMvYWNw
aS9LY29uZmlnCkBAIC01LDUgKzUsOCBAQCBjb25maWcgQUNQSQogY29uZmlnIEFDUElfTEVHQUNZ
X1RBQkxFU19MT09LVVAKIAlib29sCiAKK2NvbmZpZyBBQ1BJX0lPUlQKKwlib29sCisKIGNvbmZp
ZyBOVU1BCiAJYm9vbAotLSAKMi4xNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
