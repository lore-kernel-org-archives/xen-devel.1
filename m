From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH v4 09/16] xen/pdx: Introduce helper to convert
	MFN <-> PDX
Date: Wed, 21 Feb 2018 14:02:52 +0000
Message-ID: <20180221140259.29360-10-julien.grall@arm.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyB3aWxsIGF2b2lkIHVzZSBvZiBwZm5fdG9fcGR4KG1mbl94KG1mbikpIG92ZXIgdGhlIGNv
ZGUgYmFzZS4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5j
b20+CgotLS0KCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpD
YzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNs
ZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNj
OiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5j
b20+CgogICAgQ2hhbmdlcyBpbiB2NDoKICAgICAgICAtIFBhdGNoIGFkZGVkCi0tLQogeGVuL2lu
Y2x1ZGUveGVuL3BkeC5oIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vcGR4LmggYi94ZW4vaW5jbHVkZS94ZW4vcGR4
LmgKaW5kZXggNGM1NjY0NWM0Yy4uYTE1MWFhYzFhMiAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUv
eGVuL3BkeC5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9wZHguaApAQCAtMzUsNiArMzUsOSBAQCBz
dGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgcGR4X3RvX3Bmbih1bnNpZ25lZCBsb25nIHBkeCkK
ICAgICAgICAgICAgKChwZHggPDwgcGZuX3BkeF9ob2xlX3NoaWZ0KSAmIHBmbl90b3BfbWFzayk7
CiB9CiAKKyNkZWZpbmUgbWZuX3RvX3BkeChtZm4pIHBmbl90b19wZHgobWZuX3gobWZuKSkKKyNk
ZWZpbmUgcGR4X3RvX21mbihwZHgpIF9tZm4ocGR4X3RvX3BmbihwZHgpKQorCiBleHRlcm4gdm9p
ZCBwZm5fcGR4X2hvbGVfc2V0dXAodW5zaWduZWQgbG9uZyk7CiAKICNlbmRpZiAvKiBIQVNfUERY
ICovCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
