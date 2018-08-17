From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC 1/2] drivers/base: export
 lock_device_hotplug/unlock_device_hotplug
Date: Fri, 17 Aug 2018 11:41:24 +0200
Message-ID: <42df9062-f647-3ad6-5a07-be2b99531119__1658.81893267414$1534498823$gmane$org@redhat.com>
References: <20180817075901.4608-1-david@redhat.com>
 <20180817075901.4608-2-david@redhat.com> <20180817084146.GB14725@kroah.com>
 <5a5d73e9-e4aa-ffed-a2e3-8aef64e61923@redhat.com>
 <CAJZ5v0gkYV8o2Eq+EcGT=OP1tQGPGVVe3n9VGD6z7KAVVqhv9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=/cqo=la=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1fqbG8-0000tS-HD
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 09:41:32 +0000
In-Reply-To: <CAJZ5v0gkYV8o2Eq+EcGT=OP1tQGPGVVe3n9VGD6z7KAVVqhv9w@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Linux Memory Management List <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>, kys@microsoft.com, linux-s390@vger.kernel.org, sthemmin@microsoft.com, Pavel Tatashin <pasha.tatashin@oracle.com>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, haiyangz@microsoft.com, Dan Williams <dan.j.williams@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, osalvador@suse.de, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, devel@linuxdriverproject.org, Vitaly
List-Id: xen-devel@lists.xenproject.org

T24gMTcuMDguMjAxOCAxMTowMywgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gT24gRnJpLCBB
dWcgMTcsIDIwMTggYXQgMTA6NTYgQU0gRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5j
b20+IHdyb3RlOgo+Pgo+PiBPbiAxNy4wOC4yMDE4IDEwOjQxLCBHcmVnIEtyb2FoLUhhcnRtYW4g
d3JvdGU6Cj4+PiBPbiBGcmksIEF1ZyAxNywgMjAxOCBhdCAwOTo1OTowMEFNICswMjAwLCBEYXZp
ZCBIaWxkZW5icmFuZCB3cm90ZToKPj4+PiBGcm9tOiBWaXRhbHkgS3V6bmV0c292IDx2a3V6bmV0
c0ByZWRoYXQuY29tPgo+Pj4+Cj4+Pj4gV2VsbCByZXF1aXJlIHRvIGNhbGwgYWRkX21lbW9yeSgp
L2FkZF9tZW1vcnlfcmVzb3VyY2UoKSB3aXRoCj4+Pj4gZGV2aWNlX2hvdHBsdWdfbG9jayBoZWxk
LCB0byBhdm9pZCBhIGxvY2sgaW52ZXJzaW9uLiBBbGxvdyBleHRlcm5hbCBtb2R1bGVzCj4+Pj4g
KGUuZy4gaHZfYmFsbG9vbikgdGhhdCBtYWtlIHVzZSBvZiBhZGRfbWVtb3J5KCkvYWRkX21lbW9y
eV9yZXNvdXJjZSgpIHRvCj4+Pj4gbG9jayBkZXZpY2UgaG90cGx1Zy4KPj4+Pgo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFZpdGFseSBLdXpuZXRzb3YgPHZrdXpuZXRzQHJlZGhhdC5jb20+Cj4+Pj4gW21v
ZGlmeSBwYXRjaCBkZXNjcmlwdGlvbl0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIaWxkZW5i
cmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KPj4+PiAtLS0KPj4+PiAgZHJpdmVycy9iYXNlL2NvcmUu
YyB8IDIgKysKPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmFzZS9jb3JlLmMgYi9kcml2ZXJzL2Jhc2UvY29yZS5jCj4+
Pj4gaW5kZXggMDRiYmNkNzc5ZTExLi45MDEwYjllOTQyYjUgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJp
dmVycy9iYXNlL2NvcmUuYwo+Pj4+ICsrKyBiL2RyaXZlcnMvYmFzZS9jb3JlLmMKPj4+PiBAQCAt
NzAwLDExICs3MDAsMTMgQEAgdm9pZCBsb2NrX2RldmljZV9ob3RwbHVnKHZvaWQpCj4+Pj4gIHsK
Pj4+PiAgICAgIG11dGV4X2xvY2soJmRldmljZV9ob3RwbHVnX2xvY2spOwo+Pj4+ICB9Cj4+Pj4g
K0VYUE9SVF9TWU1CT0xfR1BMKGxvY2tfZGV2aWNlX2hvdHBsdWcpOwo+Pj4+Cj4+Pj4gIHZvaWQg
dW5sb2NrX2RldmljZV9ob3RwbHVnKHZvaWQpCj4+Pj4gIHsKPj4+PiAgICAgIG11dGV4X3VubG9j
aygmZGV2aWNlX2hvdHBsdWdfbG9jayk7Cj4+Pj4gIH0KPj4+PiArRVhQT1JUX1NZTUJPTF9HUEwo
dW5sb2NrX2RldmljZV9ob3RwbHVnKTsKPj4+Cj4+PiBJZiB0aGVzZSBhcmUgZ29pbmcgdG8gYmUg
Imdsb2JhbCIgc3ltYm9scywgbGV0J3MgcHJvcGVybHkgbmFtZSB0aGVtLgo+Pj4gZGV2aWNlX2hv
dHBsdWdfbG9jay91bmxvY2sgd291bGQgYmUgYmV0dGVyLiAgQnV0IEkgYW0gX3JlYWxseV8gbmVy
dm91cwo+Pj4gYWJvdXQgbGV0dGluZyBzdHVmZiBvdXRzaWRlIG9mIHRoZSBkcml2ZXIgY29yZSBt
ZXNzIHdpdGggdGhpcywgYXMgcGVvcGxlCj4+PiBiZXR0ZXIga25vdyB3aGF0IHRoZXkgYXJlIGRv
aW5nLgo+Pgo+PiBUaGUgb25seSAicHJvYmxlbSIgaXMgdGhhdCB3ZSBoYXZlIGtlcm5lbCBtb2R1
bGVzIChmb3IgcGFyYXZpcnR1YWxpemVkCj4+IGRldmljZXMpIHRoYXQgY2FsbCBhZGRfbWVtb3J5
KCkuIFRoaXMgaXMgSHlwZXItViByaWdodCBub3csIGJ1dCB3ZSBtaWdodAo+PiBoYXZlIG90aGVy
IG9uZXMgaW4gdGhlIGZ1dHVyZS4gV2l0aG91dCB0aGVtIHdlIHdvdWxkIG5vdCBoYXZlIHRvIGV4
cG9ydAo+PiBpdC4gV2UgbWlnaHQgYWxzbyBnZXQga2VybmVsIG1vZHVsZXMgdGhhdCB3YW50IHRv
IGNhbGwgcmVtb3ZlX21lbW9yeSgpIC0KPj4gd2hpY2ggd2lsbCByZXF1aXJlIHRoZSBkZXZpY2Vf
aG90cGx1Z19sb2NrIGFzIG9mIG5vdy4KPj4KPj4gV2hhdCB3ZSBjb3VsZCBkbyBpcwo+Pgo+PiBh
KSBhZGRfbWVtb3J5KCkgLT4gX2FkZF9tZW1vcnkoKSBhbmQgZG9uJ3QgZXhwb3J0IGl0Cj4+IGIp
IGFkZF9tZW1vcnkoKSB0YWtlcyB0aGUgZGV2aWNlX2hvdHBsdWdfbG9jayBhbmQgY2FsbHMgX2Fk
ZF9tZW1vcnkoKSAuCj4+IFdlIGV4cG9ydCB0aGF0IG9uZS4KPj4gYykgVXNlIGFkZF9tZW1vcnko
KSBpbiBleHRlcm5hbCBtb2R1bGVzIG9ubHkKPj4KPj4gU2ltaWxhciB3cmFwcGVyIHdvdWxkIGJl
IG5lZWRlZCBlLmcuIGZvciByZW1vdmVfbWVtb3J5KCkgbGF0ZXIgb24uCj4gCj4gVGhhdCB3b3Vs
ZCBiZSBzYWZlciBJTU8sIGFzIGl0IHdvdWxkIHByZXZlbnQgZGV2ZWxvcGVycyBmcm9tIHVzaW5n
Cj4gYWRkX21lbW9yeSgpIHdpdGhvdXQgdGhlIGxvY2ssIHNheS4KPiAKPiBJZiB0aGUgbG9jayBp
cyBhbHdheXMgZ29pbmcgdG8gYmUgcmVxdWlyZWQgZm9yIGFkZF9tZW1vcnkoKSwgbWFrZSBpdAo+
IGhhcmQgKG9yIGV2ZW50IGltcG9zc2libGUpIHRvIHVzZSB0aGUgbGF0dGVyIHdpdGhvdXQgaXQu
Cj4gCgpJZiB0aGVyZSBhcmUgbm8gb2JqZWN0aW9ucywgSSdsbCBnbyBpbnRvIHRoYXQgZGlyZWN0
aW9uLiBCdXQgSSdsbCB3YWl0CmZvciBtb3JlIGNvbW1lbnRzIHJlZ2FyZGluZyB0aGUgZ2VuZXJh
bCBjb25jZXB0IGZpcnN0LgoKVGhhbmtzIQoKLS0gCgpUaGFua3MsCgpEYXZpZCAvIGRoaWxkZW5i
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
