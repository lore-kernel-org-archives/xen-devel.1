From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] xen: Fix XEN_EXTRAVERSION after c/s 100507b34
 branching for 4.13
Date: Tue, 12 Mar 2019 11:38:03 +0000
Message-ID: <1552390683-31813-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHVwZGF0ZSB0byBSRUFETUUgYW5kIFNVUFBPUlQubWQgd2hlcmUgY29ycmVjdCwgYnV0IFhF
Tl9FWFRSQVZFUlNJT04gaGFkIGFuCmFkZGl0aW9uYWwgLjAgc2xpcCBpbi4KClNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogR2Vv
cmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDQzogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGNpdHJpeC5jb20+CkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5j
b20+CkNDOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkND
OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBUaW0gRGVl
Z2FuIDx0aW1AeGVuLm9yZz4KQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNDOiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHhlbi9NYWtlZmlsZSB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL3hlbi9NYWtlZmlsZSBiL3hlbi9NYWtlZmlsZQppbmRleCAzMzVmMmYwLi4xZmQ4YWQ1
IDEwMDY0NAotLS0gYS94ZW4vTWFrZWZpbGUKKysrIGIveGVuL01ha2VmaWxlCkBAIC0yLDcgKzIs
NyBAQAogIyBBbGwgb3RoZXIgcGxhY2VzIHRoaXMgaXMgc3RvcmVkIChlZy4gY29tcGlsZS5oKSBz
aG91bGQgYmUgYXV0b2dlbmVyYXRlZC4KIGV4cG9ydCBYRU5fVkVSU0lPTiAgICAgICA9IDQKIGV4
cG9ydCBYRU5fU1VCVkVSU0lPTiAgICA9IDEzCi1leHBvcnQgWEVOX0VYVFJBVkVSU0lPTiA/PSAu
MC11bnN0YWJsZSQoWEVOX1ZFTkRPUlZFUlNJT04pCitleHBvcnQgWEVOX0VYVFJBVkVSU0lPTiA/
PSAtdW5zdGFibGUkKFhFTl9WRU5ET1JWRVJTSU9OKQogZXhwb3J0IFhFTl9GVUxMVkVSU0lPTiAg
ID0gJChYRU5fVkVSU0lPTikuJChYRU5fU1VCVkVSU0lPTikkKFhFTl9FWFRSQVZFUlNJT04pCiAt
aW5jbHVkZSB4ZW4tdmVyc2lvbgogCi0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
