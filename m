From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 1/5] db_retry: Honour new
 OSSTEST_DB_ALWAYS_ABORT variable
Date: Tue, 12 Jun 2018 17:39:09 +0100
Message-ID: <1528821553-27252-2-git-send-email-ian.jackson@eu.citrix.com>
References: <23327.63003.13831.988297@mariner.uk.xensource.com>
 <1528821553-27252-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hfe/=i6=citrix.com=prvs=694d9f8cf=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fSmKZ-0005ju-IU
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 16:39:39 +0000
In-Reply-To: <1528821553-27252-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyB1c2VmdWwgZm9yIGRlYnVnZ2luZy4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QucG0gfCAyICsrCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvT3NzdGVzdC5wbSBiL09z
c3Rlc3QucG0KaW5kZXggMjI2Mzc4Ni4uMzM3N2VhMyAxMDA2NDQKLS0tIGEvT3NzdGVzdC5wbQor
KysgYi9Pc3N0ZXN0LnBtCkBAIC0zMzAsNiArMzMwLDggQEAgc3ViIGRiX3JldHJ5ICgkJCQ7JCQp
IHsKIAkJbGFzdCBpZiAkZGJfcmV0cnlfc3RvcCBlcSAnYWJvcnQnOwogCQluZXh0OwogCSAgICB9
CisgICAgICAgICAgICBkaWUgJ09TU1RFU1RfREJfQUxXQVlTX0FCT1JUIHNldCcKKyAgICAgICAg
ICAgICAgICBpZiAkRU5WeydPU1NURVNUX0RCX0FMV0FZU19BQk9SVCd9OwogCSAgICAkY29tbWl0
dGluZyA9IDE7CiAJICAgICRkYmgtPmNvbW1pdCgpOwogCX07Ci0tIAoyLjEuNAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
