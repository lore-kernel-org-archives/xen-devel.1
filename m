From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC 1/3] automation: install texinfo in debian
Date: Wed, 23 May 2018 11:20:38 +0100
Message-ID: <20180523102040.16299-2-wei.liu2@citrix.com>
References: <20180523102040.16299-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=x+ah=ik=citrix.com=prvs=674237c1e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fLQt4-0004e8-0o
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 10:20:54 +0000
In-Reply-To: <20180523102040.16299-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

U3R1YmRvbSBidWlsZCByZXF1aXJlcyB0aGF0LgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4KLS0tCiBhdXRvbWF0aW9uL2J1aWxkL2RlYmlhbi9qZXNzaWUuZG9j
a2VyZmlsZSAgfCAxICsKIGF1dG9tYXRpb24vYnVpbGQvZGViaWFuL3N0cmV0Y2guZG9ja2VyZmls
ZSB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9h
dXRvbWF0aW9uL2J1aWxkL2RlYmlhbi9qZXNzaWUuZG9ja2VyZmlsZSBiL2F1dG9tYXRpb24vYnVp
bGQvZGViaWFuL2plc3NpZS5kb2NrZXJmaWxlCmluZGV4IDliYjFiZGYxMDQuLjMzNzdhNjMzMzQg
MTAwNjQ0Ci0tLSBhL2F1dG9tYXRpb24vYnVpbGQvZGViaWFuL2plc3NpZS5kb2NrZXJmaWxlCisr
KyBiL2F1dG9tYXRpb24vYnVpbGQvZGViaWFuL2plc3NpZS5kb2NrZXJmaWxlCkBAIC00MSw2ICs0
MSw3IEBAIFJVTiBhcHQtZ2V0IHVwZGF0ZSAmJiBcCiAgICAgICAgIGNoZWNrcG9saWN5IFwKICAg
ICAgICAgd2dldCBcCiAgICAgICAgIGdpdCBcCisgICAgICAgIHRleGluZm8gXAogICAgICAgICAm
JiBcCiAgICAgICAgIGFwdC1nZXQgYXV0b3JlbW92ZSAteSAmJiBcCiAgICAgICAgIGFwdC1nZXQg
Y2xlYW4gJiYgXApkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9idWlsZC9kZWJpYW4vc3RyZXRjaC5k
b2NrZXJmaWxlIGIvYXV0b21hdGlvbi9idWlsZC9kZWJpYW4vc3RyZXRjaC5kb2NrZXJmaWxlCmlu
ZGV4IGYwNjg0NTdhYjYuLjNkM2YxNDA3MzcgMTAwNjQ0Ci0tLSBhL2F1dG9tYXRpb24vYnVpbGQv
ZGViaWFuL3N0cmV0Y2guZG9ja2VyZmlsZQorKysgYi9hdXRvbWF0aW9uL2J1aWxkL2RlYmlhbi9z
dHJldGNoLmRvY2tlcmZpbGUKQEAgLTQxLDYgKzQxLDcgQEAgUlVOIGFwdC1nZXQgdXBkYXRlICYm
IFwKICAgICAgICAgY2hlY2twb2xpY3kgXAogICAgICAgICB3Z2V0IFwKICAgICAgICAgZ2l0IFwK
KyAgICAgICAgdGV4aW5mbyBcCiAgICAgICAgICYmIFwKICAgICAgICAgYXB0LWdldCBhdXRvcmVt
b3ZlIC15ICYmIFwKICAgICAgICAgYXB0LWdldCBjbGVhbiAmJiBcCi0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
