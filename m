From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 16/21] ts-host-allocate-Executive: Break
 out $now and add a newline
Date: Thu, 18 Apr 2019 17:31:53 +0100
Message-ID: <20190418163158.11408-17-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xK-00022D-W2
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:11 +0000
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
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

UHJlcCB3b3JrLCBubyBmdW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNr
c29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRzLWhvc3RzLWFsbG9jYXRlLUV4
ZWN1dGl2ZSB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL3RzLWhvc3RzLWFsbG9jYXRlLUV4ZWN1dGl2ZSBiL3RzLWhv
c3RzLWFsbG9jYXRlLUV4ZWN1dGl2ZQppbmRleCAzZGExMzhiMS4uMzQyNWM4Y2UgMTAwNzU1Ci0t
LSBhL3RzLWhvc3RzLWFsbG9jYXRlLUV4ZWN1dGl2ZQorKysgYi90cy1ob3N0cy1hbGxvY2F0ZS1F
eGVjdXRpdmUKQEAgLTc1NiwxMiArNzU2LDE0IEBAIHN1YiBhdHRlbXB0X2FsbG9jYXRpb24gewog
CWxvZ20oImhvc3QgYWxsb2NhdGlvbjogc3VjY2Vzc2Z1bCwgcmVwb3J0aW5nIHRvIHBsYW5uZXIu
Iik7CiAgICAgfSBlbHNlIHsKIAlsb2dtKCJob3N0IGFsbG9jYXRpb246IHBsYW5uZWQgc3RhcnQg
aW4gJGJlc3QtPntTdGFydH0gc2Vjb25kcy4iKTsKKwogCW15ICRtYXh3YWl0ID0gJHJ7aG9zdGFs
bG9jX21heHdhaXRfbWF4fTsKKwlteSAkbm93ID0gdGltZSAvLyBkaWUgJCE7CiAJaWYgKGRlZmlu
ZWQgJG1heHdhaXQpIHsKIAkgICAgIyBXZSBxdWl0IGlmOgogCSAgICAjICAqIHdlIGhhdmUgYmVl
biB3YWl0aW5nIGF0IGxlYXN0ICRtYXh3YWl0LzIKIAkgICAgIyAgKiB3ZSBlc3RpbWF0ZSBpdCB3
aWxsIHRha2UgYXQgbGVhc3QgJG1heHdhaXQgb3ZlcmFsbAotCSAgICBteSAkd2FpdF9zb2ZhciA9
ICh0aW1lIC8vIGRpZSAkISkgLSAkYWxsb2Nfc3RhcnRfdGltZTsKKwkgICAgbXkgJHdhaXRfc29m
YXIgPSAkbm93IC0gJGFsbG9jX3N0YXJ0X3RpbWU7CiAJICAgIGRpZSAidGltZWQgb3V0OiAkd2Fp
dF9zb2ZhciwgJGJlc3QtPntTdGFydH0sICRtYXh3YWl0IgogICAgICAgICAgICAgICAgIGlmICR3
YWl0X3NvZmFyID4gJG1heHdhaXQvMgogCQkmJiAkd2FpdF9zb2ZhciArICRiZXN0LT57U3RhcnR9
ID4gJG1heHdhaXQ7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
