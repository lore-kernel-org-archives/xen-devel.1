From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 1/2] xen/pvh: set xen_domain_type to HVM in
 xen_pvh_init
Date: Tue, 23 Apr 2019 11:28:28 +0200
Message-ID: <20190423092829.67915-1-roger.pau__39960.9690344491$1556011823$gmane$org@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hJhn=SZ=citrix.com=prvs=009aac223=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hIrk2-00080B-I1
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 09:29:30 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T3IgZWxzZSB4ZW5fZG9tYWluKCkgcmV0dXJucyBmYWxzZSBkZXNwaXRlIHhlbl9wdmggYmVpbmcg
c2V0LgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+Ci0tLQpDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4K
Q2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwotLS0KIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHZoLmMgfCAxICsKIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9l
bmxpZ2h0ZW5fcHZoLmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2aC5jCmluZGV4IDM1Yjc1
OTlkMmQwYi4uYmJmZmE0MDllMGU4IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVu
X3B2aC5jCisrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHZoLmMKQEAgLTI3LDYgKzI3LDcg
QEAgdm9pZCBfX2luaXQgeGVuX3B2aF9pbml0KHZvaWQpCiAJdTY0IHBmbjsKIAogCXhlbl9wdmgg
PSAxOworCXhlbl9kb21haW5fdHlwZSA9IFhFTl9IVk1fRE9NQUlOOwogCXhlbl9zdGFydF9mbGFn
cyA9IHB2aF9zdGFydF9pbmZvLmZsYWdzOwogCiAJbXNyID0gY3B1aWRfZWJ4KHhlbl9jcHVpZF9i
YXNlKCkgKyAyKTsKLS0gCjIuMTcuMiAoQXBwbGUgR2l0LTExMykKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
