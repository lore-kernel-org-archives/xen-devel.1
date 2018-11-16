From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v5 00/24] ACPI reorganization
 for hardware-reduced API addition
Date: Fri, 16 Nov 2018 17:37:54 +0100
Message-ID: <d4f6f0ef-1333-a917-e3eb-d9bad47c9648@redhat.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
 <20181116172919.43f3e27d@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=o2lo=n3=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1gNh88-0007tT-Tf
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 16:38:04 +0000
In-Reply-To: <20181116172919.43f3e27d@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Mammedov <imammedo@redhat.com>, Samuel Ortiz <sameo@linux.intel.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMTEvMTggMTc6MjksIElnb3IgTWFtbWVkb3Ygd3JvdGU6Cj4gR2VuZXJhbCBzdWdnZXN0
aW9ucyBmb3IgdGhpcyBzZXJpZXM6Cj4gICAxLiBQcmVmZXJhYmx5IGRvbid0IGRvIG11bHRpcGxl
IGNoYW5nZXMgd2l0aGluIGEgcGF0Y2gKPiAgICAgIG5laXRoZXIgcG9zdCBodWdlIHBhdGNoZXMg
KHVubGVzcyBpdCdzIHB1cmUgY29kZSBtb3ZlbWVudCkuCj4gICAgICAoaXQncyBlYXN5IHRvIHNx
dWFzaCBwYXRjaGVzIGxhdGVyIGl0IG5lY2Vzc2FyeSkKPiAgIDIuIFN0YXJ0IHNtYWxsLCBwaWNr
IGEgdGFibGUgZ2VuZXJhbGl6ZSBpdCBhbmQgc2VuZCBhcwo+ICAgICAgb25lIHNtYWxsIHBhdGNo
c2V0LiBUYWJsZXMgYXJlIG9mdGVuIGluZGVwZW5kZW50Cj4gICAgICBhbmQgaXQncyBtdWNoIGVh
c2llciBvbiBib3RoIGF1dGhvci9yZXZpZXdlciB0byBhZ3JlZSB1cG9uCj4gICAgICBjaGFuZ2Vz
IGFuZCByZXdyaXRlIGl0IGlmIG5lY2Vzc2FyeS4KCkhvdyB3b3VsZCB0aGF0IGJlIGRvbmU/ICBU
aGlzIHNlcmllcyBpcyBvbiB0aGUgYmlnZ2VyIHNpZGUsIGFncmVlZCwgYnV0Cm1vc3Qgb2YgaXQg
aXMgcmVhbGx5IGp1c3QgY29kZSBtb3ZlbWVudC4gIEl0J3MgYSBzdGFydGluZyBwb2ludCwgaGF2
aW5nCmEgZ2VuZXJpYyBBQ1BJIGxpYnJhcnkgaXMgd2F5IGJleW9uZCB3aGF0IHRoaXMgaXMgdHJ5
aW5nIHRvIGRvLgoKUGFvbG8KCj4gICAzLiB3aGVuIHlvdSB0aGluayBhYm91dCByZWZhY3Rvcmlu
ZyBhY3BpIGludG8gYSBnZW5lcmljIEFQSQo+ICAgICAgdGhpbmsgYWJvdXQgaXQgYXMgcm91dGlu
ZXMgdGhhdCBnbyBpbnRvIGEgc2VwYXJhdGUgbGlicmFyeQo+ICAgICAgKHB1cmUgYWNwaSBzcGVj
IGNvZGUpIGFuZCBxZW11L2FjcGkgZ2x1ZSByb3V0aW5lcyBhbmQKPiAgICAgICBkaXZpZGUgdGhl
bSBjb3JyZXNwb25kaW5nbHkuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
