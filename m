From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] AMD/IOMMU: revert "amd/iommu: assign iommu
 devices to Xen"
Date: Mon, 03 Jun 2019 07:00:25 -0600
Message-ID: <5CF519E902000078002349FF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hXmZi-0007dI-Q8
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 13:00:30 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyByZXZlcnRzIGNvbW1pdCBiNmJkMDJiN2E4NzdmOWZhYzJkZTY5ZTY0ZDgyNDVkNTZmOTJh
YjI1LiBUaGUgY2hhbmdlCndhcyByZWR1bmRhbnQgd2l0aCBhbWRfaW9tbXVfZGV0ZWN0X29uZV9h
Y3BpKCkgYWxyZWFkeSBjYWxsaW5nCnBjaV9yb19kZXZpY2UoKS4KClNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2FtZC9pb21tdV9pbml0LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lv
bW11X2luaXQuYwpAQCAtMTAyMSw4ICsxMDIxLDYgQEAgc3RhdGljIHZvaWQgKiBfX2luaXQgYWxs
b2NhdGVfcHByX2xvZyhzdAogCiBzdGF0aWMgaW50IF9faW5pdCBhbWRfaW9tbXVfaW5pdF9vbmUo
c3RydWN0IGFtZF9pb21tdSAqaW9tbXUpCiB7Ci0gICAgcGNpX2hpZGVfZGV2aWNlKGlvbW11LT5z
ZWcsIFBDSV9CVVMoaW9tbXUtPmJkZiksIFBDSV9ERVZGTjIoaW9tbXUtPmJkZikpOwotCiAgICAg
aWYgKCBtYXBfaW9tbXVfbW1pb19yZWdpb24oaW9tbXUpICE9IDAgKQogICAgICAgICBnb3RvIGVy
cm9yX291dDsKIAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
