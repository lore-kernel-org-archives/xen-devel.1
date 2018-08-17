From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH RFC 1/2] drivers/base: export
 lock_device_hotplug/unlock_device_hotplug
Date: Fri, 17 Aug 2018 10:57:25 +0200
Message-ID: <CAJZ5v0ja2wrwQ_X=8WW0Lvio+jE7nyqM_WSy1C+tzuKj6RsMdA__18237.355099018$1534496176$gmane$org@mail.gmail.com>
References: <20180817075901.4608-1-david@redhat.com>
 <20180817075901.4608-2-david@redhat.com>
 <20180817084146.GB14725@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8xpb=la=gmail.com=rjwysocki@srs-us1.protection.inumbo.net>)
 id 1fqaZe-0004VG-8U
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 08:57:38 +0000
Received: by mail-oi0-f68.google.com with SMTP id s198-v6so12799762oih.11
 for <xen-devel@lists.xenproject.org>; Fri, 17 Aug 2018 01:57:37 -0700 (PDT)
In-Reply-To: <20180817084146.GB14725@kroah.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Linux Memory Management List <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>, kys@microsoft.com, linux-s390@vger.kernel.org, sthemmin@microsoft.com, Pavel Tatashin <pasha.tatashin@oracle.com>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, haiyangz@microsoft.com, Dan Williams <dan.j.williams@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, osalvador@suse.de, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, devel@linuxdriverproject.org, Vitaly Kuznetsov <vkuznets@r>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMTcsIDIwMTggYXQgMTA6NDEgQU0gR3JlZyBLcm9haC1IYXJ0bWFuCjxncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEF1ZyAxNywgMjAxOCBh
dCAwOTo1OTowMEFNICswMjAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPiA+IEZyb206IFZp
dGFseSBLdXpuZXRzb3YgPHZrdXpuZXRzQHJlZGhhdC5jb20+Cj4gPgo+ID4gV2VsbCByZXF1aXJl
IHRvIGNhbGwgYWRkX21lbW9yeSgpL2FkZF9tZW1vcnlfcmVzb3VyY2UoKSB3aXRoCj4gPiBkZXZp
Y2VfaG90cGx1Z19sb2NrIGhlbGQsIHRvIGF2b2lkIGEgbG9jayBpbnZlcnNpb24uIEFsbG93IGV4
dGVybmFsIG1vZHVsZXMKPiA+IChlLmcuIGh2X2JhbGxvb24pIHRoYXQgbWFrZSB1c2Ugb2YgYWRk
X21lbW9yeSgpL2FkZF9tZW1vcnlfcmVzb3VyY2UoKSB0bwo+ID4gbG9jayBkZXZpY2UgaG90cGx1
Zy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBWaXRhbHkgS3V6bmV0c292IDx2a3V6bmV0c0ByZWRo
YXQuY29tPgo+ID4gW21vZGlmeSBwYXRjaCBkZXNjcmlwdGlvbl0KPiA+IFNpZ25lZC1vZmYtYnk6
IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVy
cy9iYXNlL2NvcmUuYyB8IDIgKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmFzZS9jb3JlLmMgYi9kcml2ZXJzL2Jhc2Uv
Y29yZS5jCj4gPiBpbmRleCAwNGJiY2Q3NzllMTEuLjkwMTBiOWU5NDJiNSAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvYmFzZS9jb3JlLmMKPiA+ICsrKyBiL2RyaXZlcnMvYmFzZS9jb3JlLmMKPiA+
IEBAIC03MDAsMTEgKzcwMCwxMyBAQCB2b2lkIGxvY2tfZGV2aWNlX2hvdHBsdWcodm9pZCkKPiA+
ICB7Cj4gPiAgICAgICBtdXRleF9sb2NrKCZkZXZpY2VfaG90cGx1Z19sb2NrKTsKPiA+ICB9Cj4g
PiArRVhQT1JUX1NZTUJPTF9HUEwobG9ja19kZXZpY2VfaG90cGx1Zyk7Cj4gPgo+ID4gIHZvaWQg
dW5sb2NrX2RldmljZV9ob3RwbHVnKHZvaWQpCj4gPiAgewo+ID4gICAgICAgbXV0ZXhfdW5sb2Nr
KCZkZXZpY2VfaG90cGx1Z19sb2NrKTsKPiA+ICB9Cj4gPiArRVhQT1JUX1NZTUJPTF9HUEwodW5s
b2NrX2RldmljZV9ob3RwbHVnKTsKPgo+IElmIHRoZXNlIGFyZSBnb2luZyB0byBiZSAiZ2xvYmFs
IiBzeW1ib2xzLCBsZXQncyBwcm9wZXJseSBuYW1lIHRoZW0uCj4gZGV2aWNlX2hvdHBsdWdfbG9j
ay91bmxvY2sgd291bGQgYmUgYmV0dGVyLgoKV2VsbCwgZGV2aWNlX2hvdHBsdWdfbG9jayBpcyB0
aGUgbmFtZSBvZiB0aGUgbG9jayBpdHNlbGYuIDotKQoKPiBCdXQgSSBhbSBfcmVhbGx5XyBuZXJ2
b3VzIGFib3V0IGxldHRpbmcgc3R1ZmYgb3V0c2lkZSBvZiB0aGUgZHJpdmVyIGNvcmUgbWVzcwo+
IHdpdGggdGhpcywgYXMgcGVvcGxlIGJldHRlciBrbm93IHdoYXQgdGhleSBhcmUgZG9pbmcuCj4K
PiBDYW4ndCB3ZSBqdXN0ICJsb2NrIiB0aGUgbWVtb3J5IHN0dWZmIGluc3RlYWQ/ICBXaHkgZG9l
cyB0aGUgZW50aXJldHkgb2YKPiB0aGUgZHJpdmVyIGNvcmUgbmVlZCB0byBiZSBtZXNzZWQgd2l0
aCBoZXJlPwoKQmVjYXVzZSwgaW4gZ2VuZXJhbCwgbWVtb3J5IGhvdHBsdWcgYW5kIGhvdHBsdWcg
b2YgZGV2aWNlcyBhcmUgbm90CmluZGVwZW5kZW50LiAgQ1BVcyBhbmQgbWVtb3J5IG1heSBvbmx5
IGJlIHBvc3NpYmxlIHRvIHRha2UgYXdheQp0b2dldGhlciBhbmQgdGhhdCBtYXkgYmUgdGhlIGNh
c2UgZm9yIG90aGVyIGRldmljZXMgdG9vIChzYXksIGl0CndvdWxkbid0IGJlIGEgZ29vZCBpZGVh
IHRvIGFjY2VzcyBhIG1lbW9yeSBibG9jayB0aGF0IGhhcyBqdXN0IGdvbmUKYXdheSBmcm9tIGEg
ZGV2aWNlLCBmb3IgRE1BIGFuZCB0aGUgbGlrZSkuICBUaGF0J3Mgd2h5CmRldmljZV9ob3RwbHVn
X2xvY2sgd2FzIGludHJvZHVjZWQgaW4gdGhlIGZpcnN0IHBsYWNlLgoKVGhhdCBzYWlkIEkgYWdy
ZWUgdGhhdCBleHBvcnRpbmcgdGhpcyB0byBkcml2ZXJzIGRvZXNuJ3QgZmVlbCBwYXJ0aWN1bGFy
bHkgc2FmZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
