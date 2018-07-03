From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9 03/11] x86/hvm: Introduce
 hvm_save_cpu_ctxt_one func
Date: Tue, 03 Jul 2018 06:17:29 -0600
Message-ID: <5B3B695902000078001D04B1@prv1-mh.provo.novell.com>
References: <1530177936-28379-1-git-send-email-aisaila@bitdefender.com>
 <1530177936-28379-4-git-send-email-aisaila@bitdefender.com>
 <5B3657AD02000078001CF49B@prv1-mh.provo.novell.com>
 <1530619570.8880.34.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1530619570.8880.34.camel@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA3LjE4IGF0IDE0OjA1LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IE9uIFZpLCAyMDE4LTA2LTI5IGF0IDEwOjAwIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4gPiA+ID4gT24gMjguMDYuMTggYXQgMTE6MjUsIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4g
d3JvdGU6Cj4+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3VwcG9ydC5oCj4+ID4g
KysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3VwcG9ydC5oCj4+ID4gQEAgLTUyLDYgKzUy
LDggQEAgZXh0ZXJuIHVuc2lnbmVkIGludCBvcHRfaHZtX2RlYnVnX2xldmVsOwo+PiA+ICAjZGVm
aW5lIEhWTV9EQkdfTE9HKGxldmVsLCBfZiwgX2EuLi4pIGRvIHt9IHdoaWxlICgwKQo+PiA+ICAj
ZW5kaWYKPj4gPgo+PiA+ICsjZGVmaW5lIENPTlRJTlVFIDIKPj4gVGhpcyBpcyB3YXkgdG9vIGdl
bmVyaWMgYW4gaWRlbnRpZmllciBuYW1lLiBBbmQgaXQncyBub3QgaGVscGZ1bCBhdAo+PiBhbGwg
d2l0aG91dCBvdGhlciBwb3NzaWJsZSB2YWx1ZXMgYWxzbyBlbnVtZXJhdGVkLiBBbmQgcGxlYXNl
Cj4+IHRha2UgImVudW1lcmF0ZWQiIGFzIGEgaGludCAuLi4gT3RvaCwgbG9va2luZyBhdCBpdHMg
dXNlIC0gdGhpcyBpcwo+PiBhbiBhZ3JlZW1lbnQgYmV0d2VlbiBodm1fc2F2ZV9jcHVfY3R4dCgp
IGFuZAo+PiBodm1fc2F2ZV9jcHVfY3R4dF9vbmUoKSBvbmx5LiBXaHkgZG9lcyBzdWNoIG5lZWQg
YSBnbG9iYWxseQo+PiB2aXNpYmxlICNkZWZpbmU/Cj4+Cj4gCj4gSW4gdGhlIGZpcnN0IHBhdGNo
ZXMoaW50cm9kdWNlKikgaXQgaXMgdXNlZCBvbmx5IGJldHdlZW4gc2F2ZSooKSBhbmQKPiBzYXZl
X29uZSooKSBmdW5jcyBidXQgbGF0ZXIgaW4gcGF0Y2ggOSBpdCBpcyB1c2VkIGluIGh2bV9zYXZl
KCkgc28gaXQKPiBoYXMgdG8gYmUgdmlzaWJsZSBmcm9tIGJvdGggcGxhY2VzLiBJIGNhbiBtb3Zl
IHRoZSBlbnVtKGZvciB0aGUgcmV0dXJuCj4gdmFsdWVzKSBkZWNsYXJhdGlvbiB0byBzYXZlLmgg
aWYgdGhhdCBpcyBhIGdvb2QgcGxhY2UgZm9yIGl0LgoKWWVzLCB0aGlzIHdvdWxkIGJlIG1vcmUg
c3VpdGFibGUgYSBwbGFjZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
