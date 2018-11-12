From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: [PATCH 08/18] xen/arm: Disable/enable non-boot physical
 CPUs on suspend/resume
Date: Mon, 12 Nov 2018 12:30:34 +0100
Message-ID: <1542022244-22977-9-git-send-email-mirela.simonovic@aggios.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xmwf=nx=aggios.com=mirela.simonovic@srs-us1.protection.inumbo.net>)
 id 1gMAR3-0005LE-ID
 for xen-devel@lists.xenproject.org; Mon, 12 Nov 2018 11:31:17 +0000
Received: by mail-wr1-x444.google.com with SMTP id o15-v6so8910932wrv.4
 for <xen-devel@lists.xenproject.org>; Mon, 12 Nov 2018 03:31:16 -0800 (PST)
In-Reply-To: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, dm@aggios.com, saeed.nowshadi@xilinx.com, Julien Grall <julien.grall@arm.com>, stefano.stabellini@xilinx.com, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

Tm9uLWJvb3QgQ1BVcyBoYXZlIHRvIGJlIGRpc2FibGVkIG9uIHN1c3BlbmQgYW5kIGVuYWJsZWQg
b24gcmVzdW1lCihob3RwbHVnLWJhc2VkIG1lY2hhbmlzbSkuIERpc2FibGluZyBub24tYm9vdCBD
UFVzIHdpbGwgbGVhZCB0byBQU0NJCkNQVV9PRkYgdG8gYmUgY2FsbGVkIGJ5IGVhY2ggbm9uLWJv
b3QgQ1BVLiBEZXBlbmRpbmcgb24gdGhlIHVuZGVybHlpbmcKcGxhdGZvcm0gY2FwYWJpbGl0aWVz
LCB0aGlzIG1heSBsZWFkIHRvIHRoZSBwaHlzaWNhbCBwb3dlcmluZyBkb3duIG9mCkNQVXMuIFRl
c3RlZCBvbiBYaWxpbnggWnlucSBVbHRyYXNjYWxlKyBNUFNvQyAoaW5jbHVkaW5nIHBvd2VyIGRv
d24gb2YKZWFjaCBub24tYm9vdCBDUFUpLgoKU2lnbmVkLW9mZi1ieTogTWlyZWxhIFNpbW9ub3Zp
YyA8bWlyZWxhLnNpbW9ub3ZpY0BhZ2dpb3MuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYWVlZCBOb3dz
aGFkaSA8c2FlZWQubm93c2hhZGlAeGlsaW54LmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0vc3VzcGVu
ZC5jIHwgMTUgKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9zdXNwZW5kLmMgYi94
ZW4vYXJjaC9hcm0vc3VzcGVuZC5jCmluZGV4IDU3NWFmZDVlYjguLmRhZTFiMWY3ZDYgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL2FybS9zdXNwZW5kLmMKKysrIGIveGVuL2FyY2gvYXJtL3N1c3BlbmQu
YwpAQCAtMSw0ICsxLDUgQEAKICNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4KKyNpbmNsdWRlIDx4ZW4v
Y3B1Lmg+CiAjaW5jbHVkZSA8YXNtL2NwdWZlYXR1cmUuaD4KICNpbmNsdWRlIDxhc20vZXZlbnQu
aD4KICNpbmNsdWRlIDxhc20vcHNjaS5oPgpAQCAtMTE1LDE3ICsxMTYsMjkgQEAgc3RhdGljIHZv
aWQgdmNwdV9zdXNwZW5kKHJlZ2lzdGVyX3QgZXBvaW50LCByZWdpc3Rlcl90IGNpZCkKIC8qIFhl
biBzdXNwZW5kLiBOb3RlOiBkYXRhIGlzIG5vdCB1c2VkIChzdXNwZW5kIGlzIHRoZSBzdXNwZW5k
IHRvIFJBTSkgKi8KIHN0YXRpYyBsb25nIHN5c3RlbV9zdXNwZW5kKHZvaWQgKmRhdGEpCiB7Cisg
ICAgaW50IHN0YXR1czsKKwogICAgIEJVR19PTihzeXN0ZW1fc3RhdGUgIT0gU1lTX1NUQVRFX2Fj
dGl2ZSk7CiAKICAgICBzeXN0ZW1fc3RhdGUgPSBTWVNfU1RBVEVfc3VzcGVuZDsKICAgICBmcmVl
emVfZG9tYWlucygpOwogCisgICAgc3RhdHVzID0gZGlzYWJsZV9ub25ib290X2NwdXMoKTsKKyAg
ICBpZiAoIHN0YXR1cyApCisgICAgeworICAgICAgICBzeXN0ZW1fc3RhdGUgPSBTWVNfU1RBVEVf
cmVzdW1lOworICAgICAgICBnb3RvIHJlc3VtZV9ub25ib290X2NwdXM7CisgICAgfQorCiAgICAg
c3lzdGVtX3N0YXRlID0gU1lTX1NUQVRFX3Jlc3VtZTsKIAorcmVzdW1lX25vbmJvb3RfY3B1czoK
KyAgICBlbmFibGVfbm9uYm9vdF9jcHVzKCk7CiAgICAgdGhhd19kb21haW5zKCk7CiAgICAgc3lz
dGVtX3N0YXRlID0gU1lTX1NUQVRFX2FjdGl2ZTsKKyAgICBkc2Ioc3kpOwogCi0gICAgcmV0dXJu
IC1FTk9TWVM7CisgICAgcmV0dXJuIHN0YXR1czsKIH0KIAogaW50MzJfdCBkb21haW5fc3VzcGVu
ZChyZWdpc3Rlcl90IGVwb2ludCwgcmVnaXN0ZXJfdCBjaWQpCi0tIAoyLjEzLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
