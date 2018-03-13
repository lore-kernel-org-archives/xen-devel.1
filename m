From: Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2] tools/xl: fix uninitialized variable in
	xl_vdispl
Date: Tue, 13 Mar 2018 11:25:29 -0500
Message-ID: <20180313162529.9660-1-cardoe@cardoe.com>
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
To: xen-devel@lists.xen.org
Cc: Oleksandr Grytsov <oleksandr_grytsov@epam.com>, Doug Goldstein <cardoe@cardoe.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGNvZGUgYWRkZWQgaW4gN2E0ODYyMmE3OGEwYjQ1MmU4YWZhNTViODQ0MmM5NThhYmQyMjZh
NyBjb3VsZCB1c2UgcmMKdW5pbml0aWFsaXplZCBpbiBtYWluX3ZkaXNwbGF0dGFjaCgpLgoKU2ln
bmVkLW9mZi1ieTogRG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2UuY29tPgotLS0KQ0M6IE9s
ZWtzYW5kciBHcnl0c292IDxvbGVrc2FuZHJfZ3J5dHNvdkBlcGFtLmNvbT4KLS0tCiB0b29scy94
bC94bF92ZGlzcGwuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZm
IC0tZ2l0IGEvdG9vbHMveGwveGxfdmRpc3BsLmMgYi90b29scy94bC94bF92ZGlzcGwuYwppbmRl
eCAzY2M5OWI2YWVkLi5lNGVkNTcyYTBiIDEwMDY0NAotLS0gYS90b29scy94bC94bF92ZGlzcGwu
YworKysgYi90b29scy94bC94bF92ZGlzcGwuYwpAQCAtNTAsNiArNTAsNyBAQCBpbnQgbWFpbl92
ZGlzcGxhdHRhY2goaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogICAgICAgICBjaGFyICpqc29uID0g
bGlieGxfZGV2aWNlX3ZkaXNwbF90b19qc29uKGN0eCwgJnZkaXNwbCk7CiAgICAgICAgIHByaW50
ZigidmRpc3BsOiAlc1xuIiwganNvbik7CiAgICAgICAgIGZyZWUoanNvbik7CisgICAgICAgIHJj
ID0gMDsKICAgICAgICAgZ290byBvdXQ7CiAgICAgfQogCi0tIAoyLjE2LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
