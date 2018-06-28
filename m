From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/mm: Add mem access rights to NPT
Date: Thu, 28 Jun 2018 08:40:44 -0600
Message-ID: <5B34F36C02000078001CEEA0@prv1-mh.provo.novell.com>
References: <1529335072-2141-1-git-send-email-aisaila@bitdefender.com>
 <5B2D1B0002000078001CD08E@prv1-mh.provo.novell.com>
 <1530195070.8880.9.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1530195070.8880.9.camel@bitdefender.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, tamas@tklengyel.com, Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA2LjE4IGF0IDE2OjEwLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IE9uIFZpLCAyMDE4LTA2LTIyIGF0IDA5OjUxIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4gPiA+ID4gT24gMTguMDYuMTggYXQgMTc6MTcsIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4g
d3JvdGU6Cj4+ID4gRnJvbTogSXNhaWxhIEFsZXhhbmRydSA8YWlzYWlsYUBiaXRkZWZlbmRlci5j
b20+Cj4+ID4KPj4gPiBUaGlzIHBhdGNoIGFkZHMgYWNjZXNzIHJpZ2h0cyBmb3IgdGhlIE5QVCBw
YWdlcy4gVGhlIGFjY2VzcyByaWdodHMKPj4gPiBhcmUKPj4gPiBzYXZlZCBpbiBhIHJhZGl4IHRy
ZWUgd2l0aCB0aGUgcm9vdCBzYXZlZCBpbiBwMm1fZG9tYWluLgo+PiBTb3VuZHMgcmVzb3VyY2Ug
aW50ZW5zaXZlLiBIb3cgbWFueSBub2RlcyB3b3VsZCBzdWNoIGEgcmFkaXggdHJlZQo+PiBoYXZl
Cj4+IG9uIGF2ZXJhZ2U/Cj4gCj4gVGhlIGF2ZXJhZ2UgaXMgYXJvdW5kIDE0Nzg4OTAgZm9yIGEg
bWFjaGluZSB3aXRoIDRHQiBvZiByYW0uCgpJcyB0aGlzIHdpdGggLi4uCgo+PiA+ICtzdGF0aWMg
dm9pZCBwMm1fc2V0X2FjY2VzcyhzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLCB1bnNpZ25lZCBsb25n
Cj4+ID4gZ2ZuLAo+PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAy
bV9hY2Nlc3NfdCBhKQo+PiA+ICt7Cj4+ID4gKyAgICBpbnQgcmM7Cj4+ID4gKwo+PiA+ICsgICAg
aWYgKCBwMm1fYWNjZXNzX3J3eCA9PSBhICkKPj4gPiArICAgICAgICByYWRpeF90cmVlX2RlbGV0
ZSgmcDJtLT5tZW1fYWNjZXNzX3NldHRpbmdzLCBnZm4pOwo+PiA+ICsKPj4gPiArICAgIHJjID0g
cmFkaXhfdHJlZV9pbnNlcnQoJnAybS0+bWVtX2FjY2Vzc19zZXR0aW5ncywgZ2ZuLAo+PiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICByYWRpeF90cmVlX2ludF90b19wdHIoYSkpOwo+PiBJ
cyB0aGVyZSBhbiAiZWxzZSIgbWlzc2luZyBhYm92ZSBoZXJlPyBPdGhlcndpc2Ugd2h5IHdvdWxk
IHlvdQo+PiBkZWxldGUgdGhlIG5vZGUgZmlyc3Q/Cj4gCj4gWWVzIGl0IG5lZWRzIGEgZWxzZSBv
ciBhIHJldHVybi4gV2UgcGxhbiBub3QgdG8gaGF2ZSB0aGUgcnd4IGluIHRoZQo+IHRyZWUgc28g
d2UgY2Egc2F2ZSB1cCBzb21lIHNwYWNlLgoKLi4uIHRoaXMgY29ycmVjdGVkPyBPdGhlcndpc2Ug
SSdtIHRlbXB0ZWQgdG8gc2F5IHRoYXQgdGhlIGNyZWF0aW9uIG9mCnRoaXMgcmFkaXggdHJlZSBu
ZWVkcyB0byBiZSBhdm9pZGVkIGJ5IGFsbCBtZWFucywgYXMgbG9uZyBhcyBpdCdzIG5vdApyZWFs
bHkgbmVlZGVkLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
