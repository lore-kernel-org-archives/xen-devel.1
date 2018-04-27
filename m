From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH RESEND v1 1/7] x86: add a flag to enable
 Intel processor trace
Date: Fri, 27 Apr 2018 09:32:18 +0100
Message-ID: <20180427083218.ryib2t33onll7zdv@citrix.com>
References: <1516039953-2988-1-git-send-email-luwei.kang@intel.com>
 <1516039953-2988-2-git-send-email-luwei.kang@intel.com>
 <20180426120909.6miciqgzuvxfxpyy@citrix.com>
 <82D7661F83C1A047AF7DC287873BF1E167F67364@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <82D7661F83C1A047AF7DC287873BF1E167F67364@SHSMSX101.ccr.corp.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Kang, Luwei" <luwei.kang@intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "tim@xen.org" <tim@xen.org>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBcHIgMjcsIDIwMTggYXQgMDg6MjI6MDBBTSArMDAwMCwgS2FuZywgTHV3ZWkgd3Jv
dGU6Cj4gPiA+IGRpZmYgLS1naXQgYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5tYXJrZG93
bgo+ID4gPiBiL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLm1hcmtkb3duCj4gPiA+IGluZGV4
IDc4MTExMGQuLjk1NDExY2YgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFu
ZC1saW5lLm1hcmtkb3duCj4gPiA+ICsrKyBiL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLm1h
cmtkb3duCj4gPiA+IEBAIC0xMDA5LDYgKzEwMDksMTMgQEAgZGVidWcgaHlwZXJ2aXNvciBvbmx5
KS4KPiA+ID4gICMjIyBpZGxlXF9sYXRlbmN5XF9mYWN0b3IKPiA+ID4gID4gYD0gPGludGVnZXI+
YAo+ID4gPgo+ID4gPiArIyMjIGludGVsXF9wdAo+ID4gPiArPiBgPSA8Ym9vbGVhbj5gCj4gPiA+
ICsKPiA+ID4gKz4gRGVmYXVsdDogYHRydWVgCj4gPiA+ICsKPiA+IAo+ID4gQWZ0ZXIgcmVhZGlu
ZyB0aGUgbWFudWFsIGEgYml0IEkgdGhpbmsgdGhpcyBvcHRpb24gbmVlZHMgdG8gYmUgbW9yZQo+
ID4gc29waGlzdGljYXRlZC4KPiA+IAo+ID4gVGhlIHNlcmllcyBvbmx5IGltcGxlbWVudHMgZ3Vl
c3Qtb25seSB0cmFjaW5nLCB3aGlsZSBpbiB0aGUgZnV0dXJlIHdlIG1pZ2h0Cj4gPiB3YW50IGhv
c3Qtb25seSB0cmFjaW5nIGFuZCBzeXN0ZW0gd2lkZSB0cmFjaW5nLgo+ID4gCj4gPiBFdmVuIHRo
ZSBvdGhlciBtb2RlcyBhcmVuJ3QgaW1wbGVtZW50ZWQgeWV0IHdlIHNob3VsZCBsZWF2ZSByb29t
IGZvcgo+ID4gdGhlbS4KPiA+IAo+IAo+IEhpIFdlaSwKPiAgICAgIFRoYW5rcyBmb3IgdGhlIHJl
dmlldy4gU28gd2hhdCBhYm91dCBkZWZpbmUgZ3Vlc3QgbW9kZSBsaWtlIHRoaXMgYW5kIG1ha2Ug
dGhlIG9wdGlvbiBhcyBhIHN0cmluZy4gT3RoZXIgbW9kZSBjYW4gYmUgYWRkZWQgbGlrZSAnc3lz
dGVtIHwgaG9zdCcgaW4gZnV0dXJlLgo+IAo+ICMjIyBJbnRlbFxfcHQKPiA+IGA9IGd1ZXN0YAo+
IAoKSSdtIGZpbmUgd2l0aCB0aGlzLgoKPiA8c29tZSBkZXNjcmlwdGlvbj4KPiAKPiBCeSB0aGUg
d2F5LCB5b3UgbWVudGlvbmVkIGluIGFub3RoZXIgc2FpZCB0aGF0LCAgIk5vIGRvY3VtZW50IGZv
ciB0aGlzIG9wdGlvbiBoZXJlPyIuIERvIHlvdSBtZWFuIHRoZSBkZXNjcmlwdGlvbiBpcyB0b28g
c2ltcGxlIGluIHRoaXMgcGF0Y2ggb3IgSSBuZWVkIGFkZCBzb21lIHdvcmRzIGluIGEgYW5vdGhl
ciBkb2N1bWVudD8KPiAKClRoZSBvbmUtbGluZXIgcHJvdmlkZWQgaW4gdGhpcyBwYXRjaCBpcyB0
b28gdGVyc2UuCgpZb3UgbmVlZCB0byBkZXNjcmliZSB3aGF0IHRoaXMgb3B0aW9uIGlzIHVzZWQg
Zm9yIGFuZCBob3cgdG8gdXNlIGl0LiBTZWUKdGhlIG90aGVyIGl0ZW1zIGluIHhlbi1jb21tYW5k
LWxpbmUubWFya2Rvd24gZm9yIGV4YW1wbGUuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
