From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/2] xen/arm: Extend the number of memory
 banks supported
Date: Wed, 14 Feb 2018 10:33:54 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1802141033410.5392@sstabellini-ThinkPad-X260>
References: <20180214153045.10558-1-julien.grall@arm.com>
 <20180214153045.10558-2-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180214153045.10558-2-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: andre.przywara@arm.com, mjaggi@caviumnetworks.com, sstabellini@kernel.org, ian.jackson@eu.citrix.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAxNCBGZWIgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFdoZW4gYm9vdGluZyB1
c2luZyBHcnViIG9uIFRodW5kZXItWCwgdGhlIG51bWJlciBvZiBtZW1vcnkgYXZhaWxhYmxlIGlz
Cj4gZ3JlYXRlciB0aGFuIDY0LiBCdW1wIHRoZSBudW1iZXIgdG8gMTI4LCBzbyB3ZSBjYW4gdGFr
ZSBhZHZhbnRhZ2Ugb2YgYWxsCj4gdGhlIG1lbW9yeS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCgo+IC0tLQo+IAo+ICAgICBOb3RlIHRo
YXQgSSB3YXNuJ3QgYWJsZSB0byBib290IHdpdGhvdXQgdGhpcyBwYXRjaCwgYmVjYXVzZSBFRkkg
c3R1Ygo+ICAgICBpcyBwcmludGluZyBhbiBlcnJvciB3aGVuIHRoZSBudW1iZXIgb2YgcmVnaW9u
IGV4Y2VlZCA2NC4gVGhpcyB3aWxsCj4gICAgIHJlc3VsdCB0byBmcmFnbWVudCBpbiBiaXQgbW9y
ZSB0aGUgbWVtb3J5IChzb3VuZHMgbGlrZSBwcmludAo+ICAgICBhbGxvY2F0ZSBtZW1vcnkpIGFu
ZCB3aWxsIGZhaWwgdG8gZ2V0IHRoZSBtZW1vcnkgb24gcmV0cnkuCj4gLS0tCj4gIHhlbi9pbmNs
dWRlL2FzbS1hcm0vc2V0dXAuaCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0v
c2V0dXAuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vc2V0dXAuaAo+IGluZGV4IDdmZjJjMzRkYWIu
LjBjYzMzMzA4MDcgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oCj4g
KysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oCj4gQEAgLTYsNyArNiw3IEBACj4gICNk
ZWZpbmUgTUlOX0ZEVF9BTElHTiA4Cj4gICNkZWZpbmUgTUFYX0ZEVF9TSVpFIFNaXzJNCj4gIAo+
IC0jZGVmaW5lIE5SX01FTV9CQU5LUyA2NAo+ICsjZGVmaW5lIE5SX01FTV9CQU5LUyAxMjgKPiAg
Cj4gICNkZWZpbmUgTUFYX01PRFVMRVMgNSAvKiBDdXJyZW50IG1heGltdW0gdXNlZnVsIG1vZHVs
ZXMgKi8KPiAgCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
