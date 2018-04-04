From: Pawel Wieczorkiewicz <wipawel@amazon.de>
Subject: [PATCH 5/7] add spin_sleep function to time manager
Date: Wed, 4 Apr 2018 15:50:52 +0000
Message-ID: <20180404155054.99335-5-wipawel@amazon.de>
References: <20180404155054.99335-1-wipawel@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ov0m=gz=amazon.de=prvs=6257b9c38=wipawel@srs-us1.protection.inumbo.net>)
 id 1f3khO-0004gj-K5
 for xen-devel@lists.xenproject.org; Wed, 04 Apr 2018 15:51:46 +0000
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
dmlld3MvQ1ItNzg2MjI2Ci0tLQogY29tbW9uL3RpbWUuYyB8IDE0ICsrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2NvbW1vbi90aW1l
LmMgYi9jb21tb24vdGltZS5jCmluZGV4IGRiMjhkNzguLjZhYTE2NDggMTAwNjQ0Ci0tLSBhL2Nv
bW1vbi90aW1lLmMKKysrIGIvY29tbW9uL3RpbWUuYwpAQCAtMTI0LDYgKzEyNCwyMCBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgbnNwaW5fc2xlZXAodWludDY0X3QgdCkKICAgICAgICAgY3VyciA9IHNp
bmNlX2Jvb3RfdGltZSgpOwogfQogCisjaWYgZGVmaW5lZChfX2kzODZfXykKK3N0YXRpYyBpbmxp
bmUgdm9pZCBzcGluX3NsZWVwKHVpbnQzMl90IHQpCisjZWxzZQorc3RhdGljIGlubGluZSB2b2lk
IHNwaW5fc2xlZXAodWludDY0X3QgdCkKKyNlbmRpZgoreworI2lmIGRlZmluZWQoX19pMzg2X18p
CisgICAgdWludDMyX3QgbnNlYyA9IHQgKiAxMDAwMDAwMDAwOworI2Vsc2UKKyAgICB1aW50NjRf
dCBuc2VjID0gdCAqIDEwMDAwMDAwMDB1bDsKKyNlbmRpZgorICAgIG5zcGluX3NsZWVwKG5zZWMp
OworfQorCiAvKgogICogTG9jYWwgdmFyaWFibGVzOgogICogbW9kZTogQwotLSAKMi4xNi4yCgpB
bWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApCZXJsaW4gLSBEcmVzZGVuIC0g
QWFjaGVuCm1haW4gb2ZmaWNlOiBLcmF1c2Vuc3RyLiAzOCwgMTAxMTcgQmVybGluCkdlc2NoYWVm
dHNmdWVocmVyOiBEci4gUmFsZiBIZXJicmljaCwgQ2hyaXN0aWFuIFNjaGxhZWdlcgpVc3QtSUQ6
IERFMjg5MjM3ODc5CkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIEhS
QiAxNDkxNzMgQgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
