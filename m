From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 3/5] PowerMethod: New "nest"
 psuedo-method
Date: Mon, 2 Jul 2018 17:25:45 +0100
Message-ID: <1530548747-28975-4-git-send-email-ian.jackson@eu.citrix.com>
References: <1530548747-28975-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kxf3=js=citrix.com=prvs=714649dcc=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fa1eF-0000N2-6u
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 16:25:55 +0000
In-Reply-To: <1530548747-28975-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SWYgc3BlY2lmaWVkIGFzIHRoZSBmaXJzdCBtZXRob2QsIGl0IG1lYW5zIHRvIHJldmVyc2UgdGhl
IG9yZGVyIHdoZW4KcG93ZXJpbmcgb2ZmLgoKVGhlcmUgZG9uJ3Qgc2VlbSB0byBiZSBhbnkgZG9j
cyBmb3IgUG93ZXJNZXRob2QsIHNvIEkgaGF2ZSBub3QKZG9jdW1lbnRlZCB0aGlzIHJpZ2h0IG5v
dy4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PgotLS0KIE9zc3Rlc3QvVGVzdFN1cHBvcnQucG0gfCAxMyArKysrKysrKysrKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9P
c3N0ZXN0L1Rlc3RTdXBwb3J0LnBtIGIvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQppbmRleCA3OTcz
N2VhLi5hZDg3N2UyIDEwMDY0NAotLS0gYS9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCisrKyBiL09z
c3Rlc3QvVGVzdFN1cHBvcnQucG0KQEAgLTkyMCw3ICs5MjAsMTEgQEAgc3ViIHBvd2VyX2N5Y2xl
X2hvc3Rfc2V0dXAgKCQpIHsKICAgICBteSAoJGhvKSA9IEBfOwogICAgIG15ICRtZXRob2JqcyA9
IFsgXTsKICAgICBmb3JlYWNoIG15ICRtZXRoIChzcGxpdCAvXDtccyovLCAoJGhvLT57UG93ZXJ9
IC8vICd1bnN1cHBvcnRlZCcpKSB7Ci0JcHVzaCBAJG1ldGhvYmpzLCBnZXRfaG9zdF9tZXRob2Rf
b2JqZWN0KCRobywnUERVJywkbWV0aCk7CisgICAgICAgIGlmICgkbWV0aCBlcSAnbmVzdCcpIHsK
KyAgICAgICAgICAgIHB1c2ggQCRtZXRob2JqcywgJG1ldGg7CisgICAgICAgIH0gZWxzZSB7Cisg
ICAgICAgICAgICBwdXNoIEAkbWV0aG9ianMsIGdldF9ob3N0X21ldGhvZF9vYmplY3QoJGhvLCdQ
RFUnLCRtZXRoKTsKKyAgICAgICAgfQogICAgIH0KICAgICAkaG8tPntQb3dlck1ldGhvYmpzfSA9
ICRtZXRob2JqczsKIH0KQEAgLTk0Niw3ICs5NTAsMTIgQEAgc3ViIHBvd2VyX2N5Y2xlICgkKSB7
CiBzdWIgcG93ZXJfc3RhdGUgKCQkKSB7CiAgICAgbXkgKCRobywgJG9uKSA9IEBfOwogICAgIGxv
Z20oInBvd2VyOiBzZXR0aW5nICRvbiBmb3IgJGhvLT57TmFtZX0iKTsKLSAgICBmb3JlYWNoIG15
ICRtbyAoQHsgJGhvLT57UG93ZXJNZXRob2Jqc30gfSkgeworICAgIG15IEBtZXRob2JqcyA9IEB7
ICRoby0+e1Bvd2VyTWV0aG9ianN9IH07CisgICAgaWYgKCRtZXRob2Jqc1swXSBlcSAnbmVzdCcp
IHsKKyAgICAgICAgc2hpZnQgQG1ldGhvYmpzOworICAgICAgICBAbWV0aG9ianMgPSByZXZlcnNl
IEBtZXRob2JqcyBpZiAhJG9uOworICAgIH0KKyAgICBmb3JlYWNoIG15ICRtbyAoQG1ldGhvYmpz
KSB7CiAJJG1vLT5wZHVfcG93ZXJfc3RhdGUoJG9uKTsKICAgICB9CiB9Ci0tIAoyLjEuNAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
