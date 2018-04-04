From: Pawel Wieczorkiewicz <wipawel@amazon.de>
Subject: [PATCH 4/7] add nspin_sleep function to time manager
Date: Wed, 4 Apr 2018 15:50:51 +0000
Message-ID: <20180404155054.99335-4-wipawel@amazon.de>
References: <20180404155054.99335-1-wipawel@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ov0m=gz=amazon.de=prvs=6257b9c38=wipawel@srs-us1.protection.inumbo.net>)
 id 1f3khF-0004cd-NV
 for xen-devel@lists.xenproject.org; Wed, 04 Apr 2018 15:51:37 +0000
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
dmlld3MvQ1ItODM2NTM5Ci0tLQogY29tbW9uL3RpbWUuYyB8IDE4ICsrKysrKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9jb21tb24v
dGltZS5jIGIvY29tbW9uL3RpbWUuYwppbmRleCBjODBiYzExLi5kYjI4ZDc4IDEwMDY0NAotLS0g
YS9jb21tb24vdGltZS5jCisrKyBiL2NvbW1vbi90aW1lLmMKQEAgLTEwNiw2ICsxMDYsMjQgQEAg
aW50IGdldHRpbWVvZmRheShzdHJ1Y3QgdGltZXZhbCAqdHApCiAgICAgcmV0dXJuIDA7CiB9CiAK
KyNpZiBkZWZpbmVkKF9faTM4Nl9fKQorc3RhdGljIGlubGluZSB2b2lkIG5zcGluX3NsZWVwKHVp
bnQzMl90IHQpCisjZWxzZQorc3RhdGljIGlubGluZSB2b2lkIG5zcGluX3NsZWVwKHVpbnQ2NF90
IHQpCisjZW5kaWYKK3sKKyNpZiBkZWZpbmVkKF9faTM4Nl9fKQorICAgIHVpbnQzMl90IGN1cnIg
PSBzaW5jZV9ib290X3RpbWUoKTsKKyAgICB1aW50MzJfdCBlbmQgPSBjdXJyICsgdDsKKyNlbHNl
CisgICAgdWludDY0X3QgY3VyciA9IHNpbmNlX2Jvb3RfdGltZSgpOworICAgIHVpbnQ2NF90IGVu
ZCA9IGN1cnIgKyB0OworI2VuZGlmCisKKyAgICB3aGlsZSAoIGN1cnIgPCBlbmQgKQorICAgICAg
ICBjdXJyID0gc2luY2VfYm9vdF90aW1lKCk7Cit9CisKIC8qCiAgKiBMb2NhbCB2YXJpYWJsZXM6
CiAgKiBtb2RlOiBDCi0tIAoyLjE2LjIKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFu
eSBHbWJICkJlcmxpbiAtIERyZXNkZW4gLSBBYWNoZW4KbWFpbiBvZmZpY2U6IEtyYXVzZW5zdHIu
IDM4LCAxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IERyLiBSYWxmIEhlcmJyaWNoLCBD
aHJpc3RpYW4gU2NobGFlZ2VyClVzdC1JRDogREUyODkyMzc4NzkKRWluZ2V0cmFnZW4gYW0gQW10
c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgSFJCIDE0OTE3MyBCCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
