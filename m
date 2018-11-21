From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [Qemu-devel] [PATCH v5 15/24] hw: i386: Export the
 i386 ACPI SRAT build method
Date: Thu, 22 Nov 2018 00:27:33 +0100
Message-ID: <20181121232733.GC4450@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
 <20181105014047.26447-16-sameo@linux.intel.com>
 <20181115142854.1c62f32f@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uxgW=OA=linux.intel.com=sameo@srs-us1.protection.inumbo.net>)
 id 1gPbun-0006no-97
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 23:28:13 +0000
Content-Disposition: inline
In-Reply-To: <20181115142854.1c62f32f@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMTUsIDIwMTggYXQgMDI6Mjg6NTRQTSArMDEwMCwgSWdvciBNYW1tZWRvdiB3
cm90ZToKPiBPbiBNb24sICA1IE5vdiAyMDE4IDAyOjQwOjM4ICswMTAwCj4gU2FtdWVsIE9ydGl6
IDxzYW1lb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+IAo+ID4gVGhpcyBpcyB0aGUgc3RhbmRh
cmQgd2F5IG9mIGJ1aWxkaW5nIFNSQVQgb24geDg2IHBsYXRmb21zLiBCdXQgZnV0dXJlCj4gPiBt
YWNoaW5lIHR5cGVzIGNvdWxkIGRlY2lkZSB0byBkZWZpbmUgdGhlaXIgb3duIGN1c3RvbSBTUkFU
IGJ1aWxkIG1ldGhvZAo+ID4gdGhyb3VnaCB0aGUgQUNQSSBidWlsZGVyIG1ldGhvZHMuCj4gPiBN
b3Jlb3Zlciwgd2Ugd2lsbCBhbHNvIG5lZWQgdG8gcmVhY2ggYnVpbGRfc3JhdCgpIGZyb20gb3V0
c2lkZSBvZgo+ID4gYWNwaS1idWlsZCBpbiBvcmRlciB0byB1c2UgaXQgYXMgdGhlIEFDUEkgYnVp
bGRlciBTUkFUIGJ1aWxkIG1ldGhvZC4KPiBTUkFUIGlzIHVzdWFsbHkgaGlnaGx5IG1hY2hpbmUg
c3BlY2lmaWMgKG1lbW9yeSBob2xlcywgbGF5b3V0LCBndWVzdCBPUwo+IHNwZWNpZmljIHF1aXJr
cykgc28gaXQncyBoYXJkIHRvIGdlbmVyYWxpemUgaXQuCkhlbmNlIHRoZSBuZWVkIGZvciBhbiBT
UkFUIGJ1aWxkZXIgaW50ZXJmYWNlLgoKPiBJJ2QgIGRyb3AgU1JBVCByZWxhdGVkIHBhdGNoZXMg
ZnJvbSB0aGlzIHNlcmllcyBhbmQgaW50cm9kdWNlCj4gaTM4Ni92aXJ0IHNwZWNpZmljIFNSQVQg
d2hlbiB5b3UgcG9zdCBwYXRjaGVzIGZvciBpdC4KdmlydCB1c2VzIHRoZSBleGlzdGluZyBpMzg2
IGJ1aWxkX3NyYXQoKSByb3V0aW5lLCB0aGVyZSdzIG5vdGhpbmcKc3BlY2lhbCBhYm91dCBpdC4g
U28gdGhpcyB3b3VsZCBiZSBwdXJlbHkgZHVwbGljYXRlZCBjb2RlLgoKQ2hlZXJzLApTYW11ZWwu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
