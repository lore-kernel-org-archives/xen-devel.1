From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 0/4] automation: QEMU-based smoke test
Date: Mon, 19 Nov 2018 21:30:58 +0000
Message-ID: <20181119213102.8939-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Bhw3=N6=citrix.com=prvs=8540992c9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gOr8N-00070W-Rz
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 21:31:07 +0000
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

U2VlIGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvbGl1dy94ZW4vcGlwZWxp
bmVzLzM3MTczMDA5CgpBIHBpcGVsaW5lIHdoaWxlIEkgd2FzIGRldmVsb3BpbmcgdGhpcyBzZXJp
ZXMuCgpXZWkgTGl1ICg0KToKICBhdXRvbWF0aW9uOiBpbnRyb2R1Y2UgQ09OVEFJTkVSX05PX1BV
TEwgZm9yIGNvbnRhaW5lcml6ZQogIGF1dG9tYXRpb246IHN0YXNoIGRlZmF1bHQgY29uZmlnIGZp
bGUgZm9yIGFydGlmYWN0IGV4dHJhY3Rpb24KICBhdXRvbWF0aW9uOiBhbHNvIHNwZWNpZnkgeGVu
IGJpbmFyeSBhcyBhcnRpZmFjdCBvbiB4ODZfNjQKICBhdXRvbWF0aW9uOiBhZGQgcWVtdSBzbW9r
ZSB0ZXN0CgogLmdpdGxhYi1jaS55bWwgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjIgKysr
KysrKysrKysrKysrKysrKysrLQogYXV0b21hdGlvbi9idWlsZC9SRUFETUUubWQgICAgICAgICAg
ICAgIHwgIDMgKysrCiBhdXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQgICAgICAgICAgICAgICAgfCAg
NyArKysrKysrCiBhdXRvbWF0aW9uL3NjcmlwdHMvY29udGFpbmVyaXplICAgICAgICAgfCAgOCAr
KysrKy0tLQogYXV0b21hdGlvbi9zY3JpcHRzL3FlbXUtc21va2UteDg2LTY0LnNoIHwgMjMgKysr
KysrKysrKysrKysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDc1NSBhdXRvbWF0aW9uL3NjcmlwdHMvcWVt
dS1zbW9rZS14ODYtNjQuc2gKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
