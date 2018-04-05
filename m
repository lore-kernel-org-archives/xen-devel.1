From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [for-4.11][PATCH v7 05/16] xen/arm: mm: Remove
 unused relinquish_shared_pages
Date: Thu, 5 Apr 2018 13:03:05 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1804051302580.6016@sstabellini-ThinkPad-X260>
References: <20180403153251.19595-1-julien.grall@arm.com>
 <20180403153251.19595-6-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180403153251.19595-6-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAzIEFwciAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gcmVsaW5xdWlzaF9zaGFy
ZWRfcGFnZXMgaXMgbmV2ZXIgY2FsbGVkIG9uIEFybS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IFJldmlld2VkLWJ5OiBHZW9yZ2UgRHVu
bGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4gLS0tCj4gCj4gQ2M6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiAKPiAgICAgQ2hhbmdlcyBpbiB2NjoK
PiAgICAgICAgIC0gQWRkIEdlb3JnZSdzIHJldmlld2VkLWJ5Cj4gCj4gICAgIENoYW5nZXMgaW4g
djQ6Cj4gICAgICAgICAtIFBhdGNoIGFkZGVkCj4gLS0tCj4gIHhlbi9pbmNsdWRlL2FzbS1hcm0v
bW0uaCB8IDQgLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9t
bS5oCj4gaW5kZXggY2FiYjFkYWYzMC4uMDliZWM2N2Y2MyAxMDA2NDQKPiAtLS0gYS94ZW4vaW5j
bHVkZS9hc20tYXJtL21tLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgKPiBAQCAt
MzE0LDEwICszMTQsNiBAQCBzdHJ1Y3QgcGFnZV9pbmZvICpnZXRfcGFnZV9mcm9tX2d2YShzdHJ1
Y3QgdmNwdSAqdiwgdmFkZHJfdCB2YSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgbG9uZyBmbGFncyk7Cj4gIAo+ICBzdGF0aWMgaW5saW5lIHZvaWQgcHV0
X2dmbihzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIGdmbikge30KPiAtc3RhdGljIGlu
bGluZSBpbnQgcmVsaW5xdWlzaF9zaGFyZWRfcGFnZXMoc3RydWN0IGRvbWFpbiAqZCkKPiAtewo+
IC0gICAgcmV0dXJuIDA7Cj4gLX0KPiAgCj4gIC8qCj4gICAqIEFybSBkb2VzIG5vdCBoYXZlIGFu
IE0yUCwgYnV0IGNvbW1vbiBjb2RlIGV4cGVjdHMgYSBoYW5kZnVsIG9mCj4gLS0gCj4gMi4xMS4w
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
