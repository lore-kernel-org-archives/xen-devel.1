From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v5 00/24] ACPI reorganization
 for hardware-reduced API addition
Date: Tue, 20 Nov 2018 22:36:01 +0100
Message-ID: <df790ea7-332c-66b1-63a3-052e1e7a2432@redhat.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
 <20181116172919.43f3e27d@redhat.com>
 <d4f6f0ef-1333-a917-e3eb-d9bad47c9648@redhat.com>
 <20181119163110.2f357f40@redhat.com>
 <c09214f5-85fa-bb64-7c7e-2e9435ea4279@redhat.com>
 <20181120135719.3965e33b@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qxuu=n7=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1gPDgq-0001p2-5H
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 21:36:12 +0000
In-Reply-To: <20181120135719.3965e33b@redhat.com>
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

T24gMjAvMTEvMTggMTM6NTcsIElnb3IgTWFtbWVkb3Ygd3JvdGU6Cj4gT24gTW9uLCAxOSBOb3Yg
MjAxOCAxODoxNDoyNiArMDEwMAo+IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+
IHdyb3RlOgo+IAo+PiBPbiAxOS8xMS8xOCAxNjozMSwgSWdvciBNYW1tZWRvdiB3cm90ZToKPj4+
IEkndmUgdHJpZWQgdG8gZ2l2ZSBzdWdnZXN0aW9ucyBob3cgdG8gcmVzdHJ1Y3R1cmUgc2VyaWVz
Cj4+PiBvbiBwZXIgcGF0Y2ggYmFzaXMuIEluIG15IG9waW5pb24gaXQgcXVpdGUgcG9zc2libGUg
dG8gc3BsaXQKPj4+IHNlcmllcyBpbiBzZXZlcmFsIHNtYWxsZXIgb25lcyBhbmQgaXQgc2hvdWxk
IHJlYWxseSBoZWxwIHdpdGgKPj4+IG1ha2luZyBzZXJpZXMgY2xlYW5lciBhbmQgZWFzaWVyL2Zh
c3RlciB0byByZXZpZXcvYW1lbmQvbWVyZ2UKPj4+IHZzIHdoYXQgd2UgaGF2ZSBpbiB2NS4gIAo+
Pgo+PiBUaGlzIGlzIHRydWUsIG9uIHRoZSBvdGhlciBoYW5kIHRoZSBzZXJpZXMgbWFrZXMgc2Vu
c2UgdG9nZXRoZXIgYW5kLAo+PiBldmVuIGlmIHRoZSBwYXRjaGVzIGFyZSBtb3JlIG9yIGxlc3Mg
aW5kZXBlbmRlbnQsIHRoZXkgYWxzbyBhbGwgZm9sbG93Cj4+IHRoZSBzYW1lICJwbGFuIi4gIEZv
ciByZXZpZXdpbmcgdjYsIGFyZSB5b3UgYXdhcmUgb2YgUGF0Y2hldydzIHNlcmllcwo+PiBkaWZm
IGZ1bmN0aW9uYWxpdHk/ICBJdCBjYW4gdGVsbCB5b3Ugd2hpY2ggcGF0Y2hlcyBoYWQgY29tbWVu
dHMgaW4gdjUsCj4+IHJlb3JkZXIgcGF0Y2hlcyBpZiBhcHBsaWNhYmxlLCBhbmQgZGlzcGxheSBk
ZWxldGVkIGFuZCBuZXcgcGF0Y2hlcyBhdAo+PiB0aGUgcmlnaHQgcG9pbnQgaW4gdGhlIHNlcmll
cy4KPiBUaGFua3MsIEknbGwgZ2l2ZSBpdCBhIHRyeS4KPiAKPiBTdWdnZXN0aW9uIHRvIHNwbGl0
IHNlcmllcyBtb3N0bHkgY29tZXMgZnJvbSBjb250cmlidXRvcidzIHBvaW50IG9mIHZpZXcsCj4g
aXQgbXVjaCBlYXNpZXIgdG8gYW1lbmQgc21hbGwgc2VyaWVzIHRoYW4gYSBsYXJnZXIgb25lLgoK
VGhhdCdzIHRydWUsIG9uIHRoZSBvdGhlciBoYW5kIHJ1bGVzIGV4aXN0IHRvIGhhdmUgZXhjZXB0
aW9ucy4gOikgIElJUkMKeW91ciBBTUwgYnVpbGRlciBwYXRjaCB3YXMgYWxzbyBhIGh1Z2Ugc2Vy
aWVzLCB0aGlzIGlzIG5vdCB2ZXJ5IGRpZmZlcmVudC4KClBhb2xvCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
