From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 3/8] kexec: export PG_offline to
 VMCOREINFO
Date: Wed, 21 Nov 2018 09:50:17 +0100
Message-ID: <ddd5a6f4-59d0-474b-45d5-3589a21ebcd4__44928.8870710463$1542790177$gmane$org@redhat.com>
References: <20181119101616.8901-1-david@redhat.com>
 <20181119101616.8901-4-david@redhat.com>
 <20181121060458.GC7386@MiWiFi-R3L-srv>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmdf=OA=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1gPODh-0001yw-Pz
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 08:50:49 +0000
In-Reply-To: <20181121060458.GC7386@MiWiFi-R3L-srv>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Baoquan He <bhe@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, "Michael S. Tsirkin" <mst@redhat.com>, Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, pv-drivers@vmware.com, linux-doc@vger.kernel.org, kexec-ml <kexec@lists.infradead.org>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Kazuhito Hagio <k-hagio@ab.jp.nec.com>, Borislav Petkov <bp@alien8.de>, devel@linuxdriverproject.org, linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>, Omar Sandoval <osandov@fb.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Lianbo Jiang <lijiang@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjEuMTEuMTggMDc6MDQsIEJhb3F1YW4gSGUgd3JvdGU6Cj4gT24gMTEvMTkvMTggYXQgMTE6
MTZhbSwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+IGRpZmYgLS1naXQgYS9rZXJuZWwvY3Jh
c2hfY29yZS5jIGIva2VybmVsL2NyYXNoX2NvcmUuYwo+PiBpbmRleCA5MzNjYjNlNDViOTguLjA5
M2M5ZjkxN2VkMCAxMDA2NDQKPj4gLS0tIGEva2VybmVsL2NyYXNoX2NvcmUuYwo+PiArKysgYi9r
ZXJuZWwvY3Jhc2hfY29yZS5jCj4+IEBAIC00NjQsNiArNDY0LDggQEAgc3RhdGljIGludCBfX2lu
aXQgY3Jhc2hfc2F2ZV92bWNvcmVpbmZvX2luaXQodm9pZCkKPj4gIAlWTUNPUkVJTkZPX05VTUJF
UihQQUdFX0JVRERZX01BUENPVU5UX1ZBTFVFKTsKPj4gICNpZmRlZiBDT05GSUdfSFVHRVRMQl9Q
QUdFCj4+ICAJVk1DT1JFSU5GT19OVU1CRVIoSFVHRVRMQl9QQUdFX0RUT1IpOwo+PiArI2RlZmlu
ZSBQQUdFX09GRkxJTkVfTUFQQ09VTlRfVkFMVUUJKH5QR19vZmZsaW5lKQo+PiArCVZNQ09SRUlO
Rk9fTlVNQkVSKFBBR0VfT0ZGTElORV9NQVBDT1VOVF9WQUxVRSk7Cj4+ICAjZW5kaWYKPiAKPiBU
aGlzIHNvbHV0aW9uIGxvb2tzIGdvb2QgdG8gbWUuIE9uZSBzbWFsbCBjb25jZXJuIGlzIHdoeSB3
ZSBkb24ndAo+IGV4cG9ydCBQR19vZmZsaW5lIHRvIHZtY29yZWluZm8gZGlyZWN0bHksIHRoZW4g
ZGVmaW5lCj4gUEFHRV9PRkZMSU5FX01BUENPVU5UX1ZBTFVFIGluIG1ha2VkdW1wZmlsZS4gV2Ug
aGF2ZSBiZWVuIGV4cG9ydGluZwo+IGtlcm5lbCBkYXRhL01BQ1JPIGRpcmVjdGx5LCB3aHkgdGhp
cyBvbmUgaXMgZXhjZXB0aW9uYWwuCj4gCgoxLiBXZSBhcmUgbXVjaCBtb3JlIHNpbWlsYXIgdG8g
UEdfYnVkZHkgKGluIGNvbnRyYXN0IHRvIGFjdHVhbCBwYWdlCmZsYWdzKSwgYW5kIGZvciBQR19i
dWRkeSBpdCBpcyBoaXN0b3JpY2FsbHkgaGFuZGxlZCBsaWtlIHRoaXMgKGFuZCBJCnRoaW5rIGl0
IG1ha2VzIHNlbnNlIHRvIGV4cG9zZSB0aGVzZSBhcyBhY3R1YWwgTUFQQ09VTlRfVkFMVUVzKS4K
CjIuIFJpZ2h0IG5vdyBvbmx5IG9uZSBwYWdlIHR5cGUgcGVyIHBhZ2UgaXMgc3VwcG9ydGVkLiBU
aGVyZWZvcmUgb25seQpleGFjdGx5IG9uZSB2YWx1ZSBpbiBtYXBjb3VudCBpbmRpY2F0ZXMgZS5n
LiBQYWdlQnVkZHkoKS9QYWdlT2ZmbGluZSgpLgoKTm93LCBpZiB3ZSBldmVyIGRlY2lkZSB0byBj
aGFuZ2UgdGhpcyAoZS5nLiB0cmVhdCB0aGVtIGxpa2UgcmVhbCBmbGFncyksCml0IGlzIG11Y2gg
ZWFzaWVyIHRvIHN3aXRjaCB0byBQR19vZmZsaW5lL1BHX2J1ZGR5IHRoZW4uIFdlIGNhbiBkaXJl
Y3RseQpzZWUgaW4gbWFrZWR1bXBmaWxlIHRoYXQgLipfTUFQQ09VTlRfVkFMVUUgaXMgbm8gbG9u
Z2VyIGF2YWlsYWJsZSBidXQKaW5zdGVhZCBlLmcuIFBHX29mZmxpbmUgYW5kIFBHX2J1ZGR5LiBJ
bnN0ZWFkIHdlIHdvdWxkIG5vIHNlZSBhIGNoYW5nZQppbiBtYWtlZHVtcGZpbGUgYW5kIHdvdWxk
IGhhdmUgdG8gcmVseSBvbiBvdGhlciBwcm9wZXJ0aWVzLgoKSWYgdGhlcmUgYXJlIG5vIHN0cm9u
ZyBvcGluaW9ucyBJIHdpbGwgbGVhdmUgaXQgbGlrZSB0aGlzLgoKVGhhbmtzIQoKPiBUaGFua3MK
PiBCYW9xdWFuCj4gCgoKLS0gCgpUaGFua3MsCgpEYXZpZCAvIGRoaWxkZW5iCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
