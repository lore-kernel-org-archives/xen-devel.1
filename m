From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: [PATCH 0/2] CPU hotplug fixes for ARM32
Date: Tue,  4 Dec 2018 13:42:23 +0200
Message-ID: <1543923745-29877-1-git-send-email-olekstysh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=es3t=on=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1gU96F-0005jD-6w
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 11:42:47 +0000
Received: by mail-lf1-x143.google.com with SMTP id c16so11690880lfj.8
 for <xen-devel@lists.xenproject.org>; Tue, 04 Dec 2018 03:42:45 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com, sstabellini@kernel.org, mirela.simonovic@aggios.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKSGksIGFsbC4KClRoaXMgaXMgc21hbGwgcGF0Y2ggc2VyaWVzIGZvciBBUk0zMiB3aGljaCBu
ZWVkZWQgdG8gYmUgYWJsZSB0byBicmluZwpzZWNvbmRhcnkgQ1BVcyB1cCBub3Qgb25seSBkdXJp
bmcgdGhlIGluaXRpYWwgYm9vdCwgYnV0IGF0IHJ1bnRpbWUgYWxzby4KRm9yIGV4YW1wbGUsIGR1
cmluZyBDUFUgaG90cGx1Zy4KCkFjdHVhbGx5IHRoZXNlIGFyZSBmb2xsb3ctdXAgcGF0Y2hlcyB0
byB0aGUgZm9sbG93aW5nIHNlcmllcyBbMV0sIHdoaWNoIGNvdmVycyAKZ2VuZXJpYyBBUk0gYW5k
IEFSTTY0IHBhcnRzLiAKClsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVz
L2h0bWwveGVuLWRldmVsLzIwMTgtMDYvbXNnMDAwMzkuaHRtbAoKT2xla3NhbmRyIFR5c2hjaGVu
a28gKDIpOgogIHhlbi9saW5rOiBMaW5rIHByb2NfaW5mb19saXN0IGluIC5kYXRhIGluc3RlYWQg
b2YgLmluaXQuZGF0YQogIHhlbi9hcm0zMjogUmVtb3ZlIF9faW5pdCBwcmVmaXhlcyBmcm9tIGZ1
bmNzIHRoYXQgYXJlIHVzZWQgd2l0aGluIENQVQogICAgdXAgZmxvdwoKIHhlbi9hcmNoL2FybS9h
cm0zMi9zbXBib290LmMgfCAgMiArLQogeGVuL2FyY2gvYXJtL3BsYXRmb3JtLmMgICAgICB8ICAy
ICstCiB4ZW4vYXJjaC9hcm0veGVuLmxkcy5TICAgICAgIHwgMTAgKysrKysrLS0tLQogMyBmaWxl
cyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgotLSAKMi43LjQKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
