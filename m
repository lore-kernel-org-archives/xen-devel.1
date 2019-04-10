From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 50/62] dm restrict audit: actually
 install fishdescriptor in host
Date: Wed, 10 Apr 2019 15:23:56 +0100
Message-ID: <20190410142408.22848-51-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAY-0006yI-8v
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:42 +0000
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
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

SW4KICBkbSByZXN0cmljdCBhdWRpdDogaW5zdGFsbCBuZXdlciBjaGlhcmstc2NyaXB0cyBmb3Ig
ZmlzaGRlc2NyaXB0b3IKYXJyYW5nZW1lbnRzIHdlcmUgbWFkZSB0byBpbnN0YWxsIGEgYmFja3Bv
cnQgb2YgY2hpYXJrLXNjcmlwdHMKYnV0IHRoZSBjb2RlIHdhcyBtaXN0YWtlbmx5IHBsYWNlZCBp
biBwcmVzZWVkX2NyZWF0ZV9ndWVzdCBidXQKb2YgY291cnNlIGl0J3MgbmVlZGVkIGluIHRoZSBo
b3N0LgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+Ci0tLQogT3NzdGVzdC9EZWJpYW4ucG0gfCAxMSArKysrKystLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0
L0RlYmlhbi5wbSBiL09zc3Rlc3QvRGViaWFuLnBtCmluZGV4IDI1YmY4ZTg4Li44ZDUzYmJlMSAx
MDA2NDQKLS0tIGEvT3NzdGVzdC9EZWJpYW4ucG0KKysrIGIvT3NzdGVzdC9EZWJpYW4ucG0KQEAg
LTEwMjIsNiArMTAyMiwxMiBAQCBFTkQKICAgICAjIHNlY3VyaXR5LmQubyBDRE4gc2VlbXMgdW5y
ZWxpYWJsZSByaWdodCBub3cKICAgICAjIGFuZCBqZXNzaWUtdXBkYXRlcyBpcyBubyBtb3JlCiAK
KyAgICBpZiAoZ3JlcCB7IG0vX2RtcmVzdHJpY3QkLyAmJiAkcnskX30gfSBrZXlzICVyIGFuZAor
CSRzdWl0ZSA9fiBtL3N0cmV0Y2gvKSB7CisJcHJlc2VlZF9iYWNrcG9ydHNfcGFja2FnZXMoJGhv
LCAkc2Z4LCBcJXhvcHRzLCAkc3VpdGUsCisJCQkJICAgcXcoY2hpYXJrLXNjcmlwdHMpKTsKKyAg
ICB9CisKICAgICAkcHJlc2VlZCAuPSA8PCJFTkQiOwogCiAjIyMgRU5EIE9GIERFQklBTiBQUkVT
RUVEIEJBU0UKQEAgLTEwNTcsMTEgKzEwNjMsNiBAQCBzdWIgcHJlc2VlZF9jcmVhdGVfZ3Vlc3Qg
KCQkJDtAKSB7CiAgICAgICAgICAgICAkZXh0cmFfcGFja2FnZXMgPSAicHYtZ3J1Yi1tZW51IjsK
ICAgICAgICAgfQogICAgIH0KLSAgICBpZiAoZ3JlcCB7IG0vX2RtcmVzdHJpY3QkLyAmJiAkcnsk
X30gfSBrZXlzICVyIGFuZAotCSRzdWl0ZSA9fiBtL3N0cmV0Y2gvKSB7Ci0JcHJlc2VlZF9iYWNr
cG9ydHNfcGFja2FnZXMoJGhvLCAkc2Z4LCBcJXhvcHRzLCAkc3VpdGUsCi0JCQkJICAgcXcoY2hp
YXJrLXNjcmlwdHMpKTsKLSAgICB9CiAKICAgICBteSAkcHJlc2VlZF9maWxlPSBwcmVzZWVkX2Jh
c2UoJGhvLCAkc2Z4LCAkZXh0cmFfcGFja2FnZXMsICV4b3B0cyk7CiAgICAgJHByZXNlZWRfZmls
ZS49ICg8PEVORCk7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
