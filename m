From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] x86/pvh: clarify Dom0 PVH build error message
Date: Tue, 10 Jul 2018 10:04:45 +0200
Message-ID: <20180710080445.63737-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vod0=j2=citrix.com=prvs=722e3bda8=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fcndk-0008Rz-65
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 08:04:52 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QXZvaWQgaGF2aW5nIGVycm9yIG1lc3NhZ2VzIHdpdGggdGhlIHNhbWUgdGV4dC4gTm8gZnVuY3Rp
b25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KLS0tCkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4
Ni9odm0vZG9tMF9idWlsZC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxk
LmMgYi94ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYwppbmRleCBlMmI1ZDQ4ZTAzLi45YTgz
M2ZhNGI5IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYworKysgYi94
ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYwpAQCAtMTA1OCw3ICsxMDU4LDcgQEAgc3RhdGlj
IGludCBfX2luaXQgcHZoX3NldHVwX2FjcGkoc3RydWN0IGRvbWFpbiAqZCwgcGFkZHJfdCBzdGFy
dF9pbmZvKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkLT52Y3B1WzBdKTsKICAg
ICBpZiAoIHJjICkKICAgICB7Ci0gICAgICAgIHByaW50aygiVW5hYmxlIHRvIGNvcHkgUlNEUCBp
bnRvIGd1ZXN0IG1lbW9yeVxuIik7CisgICAgICAgIHByaW50aygiVW5hYmxlIHRvIGNvcHkgUlNE
UCBhZGRyZXNzIHRvIHN0YXJ0IGluZm9cbiIpOwogICAgICAgICByZXR1cm4gcmM7CiAgICAgfQog
Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
