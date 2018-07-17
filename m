From: Isaila Alexandru <aisaila@bitdefender.com>
Subject: Re: [PATCH v12 03/11] x86/hvm: Introduce
 hvm_save_cpu_ctxt_one func
Date: Tue, 17 Jul 2018 17:57:37 +0300
Message-ID: <1531839457.10865.9.camel@bitdefender.com>
References: <1531752937-10478-1-git-send-email-aisaila@bitdefender.com>
 <1531752937-10478-4-git-send-email-aisaila@bitdefender.com>
 <492015aaf7164a48bc2a2e635ef0277d@AMSPEX02CL02.citrite.net>
 <1531830332.10865.4.camel@bitdefender.com>
 <5B4DF71402000078001D4F5E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B4DF71402000078001D4F5E@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTWEsIDIwMTgtMDctMTcgYXQgMDg6MDMgLTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4g
Cj4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+IE9uIDE3LjA3LjE4IGF0IDE0OjI1LCA8YWlzYWlsYUBi
aXRkZWZlbmRlci5jb20+IHdyb3RlOgo+ID4gT24gTHUsIDIwMTgtMDctMTYgYXQgMTU6MjkgKzAw
MDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gRnJvbTogQWxl
eGFuZHJ1IElzYWlsYSBbbWFpbHRvOmFpc2FpbGFAYml0ZGVmZW5kZXIuY29tXQo+ID4gPiA+IFNl
bnQ6IDE2IEp1bHkgMjAxOCAxNTo1NQo+ID4gPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZt
LmMKPiA+ID4gPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4gPiA+ID4gQEAgLTc4Nywx
MTkgKzc4NywxMjkgQEAgc3RhdGljIGludCBodm1fbG9hZF90c2NfYWRqdXN0KHN0cnVjdAo+ID4g
PiA+IGRvbWFpbiAqZCwKPiA+ID4gPiBodm1fZG9tYWluX2NvbnRleHRfdCAqaCkKPiA+ID4gPiDC
oEhWTV9SRUdJU1RFUl9TQVZFX1JFU1RPUkUoVFNDX0FESlVTVCwgaHZtX3NhdmVfdHNjX2FkanVz
dCwKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBodm1fbG9hZF90c2NfYWRqdXN0LCAxLAo+ID4gPiA+IEhWTVNSX1BFUl9WQ1BVKTsK
PiA+ID4gPiAKPiA+ID4gPiArc3RhdGljIGludCBodm1fc2F2ZV9jcHVfY3R4dF9vbmUoc3RydWN0
IHZjcHUgKnYsCj4gPiA+ID4gaHZtX2RvbWFpbl9jb250ZXh0X3QKPiA+ID4gPiAqaCkKPiA+ID4g
PiArewo+ID4gPiA+ICvCoMKgwqDCoHN0cnVjdCBzZWdtZW50X3JlZ2lzdGVyIHNlZzsKPiA+ID4g
PiArwqDCoMKgwqBzdHJ1Y3QgaHZtX2h3X2NwdSBjdHh0Owo+ID4gPiA+ICsKPiA+ID4gPiArwqDC
oMKgwqBtZW1zZXQoJmN0eHQsIDAsIHNpemVvZihjdHh0KSk7Cj4gPiA+IFdoeSBub3QgdXNlIGFu
ID0ge30gaW5pdGlhbGl6ZXIgaW5zdGVhZCBvZiB0aGUgbWVtc2V0IGhlcmUgbGlrZQo+ID4gPiBl
bHNld2hlcmU/Cj4gPiBJIHdhbnRlZCB0byBtYWtlIGxlc3MgY2hhbmdlIGFzIHBvc3NpYmxlIGFu
ZCBJIG9ubHkgYWRkZWQgYQo+ID4gaW5pdGlhbGl6ZXIKPiA+IHdoZXJlIHRoZXJlIHdhcyBub25l
LsKgCj4gVHJ5aW5nIHRvIGxpbWl0IHBhdGNoIGltcGFjdCBpcyBjZXJ0YWlubHkgYXBwcmVjaWF0
ZWQsIGJ1dCBwbGVhc2UKPiB0YWtlIGEKPiBsb29rIGF0IHlvdXIgcGF0Y2ggdG8gc2VlIHdoZXRo
ZXIgdGhpcyB3b3VsZCByZWFsbHkgaGF2ZSBtYWRlIG11Y2gKPiBvZiBhIGRpZmZlcmVuY2UuCj4g
Ckkgd2lsbCBjaGFuZ2UgdGhpcyBpbiB0aGUgbmV4dCB2ZXJzaW9uIGJ1dCBJIHdpbGwgd2FpdCBm
b3IgbW9yZQpjb21tZW50cyBvbiB0aGUgcmVzdCBvZiB0aGUgcGF0Y2hlcy7CoAoKUmVnYXJkcyzC
oApBbGV4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
