From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] libx86: Fix 32bit stubdom build of
 x86_cpuid_policy_fill_native()
Date: Tue, 13 Nov 2018 05:16:04 -0700
Message-ID: <5BEAC08402000078001FB70F@prv1-mh.provo.novell.com>
References: <1542110355-842-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542110355-842-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjExLjE4IGF0IDEyOjU5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2xpYi94ODYvY3B1aWQuYwo+ICsrKyBiL3hlbi9saWIveDg2L2NwdWlk
LmMKPiBAQCAtNyw4ICs3LDggQEAgdm9pZCB4ODZfY3B1aWRfcG9saWN5X2ZpbGxfbmF0aXZlKHN0
cnVjdCBjcHVpZF9wb2xpY3kgKnApCj4gICAgICB1bnNpZ25lZCBpbnQgaTsKPiAgCj4gICAgICBj
cHVpZF9sZWFmKDAsICZwLT5iYXNpYy5yYXdbMF0pOwo+IC0gICAgZm9yICggaSA9IDE7IGkgPCBt
aW4oQVJSQVlfU0laRShwLT5iYXNpYy5yYXcpLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
cC0+YmFzaWMubWF4X2xlYWYgKyAxdWwpOyArK2kgKQo+ICsgICAgZm9yICggaSA9IDE7IGkgPCBt
aW5fdCh1bnNpZ25lZCBpbnQsIEFSUkFZX1NJWkUocC0+YmFzaWMucmF3KSwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcC0+YmFzaWMubWF4X2xlYWYpOyArK2kgKQoKSSBkaXNsaWtlIHRo
ZSAoaGlkZGVuKSBjYXN0aW5nIHJlc3VsdGluZyBmcm9tIHRoZSB1c2VzIG9mIG1pbl90KCkgLwpt
YXhfdCgpLCBzbyBpbiBhIGNhc2UgbGlrZSB0aGlzIEknZCBoYXZlIHByZWZlcnJlZCB0byByZXBs
YWNlIDF1bApieSBzaXplb2YoY2hhcikgb3Igc29tZSBzdWNoLiBCdXQgSSBleHBlY3QgeW91IHdv
dWxkbid0IGxpa2UgdGhpcywKc28gZWl0aGVyIHdheQpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
