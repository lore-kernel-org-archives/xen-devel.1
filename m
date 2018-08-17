From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH RFC 1/2] drivers/base: export
 lock_device_hotplug/unlock_device_hotplug
Date: Fri, 17 Aug 2018 12:06:04 +0200
Message-ID: <20180817100604.GA18164__18082.8803954229$1534500293$gmane$org@kroah.com>
References: <20180817075901.4608-1-david@redhat.com>
 <20180817075901.4608-2-david@redhat.com>
 <20180817084146.GB14725@kroah.com>
 <5a5d73e9-e4aa-ffed-a2e3-8aef64e61923@redhat.com>
 <CAJZ5v0gkYV8o2Eq+EcGT=OP1tQGPGVVe3n9VGD6z7KAVVqhv9w@mail.gmail.com>
 <42df9062-f647-3ad6-5a07-be2b99531119@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jc64=la=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1fqbdx-0003rn-Kr
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 10:06:09 +0000
Content-Disposition: inline
In-Reply-To: <42df9062-f647-3ad6-5a07-be2b99531119@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Linux Memory Management List <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>, linux-s390@vger.kernel.org, sthemmin@microsoft.com, Pavel Tatashin <pasha.tatashin@oracle.com>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, haiyangz@microsoft.com, Dan Williams <dan.j.williams@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, osalvador@suse.de, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, devel@linuxdriverproject.org, Andrew Morton <akpm@linux-foundation.org>linu
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMTcsIDIwMTggYXQgMTE6NDE6MjRBTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gT24gMTcuMDguMjAxOCAxMTowMywgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6
Cj4gPiBPbiBGcmksIEF1ZyAxNywgMjAxOCBhdCAxMDo1NiBBTSBEYXZpZCBIaWxkZW5icmFuZCA8
ZGF2aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBPbiAxNy4wOC4yMDE4IDEwOjQxLCBH
cmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4gPj4+IE9uIEZyaSwgQXVnIDE3LCAyMDE4IGF0IDA5
OjU5OjAwQU0gKzAyMDAsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+ID4+Pj4gRnJvbTogVml0
YWx5IEt1em5ldHNvdiA8dmt1em5ldHNAcmVkaGF0LmNvbT4KPiA+Pj4+Cj4gPj4+PiBXZWxsIHJl
cXVpcmUgdG8gY2FsbCBhZGRfbWVtb3J5KCkvYWRkX21lbW9yeV9yZXNvdXJjZSgpIHdpdGgKPiA+
Pj4+IGRldmljZV9ob3RwbHVnX2xvY2sgaGVsZCwgdG8gYXZvaWQgYSBsb2NrIGludmVyc2lvbi4g
QWxsb3cgZXh0ZXJuYWwgbW9kdWxlcwo+ID4+Pj4gKGUuZy4gaHZfYmFsbG9vbikgdGhhdCBtYWtl
IHVzZSBvZiBhZGRfbWVtb3J5KCkvYWRkX21lbW9yeV9yZXNvdXJjZSgpIHRvCj4gPj4+PiBsb2Nr
IGRldmljZSBob3RwbHVnLgo+ID4+Pj4KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IFZpdGFseSBLdXpu
ZXRzb3YgPHZrdXpuZXRzQHJlZGhhdC5jb20+Cj4gPj4+PiBbbW9kaWZ5IHBhdGNoIGRlc2NyaXB0
aW9uXQo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhh
dC5jb20+Cj4gPj4+PiAtLS0KPiA+Pj4+ICBkcml2ZXJzL2Jhc2UvY29yZS5jIHwgMiArKwo+ID4+
Pj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+Pj4+Cj4gPj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9iYXNlL2NvcmUuYyBiL2RyaXZlcnMvYmFzZS9jb3JlLmMKPiA+Pj4+IGlu
ZGV4IDA0YmJjZDc3OWUxMS4uOTAxMGI5ZTk0MmI1IDEwMDY0NAo+ID4+Pj4gLS0tIGEvZHJpdmVy
cy9iYXNlL2NvcmUuYwo+ID4+Pj4gKysrIGIvZHJpdmVycy9iYXNlL2NvcmUuYwo+ID4+Pj4gQEAg
LTcwMCwxMSArNzAwLDEzIEBAIHZvaWQgbG9ja19kZXZpY2VfaG90cGx1Zyh2b2lkKQo+ID4+Pj4g
IHsKPiA+Pj4+ICAgICAgbXV0ZXhfbG9jaygmZGV2aWNlX2hvdHBsdWdfbG9jayk7Cj4gPj4+PiAg
fQo+ID4+Pj4gK0VYUE9SVF9TWU1CT0xfR1BMKGxvY2tfZGV2aWNlX2hvdHBsdWcpOwo+ID4+Pj4K
PiA+Pj4+ICB2b2lkIHVubG9ja19kZXZpY2VfaG90cGx1Zyh2b2lkKQo+ID4+Pj4gIHsKPiA+Pj4+
ICAgICAgbXV0ZXhfdW5sb2NrKCZkZXZpY2VfaG90cGx1Z19sb2NrKTsKPiA+Pj4+ICB9Cj4gPj4+
PiArRVhQT1JUX1NZTUJPTF9HUEwodW5sb2NrX2RldmljZV9ob3RwbHVnKTsKPiA+Pj4KPiA+Pj4g
SWYgdGhlc2UgYXJlIGdvaW5nIHRvIGJlICJnbG9iYWwiIHN5bWJvbHMsIGxldCdzIHByb3Blcmx5
IG5hbWUgdGhlbS4KPiA+Pj4gZGV2aWNlX2hvdHBsdWdfbG9jay91bmxvY2sgd291bGQgYmUgYmV0
dGVyLiAgQnV0IEkgYW0gX3JlYWxseV8gbmVydm91cwo+ID4+PiBhYm91dCBsZXR0aW5nIHN0dWZm
IG91dHNpZGUgb2YgdGhlIGRyaXZlciBjb3JlIG1lc3Mgd2l0aCB0aGlzLCBhcyBwZW9wbGUKPiA+
Pj4gYmV0dGVyIGtub3cgd2hhdCB0aGV5IGFyZSBkb2luZy4KPiA+Pgo+ID4+IFRoZSBvbmx5ICJw
cm9ibGVtIiBpcyB0aGF0IHdlIGhhdmUga2VybmVsIG1vZHVsZXMgKGZvciBwYXJhdmlydHVhbGl6
ZWQKPiA+PiBkZXZpY2VzKSB0aGF0IGNhbGwgYWRkX21lbW9yeSgpLiBUaGlzIGlzIEh5cGVyLVYg
cmlnaHQgbm93LCBidXQgd2UgbWlnaHQKPiA+PiBoYXZlIG90aGVyIG9uZXMgaW4gdGhlIGZ1dHVy
ZS4gV2l0aG91dCB0aGVtIHdlIHdvdWxkIG5vdCBoYXZlIHRvIGV4cG9ydAo+ID4+IGl0LiBXZSBt
aWdodCBhbHNvIGdldCBrZXJuZWwgbW9kdWxlcyB0aGF0IHdhbnQgdG8gY2FsbCByZW1vdmVfbWVt
b3J5KCkgLQo+ID4+IHdoaWNoIHdpbGwgcmVxdWlyZSB0aGUgZGV2aWNlX2hvdHBsdWdfbG9jayBh
cyBvZiBub3cuCj4gPj4KPiA+PiBXaGF0IHdlIGNvdWxkIGRvIGlzCj4gPj4KPiA+PiBhKSBhZGRf
bWVtb3J5KCkgLT4gX2FkZF9tZW1vcnkoKSBhbmQgZG9uJ3QgZXhwb3J0IGl0Cj4gPj4gYikgYWRk
X21lbW9yeSgpIHRha2VzIHRoZSBkZXZpY2VfaG90cGx1Z19sb2NrIGFuZCBjYWxscyBfYWRkX21l
bW9yeSgpIC4KPiA+PiBXZSBleHBvcnQgdGhhdCBvbmUuCj4gPj4gYykgVXNlIGFkZF9tZW1vcnko
KSBpbiBleHRlcm5hbCBtb2R1bGVzIG9ubHkKPiA+Pgo+ID4+IFNpbWlsYXIgd3JhcHBlciB3b3Vs
ZCBiZSBuZWVkZWQgZS5nLiBmb3IgcmVtb3ZlX21lbW9yeSgpIGxhdGVyIG9uLgo+ID4gCj4gPiBU
aGF0IHdvdWxkIGJlIHNhZmVyIElNTywgYXMgaXQgd291bGQgcHJldmVudCBkZXZlbG9wZXJzIGZy
b20gdXNpbmcKPiA+IGFkZF9tZW1vcnkoKSB3aXRob3V0IHRoZSBsb2NrLCBzYXkuCj4gPiAKPiA+
IElmIHRoZSBsb2NrIGlzIGFsd2F5cyBnb2luZyB0byBiZSByZXF1aXJlZCBmb3IgYWRkX21lbW9y
eSgpLCBtYWtlIGl0Cj4gPiBoYXJkIChvciBldmVudCBpbXBvc3NpYmxlKSB0byB1c2UgdGhlIGxh
dHRlciB3aXRob3V0IGl0Lgo+ID4gCj4gCj4gSWYgdGhlcmUgYXJlIG5vIG9iamVjdGlvbnMsIEkn
bGwgZ28gaW50byB0aGF0IGRpcmVjdGlvbi4gQnV0IEknbGwgd2FpdAo+IGZvciBtb3JlIGNvbW1l
bnRzIHJlZ2FyZGluZyB0aGUgZ2VuZXJhbCBjb25jZXB0IGZpcnN0LgoKSXQgaXMgdGhlIG1pZGRs
ZSBvZiB0aGUgbWVyZ2Ugd2luZG93LCBhbmQgbWFpbnRhaW5lcnMgYXJlIHJlYWxseSBidXN5CnJp
Z2h0IG5vdy4gIEkgZG91YnQgeW91IHdpbGwgZ2V0IG1hbnkgcmV2aWV3IGNvbW1lbnRzIGp1c3Qg
eWV0Li4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
