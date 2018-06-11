From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH v2 7/8] tools/tests/depriv: Install
 depriv-fd-checker in our private libexec directory
Date: Mon, 11 Jun 2018 15:13:23 +0100
Message-ID: <1528726404-14924-8-git-send-email-ian.jackson@eu.citrix.com>
References: <1528726404-14924-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m2ge=i5=citrix.com=prvs=6937e3dae=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fSNZk-0000mL-Fz
 for xen-devel@lists.xenproject.org; Mon, 11 Jun 2018 14:13:40 +0000
In-Reply-To: <1528726404-14924-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

b3NzdGVzdCBpcyBnb2luZyB0byB3YW50IHRvIGNhbGwgaXQsIGFuZCBzaG91bGQgbm90IGJlIGV4
cGVjdGVkIHRvCmZpc2ggaXQgb3V0IG9mIHRoZSBidWlsZCB0cmVlLgoKU2lnbmVkLW9mZi1ieTog
SWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQp2MjogTmV3IHBhdGNo
Ci0tLQogdG9vbHMvdGVzdHMvZGVwcml2L01ha2VmaWxlIHwgMTMgKysrKysrKysrKy0tLQogMSBm
aWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvdG9vbHMvdGVzdHMvZGVwcml2L01ha2VmaWxlIGIvdG9vbHMvdGVzdHMvZGVwcml2L01ha2Vm
aWxlCmluZGV4IDY0M2QyYzUuLjExZTA3YjcgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3RzL2RlcHJp
di9NYWtlZmlsZQorKysgYi90b29scy90ZXN0cy9kZXByaXYvTWFrZWZpbGUKQEAgLTIzLDggKzIz
LDkgQEAgTERMSUJTICs9ICQoTERMSUJTX2xpYnhlbmRldmljZW1vZGVsKQogTERMSUJTICs9ICQo
TERMSUJTX2xpYnhlbnRvb2xjb3JlKQogTERMSUJTICs9ICQoTERMSUJTX2xpYnhlbnRvb2xsb2cp
CiAKLVRBUkdFVFMteSA6PSBkZXByaXYtZmQtY2hlY2tlcgotVEFSR0VUUyA6PSAkKFRBUkdFVFMt
eSkKK0lOU1RBTExfUFJJVkJJTi15ICs9IGRlcHJpdi1mZC1jaGVja2VyCitJTlNUQUxMX1BSSVZC
SU4gOj0gJChJTlNUQUxMX1BSSVZCSU4teSkKK1RBUkdFVFMgKz0gJChJTlNUQUxMX1BSSVZCSU4p
CiAKIC5QSE9OWTogYWxsCiBhbGw6IGJ1aWxkCkBAIC0zOSw2ICs0MCwxMiBAQCBjbGVhbjoKIC5Q
SE9OWTogZGlzdGNsZWFuCiBkaXN0Y2xlYW46IGNsZWFuCiAKLWluc3RhbGwgdW5pbnN0YWxsOgor
aW5zdGFsbDogYWxsCisJJChJTlNUQUxMX0RJUikgJChERVNURElSKSQoTElCRVhFQ19CSU4pCisJ
JChJTlNUQUxMX1BST0cpICQoSU5TVEFMTF9QUklWQklOKSAkKERFU1RESVIpJChMSUJFWEVDX0JJ
TikKKworLlBIT05ZOiB1bmluc3RhbGwKK3VuaW5zdGFsbDoKKwlybSAtZiAkKGFkZHByZWZpeCAk
KERFU1RESVIpJChMSUJFWEVDX0JJTikvLCAkKElOU1RBTExfUFJJVkJJTikpCiAKIC1pbmNsdWRl
ICQoREVQU19JTkNMVURFKQotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
