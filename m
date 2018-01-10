From: Anthony Liguori <aliguori@amzn.com>
Subject: [PATCH v3 23/24] vixen: use default position for the
	m2p mappings
Date: Tue, 9 Jan 2018 16:02:57 -0800
Message-ID: <1515542578-15412-24-git-send-email-aliguori@amzn.com>
References: <1515542578-15412-1-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=9dv8=ef=amzn.com=prvs=541bb313f=aliguori@srs-us1.protection.inumbo.net>)
 id 1eZ3sH-0006co-79
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 00:04:09 +0000
In-Reply-To: <1515542578-15412-1-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?q?Jan=20H=2E=20Sch=C3=B6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCldoZW4gcnVubmlu
ZyBhIDMyYml0IGtlcm5lbCBhcyBEb20wIG9uIGEgNjRiaXQgaHlwZXJ2aXNvciB0aGUKaHlwZXJ2
aXNvciB3aWxsIHRyeSB0byBzaHJpbmsgdGhlIGh5cGVydmlzb3IgaG9sZSB0byB0aGUgbWluaW11
bQpuZWVkZWQsIGFuZCB0aHVzIHJlcXVpcmVzIHRoZSBEb20wIHRvIHVzZSBYRU5NRU1fbWFjaHBo
eXNfbWFwcGluZyBpbgpvcmRlciB0byBmZXRjaCB0aGUgcG9zaXRpb24gb2YgdGhlIHN0YXJ0IG9m
IHRoZSBoeXBlcnZpc29yIHZpcnR1YWwKbWFwcGluZ3MuCgpEaXNhYmxlIHRoaXMgZmVhdHVyZSB3
aGVuIHJ1bm5pbmcgYXMgYSBQViBzaGltLCBzaW5jZSBzb21lIERvbVUKa2VybmVscyBkb24ndCBp
bXBsZW1lbnRlZCBYRU5NRU1fbWFjaHBoeXNfbWFwcGluZyBhbmQgYnJlYWsgaWYgdGhlIG0ycApk
b2Vzbid0IGJlZ2luIGF0IHRoZSBkZWZhdWx0IGFkZHJlc3MuCgpOQjogc3VwcG9ydCBmb3IgdGhl
IFhFTk1FTV9tYWNocGh5c19tYXBwaW5nIHdhcyBhZGRlZCBpbiBMaW51eCBieQpjb21taXQgN2U3
NzUwLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+ClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgTGlndW9yaSA8YWxpZ3VvcmlAYW1hem9uLmNvbT4K
LS0tCnYxIC0+IHYyCiAtIGFkYXB0ZWQgZm9yIFZpeGVuCi0tLQogeGVuL2FyY2gveDg2L3B2L2Rv
bTBfYnVpbGQuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYyBiL3hl
bi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMKaW5kZXggYTU1NDYyOS4uMmJjNjMzOSAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYworKysgYi94ZW4vYXJjaC94ODYvcHYv
ZG9tMF9idWlsZC5jCkBAIC0zOTgsNyArMzk4LDggQEAgaW50IF9faW5pdCBkb20wX2NvbnN0cnVj
dF9wdihzdHJ1Y3QgZG9tYWluICpkLAogICAgIGlmICggcGFybXMucGFlID09IFhFTl9QQUVfRVhU
Q1IzICkKICAgICAgICAgICAgIHNldF9iaXQoVk1BU1NUX1RZUEVfcGFlX2V4dGVuZGVkX2NyMywg
JmQtPnZtX2Fzc2lzdCk7CiAKLSAgICBpZiAoIChwYXJtcy52aXJ0X2h2X3N0YXJ0X2xvdyAhPSBV
TlNFVF9BRERSKSAmJiBlbGZfMzJiaXQoJmVsZikgKQorICAgIGlmICggIWlzX3ZpeGVuKCkgJiYg
KHBhcm1zLnZpcnRfaHZfc3RhcnRfbG93ICE9IFVOU0VUX0FERFIpICYmCisgICAgICAgICBlbGZf
MzJiaXQoJmVsZikgKQogICAgIHsKICAgICAgICAgdW5zaWduZWQgbG9uZyBtYXNrID0gKDFVTCA8
PCBMMl9QQUdFVEFCTEVfU0hJRlQpIC0gMTsKICAgICAgICAgdmFsdWUgPSAocGFybXMudmlydF9o
dl9zdGFydF9sb3cgKyBtYXNrKSAmIH5tYXNrOwotLSAKMS45LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
