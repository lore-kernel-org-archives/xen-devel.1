From: julien.grall@arm.com
Subject: [PATCH v5 09/16] xen/pdx: Introduce helper to convert
	MFN <-> PDX
Date: Wed, 14 Mar 2018 18:20:02 +0000
Message-ID: <20180314182009.14274-10-julien.grall@arm.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180314182009.14274-1-julien.grall@arm.com>
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

RnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClRoaXMgd2lsbCBhdm9p
ZCB1c2Ugb2YgcGZuX3RvX3BkeChtZm5feChtZm4pKSBvdmVyIHRoZSBjb2RlIGJhc2UuCgpTaWdu
ZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpSZXZpZXdlZC1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCi0tLQoKQ2M6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVu
bGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEtvbnJhZCBSemVz
enV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpD
YzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCiAgICBDaGFuZ2VzIGluIHY1OgogICAg
ICAgIC0gQWRkIFdlaSdzIHJldmlld2VkLWJ5CgogICAgQ2hhbmdlcyBpbiB2NDoKICAgICAgICAt
IFBhdGNoIGFkZGVkCi0tLQogeGVuL2luY2x1ZGUveGVuL3BkeC5oIHwgMyArKysKIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vcGR4
LmggYi94ZW4vaW5jbHVkZS94ZW4vcGR4LmgKaW5kZXggNGM1NjY0NWM0Yy4uYTE1MWFhYzFhMiAx
MDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3BkeC5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9w
ZHguaApAQCAtMzUsNiArMzUsOSBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgcGR4X3Rv
X3Bmbih1bnNpZ25lZCBsb25nIHBkeCkKICAgICAgICAgICAgKChwZHggPDwgcGZuX3BkeF9ob2xl
X3NoaWZ0KSAmIHBmbl90b3BfbWFzayk7CiB9CiAKKyNkZWZpbmUgbWZuX3RvX3BkeChtZm4pIHBm
bl90b19wZHgobWZuX3gobWZuKSkKKyNkZWZpbmUgcGR4X3RvX21mbihwZHgpIF9tZm4ocGR4X3Rv
X3BmbihwZHgpKQorCiBleHRlcm4gdm9pZCBwZm5fcGR4X2hvbGVfc2V0dXAodW5zaWduZWQgbG9u
Zyk7CiAKICNlbmRpZiAvKiBIQVNfUERYICovCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
