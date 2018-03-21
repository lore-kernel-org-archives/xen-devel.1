From: Julien Grall <julien.grall@arm.com>
Subject: [for-4.11][PATCH v6 09/16] xen/pdx: Introduce helper to
 convert MFN <-> PDX
Date: Wed, 21 Mar 2018 04:47:30 +0000
Message-ID: <20180321044737.20794-10-julien.grall@arm.com>
References: <20180321044737.20794-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180321044737.20794-1-julien.grall@arm.com>
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
b20+ClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpBY2tlZC1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCi0tLQoKQ2M6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxH
ZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEtv
bnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4
ZW4ub3JnPgpDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCiAgICBDaGFuZ2VzIGlu
IHY2OgogICAgICAgIC0gQWRkIEFuZHJldydzIGFja2VkLWJ5CgogICAgQ2hhbmdlcyBpbiB2NToK
ICAgICAgICAtIEFkZCBXZWkncyByZXZpZXdlZC1ieQoKICAgIENoYW5nZXMgaW4gdjQ6CiAgICAg
ICAgLSBQYXRjaCBhZGRlZAotLS0KIHhlbi9pbmNsdWRlL3hlbi9wZHguaCB8IDMgKysrCiAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVu
L3BkeC5oIGIveGVuL2luY2x1ZGUveGVuL3BkeC5oCmluZGV4IDRjNTY2NDVjNGMuLmExNTFhYWMx
YTIgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wZHguaAorKysgYi94ZW4vaW5jbHVkZS94
ZW4vcGR4LmgKQEAgLTM1LDYgKzM1LDkgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIHBk
eF90b19wZm4odW5zaWduZWQgbG9uZyBwZHgpCiAgICAgICAgICAgICgocGR4IDw8IHBmbl9wZHhf
aG9sZV9zaGlmdCkgJiBwZm5fdG9wX21hc2spOwogfQogCisjZGVmaW5lIG1mbl90b19wZHgobWZu
KSBwZm5fdG9fcGR4KG1mbl94KG1mbikpCisjZGVmaW5lIHBkeF90b19tZm4ocGR4KSBfbWZuKHBk
eF90b19wZm4ocGR4KSkKKwogZXh0ZXJuIHZvaWQgcGZuX3BkeF9ob2xlX3NldHVwKHVuc2lnbmVk
IGxvbmcpOwogCiAjZW5kaWYgLyogSEFTX1BEWCAqLwotLSAKMi4xMS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
