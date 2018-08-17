From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH RFC 1/2] drivers/base: export
 lock_device_hotplug/unlock_device_hotplug
Date: Fri, 17 Aug 2018 11:03:09 +0200
Message-ID: <CAJZ5v0gkYV8o2Eq+EcGT=OP1tQGPGVVe3n9VGD6z7KAVVqhv9w__40378.7662894048$1534496530$gmane$org@mail.gmail.com>
References: <20180817075901.4608-1-david@redhat.com>
 <20180817075901.4608-2-david@redhat.com>
 <20180817084146.GB14725@kroah.com>
 <5a5d73e9-e4aa-ffed-a2e3-8aef64e61923@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8xpb=la=gmail.com=rjwysocki@srs-us1.protection.inumbo.net>)
 id 1fqafC-0005dP-S8
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 09:03:22 +0000
Received: by mail-oi0-f68.google.com with SMTP id v8-v6so12851695oie.5
 for <xen-devel@lists.xenproject.org>; Fri, 17 Aug 2018 02:03:21 -0700 (PDT)
In-Reply-To: <5a5d73e9-e4aa-ffed-a2e3-8aef64e61923@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Linux Memory Management List <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>, kys@microsoft.com, linux-s390@vger.kernel.org, sthemmin@microsoft.com, Pavel Tatashin <pasha.tatashin@oracle.com>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, haiyangz@microsoft.com, Dan Williams <dan.j.williams@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, osalvador@suse.de, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, devel@linuxdriverproject.org, Vitaly
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMTcsIDIwMTggYXQgMTA6NTYgQU0gRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlk
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gMTcuMDguMjAxOCAxMDo0MSwgR3JlZyBLcm9haC1I
YXJ0bWFuIHdyb3RlOgo+ID4gT24gRnJpLCBBdWcgMTcsIDIwMTggYXQgMDk6NTk6MDBBTSArMDIw
MCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gPj4gRnJvbTogVml0YWx5IEt1em5ldHNvdiA8
dmt1em5ldHNAcmVkaGF0LmNvbT4KPiA+Pgo+ID4+IFdlbGwgcmVxdWlyZSB0byBjYWxsIGFkZF9t
ZW1vcnkoKS9hZGRfbWVtb3J5X3Jlc291cmNlKCkgd2l0aAo+ID4+IGRldmljZV9ob3RwbHVnX2xv
Y2sgaGVsZCwgdG8gYXZvaWQgYSBsb2NrIGludmVyc2lvbi4gQWxsb3cgZXh0ZXJuYWwgbW9kdWxl
cwo+ID4+IChlLmcuIGh2X2JhbGxvb24pIHRoYXQgbWFrZSB1c2Ugb2YgYWRkX21lbW9yeSgpL2Fk
ZF9tZW1vcnlfcmVzb3VyY2UoKSB0bwo+ID4+IGxvY2sgZGV2aWNlIGhvdHBsdWcuCj4gPj4KPiA+
PiBTaWduZWQtb2ZmLWJ5OiBWaXRhbHkgS3V6bmV0c292IDx2a3V6bmV0c0ByZWRoYXQuY29tPgo+
ID4+IFttb2RpZnkgcGF0Y2ggZGVzY3JpcHRpb25dCj4gPj4gU2lnbmVkLW9mZi1ieTogRGF2aWQg
SGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Cj4gPj4gLS0tCj4gPj4gIGRyaXZlcnMvYmFz
ZS9jb3JlLmMgfCAyICsrCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+
Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jhc2UvY29yZS5jIGIvZHJpdmVycy9iYXNlL2Nv
cmUuYwo+ID4+IGluZGV4IDA0YmJjZDc3OWUxMS4uOTAxMGI5ZTk0MmI1IDEwMDY0NAo+ID4+IC0t
LSBhL2RyaXZlcnMvYmFzZS9jb3JlLmMKPiA+PiArKysgYi9kcml2ZXJzL2Jhc2UvY29yZS5jCj4g
Pj4gQEAgLTcwMCwxMSArNzAwLDEzIEBAIHZvaWQgbG9ja19kZXZpY2VfaG90cGx1Zyh2b2lkKQo+
ID4+ICB7Cj4gPj4gICAgICBtdXRleF9sb2NrKCZkZXZpY2VfaG90cGx1Z19sb2NrKTsKPiA+PiAg
fQo+ID4+ICtFWFBPUlRfU1lNQk9MX0dQTChsb2NrX2RldmljZV9ob3RwbHVnKTsKPiA+Pgo+ID4+
ICB2b2lkIHVubG9ja19kZXZpY2VfaG90cGx1Zyh2b2lkKQo+ID4+ICB7Cj4gPj4gICAgICBtdXRl
eF91bmxvY2soJmRldmljZV9ob3RwbHVnX2xvY2spOwo+ID4+ICB9Cj4gPj4gK0VYUE9SVF9TWU1C
T0xfR1BMKHVubG9ja19kZXZpY2VfaG90cGx1Zyk7Cj4gPgo+ID4gSWYgdGhlc2UgYXJlIGdvaW5n
IHRvIGJlICJnbG9iYWwiIHN5bWJvbHMsIGxldCdzIHByb3Blcmx5IG5hbWUgdGhlbS4KPiA+IGRl
dmljZV9ob3RwbHVnX2xvY2svdW5sb2NrIHdvdWxkIGJlIGJldHRlci4gIEJ1dCBJIGFtIF9yZWFs
bHlfIG5lcnZvdXMKPiA+IGFib3V0IGxldHRpbmcgc3R1ZmYgb3V0c2lkZSBvZiB0aGUgZHJpdmVy
IGNvcmUgbWVzcyB3aXRoIHRoaXMsIGFzIHBlb3BsZQo+ID4gYmV0dGVyIGtub3cgd2hhdCB0aGV5
IGFyZSBkb2luZy4KPgo+IFRoZSBvbmx5ICJwcm9ibGVtIiBpcyB0aGF0IHdlIGhhdmUga2VybmVs
IG1vZHVsZXMgKGZvciBwYXJhdmlydHVhbGl6ZWQKPiBkZXZpY2VzKSB0aGF0IGNhbGwgYWRkX21l
bW9yeSgpLiBUaGlzIGlzIEh5cGVyLVYgcmlnaHQgbm93LCBidXQgd2UgbWlnaHQKPiBoYXZlIG90
aGVyIG9uZXMgaW4gdGhlIGZ1dHVyZS4gV2l0aG91dCB0aGVtIHdlIHdvdWxkIG5vdCBoYXZlIHRv
IGV4cG9ydAo+IGl0LiBXZSBtaWdodCBhbHNvIGdldCBrZXJuZWwgbW9kdWxlcyB0aGF0IHdhbnQg
dG8gY2FsbCByZW1vdmVfbWVtb3J5KCkgLQo+IHdoaWNoIHdpbGwgcmVxdWlyZSB0aGUgZGV2aWNl
X2hvdHBsdWdfbG9jayBhcyBvZiBub3cuCj4KPiBXaGF0IHdlIGNvdWxkIGRvIGlzCj4KPiBhKSBh
ZGRfbWVtb3J5KCkgLT4gX2FkZF9tZW1vcnkoKSBhbmQgZG9uJ3QgZXhwb3J0IGl0Cj4gYikgYWRk
X21lbW9yeSgpIHRha2VzIHRoZSBkZXZpY2VfaG90cGx1Z19sb2NrIGFuZCBjYWxscyBfYWRkX21l
bW9yeSgpIC4KPiBXZSBleHBvcnQgdGhhdCBvbmUuCj4gYykgVXNlIGFkZF9tZW1vcnkoKSBpbiBl
eHRlcm5hbCBtb2R1bGVzIG9ubHkKPgo+IFNpbWlsYXIgd3JhcHBlciB3b3VsZCBiZSBuZWVkZWQg
ZS5nLiBmb3IgcmVtb3ZlX21lbW9yeSgpIGxhdGVyIG9uLgoKVGhhdCB3b3VsZCBiZSBzYWZlciBJ
TU8sIGFzIGl0IHdvdWxkIHByZXZlbnQgZGV2ZWxvcGVycyBmcm9tIHVzaW5nCmFkZF9tZW1vcnko
KSB3aXRob3V0IHRoZSBsb2NrLCBzYXkuCgpJZiB0aGUgbG9jayBpcyBhbHdheXMgZ29pbmcgdG8g
YmUgcmVxdWlyZWQgZm9yIGFkZF9tZW1vcnkoKSwgbWFrZSBpdApoYXJkIChvciBldmVudCBpbXBv
c3NpYmxlKSB0byB1c2UgdGhlIGxhdHRlciB3aXRob3V0IGl0LgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
