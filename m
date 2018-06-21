From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v7 08/15] x86/cpu: Remove loop form
 vmce_save_vcpu_ctxt() func
Date: Thu, 21 Jun 2018 02:15:41 -0600
Message-ID: <5B2B5EAD02000078001CC9AD@prv1-mh.provo.novell.com>
References: <1528383573-21522-1-git-send-email-aisaila@bitdefender.com>
 <1528383573-21522-9-git-send-email-aisaila@bitdefender.com>
 <d459cb16ab834f15907b75b4266a22b8@AMSPEX02CL03.citrite.net>
 <1528447880.25123.36.camel@bitdefender.com>
 <d273805464a3476d9bebbf254cbc4124@AMSPEX02CL03.citrite.net>
 <5B1A95D702000078001C9878@prv1-mh.provo.novell.com>
 <1529484960.4608.16.camel@bitdefender.com>
 <5B2B561902000078001CC95C@prv1-mh.provo.novell.com>
 <1529567253.4608.19.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1529567253.4608.19.camel@bitdefender.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian.Jackson@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjA2LjE4IGF0IDA5OjQ3LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IE9uIEpvLCAyMDE4LTA2LTIxIGF0IDAxOjM5IC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4gPgo+PiA+ID4KPj4gPiA+ID4KPj4gPiA+ID4gT24gMjAuMDYuMTggYXQgMTA6NTYsIDxhaXNh
aWxhQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+ID4gU28gdGhlIGZpbmFsIHBsYW4gZm9yIHRo
ZSBzZXJpZXMgaXMgbGlrZSB0aGlzOgo+PiA+IC0gQmFzZSBldmVyeXRoaW5nIG9uIFJvZ2VyJ3Mg
c2VyaWVzCj4+ID4gLSBLZWVwIHBhdGNoZXMgMS03Cj4+ID4gLSBIYXZlIHBhdGNoIDggYWRkIGFu
IGV4dHJhIGFyZyB0byBIVk1fUkVHSVNURVJfU0FWRV9SRVNUT1JFCj4+ID4gYW5kIGh2bV9zcl9o
YW5kbGVycwo+PiA+IC0gSGF2ZSBwYXRjaCA5IGxpa2UgdGhlIHBhdGNoIDE1IGZvcm0gbm93IGFu
ZCBoYXZlIGl0IGNhbGwgdGhlCj4+ID4gc2F2ZV9vbmUgaGFuZGxlcnMKPj4gPiAtIEhhdmUgdGhl
IG5leHQgcGF0Y2hlcyByZW1vdmUgdGhlIHJlZHVuZGFudCBzYXZlIGhhbmRsZXJzIGFuZAo+PiA+
IHJlbmFtZSB0aGUgc2F2ZSBvbmUKPj4gPiAtIFRoZSBmaW5hbCBwYXRjaCBzaG91bGQgcmVtb3Zl
IHRoZSBleHRyYSBhcmcuIFRoaXMgb25lIGNhbiBiZQo+PiA+IGtlcHQgb3Igbm90Lgo+PiBTb3Vu
ZHMgcmVhc29uYWJsZSwgYWxiZWl0IEkgaGF2ZSB0byBhZG1pdCBJJ20gbm90IHN1cmUgd2hhdCB0
aGUgbGFzdAo+PiBzZW50ZW5jZSBpcyBzdXBwb3NlZCB0byBtZWFuLiBFaXRoZXIgaXQgaXMgcG9z
c2libGUgdG8gZWxpbWluYXRlIHRoZQo+PiBleHRyYSBhcmcsIHRoZW4geW91IHNob3VsZCBkbyBz
bywgb3IgaXQgaXMgbm90IHBvc3NpYmxlIChpbiB3aGljaAo+PiBjYXNlCj4+IHlvdSBjYW4ndCBw
b3NzaWJseSBhZGQgYSByZXNwZWN0aXZlIHBhdGNoIHRvIHRoZSBzZXJpZXMpLgo+IAo+IEkgd2Fu
dGVkIHRvIHNheSB0aGF0IHRoZSBsYXN0IHBhdGNoIHdpbGwgYmUgaW5kZXBlbmRlbnQgYW5kIGl0
IGNhbiBnbwo+IHVwc3RyZWFtIG9yIG5vdCBiZWNhdXNlIHlvdSBzYWlkIHRoYXQgeW91IGFyZSBu
b3Qgc3VyZSBpZiB0aGUgZXh0cmEKPiBhcmdzIHNob3VsZCBiZSByZW1vdmVkIG9yIG5vdC4KCkkg
ZGlkIG5vdCBzYXkgInNob3VsZCIgYnV0ICJjb3VsZCIgKGluIG90aGVyIHdvcmRzIG9mIGNvdXJz
ZSkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
