From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH v4 05/16] xen/arm: mm: Remove unused
	relinquish_shared_pages
Date: Wed, 21 Feb 2018 14:02:48 +0000
Message-ID: <20180221140259.29360-6-julien.grall@arm.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180221140259.29360-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

cmVsaW5xdWlzaF9zaGFyZWRfcGFnZXMgaXMgbmV2ZXIgY2FsbGVkIG9uIEFybS4KClNpZ25lZC1v
ZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgotLS0KCkNjOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgogICAgQ2hhbmdlcyBpbiB2
NDoKICAgICAgICAtIFBhdGNoIGFkZGVkCi0tLQogeGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oIHwg
NCAtLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9hc20tYXJtL21tLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgKaW5kZXggYzAz
ZjRhZDY3NC4uNzY3OGUyOWMxNSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5o
CisrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaApAQCAtMzIxLDEwICszMjEsNiBAQCBzdHJ1
Y3QgcGFnZV9pbmZvICpnZXRfcGFnZV9mcm9tX2d2YShzdHJ1Y3QgdmNwdSAqdiwgdmFkZHJfdCB2
YSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxh
Z3MpOwogCiBzdGF0aWMgaW5saW5lIHZvaWQgcHV0X2dmbihzdHJ1Y3QgZG9tYWluICpkLCB1bnNp
Z25lZCBsb25nIGdmbikge30KLXN0YXRpYyBpbmxpbmUgaW50IHJlbGlucXVpc2hfc2hhcmVkX3Bh
Z2VzKHN0cnVjdCBkb21haW4gKmQpCi17Ci0gICAgcmV0dXJuIDA7Ci19CiAKICNkZWZpbmUgSU5W
QUxJRF9NMlBfRU5UUlkgICAgICAgICh+MFVMKQogI2RlZmluZSBTSEFSRURfTTJQX0VOVFJZICAg
ICAgICAgKH4wVUwgLSAxVUwpCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
