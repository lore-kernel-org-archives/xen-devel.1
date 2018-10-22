From: Mihai =?UTF-8?Q?Don=C8=9Bu?= <mdontu@bitdefender.com>
Subject: Re: Ongoing/future speculative mitigation work
Date: Mon, 22 Oct 2018 12:32:54 +0300
Message-ID: <1540200774.2833.8.camel@bitdefender.com>
References: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
 <0508ae79c8d74f6ebb7d1b239b2c3f0e428aca6b.camel@suse.com>
 <0fa1c7a6-d3bc-5ea3-ae65-f6f24b303134@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <0fa1c7a6-d3bc-5ea3-ae65-f6f24b303134@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Xen-devel List <xen-devel@lists.xen.org>
Cc: Juergen Gross <JGross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Ross Philipson <ross.philipson@oracle.com>, Daniel Kiper <daniel.kiper@oracle.com>, Konrad Wilk <konrad.wilk@oracle.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, "Dannowski, Uwe" <uwed@amazon.de>, Jan Beulich <JBeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Matt Wilson <msw@amazon.com>, Joao Martins <joao.m.martins@oracle.com>, "Woodhouse,
 David" <dwmw@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyMDE4LTEwLTE5IGF0IDEzOjE3ICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+
IFsuLi5dCj4gCj4gPiBUaGVyZWZvcmUsIGFsdGhvdWdoIEkgY2VydGFpbmx5IHRoaW5rIHdlIF9t
dXN0XyBoYXZlIHRoZSBwcm9wZXIKPiA+IHNjaGVkdWxlciBlbmhhbmNlbWVudHMgaW4gcGxhY2Ug
KGFuZCBpbiBmYWN0IEknbSB3b3JraW5nIG9uIHRoYXQgOi1EKQo+ID4gaXQgc2hvdWxkIElNTyBz
dGlsbCBiZSBwb3NzaWJsZSBmb3IgdGhlIHVzZXIgdG8gZGVjaWRlIHdoZXRoZXIgb3Igbm90Cj4g
PiB0byB1c2UgdGhlbSAoZWl0aGVyIGJ5IG9wdGluZy1pbiBvciBvcHRpbmctb3V0LCBJIGRvbid0
IGNhcmUgbXVjaCBhdAo+ID4gdGhpcyBzdGFnZSkuCj4gCj4gSSdtIG5vdCBzdWdnZXN0aW5nIHRo
YXQgd2UgbGVhdmUgcGVvcGxlIHdpdGhvdXQgYSBjaG9pY2UsIGJ1dCBnaXZlbiBhbgo+IG9wdGlv
biB3aGljaCBkb2Vzbid0IHNoYXJlIHNpYmxpbmdzIGJldHdlZW4gZGlmZmVyZW50IGd1ZXN0cywg
aXQgc2hvdWxkCj4gYmUgdGhlIGRlZmF1bHQuCgorMQoKPiBbLi4uXQo+IAo+IEl0cyBiZXN0IHRv
IGNvbnNpZGVyIHRoZSBzZWNyZXQtZnJlZSBYZW4gYW5kIHNjaGVkdWxlciBpbXByb3ZlbWVudHMg
YXMKPiBvcnRob2dvbmFsLiAgSW4gcGFydGljdWxhciwgdGhlIHNlY3JldC1mcmVlIFhlbiBpcyBk
ZWZlbmNlIGluIGRlcHRoCj4gYWdhaW5zdCBTUDEsIGFuZCB0aGUgcmlzayBvZiBmdXR1cmUgaXNz
dWVzLCBidXQgZG9lcyBoYXZlCj4gbm9uLXNwZWN1bGF0aXZlIGJlbmVmaXRzIGFzIHdlbGwuCj4g
Cj4gVGhhdCBzYWlkLCB0aGUgb25seSB3YXkgdG8gdXNlIEhUIGFuZCBkZWZpbml0ZWx5IGJlIHNh
ZmUgdG8gTDFURiB3aXRob3V0Cj4gYSBzZWNyZXQtZnJlZSBYZW4gaXMgdG8gaGF2ZSB0aGUgc3lu
Y2hyb25pc2VkIGVudHJ5L2V4aXQgbG9naWMgd29ya2luZy4KPiAKPiA+ID4gQSBzb2x1dGlvbiB0
byB0aGlzIGlzc3VlIHdhcyBwcm9wb3NlZCwgd2hlcmVieSBYZW4gc3luY2hyb25pc2VzCj4gPiA+
IHNpYmxpbmdzIG9uIHZtZXhpdC9lbnRyeSwgc28gd2UgYXJlIG5ldmVyIGV4ZWN1dGluZyBjb2Rl
IGluIHR3byBkaWZmZXJlbnQKPiA+ID4gcHJpdmlsZWdlIGxldmVscy4gIEdldHRpbmcgdGhpcyB3
b3JraW5nIHdvdWxkIG1ha2UgaXQgc2FmZSB0bwo+ID4gPiBjb250aW51ZSB1c2luZyBoeXBlcnRo
cmVhZGluZyBldmVuIGluIHRoZSBwcmVzZW5jZSBvZiBMMVRGLiAgCj4gPiAKPiA+IEVyci4uLiBv
aywgYnV0IHdlIHN0aWxsIHdhbnQgY29yZS1hd2FyZSBzY2hlZHVsaW5nLCBvciBhdCBsZWFzdCB3
ZSB3YW50Cj4gPiB0byBhdm9pZCBoYXZpbmcgdmNwdXMgZnJvbSBkaWZmZXJlbnQgZG9tYWlucyBv
biBzaWJsaW5ncywgZG9uJ3Qgd2U/IEluCj4gPiBvcmRlciB0byBhdm9pZCBsZWFrcyBiZXR3ZWVu
IGd1ZXN0cywgSSBtZWFuLgo+IAo+IElkZWFsbHksIHdlJ2Qgd2FudCBhbGwgb2YgdGhlc2UuICBJ
IGV4cGVjdCB0aGUgb25seSByZWFzb25hYmxlIHdheSB0bwo+IGRldmVsb3AgdGhlbSBpcyBvbmUg
b24gdG9wIG9mIGFub3RoZXIuCgpJZiB0aGVyZSB3YXMgYSB2b3RlLCBJJ2QgcGxhY2UgdGhlIHNj
aGVkdWxlciBjaGFuZ2VzIGF0IHRoZSB0b3AuCgotLSAKTWloYWkgRG9uyJt1CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
