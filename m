From: Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2 3/6] xen/arm: add RCAR2 kconfig
Date: Fri, 24 Aug 2018 12:31:04 -0700
Message-ID: <alpine.DEB.2.10.1808241228450.14449@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1808231631270.14449@sstabellini-ThinkPad-X260>
 <1535067220-16825-3-git-send-email-sstabellini@kernel.org>
 <20b1fbc5-439a-fc10-d878-437c3e8f9d70@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w+85=lh=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1ftHni-000783-4F
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 19:31:18 +0000
In-Reply-To: <20b1fbc5-439a-fc10-d878-437c3e8f9d70@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>
Cc: xen-devel@lists.xenproject.org, iurii.konovalenko@globallogic.com, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, Stefano Stabellini <stefanos@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyNCBBdWcgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDI0
LzA4LzE4IDAwOjMzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBBZGQgYSBrY29uZmln
IG9wdGlvbiBmb3IgUmVuZXNhcyBSY2FyMiBwbGF0Zm9ybXMuCj4gPiAKPiA+IFNpZ25lZC1vZmYt
Ynk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KPiA+IFJldmlld2Vk
LWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+ID4gQ0M6IGl1cmlp
Lmtvbm92YWxlbmtvQGdsb2JhbGxvZ2ljLmNvbQo+ID4gLS0tCj4gPiAgIHhlbi9hcmNoL2FybS9w
bGF0Zm9ybXMvS2NvbmZpZyAgfCAxMSArKysrKysrKysrKwo+ID4gICB4ZW4vYXJjaC9hcm0vcGxh
dGZvcm1zL01ha2VmaWxlIHwgIDIgKy0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
cGxhdGZvcm1zL0tjb25maWcgYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL0tjb25maWcKPiA+IGlu
ZGV4IGE0M2M5MzguLmU1NDgyNWEgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vcGxhdGZv
cm1zL0tjb25maWcKPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvS2NvbmZpZwo+ID4g
QEAgLTUzLDYgKzUzLDEzIEBAIGNvbmZpZyBTVU5YSQo+ID4gICAJRW5hYmxlIGFsbCB0aGUgcmVx
dWlyZWQgZHJpdmVycyBmb3IgQWxsd2lubmRlciBzdW54aSBwbGF0Zm9ybXMsCj4gPiAgIAlpbmNs
dWRpbmcgUGluZTY0LCBPcmFuZ2VQaSwgQ3ViaWVCb2FyZCwgZXRjLgo+ID4gICArY29uZmlnIFJD
QVIyCj4gPiArCWJvb2wgIlJlbmVzYXMgUi1DYXIgR2VuMiIKPiA+ICsJZGVwZW5kcyBvbiBBUk1f
MzIKPiA+ICsJc2VsZWN0IEhBU19TQ0lGCj4gPiArCS0tLWhlbHAtLS0KPiA+ICsJRW5hYmxlIGFs
bCB0aGUgcmVxdWlyZWQgZHJpdmVycyBmb3IgUmVuZXNhcyBSLUNhciBHZW4yLgo+IAo+IFRlY2hu
aWNhbGx5IHRoZSBVQVJUIGlzIG5vdCByZXF1aXJlZC4gQnkgc2VsZWN0aW5nIGl0LCB5b3UgZ2l2
ZSBubyB3YXkgdG8gdGhlCj4gdXNlciB0byByZW1vdmUgaXQuCgpJIGRvbid0IGtub3cgb2YgYSB3
YXkgdG8gc2VsZWN0IHRoZSBVQVJUIGRyaXZlciBieSBkZWZhdWx0LCB3aGljaCBpcyB0aGUKZGVz
aXJlZCBjb25maWd1cmF0aW9uIGZvciB0aGUgbWFqb3JpdHksIHdoaWxlIHN0aWxsIGFsbG93aW5n
IHVzZXJzIHRvCnJlbW92ZSBpdCBpZiB0aGV5IHdhbnQgdG8uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
