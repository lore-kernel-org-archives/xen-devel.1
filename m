From: Pawel Wieczorkiewicz <wipawel@amazon.de>
Subject: [PATCH 6/7] add mspin_sleep function to time manager
Date: Wed, 4 Apr 2018 15:50:53 +0000
Message-ID: <20180404155054.99335-6-wipawel@amazon.de>
References: <20180404155054.99335-1-wipawel@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ov0m=gz=amazon.de=prvs=6257b9c38=wipawel@srs-us1.protection.inumbo.net>)
 id 1f3khP-0004hE-QO
 for xen-devel@lists.xenproject.org; Wed, 04 Apr 2018 15:51:47 +0000
In-Reply-To: <20180404155054.99335-1-wipawel@amazon.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: semelpaul@gmail.com, andrew.cooper3@citrix.com, wipawel@amazon.de
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUGF1bCBTZW1lbCA8cGhlbnRleEBhbWF6b24uZGU+CgpTaWduZWQtb2ZmLWJ5OiBQYXVs
IFNlbWVsIDxwaGVudGV4QGFtYXpvbi5kZT4KCmNyIGh0dHBzOi8vY29kZS5hbWF6b24uY29tL3Jl
dmlld3MvQ1ItNzg2MjI3Ci0tLQogY29tbW9uL3RpbWUuYyB8IDE0ICsrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2NvbW1vbi90aW1l
LmMgYi9jb21tb24vdGltZS5jCmluZGV4IDZhYTE2NDguLjc1Nzc2OTQgMTAwNjQ0Ci0tLSBhL2Nv
bW1vbi90aW1lLmMKKysrIGIvY29tbW9uL3RpbWUuYwpAQCAtMTM4LDYgKzEzOCwyMCBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgc3Bpbl9zbGVlcCh1aW50NjRfdCB0KQogICAgIG5zcGluX3NsZWVwKG5z
ZWMpOwogfQogCisjaWYgZGVmaW5lZChfX2kzODZfXykKK3N0YXRpYyBpbmxpbmUgdm9pZCBtc3Bp
bl9zbGVlcCh1aW50MzJfdCB0KQorI2Vsc2UKK3N0YXRpYyBpbmxpbmUgdm9pZCBtc3Bpbl9zbGVl
cCh1aW50NjRfdCB0KQorI2VuZGlmCit7CisjaWYgZGVmaW5lZChfX2kzODZfXykKKyAgICB1aW50
MzJfdCBuc2VjID0gdCAqIDEwMDAwMDA7CisjZWxzZQorICAgIHVpbnQ2NF90IG5zZWMgPSB0ICog
MTAwMDAwMHVsOworI2VuZGlmCisgICAgbnNwaW5fc2xlZXAobnNlYyk7Cit9CisKIC8qCiAgKiBM
b2NhbCB2YXJpYWJsZXM6CiAgKiBtb2RlOiBDCi0tIAoyLjE2LjIKCkFtYXpvbiBEZXZlbG9wbWVu
dCBDZW50ZXIgR2VybWFueSBHbWJICkJlcmxpbiAtIERyZXNkZW4gLSBBYWNoZW4KbWFpbiBvZmZp
Y2U6IEtyYXVzZW5zdHIuIDM4LCAxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IERyLiBS
YWxmIEhlcmJyaWNoLCBDaHJpc3RpYW4gU2NobGFlZ2VyClVzdC1JRDogREUyODkyMzc4NzkKRWlu
Z2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgSFJCIDE0OTE3MyBCCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
