From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 01/10] arm: remove the ARM HDLCD driver
Date: Tue, 22 May 2018 12:55:11 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1805221254590.24793@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1805211743440.4520@sstabellini-ThinkPad-X260>
 <1526950408-18219-1-git-send-email-sstabellini@kernel.org>
 <315e3465-7b1c-6b7e-5061-bd7a1ed69e1f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <315e3465-7b1c-6b7e-5061-bd7a1ed69e1f@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: artem_mygaiev@epam.com, lars.kurth@citrix.com, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, dfaggioli@suse.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyMiBNYXkgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMDUvMjIvMjAxOCAwMTo1MyBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4g
VGhlIEFSTSBIRExDRCBkcml2ZXIgaXMgdW51c2VkLiBUaGUgZGV2aWNlIGl0c2VsZiBjYW4gb25s
eSBiZSBmb3VuZCBvbgo+ID4gVmlydHVhbCBFeHByZXNzIGJvYXJkcyB0aGF0IGFyZSBmb3IgZWFy
bHkgZGV2ZWxvcG1lbnQgb25seS4gUmVtb3ZlIHRoZQo+ID4gZHJpdmVyLgo+ID4gCj4gPiBTdWdn
ZXN0ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gPiAt
LS0KPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAtIHBhdGNoIGFkZGVkCj4gPiAtLS0KPiA+ICAgeGVu
L2FyY2gvYXJtL0tjb25maWcgICAgICAgICAgfCAgIDEgLQo+ID4gICB4ZW4vZHJpdmVycy92aWRl
by9LY29uZmlnICAgICB8ICAgMyAtCj4gPiAgIHhlbi9kcml2ZXJzL3ZpZGVvL01ha2VmaWxlICAg
IHwgICAxIC0KPiA+ICAgeGVuL2RyaXZlcnMvdmlkZW8vYXJtX2hkbGNkLmMgfCAyODEKPiA+IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gICA0IGZpbGVzIGNo
YW5nZWQsIDI4NiBkZWxldGlvbnMoLSkKPiA+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IHhlbi9kcml2
ZXJzL3ZpZGVvL2FybV9oZGxjZC5jCj4gPiAKPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
S2NvbmZpZyBiL3hlbi9hcmNoL2FybS9LY29uZmlnCj4gPiBpbmRleCA4MTc0YzBjLi5jYmQ5ZjFi
IDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL0tjb25maWcKPiA+ICsrKyBiL3hlbi9hcmNo
L2FybS9LY29uZmlnCj4gPiBAQCAtMTcsNyArMTcsNiBAQCBjb25maWcgQVJNXzY0Cj4gPiAgIGNv
bmZpZyBBUk0KPiA+ICAgCWRlZl9ib29sIHkKPiA+ICAgCXNlbGVjdCBIQVNfQUxURVJOQVRJVkUK
PiA+IC0Jc2VsZWN0IEhBU19BUk1fSERMQ0QKPiAKPiBBcyB5b3UgZHJvcCB0aGlzLCB5b3UgbWln
aHQgYWxzbyB3YW50IHRvIHJlbW92ZSAic2VsZWN0IFZJREVPIiBiZWxvdwo+IAo+IFlvdSBwcm9i
YWJseSB3YW50IHRvIHJlbW92ZSAic2VsZWN0IFZJREVPIiBiZWxvdyBhbmQgcmVtb3ZlIHZleHBy
ZXNzX3N5c2NmZwo+IHRoYXQgb25seSBleGlzdHMgZm9yIHZleHByZXNzLgoKR29vZCBzdWdnZXN0
aW9ucywgSSdsbCBtYWtlIHRoZSBjaGFuZ2VzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
