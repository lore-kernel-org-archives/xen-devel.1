From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v18 00/13] x86/domctl: Save info for one
 vcpu instance
Date: Fri, 07 Sep 2018 05:48:41 -0600
Message-ID: <5B92659902000078001E658B@prv1-mh.provo.novell.com>
References: <1535980459-5457-1-git-send-email-aisaila@bitdefender.com>
 <5B92497402000078001E6456@prv1-mh.provo.novell.com>
 <aea82a2383fab9e6e8d0f2976d0ff6ec5899c1f8.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <aea82a2383fab9e6e8d0f2976d0ff6ec5899c1f8.camel@bitdefender.com>
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

Pj4+IE9uIDA3LjA5LjE4IGF0IDEzOjE1LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IE9uIEZyaSwgMjAxOC0wOS0wNyBhdCAwMzo0OCAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6
Cj4+ID4gPiA+IE9uIDAzLjA5LjE4IGF0IDE1OjE0LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+
IHdyb3RlOgo+PiA+IAo+PiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHJlc3NlcyB0aGUgaWRlZWEg
b2Ygc2F2aW5nIGRhdGEgZnJvbSBhIHNpbmdsZQo+PiA+IHZjcHUgaW5zdGFuY2UuCj4+ID4gRmly
c3QgaXQgc3RhcnRzIGJ5IGFkZGluZyAqc2F2ZV9vbmUgZnVuY3Rpb25zLCB0aGVuIGl0IGludHJv
ZHVjZXMgYQo+PiA+IGhhbmRsZXIgZm9yIHRoZQo+PiA+IG5ldyBzYXZlX29uZSogZnVuY3MgYW5k
IG1ha2VzIHVzZSBvZiBpdCBpbiB0aGUgaHZtX3NhdmUgYW5kCj4+ID4gaHZtX3NhdmVfb25lIGZ1
bmNzLgo+PiA+IFRoZSBmaW5hbCBwYXRjaGVzIGFyZSB1c2VkIGZvciBjbGVhbiB1cCBhbmQgY2hh
bmdlIHRoZQo+PiA+IGh2bV9zYXZlX29uZSgpIGZ1bmMgd2hpbGUgCj4+ID4gY2hhbmdpbmcgZG9t
YWluX3BhdXNlIHRvIHZjcHVfcGF1c2UuCj4+IAo+PiBDb25zaWRlcmluZyB0aGUgb25nb2luZyBw
cm9ibGVtcyB3aXRoIHRoZSBzZXJpZXMsIHBsZWFzZSBnb2luZwo+PiBmb3J3YXJkIGluZGljYXRl
IGhlcmUgd2hhdCBleGFjdCB0ZXN0aW5nIHlvdSd2ZSBkb25lIHRvIG1ha2UKPj4gc3VyZSB5b3Ug
aW50cm9kdWNlIG5vIHJlZ3Jlc3Npb25zLgo+PiAKPiAKPiBJJ3ZlIHRlc3RlZCB3aXRoIHRvb2xz
L21pc2MveGVuLWh2bWN0eCBmb3IgeGNfZG9tYWluX2h2bV9nZXRjb250ZXh0IAo+IGFuZCB3aXRo
IHRvb2xzL3hlbnRyYWNlL3hlbmN0eCBmb3IgeGNfZG9tYWluX2h2bV9nZXRjb250ZXh0X3BhcnRp
YWwuCj4gCj4gQmVmb3JlIHRoaXMgSSBmaXJzdCBsb29rZWQgYXQgdGhlIHBhcnQgb2YgdGhlIGd1
ZXN0IHN0YXJ0dXAgd2hlbiBpdAo+IGNhbGxzIHhjX2RvbWFpbl9odm1fZ2V0Y29udGV4dCB0byBz
YXZlIGFsbCB0aGUgaW5mby4KPiAKPiBJZiB0aGVyZSBhcmUgbW9yZSB0ZXN0cyB0aGF0IEkgY291
bGQgcnVuIHBsZWFzZSBwcm92aWRlLgoKTWlncmF0aW9uIC8gc2F2ZSAvIHJlc3RvcmUsIGFzIHBv
aW50ZWQgb3V0IGEgbnVtYmVyIG9mIHRpbWVzCmJlZm9yZS4gUGx1cyB5b3Ugb2YgY291cnNlIHJl
YWxpemUgeW91J3JlIGZyZWUgdG8gcHV0IHRvZ2V0aGVyCmV4dHJhIHRlc3RpbmcgY29kZSwganVz
dCB0byBtYWtlIHN1cmUgeW91J3ZlIGxlZnQgbm8gY29ybmVyCmNhc2VzLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
