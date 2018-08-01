From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v14 09/11] x86/domctl: Don't pause the whole
 domain if only getting vcpu state
Date: Wed, 01 Aug 2018 09:10:14 -0600
Message-ID: <5B61CD5602000078001DA021@prv1-mh.provo.novell.com>
References: <1532520862-13648-1-git-send-email-aisaila@bitdefender.com>
 <1532520862-13648-10-git-send-email-aisaila@bitdefender.com>
 <5B605F4702000078001D9759@prv1-mh.provo.novell.com>
 <1533135046.21125.36.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1533135046.21125.36.camel@bitdefender.com>
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

Pj4+IE9uIDAxLjA4LjE4IGF0IDE2OjUwLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IE9uIE1hLCAyMDE4LTA3LTMxIGF0IDA3OjA4IC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4gPiAKPj4gPiA+IAo+PiA+ID4gPiAKPj4gPiA+ID4gT24gMjUuMDcuMTggYXQgMTQ6MTQsIDxh
aXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+ID4gVGhpcyBwYXRjaCBpcyBmb2N1c2Vk
IG9uIG1vdmluZyB0aGUgZm9yIGxvb3AgdG8gdGhlIGNhbGxlciBzbwo+PiA+IG5vdyB3ZSBjYW4g
c2F2ZSBpbmZvIGZvciBhIHNpbmdsZSB2Y3B1IGluc3RhbmNlIHdpdGggdGhlIHNhdmVfb25lCj4+
ID4gaGFuZGxlcnMuCj4+ID4gCj4+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8
YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+Cj4+IEZpcnN0IG9mIGFsbCBJJ2QgYXBwcmVjaWF0ZSBp
ZiB0aGlzIHBhdGNoIHdhcyBsYXN0IGluIHRoZSBzZXJpZXMsCj4+IGFmdGVyIGFsbAo+PiBpbmZy
YXN0cnVjdHVyZSBjaGFuZ2VzIGhhdmUgYmVlbiBkb25lLgo+PiAKPiBJZiB0aGlzIHBhdGNoIHdp
bGwgYmUgdGhlIGxhc3Qgb25lIGluIHRoZSBzZXJpZXMgdGhlbiBiZXR3ZWVuIHRoZSBvbmUKPiB0
aGF0IHJlbW92ZXMgdGhlIHNhdmUgZnVuY3Rpb25zIChhbmQgd2l0aCB0aGF0IHRoZSBmb3IpIGFu
ZCB0aGlzIG9uZQo+IHRoZSBjb2RlIHdpbGwgbm90IHJ1biBhcyBleHBlY3RlZCBiZWNhdXNlIHRo
ZXJlIHdpbGwgYmUgbm8gZm9yLiAKCldlbGwsIEkgZGlkbid0IG1lYW4geW91IHRvIHJlLW9yZGVy
IHRoaW5ncyB3aXRob3V0IGFkanVzdGluZyB0aGUgY29kZQphY2NvcmRpbmdseS4gWW91IHdpbGwg
d2FudCB0byB0cmFuc2Zvcm0gaHZtX3NhdmUoKSBmaXJzdCwgYW5kIG9ubHkgYXMKdGhlIGZpbmFs
IHN0ZXAgbWFrZSBodm1fc2F2ZV9vbmUoKSBiZWhhdmUgdGhlIHdheSB5b3UncmUgYWN0dWFsbHkK
YWZ0ZXIuIFRoaXMgbWF5IChhcyBhbHJlYWR5IGluZGljYXRlZCBpbiBzb21lIG9mIHRoZSBpbmRp
dmlkdWFsCnJlc3BvbnNlcykgaW5jdXIgY2hhbmdpbmcgdGhlIHNwbGl0dGluZyBiZXR3ZWVuIHBh
dGNoZXMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
