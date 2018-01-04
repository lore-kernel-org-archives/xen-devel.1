From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC v1 50/74] xen/pvshim: remove Dom0 kernel
	support check
Date: Thu, 4 Jan 2018 13:06:01 +0000
Message-ID: <20180104130625.28605-51-wei.liu2@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/p+y=d7=citrix.com=prvs=535dfbe76=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eX5Zr-0004J1-Vb
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2018 13:28:59 +0000
In-Reply-To: <20180104130625.28605-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNo
L3g4Ni9wdi9kb20wX2J1aWxkLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1
aWxkLmMgYi94ZW4vYXJjaC94ODYvcHYvZG9tMF9idWlsZC5jCmluZGV4IDIzZDU5OTNiN2UuLjk1
MzQ3YzZmZDIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMKKysrIGIv
eGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYwpAQCAtMTksNiArMTksNyBAQAogI2luY2x1ZGUg
PGFzbS9kb20wX2J1aWxkLmg+CiAjaW5jbHVkZSA8YXNtL3BhZ2UuaD4KICNpbmNsdWRlIDxhc20v
cHYvbW0uaD4KKyNpbmNsdWRlIDxhc20vcHYvc2hpbS5oPgogI2luY2x1ZGUgPGFzbS9zZXR1cC5o
PgogCiAvKiBBbGxvdyByaW5nLTMgYWNjZXNzIGluIGxvbmcgbW9kZSBhcyBndWVzdCBjYW5ub3Qg
dXNlIHJpbmcgMSAuLi4gKi8KQEAgLTM3Myw3ICszNzQsNyBAQCBpbnQgX19pbml0IGRvbTBfY29u
c3RydWN0X3B2KHN0cnVjdCBkb21haW4gKmQsCiAKICAgICBpZiAoIHBhcm1zLmVsZl9ub3Rlc1tY
RU5fRUxGTk9URV9TVVBQT1JURURfRkVBVFVSRVNdLnR5cGUgIT0gWEVOX0VOVF9OT05FICkKICAg
ICB7Ci0gICAgICAgIGlmICggIXRlc3RfYml0KFhFTkZFQVRfZG9tMCwgcGFybXMuZl9zdXBwb3J0
ZWQpICkKKyAgICAgICAgaWYgKCAhcHZfc2hpbSAmJiAhdGVzdF9iaXQoWEVORkVBVF9kb20wLCBw
YXJtcy5mX3N1cHBvcnRlZCkgKQogICAgICAgICB7CiAgICAgICAgICAgICBwcmludGsoIktlcm5l
bCBkb2VzIG5vdCBzdXBwb3J0IERvbTAgb3BlcmF0aW9uXG4iKTsKICAgICAgICAgICAgIHJjID0g
LUVJTlZBTDsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
