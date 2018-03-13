From: Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH] tools/xl: fix uninitialized variable in
	xl_vdispl
Date: Mon, 12 Mar 2018 23:43:33 -0500
Message-ID: <20180313044333.27923-1-cardoe@cardoe.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Oleksandr Grytsov <oleksandr_grytsov@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGNvZGUgYWRkZWQgaW4gN2E0ODYyMmE3OGEwYjQ1MmU4YWZhNTViODQ0MmM5NThhYmQyMjZh
NyBjb3VsZCB1c2UgcmMKdW5pbml0aWFsaXplZCBpbiBtYWluX3ZkaXNwbGF0dGFjaCgpLgoKU2ln
bmVkLW9mZi1ieTogRG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2UuY29tPgotLS0KQ0M6IE9s
ZWtzYW5kciBHcnl0c292IDxvbGVrc2FuZHJfZ3J5dHNvdkBlcGFtLmNvbT4KLS0tCiB0b29scy94
bC94bF92ZGlzcGwuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3hsL3hsX3ZkaXNwbC5jIGIvdG9vbHMveGwv
eGxfdmRpc3BsLmMKaW5kZXggM2NjOTliNmFlZC4uOGZiYWQ1YmU2OCAxMDA2NDQKLS0tIGEvdG9v
bHMveGwveGxfdmRpc3BsLmMKKysrIGIvdG9vbHMveGwveGxfdmRpc3BsLmMKQEAgLTI1LDcgKzI1
LDcgQEAKIGludCBtYWluX3ZkaXNwbGF0dGFjaChpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiB7CiAg
ICAgaW50IG9wdDsKLSAgICBpbnQgcmM7CisgICAgaW50IHJjID0gRVJST1JfRkFJTDsKICAgICB1
aW50MzJfdCBkb21pZDsKICAgICBsaWJ4bF9kZXZpY2VfdmRpc3BsIHZkaXNwbDsKIAotLSAKMi4x
Ni4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
