From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC 1/2] drivers/base: export
 lock_device_hotplug/unlock_device_hotplug
Date: Fri, 17 Aug 2018 13:04:58 +0200
Message-ID: <4ac624be-d2d6-5975-821f-b20a475781dc__43266.5510023527$1534503831$gmane$org@redhat.com>
References: <20180817075901.4608-1-david@redhat.com>
 <20180817075901.4608-2-david@redhat.com> <20180817084146.GB14725@kroah.com>
 <5a5d73e9-e4aa-ffed-a2e3-8aef64e61923@redhat.com>
 <CAJZ5v0gkYV8o2Eq+EcGT=OP1tQGPGVVe3n9VGD6z7KAVVqhv9w@mail.gmail.com>
 <42df9062-f647-3ad6-5a07-be2b99531119@redhat.com>
 <20180817100604.GA18164@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=/cqo=la=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1fqcZ0-0001hd-EJ
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 11:05:06 +0000
In-Reply-To: <20180817100604.GA18164@kroah.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Hocko <mhocko@suse.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Linux Memory Management List <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>, linux-s390@vger.kernel.org, sthemmin@microsoft.com, Pavel Tatashin <pasha.tatashin@oracle.com>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, haiyangz@microsoft.com, Dan Williams <dan.j.williams@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, osalvador@suse.de, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, devel@linuxdriverproject.org, Andrew Morton <akpm@linux-foundation.org>linu
List-Id: xen-devel@lists.xenproject.org

T24gMTcuMDguMjAxOCAxMjowNiwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOgo+IE9uIEZyaSwg
QXVnIDE3LCAyMDE4IGF0IDExOjQxOjI0QU0gKzAyMDAsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3Rl
Ogo+PiBPbiAxNy4wOC4yMDE4IDExOjAzLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPj4+IE9u
IEZyaSwgQXVnIDE3LCAyMDE4IGF0IDEwOjU2IEFNIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEBy
ZWRoYXQuY29tPiB3cm90ZToKPj4+Pgo+Pj4+IE9uIDE3LjA4LjIwMTggMTA6NDEsIEdyZWcgS3Jv
YWgtSGFydG1hbiB3cm90ZToKPj4+Pj4gT24gRnJpLCBBdWcgMTcsIDIwMTggYXQgMDk6NTk6MDBB
TSArMDIwMCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+Pj4+PiBGcm9tOiBWaXRhbHkgS3V6
bmV0c292IDx2a3V6bmV0c0ByZWRoYXQuY29tPgo+Pj4+Pj4KPj4+Pj4+IFdlbGwgcmVxdWlyZSB0
byBjYWxsIGFkZF9tZW1vcnkoKS9hZGRfbWVtb3J5X3Jlc291cmNlKCkgd2l0aAo+Pj4+Pj4gZGV2
aWNlX2hvdHBsdWdfbG9jayBoZWxkLCB0byBhdm9pZCBhIGxvY2sgaW52ZXJzaW9uLiBBbGxvdyBl
eHRlcm5hbCBtb2R1bGVzCj4+Pj4+PiAoZS5nLiBodl9iYWxsb29uKSB0aGF0IG1ha2UgdXNlIG9m
IGFkZF9tZW1vcnkoKS9hZGRfbWVtb3J5X3Jlc291cmNlKCkgdG8KPj4+Pj4+IGxvY2sgZGV2aWNl
IGhvdHBsdWcuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogVml0YWx5IEt1em5ldHNvdiA8
dmt1em5ldHNAcmVkaGF0LmNvbT4KPj4+Pj4+IFttb2RpZnkgcGF0Y2ggZGVzY3JpcHRpb25dCj4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4K
Pj4+Pj4+IC0tLQo+Pj4+Pj4gIGRyaXZlcnMvYmFzZS9jb3JlLmMgfCAyICsrCj4+Pj4+PiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2Jhc2UvY29yZS5jIGIvZHJpdmVycy9iYXNlL2NvcmUuYwo+Pj4+Pj4gaW5kZXggMDRi
YmNkNzc5ZTExLi45MDEwYjllOTQyYjUgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2Jhc2Uv
Y29yZS5jCj4+Pj4+PiArKysgYi9kcml2ZXJzL2Jhc2UvY29yZS5jCj4+Pj4+PiBAQCAtNzAwLDEx
ICs3MDAsMTMgQEAgdm9pZCBsb2NrX2RldmljZV9ob3RwbHVnKHZvaWQpCj4+Pj4+PiAgewo+Pj4+
Pj4gICAgICBtdXRleF9sb2NrKCZkZXZpY2VfaG90cGx1Z19sb2NrKTsKPj4+Pj4+ICB9Cj4+Pj4+
PiArRVhQT1JUX1NZTUJPTF9HUEwobG9ja19kZXZpY2VfaG90cGx1Zyk7Cj4+Pj4+Pgo+Pj4+Pj4g
IHZvaWQgdW5sb2NrX2RldmljZV9ob3RwbHVnKHZvaWQpCj4+Pj4+PiAgewo+Pj4+Pj4gICAgICBt
dXRleF91bmxvY2soJmRldmljZV9ob3RwbHVnX2xvY2spOwo+Pj4+Pj4gIH0KPj4+Pj4+ICtFWFBP
UlRfU1lNQk9MX0dQTCh1bmxvY2tfZGV2aWNlX2hvdHBsdWcpOwo+Pj4+Pgo+Pj4+PiBJZiB0aGVz
ZSBhcmUgZ29pbmcgdG8gYmUgImdsb2JhbCIgc3ltYm9scywgbGV0J3MgcHJvcGVybHkgbmFtZSB0
aGVtLgo+Pj4+PiBkZXZpY2VfaG90cGx1Z19sb2NrL3VubG9jayB3b3VsZCBiZSBiZXR0ZXIuICBC
dXQgSSBhbSBfcmVhbGx5XyBuZXJ2b3VzCj4+Pj4+IGFib3V0IGxldHRpbmcgc3R1ZmYgb3V0c2lk
ZSBvZiB0aGUgZHJpdmVyIGNvcmUgbWVzcyB3aXRoIHRoaXMsIGFzIHBlb3BsZQo+Pj4+PiBiZXR0
ZXIga25vdyB3aGF0IHRoZXkgYXJlIGRvaW5nLgo+Pj4+Cj4+Pj4gVGhlIG9ubHkgInByb2JsZW0i
IGlzIHRoYXQgd2UgaGF2ZSBrZXJuZWwgbW9kdWxlcyAoZm9yIHBhcmF2aXJ0dWFsaXplZAo+Pj4+
IGRldmljZXMpIHRoYXQgY2FsbCBhZGRfbWVtb3J5KCkuIFRoaXMgaXMgSHlwZXItViByaWdodCBu
b3csIGJ1dCB3ZSBtaWdodAo+Pj4+IGhhdmUgb3RoZXIgb25lcyBpbiB0aGUgZnV0dXJlLiBXaXRo
b3V0IHRoZW0gd2Ugd291bGQgbm90IGhhdmUgdG8gZXhwb3J0Cj4+Pj4gaXQuIFdlIG1pZ2h0IGFs
c28gZ2V0IGtlcm5lbCBtb2R1bGVzIHRoYXQgd2FudCB0byBjYWxsIHJlbW92ZV9tZW1vcnkoKSAt
Cj4+Pj4gd2hpY2ggd2lsbCByZXF1aXJlIHRoZSBkZXZpY2VfaG90cGx1Z19sb2NrIGFzIG9mIG5v
dy4KPj4+Pgo+Pj4+IFdoYXQgd2UgY291bGQgZG8gaXMKPj4+Pgo+Pj4+IGEpIGFkZF9tZW1vcnko
KSAtPiBfYWRkX21lbW9yeSgpIGFuZCBkb24ndCBleHBvcnQgaXQKPj4+PiBiKSBhZGRfbWVtb3J5
KCkgdGFrZXMgdGhlIGRldmljZV9ob3RwbHVnX2xvY2sgYW5kIGNhbGxzIF9hZGRfbWVtb3J5KCkg
Lgo+Pj4+IFdlIGV4cG9ydCB0aGF0IG9uZS4KPj4+PiBjKSBVc2UgYWRkX21lbW9yeSgpIGluIGV4
dGVybmFsIG1vZHVsZXMgb25seQo+Pj4+Cj4+Pj4gU2ltaWxhciB3cmFwcGVyIHdvdWxkIGJlIG5l
ZWRlZCBlLmcuIGZvciByZW1vdmVfbWVtb3J5KCkgbGF0ZXIgb24uCj4+Pgo+Pj4gVGhhdCB3b3Vs
ZCBiZSBzYWZlciBJTU8sIGFzIGl0IHdvdWxkIHByZXZlbnQgZGV2ZWxvcGVycyBmcm9tIHVzaW5n
Cj4+PiBhZGRfbWVtb3J5KCkgd2l0aG91dCB0aGUgbG9jaywgc2F5Lgo+Pj4KPj4+IElmIHRoZSBs
b2NrIGlzIGFsd2F5cyBnb2luZyB0byBiZSByZXF1aXJlZCBmb3IgYWRkX21lbW9yeSgpLCBtYWtl
IGl0Cj4+PiBoYXJkIChvciBldmVudCBpbXBvc3NpYmxlKSB0byB1c2UgdGhlIGxhdHRlciB3aXRo
b3V0IGl0Lgo+Pj4KPj4KPj4gSWYgdGhlcmUgYXJlIG5vIG9iamVjdGlvbnMsIEknbGwgZ28gaW50
byB0aGF0IGRpcmVjdGlvbi4gQnV0IEknbGwgd2FpdAo+PiBmb3IgbW9yZSBjb21tZW50cyByZWdh
cmRpbmcgdGhlIGdlbmVyYWwgY29uY2VwdCBmaXJzdC4KPiAKPiBJdCBpcyB0aGUgbWlkZGxlIG9m
IHRoZSBtZXJnZSB3aW5kb3csIGFuZCBtYWludGFpbmVycyBhcmUgcmVhbGx5IGJ1c3kKPiByaWdo
dCBub3cuICBJIGRvdWJ0IHlvdSB3aWxsIGdldCBtYW55IHJldmlldyBjb21tZW50cyBqdXN0IHll
dC4uLgo+IAoKVGhpcyBoYXMgYmVlbiBicm9rZW4gc2luY2UgMjAxNSwgc28gSSBndWVzcyBpdCBj
YW4gd2FpdCBhIGJpdCA6KQoKLS0gCgpUaGFua3MsCgpEYXZpZCAvIGRoaWxkZW5iCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
