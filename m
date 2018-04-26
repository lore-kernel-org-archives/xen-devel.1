From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
Subject: [PATCH] tools: prepend to PKG_CONFIG_PATH when
 configuring qemu
Date: Thu, 26 Apr 2018 17:41:08 +0000
Message-ID: <311b4c0890ae4eeb823fc72dd3798982@dornerworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

QSB1c2VyIG1heSBjaG9vc2UgdG8gc2V0IGhpcy9oZXIgb3duIFBLR19DT05GSUdfUEFUSCwgd2hp
Y2ggaXMgdXNlZnVsIGluIHRoZQpjYXNlIG9mIGNyb3NzLWNvbXBpbGluZy4gIFdlIGRvbid0IHdh
bnQgdG8gY29tcGxldGVseSBvdmVycmlkZSB0aGUKUEtHX0NPTkZJR19QQVRILCBqdXN0IGFkZCB0
byBpdC4KClNpZ25lZC1vZmYtYnk6IFN0ZXdhcnQgSGlsZGVicmFuZCA8c3Rld2FydC5oaWxkZWJy
YW5kQGRvcm5lcndvcmtzLmNvbT4KLS0tCiB0b29scy9NYWtlZmlsZSB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xz
L01ha2VmaWxlIGIvdG9vbHMvTWFrZWZpbGUKaW5kZXggYWI3YTAxZS4uNjc5NzdhZCAxMDA2NDQK
LS0tIGEvdG9vbHMvTWFrZWZpbGUKKysrIGIvdG9vbHMvTWFrZWZpbGUKQEAgLTIzMiw3ICsyMzIs
NyBAQCBzdWJkaXItYWxsLXFlbXUteGVuLWRpcjogcWVtdS14ZW4tZGlyLWZpbmQKIAllbHNlIFwK
IAkJZW5hYmxlX3RyYWNlX2JhY2tlbmQ9JycgOyBcCiAJZmkgOyBcCi0JUEtHX0NPTkZJR19QQVRI
PSQoWEVOX1JPT1QpL3Rvb2xzL3BrZy1jb25maWcgXAorCVBLR19DT05GSUdfUEFUSD0kKFhFTl9S
T09UKS90b29scy9wa2ctY29uZmlnJCR7UEtHX0NPTkZJR19QQVRIOis6JCR7UEtHX0NPTkZJR19Q
QVRIfX0gXAogCSQkc291cmNlL2NvbmZpZ3VyZSAtLWVuYWJsZS14ZW4gLS10YXJnZXQtbGlzdD1p
Mzg2LXNvZnRtbXUgXAogCQkkKFFFTVVfWEVOX0VOQUJMRV9ERUJVRykgXAogCQkkJGVuYWJsZV90
cmFjZV9iYWNrZW5kIFwKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
