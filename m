From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH v2 15/15] ts-kernel-build: Move main
 program to bottom of script
Date: Wed, 1 May 2019 11:48:39 +0100
Message-ID: <20190501104839.21621-16-ian.jackson@eu.citrix.com>
References: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLmnJ-0005cj-79
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 10:48:57 +0000
In-Reply-To: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
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

SGF2aW5nIGl0IGluIHRoZSBtaWRkbGUgbWFrZXMgaXQgcXVpdGUgaGFyZCB0byBmaW5kICEKCk5v
IGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdHMta2VybmVsLWJ1aWxkIHwgMjggKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDE0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RzLWtlcm5lbC1idWlsZCBiL3RzLWtlcm5lbC1idWls
ZAppbmRleCA3MWVkYTQ4ZC4uZjdkMDU5YjAgMTAwNzU1Ci0tLSBhL3RzLWtlcm5lbC1idWlsZAor
KysgYi90cy1rZXJuZWwtYnVpbGQKQEAgLTQ2NiwyMCArNDY2LDYgQEAgc3ViIGZ3aW5zdGFsbCAo
KSB7CiBFTkQKIH0KIAotY2hlY2thcmNoKCk7Ci1jaGVja291dCgpOwotY29uZmlnKCk7Ci1idWls
ZCgpOwota2luc3RhbGwoKTsKLWlmICgkcnt0cmVlX2xpbnV4ZmlybXdhcmV9KSB7Ci0gICAgZndi
dWlsZCgpOwotICAgIGZ3aW5zdGFsbCgpOwotfQotYnVpbHRfc3Rhc2goJGhvLCAkYnVpbGRkaXIs
ICdkaXN0JywgJ2tlcm5kaXN0Jyk7Ci1idWlsdF9zdGFzaF9kZWJ1Z2ZpbGUoJGhvLCAkYnVpbGRk
aXIsICd2bWxpbnV4JywgJ2xpbnV4L3ZtbGludXgnKTsKLWJ1aWx0X2NvbXByZXNzX3N0YXNoZWQo
J3ZtbGludXgnKTsKLWJ1aWx0X3N0YXNoX2RlYnVnZmlsZSgkaG8sICRidWlsZGRpciwgJ2NvbmZp
ZycsICdsaW51eC8uY29uZmlnJyk7Ci0KIHN1YiBlbmFibGVfeGVuX2NvbmZpZyAoKSB7CiAgICAg
cmV0dXJuIDw8J0VORCc7CiAjIS9iaW4vc2gKQEAgLTYzMywzICs2MTksMTcgQEAgc2V0b3B0IENP
TkZJR19URUdSQV9IT1NUMVggbgogZXhpdCAwCiBFTkQKIH0KKworY2hlY2thcmNoKCk7CitjaGVj
a291dCgpOworY29uZmlnKCk7CitidWlsZCgpOwora2luc3RhbGwoKTsKK2lmICgkcnt0cmVlX2xp
bnV4ZmlybXdhcmV9KSB7CisgICAgZndidWlsZCgpOworICAgIGZ3aW5zdGFsbCgpOworfQorYnVp
bHRfc3Rhc2goJGhvLCAkYnVpbGRkaXIsICdkaXN0JywgJ2tlcm5kaXN0Jyk7CitidWlsdF9zdGFz
aF9kZWJ1Z2ZpbGUoJGhvLCAkYnVpbGRkaXIsICd2bWxpbnV4JywgJ2xpbnV4L3ZtbGludXgnKTsK
K2J1aWx0X2NvbXByZXNzX3N0YXNoZWQoJ3ZtbGludXgnKTsKK2J1aWx0X3N0YXNoX2RlYnVnZmls
ZSgkaG8sICRidWlsZGRpciwgJ2NvbmZpZycsICdsaW51eC8uY29uZmlnJyk7Ci0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
