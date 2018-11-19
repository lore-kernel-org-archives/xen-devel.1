From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v5 00/24] ACPI reorganization
 for hardware-reduced API addition
Date: Mon, 19 Nov 2018 18:14:26 +0100
Message-ID: <c09214f5-85fa-bb64-7c7e-2e9435ea4279@redhat.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
 <20181116172919.43f3e27d@redhat.com>
 <d4f6f0ef-1333-a917-e3eb-d9bad47c9648@redhat.com>
 <20181119163110.2f357f40@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sqdS=N6=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1gOn8G-0002XM-5I
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 17:14:44 +0000
In-Reply-To: <20181119163110.2f357f40@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTEvMTggMTY6MzEsIElnb3IgTWFtbWVkb3Ygd3JvdGU6Cj4gSSd2ZSB0cmllZCB0byBn
aXZlIHN1Z2dlc3Rpb25zIGhvdyB0byByZXN0cnVjdHVyZSBzZXJpZXMKPiBvbiBwZXIgcGF0Y2gg
YmFzaXMuIEluIG15IG9waW5pb24gaXQgcXVpdGUgcG9zc2libGUgdG8gc3BsaXQKPiBzZXJpZXMg
aW4gc2V2ZXJhbCBzbWFsbGVyIG9uZXMgYW5kIGl0IHNob3VsZCByZWFsbHkgaGVscCB3aXRoCj4g
bWFraW5nIHNlcmllcyBjbGVhbmVyIGFuZCBlYXNpZXIvZmFzdGVyIHRvIHJldmlldy9hbWVuZC9t
ZXJnZQo+IHZzIHdoYXQgd2UgaGF2ZSBpbiB2NS4KClRoaXMgaXMgdHJ1ZSwgb24gdGhlIG90aGVy
IGhhbmQgdGhlIHNlcmllcyBtYWtlcyBzZW5zZSB0b2dldGhlciBhbmQsCmV2ZW4gaWYgdGhlIHBh
dGNoZXMgYXJlIG1vcmUgb3IgbGVzcyBpbmRlcGVuZGVudCwgdGhleSBhbHNvIGFsbCBmb2xsb3cK
dGhlIHNhbWUgInBsYW4iLiAgRm9yIHJldmlld2luZyB2NiwgYXJlIHlvdSBhd2FyZSBvZiBQYXRj
aGV3J3Mgc2VyaWVzCmRpZmYgZnVuY3Rpb25hbGl0eT8gIEl0IGNhbiB0ZWxsIHlvdSB3aGljaCBw
YXRjaGVzIGhhZCBjb21tZW50cyBpbiB2NSwKcmVvcmRlciBwYXRjaGVzIGlmIGFwcGxpY2FibGUs
IGFuZCBkaXNwbGF5IGRlbGV0ZWQgYW5kIG5ldyBwYXRjaGVzIGF0CnRoZSByaWdodCBwb2ludCBp
biB0aGUgc2VyaWVzLgoKdjQtPnY1IGlzIGEgYml0IG1lc3NlZCB1cCBiZWNhdXNlIFNhbXVlbCBw
cm9iYWJseSBhZGRlZCBhIGRpZmYgb3JkZXIKc2V0dXAKKGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVN
VS8yMDE4MTEwMTEwMjMwMy4xNjQzOS0xLXNhbWVvQGxpbnV4LmludGVsLmNvbS9kaWZmLzIwMTgx
MTA1MDE0MDQ3LjI2NDQ3LTEtc2FtZW9AbGludXguaW50ZWwuY29tLykKYnV0IGl0J3MgdmVyeSB1
c2VmdWwgaW4gZ2VuZXJhbC4KClBhb2xvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
