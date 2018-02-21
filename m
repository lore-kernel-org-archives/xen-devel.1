From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 15/17] xen/arm: vpsci: Update the return
 type for MIGRATE_INFO_TYPE
Date: Tue, 20 Feb 2018 16:52:10 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1802201651440.19448@sstabellini-ThinkPad-X260>
References: <20180215150248.28922-1-julien.grall@arm.com>
 <20180215150248.28922-16-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180215150248.28922-16-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: sstabellini@kernel.org, volodymyr_babchuk@epam.com, mirela.simonovic@aggios.com, andre.przywara@linaro.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAxNSBGZWIgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID5Gcm9tIHRoZSBzcGVj
aWZpY2F0aW9uLCB0aGUgUFNDSSBjYWxsIE1JR1JBVEVfSU5GT19UWVBFIHdpbGwgcmV0dXJuIGFu
Cj4gaW50MzJfdC4gVXBkYXRlIHRoZSBmdW5jdGlvbiByZXR1cm4gdHlwZSB0byBtYXRjaCBpdC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+
IENjOiBtaXJlbGEuc2ltb25vdmljQGFnZ2lvcy5jb20KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cgo+IC0tLQo+ICAgICBDaGFuZ2VzIGlu
IHYzOgo+ICAgICAgICAgLSBQYXRjaCBhZGRlZAo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vdnBzY2ku
YyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92cHNjaS5jIGIveGVuL2FyY2gvYXJtL3Zw
c2NpLmMKPiBpbmRleCA3ZWEzZWE1OGUzLi45YTA4MmFhNmVlIDEwMDY0NAo+IC0tLSBhL3hlbi9h
cmNoL2FybS92cHNjaS5jCj4gKysrIGIveGVuL2FyY2gvYXJtL3Zwc2NpLmMKPiBAQCAtMTg2LDcg
KzE4Niw3IEBAIHN0YXRpYyBpbnQzMl90IGRvX3BzY2lfMF8yX2FmZmluaXR5X2luZm8ocmVnaXN0
ZXJfdCB0YXJnZXRfYWZmaW5pdHksCj4gICAgICByZXR1cm4gUFNDSV8wXzJfQUZGSU5JVFlfTEVW
RUxfT0ZGOwo+ICB9Cj4gIAo+IC1zdGF0aWMgdWludDMyX3QgZG9fcHNjaV8wXzJfbWlncmF0ZV9p
bmZvX3R5cGUodm9pZCkKPiArc3RhdGljIGludDMyX3QgZG9fcHNjaV8wXzJfbWlncmF0ZV9pbmZv
X3R5cGUodm9pZCkKPiAgewo+ICAgICAgcmV0dXJuIFBTQ0lfMF8yX1RPU19NUF9PUl9OT1RfUFJF
U0VOVDsKPiAgfQogCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
