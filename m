From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 09/10] xen: add per-platform defaults for
 NR_CPUS
Date: Mon,  4 Jun 2018 10:24:10 -0700
Message-ID: <1528133051-924-9-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1806041020340.23991@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1806041020340.23991@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com
Cc: artem_mygaiev@epam.com, lars.kurth@citrix.com, sstabellini@kernel.org, andrii_anisov@epam.com, andrew.cooper3@citrix.com, dfaggioli@suse.com, JBeulich@suse.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

QWRkIHNwZWNpZmljIHBlci1wbGF0Zm9ybSBkZWZhdWx0cyBmb3IgTlJfQ1BVUy4gTm90ZSB0aGF0
IHRoZSBvcmRlciBvZgp0aGUgZGVmYXVsdHMgbWF0dGVyOiB0aGV5IG5lZWQgdG8gZ28gZmlyc3Qs
IG90aGVyd2lzZSB0aGUgZ2VuZXJpYwpkZWZhdWx0cyB3aWxsIGJlIGFwcGxpZWQuCgpUaGlzIGlz
IGRvbmUgc28gdGhhdCBYZW4gYnVpbGRzIGN1c3RvbWl6ZWQgZm9yIGEgc3BlY2lmaWMgaGFyZHdh
cmUKcGxhdGZvcm0gY2FuIGhhdmUgdGhlIHJpZ2h0IE5SX0NQVVMgbnVtYmVyLgoKU2lnbmVkLW9m
Zi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDQzogSkJl
dWxpY2hAc3VzZS5jb20KQ0M6IGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20KLS0tCiB4ZW4vYXJj
aC9LY29uZmlnIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvS2NvbmZpZyBiL3hlbi9hcmNoL0tjb25maWcKaW5kZXggY2YwYWNi
Ny4uZWQ4ZjNkOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gvS2NvbmZpZworKysgYi94ZW4vYXJjaC9L
Y29uZmlnCkBAIC0zLDYgKzMsMTAgQEAgY29uZmlnIE5SX0NQVVMKIAlpbnQgIk1heGltdW0gbnVt
YmVyIG9mIHBoeXNpY2FsIENQVXMiCiAJcmFuZ2UgMSA0MDk1CiAJZGVmYXVsdCAiMjU2IiBpZiBY
ODYKKwlkZWZhdWx0ICIxMjgiIGlmIEFSTSAmJiBBTEwKKwlkZWZhdWx0ICI4IiBpZiBBUk0gJiYg
UkNBUjMKKwlkZWZhdWx0ICI0IiBpZiBBUk0gJiYgUUVNVQorCWRlZmF1bHQgIjQiIGlmIEFSTSAm
JiBNUFNPQwogCWRlZmF1bHQgIjEyOCIgaWYgQVJNCiAJLS0taGVscC0tLQogCSAgU3BlY2lmaWVz
IHRoZSBtYXhpbXVtIG51bWJlciBvZiBwaHlzaWNhbCBDUFVzIHdoaWNoIFhlbiB3aWxsIHN1cHBv
cnQuCi0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
