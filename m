From: Alan.Robinson@ts.fujitsu.com (Alan Robinson)
Subject: [PATCH] get_maintainers.pl: Avoid THE_REST when files
	are added or removed
Date: Thu, 22 Feb 2018 10:09:22 +0100
Message-ID: <20180222090922.GA15449@ts.fujitsu.com>
Reply-To: Alan.Robinson@ts.fujitsu.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

V2hlbiBmaWxlcyBhcmUgYWRkZWQgb3IgcmVtb3ZlZCAvZGV2L251bGwgaXMgdXNlZCBhcyBhIHBs
YWNlCmhvbGRlciBuYW1lIGluIHRoZSBwYXRjaCBmb3IgdGhlIGFic2VudCBmaWxlLiAgRG9uJ3Qg
dHJ5IGFuZApmaW5kIGEgTUFJTlRBSU5FUiBmb3IgdGhpcyBwbGFjZSBob2xkZXIsIGl0IG9ubHkg
ZXZlciBmbGFncwphbmQgdGhlbiBzcGFtcyBUSEUgUkVTVC4KClNpZ25lZC1vZmYtYnk6IEFsYW4g
Um9iaW5zb24gPEFsYW4uUm9iaW5zb25AdHMuZnVqaXRzdS5jb20+Ci0tLQoKVGVzdGVkIGJ5IHBy
ZXRlbmRpbmcgdG8gcmVtb3ZlIHhlbi9jb21tb24vY3B1cG9vbC5jIGZvcgp3aGljaCBnZXRfbWFp
bnRhaW5lcnMucGwgY3VycmVudGx5IGZsYWdzIDExIGFkZHJlc3NlcywgYWZ0ZXIKdGhpcyBwYXRj
aCBvbmx5IHhlbi1kZXZlbCBhbmQgaXRzIHR3byBtYWludGFpbmVycyAoSnVlcmdlbiBhbmQKRGFy
aW8pIGdldCBsaXN0ZWQuLi4KCiBzY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIHwgNCArKystCiAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCBiL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwK
aW5kZXggMGNlMmQzNjdmYS4uMjc3YmExN2E2NyAxMDA3NTUKLS0tIGEvc2NyaXB0cy9nZXRfbWFp
bnRhaW5lci5wbAorKysgYi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsCkBAIC00NDcsNyArNDQ3
LDkgQEAgZm9yZWFjaCBteSAkZmlsZSAoQEFSR1YpIHsKIAkJJGZpbGVuYW1lID1+IHNAXlteL10q
L0BAOwogCQkkZmlsZW5hbWUgPX4gc0BcbkBAOwogCQkkbGFzdGZpbGUgPSAkZmlsZW5hbWU7Ci0J
CXB1c2goQGZpbGVzLCAkZmlsZW5hbWUpOworCQlpZiAoJGZpbGVuYW1lIG5lICJkZXYvbnVsbCIp
IHsgI0lnbm9yZSB0aGUgbm8tZmlsZSBwbGFjZWhvbGRlcgorCQkgICAgIHB1c2goQGZpbGVzLCAk
ZmlsZW5hbWUpOworCQl9CiAJCSRwYXRjaF9wcmVmaXggPSAiXlsrLV0uKiI7CSNOb3cgcGFyc2lu
ZyB0aGUgYWN0dWFsIHBhdGNoCiAJICAgIH0gZWxzaWYgKG0vXlxAXEAgLShcZCspLChcZCspLykg
ewogCQlpZiAoJGVtYWlsX2dpdF9ibGFtZSkgewotLSAKMi4xNC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
