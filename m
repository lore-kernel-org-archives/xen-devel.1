From: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v5 00/24] ACPI reorganization
 for hardware-reduced API addition
Date: Tue, 20 Nov 2018 13:57:19 +0100
Message-ID: <20181120135719.3965e33b__24576.5799693347$1542718588$gmane$org@redhat.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
 <20181116172919.43f3e27d@redhat.com>
 <d4f6f0ef-1333-a917-e3eb-d9bad47c9648@redhat.com>
 <20181119163110.2f357f40@redhat.com>
 <c09214f5-85fa-bb64-7c7e-2e9435ea4279@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lbdb=n7=redhat.com=imammedo@srs-us1.protection.inumbo.net>)
 id 1gP5av-0001iH-Q0
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 12:57:33 +0000
In-Reply-To: <c09214f5-85fa-bb64-7c7e-2e9435ea4279@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxOSBOb3YgMjAxOCAxODoxNDoyNiArMDEwMApQYW9sbyBCb256aW5pIDxwYm9uemlu
aUByZWRoYXQuY29tPiB3cm90ZToKCj4gT24gMTkvMTEvMTggMTY6MzEsIElnb3IgTWFtbWVkb3Yg
d3JvdGU6Cj4gPiBJJ3ZlIHRyaWVkIHRvIGdpdmUgc3VnZ2VzdGlvbnMgaG93IHRvIHJlc3RydWN0
dXJlIHNlcmllcwo+ID4gb24gcGVyIHBhdGNoIGJhc2lzLiBJbiBteSBvcGluaW9uIGl0IHF1aXRl
IHBvc3NpYmxlIHRvIHNwbGl0Cj4gPiBzZXJpZXMgaW4gc2V2ZXJhbCBzbWFsbGVyIG9uZXMgYW5k
IGl0IHNob3VsZCByZWFsbHkgaGVscCB3aXRoCj4gPiBtYWtpbmcgc2VyaWVzIGNsZWFuZXIgYW5k
IGVhc2llci9mYXN0ZXIgdG8gcmV2aWV3L2FtZW5kL21lcmdlCj4gPiB2cyB3aGF0IHdlIGhhdmUg
aW4gdjUuICAKPiAKPiBUaGlzIGlzIHRydWUsIG9uIHRoZSBvdGhlciBoYW5kIHRoZSBzZXJpZXMg
bWFrZXMgc2Vuc2UgdG9nZXRoZXIgYW5kLAo+IGV2ZW4gaWYgdGhlIHBhdGNoZXMgYXJlIG1vcmUg
b3IgbGVzcyBpbmRlcGVuZGVudCwgdGhleSBhbHNvIGFsbCBmb2xsb3cKPiB0aGUgc2FtZSAicGxh
biIuICBGb3IgcmV2aWV3aW5nIHY2LCBhcmUgeW91IGF3YXJlIG9mIFBhdGNoZXcncyBzZXJpZXMK
PiBkaWZmIGZ1bmN0aW9uYWxpdHk/ICBJdCBjYW4gdGVsbCB5b3Ugd2hpY2ggcGF0Y2hlcyBoYWQg
Y29tbWVudHMgaW4gdjUsCj4gcmVvcmRlciBwYXRjaGVzIGlmIGFwcGxpY2FibGUsIGFuZCBkaXNw
bGF5IGRlbGV0ZWQgYW5kIG5ldyBwYXRjaGVzIGF0Cj4gdGhlIHJpZ2h0IHBvaW50IGluIHRoZSBz
ZXJpZXMuClRoYW5rcywgSSdsbCBnaXZlIGl0IGEgdHJ5LgoKU3VnZ2VzdGlvbiB0byBzcGxpdCBz
ZXJpZXMgbW9zdGx5IGNvbWVzIGZyb20gY29udHJpYnV0b3IncyBwb2ludCBvZiB2aWV3LAppdCBt
dWNoIGVhc2llciB0byBhbWVuZCBzbWFsbCBzZXJpZXMgdGhhbiBhIGxhcmdlciBvbmUuCgoKPiB2
NC0+djUgaXMgYSBiaXQgbWVzc2VkIHVwIGJlY2F1c2UgU2FtdWVsIHByb2JhYmx5IGFkZGVkIGEg
ZGlmZiBvcmRlcgo+IHNldHVwCj4gKGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE4MTEwMTEw
MjMwMy4xNjQzOS0xLXNhbWVvQGxpbnV4LmludGVsLmNvbS9kaWZmLzIwMTgxMTA1MDE0MDQ3LjI2
NDQ3LTEtc2FtZW9AbGludXguaW50ZWwuY29tLykKPiBidXQgaXQncyB2ZXJ5IHVzZWZ1bCBpbiBn
ZW5lcmFsLgo+IFBhb2xvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
