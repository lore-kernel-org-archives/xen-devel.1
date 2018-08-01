From: Isaila Alexandru <aisaila@bitdefender.com>
Subject: Re: [PATCH v14 09/11] x86/domctl: Don't pause the whole
 domain if only getting vcpu state
Date: Wed, 01 Aug 2018 17:50:46 +0300
Message-ID: <1533135046.21125.36.camel@bitdefender.com>
References: <1532520862-13648-1-git-send-email-aisaila@bitdefender.com>
 <1532520862-13648-10-git-send-email-aisaila@bitdefender.com>
 <5B605F4702000078001D9759@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B605F4702000078001D9759@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gTWEsIDIwMTgtMDctMzEgYXQgMDc6MDggLTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4g
Cj4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+IE9uIDI1LjA3LjE4IGF0IDE0OjE0LCA8YWlzYWlsYUBi
aXRkZWZlbmRlci5jb20+IHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBpcyBmb2N1c2VkIG9uIG1vdmlu
ZyB0aGUgZm9yIGxvb3AgdG8gdGhlIGNhbGxlciBzbwo+ID4gbm93IHdlIGNhbiBzYXZlIGluZm8g
Zm9yIGEgc2luZ2xlIHZjcHUgaW5zdGFuY2Ugd2l0aCB0aGUgc2F2ZV9vbmUKPiA+IGhhbmRsZXJz
Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRl
ZmVuZGVyLmNvbT4KPiBGaXJzdCBvZiBhbGwgSSdkIGFwcHJlY2lhdGUgaWYgdGhpcyBwYXRjaCB3
YXMgbGFzdCBpbiB0aGUgc2VyaWVzLAo+IGFmdGVyIGFsbAo+IGluZnJhc3RydWN0dXJlIGNoYW5n
ZXMgaGF2ZSBiZWVuIGRvbmUuCj4gCklmIHRoaXMgcGF0Y2ggd2lsbCBiZSB0aGUgbGFzdCBvbmUg
aW4gdGhlIHNlcmllcyB0aGVuIGJldHdlZW4gdGhlIG9uZQp0aGF0IHJlbW92ZXMgdGhlIHNhdmUg
ZnVuY3Rpb25zIChhbmQgd2l0aCB0aGF0IHRoZSBmb3IpIGFuZCB0aGlzIG9uZQp0aGUgY29kZSB3
aWxsIG5vdCBydW4gYXMgZXhwZWN0ZWQgYmVjYXVzZSB0aGVyZSB3aWxsIGJlIG5vIGZvci7CoAoK
VGhpcyBwYXRjaCBoYXMgdG8gYmUgZm9sbG93ZWQgYnkgdGhlICJSZW1vdmUgcmVkdW5kYW50IHNh
dmUgZnVuY3Rpb25zIgphbmQgbm90IHRoZSBvdGhlciB3YXkgYXJvdW5kLgoKUGxlYXNlIGNsYXJp
ZnkgdGhpcyBpZiBJIGRpZCBub3QgdW5kZXJzdG9vZCBjb3JyZWN0bHkuwqAKClRoYW5rcyzCoApB
bGV4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
