From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 09/12] xen: add per-platform defaults for
 NR_CPUS
Date: Fri,  6 Jul 2018 16:14:00 -0700
Message-ID: <1530918843-14318-9-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1807061537300.13502@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1807061537300.13502@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com
Cc: sstabellini@kernel.org, andrii_anisov@epam.com, andrew.cooper3@citrix.com, George.Dunlap@citrix.com, dfaggioli@suse.com, JBeulich@suse.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

QWRkIHNwZWNpZmljIHBlci1wbGF0Zm9ybSBkZWZhdWx0cyBmb3IgTlJfQ1BVUy4gTm90ZSB0aGF0
IHRoZSBvcmRlciBvZgp0aGUgZGVmYXVsdHMgbWF0dGVyOiB0aGV5IG5lZWQgdG8gZ28gZmlyc3Qs
IG90aGVyd2lzZSB0aGUgZ2VuZXJpYwpkZWZhdWx0cyB3aWxsIGJlIGFwcGxpZWQuCgpUaGlzIGlz
IGRvbmUgc28gdGhhdCBYZW4gYnVpbGRzIGN1c3RvbWl6ZWQgZm9yIGEgc3BlY2lmaWMgaGFyZHdh
cmUKcGxhdGZvcm0gY2FuIGhhdmUgdGhlIHJpZ2h0IE5SX0NQVVMgbnVtYmVyLgoKU2lnbmVkLW9m
Zi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpBY2tlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDQzogSkJldWxpY2hAc3VzZS5jb20K
Q0M6IGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20KCi0tLQoKQ2hhbmdlcyBpbiB2NjoKLSByZW1v
dmUgdXNlbGVzcyBhZGRpdGlvbmFsIGRlZmF1bHQgZm9yIEFMTAotLS0KIHhlbi9hcmNoL0tjb25m
aWcgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL0tjb25maWcgYi94ZW4vYXJjaC9LY29uZmlnCmluZGV4IGNmMGFjYjcuLjE5NTRk
MWMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL0tjb25maWcKKysrIGIveGVuL2FyY2gvS2NvbmZpZwpA
QCAtMyw2ICszLDkgQEAgY29uZmlnIE5SX0NQVVMKIAlpbnQgIk1heGltdW0gbnVtYmVyIG9mIHBo
eXNpY2FsIENQVXMiCiAJcmFuZ2UgMSA0MDk1CiAJZGVmYXVsdCAiMjU2IiBpZiBYODYKKwlkZWZh
dWx0ICI4IiBpZiBBUk0gJiYgUkNBUjMKKwlkZWZhdWx0ICI0IiBpZiBBUk0gJiYgUUVNVQorCWRl
ZmF1bHQgIjQiIGlmIEFSTSAmJiBNUFNPQwogCWRlZmF1bHQgIjEyOCIgaWYgQVJNCiAJLS0taGVs
cC0tLQogCSAgU3BlY2lmaWVzIHRoZSBtYXhpbXVtIG51bWJlciBvZiBwaHlzaWNhbCBDUFVzIHdo
aWNoIFhlbiB3aWxsIHN1cHBvcnQuCi0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
