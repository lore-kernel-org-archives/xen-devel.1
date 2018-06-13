From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 16/17] dm restrict audit: Run
 ts-depriv-audit-qemu
Date: Wed, 13 Jun 2018 14:04:01 +0100
Message-ID: <1528895042-14113-17-git-send-email-ian.jackson@eu.citrix.com>
References: <1528895042-14113-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9ytt=i7=citrix.com=prvs=695a74e14=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fT5Rm-0005QC-FA
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 13:04:22 +0000
In-Reply-To: <1528895042-14113-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWRkIHRoZSBuZXcgc3RlcHMgdG8gam9icyB3aGVyZSB0aGUgYHJlY2lwZV9kbXJlc3RyaWN0JyBy
dW52YXJzIGlzCnNldCwgYW5kIHNldCB0aGF0IGZsYWcgb24gdGhlIHJlbGV2YW50IGpvYi4KCldl
IGludHJvZHVjZSB0aGUgbmV3IHJlY2lwZS1mbGFnIHByb2MgaW4gc2ctcnVuLWpvYiB0byBtYWtl
IHRoaXMKbW9yZSBjb252ZW5pZW50LgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5K
YWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogbWFrZS1mbGlnaHQgfCAxICsKIHNnLXJ1bi1qb2Ig
IHwgOCArKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9tYWtlLWZsaWdodCBiL21ha2UtZmxpZ2h0CmluZGV4IGViYzkxNTYuLjRlMmQ0NjQgMTAw
NzU1Ci0tLSBhL21ha2UtZmxpZ2h0CisrKyBiL21ha2UtZmxpZ2h0CkBAIC00NTIsNiArNDUyLDcg
QEAgZG9faHZtX2RlYmlhbl90ZXN0cygpIHsKICAgICBpZiAkZG1yZXN0cmljdDsgdGhlbgogICAg
ICAgZG9faHZtX2RlYmlhbl90ZXN0X29uZSBkbXJlc3RyaWN0IHhsIHNlYWJpb3MgZmFsc2UgJycg
LWRtcmVzdHJpY3QgJwogICAgICAgICAgICAgICAgICAgICAgICAgICAgZGViaWFuaHZtX2RtcmVz
dHJpY3Q9dHJ1ZQorICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVjaXBlX2RtcmVzdHJpY3Q9
dHJ1ZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVjaXBlX25vbWlncmF0ZT10cnVlCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAnCiAgICAgZmkKZGlmZiAtLWdpdCBhL3NnLXJ1bi1q
b2IgYi9zZy1ydW4tam9iCmluZGV4IDk2NWU1NWQuLjcxYjViODIgMTAwNzU1Ci0tLSBhL3NnLXJ1
bi1qb2IKKysrIGIvc2ctcnVuLWpvYgpAQCAtNjE3LDYgKzYxNywxNCBAQCBwcm9jIHRlc3QtZ3Vl
c3Qge2d9IHsKICAgICAjIGd1ZXN0IGlzIGV4cGVjdGVkIHRvIGJlIHJ1bm5pbmcsIGFuZCBlbmRz
IHVwIHN0b3BwZWQKICAgICB0ZXN0LWd1ZXN0LW1pZ3IgJGcKICAgICB0ZXN0LWd1ZXN0LW5vbWln
ciAkZworICAgIHRlc3QtZ3Vlc3QtZG1yZXN0cmljdCAkZworfQorCitwcm9jIHRlc3QtZ3Vlc3Qt
ZG1yZXN0cmljdCB7Z30geworICAgICMgZ3Vlc3QgaXMgZXhwZWN0ZWQgdG8gYmUgc3RvcHBlZCwg
YW5kIGlzIGxlZnQgc3RvcHBlZAorICAgIGlmIHshW3JlY2lwZS1mbGFnIGRtcmVzdHJpY3RdfSBy
ZXR1cm4KKyAgICBydW4tdHMgLiA9IHRzLWRlcHJpdi1hdWRpdC1xZW11IGNyZWF0ZSArIGhvc3Qg
JGcKKyAgICBydW4tdHMgLiA9LmF1ZGl0ZWQgdHMtZ3Vlc3Qtc3RvcCArIGhvc3QgJGcKIH0KIAog
cHJvYyB0ZXN0LWd1ZXN0LW5vbWlnciB7Z30gewotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
