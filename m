From: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v5 00/24] ACPI reorganization
 for hardware-reduced API addition
Date: Mon, 19 Nov 2018 16:31:10 +0100
Message-ID: <20181119163110.2f357f40@redhat.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
 <20181116172919.43f3e27d@redhat.com>
 <d4f6f0ef-1333-a917-e3eb-d9bad47c9648@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qq50=N6=redhat.com=imammedo@srs-us1.protection.inumbo.net>)
 id 1gOlWA-0000FF-Th
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 15:31:18 +0000
In-Reply-To: <d4f6f0ef-1333-a917-e3eb-d9bad47c9648@redhat.com>
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

T24gRnJpLCAxNiBOb3YgMjAxOCAxNzozNzo1NCArMDEwMApQYW9sbyBCb256aW5pIDxwYm9uemlu
aUByZWRoYXQuY29tPiB3cm90ZToKCj4gT24gMTYvMTEvMTggMTc6MjksIElnb3IgTWFtbWVkb3Yg
d3JvdGU6Cj4gPiBHZW5lcmFsIHN1Z2dlc3Rpb25zIGZvciB0aGlzIHNlcmllczoKPiA+ICAgMS4g
UHJlZmVyYWJseSBkb24ndCBkbyBtdWx0aXBsZSBjaGFuZ2VzIHdpdGhpbiBhIHBhdGNoCj4gPiAg
ICAgIG5laXRoZXIgcG9zdCBodWdlIHBhdGNoZXMgKHVubGVzcyBpdCdzIHB1cmUgY29kZSBtb3Zl
bWVudCkuCj4gPiAgICAgIChpdCdzIGVhc3kgdG8gc3F1YXNoIHBhdGNoZXMgbGF0ZXIgaXQgbmVj
ZXNzYXJ5KQo+ID4gICAyLiBTdGFydCBzbWFsbCwgcGljayBhIHRhYmxlIGdlbmVyYWxpemUgaXQg
YW5kIHNlbmQgYXMKPiA+ICAgICAgb25lIHNtYWxsIHBhdGNoc2V0LiBUYWJsZXMgYXJlIG9mdGVu
IGluZGVwZW5kZW50Cj4gPiAgICAgIGFuZCBpdCdzIG11Y2ggZWFzaWVyIG9uIGJvdGggYXV0aG9y
L3Jldmlld2VyIHRvIGFncmVlIHVwb24KPiA+ICAgICAgY2hhbmdlcyBhbmQgcmV3cml0ZSBpdCBp
ZiBuZWNlc3NhcnkuICAKPiAKPiBIb3cgd291bGQgdGhhdCBiZSBkb25lPyAgVGhpcyBzZXJpZXMg
aXMgb24gdGhlIGJpZ2dlciBzaWRlLCBhZ3JlZWQsIGJ1dAo+IG1vc3Qgb2YgaXQgaXMgcmVhbGx5
IGp1c3QgY29kZSBtb3ZlbWVudC4gIEl0J3MgYSBzdGFydGluZyBwb2ludCwgaGF2aW5nCj4gYSBn
ZW5lcmljIEFDUEkgbGlicmFyeSBpcyB3YXkgYmV5b25kIHdoYXQgdGhpcyBpcyB0cnlpbmcgdG8g
ZG8uCkkndmUgdHJpZWQgdG8gZ2l2ZSBzdWdnZXN0aW9ucyBob3cgdG8gcmVzdHJ1Y3R1cmUgc2Vy
aWVzCm9uIHBlciBwYXRjaCBiYXNpcy4gSW4gbXkgb3BpbmlvbiBpdCBxdWl0ZSBwb3NzaWJsZSB0
byBzcGxpdApzZXJpZXMgaW4gc2V2ZXJhbCBzbWFsbGVyIG9uZXMgYW5kIGl0IHNob3VsZCByZWFs
bHkgaGVscCB3aXRoCm1ha2luZyBzZXJpZXMgY2xlYW5lciBhbmQgZWFzaWVyL2Zhc3RlciB0byBy
ZXZpZXcvYW1lbmQvbWVyZ2UKdnMgd2hhdCB3ZSBoYXZlIGluIHY1LgooaXQncyBtb3JlIGZydXN0
cmF0aW5nIHRvIHJld29yayBsYXJnZSBzZXJpZXMgdnMgc21hbGxlciBvbmUpCgpJZiBzb21ldGhp
bmcgaXNuJ3QgY2xlYXIsIGl0J3MgZWFzeSB0byByZWFjaCBvdXQgdG8gbWUgaGVyZQpvciBkaXJl
Y3RseSAoZW1haWwvaXJjL2dpdGh1YikgZm9yIGNsYXJpZmljYXRpb24vZmVlZCBiYWNrLgoKPiAK
PiBQYW9sbwo+IAo+ID4gICAzLiB3aGVuIHlvdSB0aGluayBhYm91dCByZWZhY3RvcmluZyBhY3Bp
IGludG8gYSBnZW5lcmljIEFQSQo+ID4gICAgICB0aGluayBhYm91dCBpdCBhcyByb3V0aW5lcyB0
aGF0IGdvIGludG8gYSBzZXBhcmF0ZSBsaWJyYXJ5Cj4gPiAgICAgIChwdXJlIGFjcGkgc3BlYyBj
b2RlKSBhbmQgcWVtdS9hY3BpIGdsdWUgcm91dGluZXMgYW5kCj4gPiAgICAgICBkaXZpZGUgdGhl
bSBjb3JyZXNwb25kaW5nbHkuICAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
