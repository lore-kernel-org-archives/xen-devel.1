From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 2/6] osstest: introduce a helper to create a
 weblink to a directory
Date: Wed, 20 Feb 2019 17:59:57 +0100
Message-ID: <20190220170001.32614-3-roger.pau@citrix.com>
References: <20190220170001.32614-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bm+n=Q3=citrix.com=prvs=947007f5f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gwVEv-0004N9-Qg
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 17:00:57 +0000
In-Reply-To: <20190220170001.32614-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0t
LQogT3NzdGVzdC9UZXN0U3VwcG9ydC5wbSB8IDEzICsrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAxMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvT3NzdGVzdC9UZXN0U3VwcG9ydC5w
bSBiL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0KaW5kZXggYzZkYTVlZTkuLjEyNDI3ZDExIDEwMDY0
NAotLS0gYS9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCisrKyBiL09zc3Rlc3QvVGVzdFN1cHBvcnQu
cG0KQEAgLTEyNSw2ICsxMjUsNyBAQCBCRUdJTiB7CiAgICAgICAgICAgICAgICAgICAgICAgdG9v
bHN0YWNrIGd1ZXN0X2NyZWF0ZSBndWVzdF9jcmVhdGVfcGF1c2VkCiAKICAgICAgICAgICAgICAg
ICAgICAgICBhd2FpdF93ZWJzcGFjZV9mZXRjaF9ieWxlYWYgY3JlYXRlX3dlYmZpbGUKKyAgICAg
ICAgICAgICAgICAgICAgICBjcmVhdGVfd2VibGluawogICAgICAgICAgICAgICAgICAgICAgIGZp
bGVfbGlua19jb250ZW50cyBnZXRfdGltZW91dAogICAgICAgICAgICAgICAgICAgICAgIHNldHVw
X25ldGJvb3RfZGkgc2V0dXBfbmV0Ym9vdF9sb2NhbCBob3N0X25ldGJvb3RfZmlsZQogICAgICAg
ICAgICAgICAgICAgICAgIHN1YnN0X25ldGJvb3RfdGVtcGxhdGUgc2V0dXBfbmV0Ym9vdF9tZW1k
aXNrCkBAIC0yNzM5LDYgKzI3NDAsMTggQEAgc3ViIGNyZWF0ZV93ZWJmaWxlICgkJCQpIHsKICAg
ICByZXR1cm4gJHdmX3VybDsKIH0KIAorc3ViIGNyZWF0ZV93ZWJsaW5rICgkJCQpIHsKKyAgICBt
eSAoJGhvLCAkdGFpbCwgJHRhcmdldCkgPSBAXzsKKyAgICBteSAkd2ZfcmhzPSBob3N0bmFtZXBh
dGgoJGhvKS4iXyIuJHRhaWw7CisgICAgbXkgJHdmX2NvbW1vbj0gJGN7V2Vic3BhY2VDb21tb259
LiR3Zl9yaHM7CisgICAgbXkgJHdmX3VybD0gJGN7V2Vic3BhY2VVcmx9LiR3Zl9jb21tb247Cisg
ICAgbXkgJHdmX2ZpbGU9ICRje1dlYnNwYWNlRmlsZX0uJHdmX2NvbW1vbjsKKworICAgIHVubGlu
ayAkd2ZfZmlsZTsKKyAgICBzeW1saW5rICR0YXJnZXQsICR3Zl9maWxlIG9yIGRpZSAiJHdmX2Zp
bGUgJCEiOworICAgIHJldHVybiAkd2ZfdXJsOworfQorCiAjLS0tLS0tLS0tLSBuZXRib290IGhh
bmRsaW5nIC0tLS0tLS0tLS0KIAogc3ViIGZpbGVfbGlua19jb250ZW50cyAoJCQkKSB7Ci0tIAoy
LjE3LjIgKEFwcGxlIEdpdC0xMTMpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
