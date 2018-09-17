From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFCv2 3/6] mm/memory_hotplug: fix
 online/offline_pages called w.o. mem_hotplug_lock
Date: Mon, 17 Sep 2018 09:32:27 +0200
Message-ID: <5f80ca56-9f34-4e6e-bc83-8f8b3c888163__16540.1361221031$1537169511$gmane$org@redhat.com>
References: <20180821104418.12710-1-david@redhat.com>
 <20180821104418.12710-4-david@redhat.com>
 <70372ef5-e332-6c07-f08c-50f8808bde6d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xwb/=l7=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1g1o1U-0002SU-00
 for xen-devel@lists.xenproject.org; Mon, 17 Sep 2018 07:32:44 +0000
In-Reply-To: <70372ef5-e332-6c07-f08c-50f8808bde6d@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Rashmica <rashmica.g@gmail.com>, linux-mm@kvack.org
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Michal Hocko <mhocko@suse.com>, linux-doc@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>, "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Michael Ellerman <mpe@ellerman.id.au>, Pavel Tatashin <pasha.tatashin@oracle.com>, linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>, Dan Williams <dan.j.williams@intel.com>, YASUAKI ISHIMATSU <yasu.isimatu@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>, Math
List-Id: xen-devel@lists.xenproject.org

QW0gMDMuMDkuMTggdW0gMDI6MzYgc2NocmllYiBSYXNobWljYToKPiBIaSBEYXZpZCwKPiAKPiAK
PiBPbiAyMS8wOC8xOCAyMDo0NCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gCj4+IFRoZXJl
IHNlZW0gdG8gYmUgc29tZSBwcm9ibGVtcyBhcyByZXN1bHQgb2YgMzA0NjdlMGIzYmUgKCJtbSwg
aG90cGx1ZzoKPj4gZml4IGNvbmN1cnJlbnQgbWVtb3J5IGhvdC1hZGQgZGVhZGxvY2siKSwgd2hp
Y2ggdHJpZWQgdG8gZml4IGEgcG9zc2libGUKPj4gbG9jayBpbnZlcnNpb24gcmVwb3J0ZWQgYW5k
IGRpc2N1c3NlZCBpbiBbMV0gZHVlIHRvIHRoZSB0d28gbG9ja3MKPj4gCWEpIGRldmljZV9sb2Nr
KCkKPj4gCWIpIG1lbV9ob3RwbHVnX2xvY2sKPj4KPj4gV2hpbGUgYWRkX21lbW9yeSgpIGZpcnN0
IHRha2VzIGIpLCBmb2xsb3dlZCBieSBhKSBkdXJpbmcKPj4gYnVzX3Byb2JlX2RldmljZSgpLCBv
bmxpbmluZyBvZiBtZW1vcnkgZnJvbSB1c2VyIHNwYWNlIGZpcnN0IHRvb2sgYiksCj4+IGZvbGxv
d2VkIGJ5IGEpLCBleHBvc2luZyBhIHBvc3NpYmxlIGRlYWRsb2NrLgo+IAo+IERvIHlvdSBtZWFu
ICJvbmxpbmluZyBvZiBtZW1vcnkgZnJvbSB1c2VyIHNwYWNlIGZpcnN0IHRvb2sgYSksCj4gZm9s
bG93ZWQgYnkgYikiPyAKClZlcnkgcmlnaHQsIHRoYW5rcy4KCj4gCj4+IEluIFsxXSwgYW5kIGl0
IHdhcyBkZWNpZGVkIHRvIG5vdCBtYWtlIHVzZSBvZiBkZXZpY2VfaG90cGx1Z19sb2NrLCBidXQK
Pj4gcmF0aGVyIHRvIGVuZm9yY2UgYSBsb2NraW5nIG9yZGVyLgo+Pgo+PiBUaGUgcHJvYmxlbXMg
SSBzcG90dGVkIHJlbGF0ZWQgdG8gdGhpczoKPj4KPj4gMS4gTWVtb3J5IGJsb2NrIGRldmljZSBh
dHRyaWJ1dGVzOiBXaGlsZSAuc3RhdGUgZmlyc3QgY2FsbHMKPj4gICAgbWVtX2hvdHBsdWdfYmVn
aW4oKSBhbmQgdGhlIGNhbGxzIGRldmljZV9vbmxpbmUoKSAtIHdoaWNoIHRha2VzCj4+ICAgIGRl
dmljZV9sb2NrKCkgLSAub25saW5lIGRvZXMgbm8gbG9uZ2VyIGNhbGwgbWVtX2hvdHBsdWdfYmVn
aW4oKSwgc28KPj4gICAgZWZmZWN0aXZlbHkgY2FsbHMgb25saW5lX3BhZ2VzKCkgd2l0aG91dCBt
ZW1faG90cGx1Z19sb2NrLgo+Pgo+PiAyLiBkZXZpY2Vfb25saW5lKCkgc2hvdWxkIGJlIGNhbGxl
ZCB1bmRlciBkZXZpY2VfaG90cGx1Z19sb2NrLCBob3dldmVyCj4+ICAgIG9ubGluaW5nIG1lbW9y
eSBkdXJpbmcgYWRkX21lbW9yeSgpIGRvZXMgbm90IHRha2UgY2FyZSBvZiB0aGF0Lgo+Pgo+PiBJ
biBhZGRpdGlvbiwgSSB0aGluayB0aGVyZSBpcyBhbHNvIHNvbWV0aGluZyB3cm9uZyBhYm91dCB0
aGUgbG9ja2luZyBpbgo+Pgo+PiAzLiBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYvbWVt
dHJhY2UuYyBjYWxscyBvZmZsaW5lX3BhZ2VzKCkKPj4gICAgd2l0aG91dCBsb2Nrcy4gVGhpcyB3
YXMgaW50cm9kdWNlZCBhZnRlciAzMDQ2N2UwYjNiZS4gQW5kIHNraW1taW5nIG92ZXIKPj4gICAg
dGhlIGNvZGUsIEkgYXNzdW1lIGl0IGNvdWxkIG5lZWQgc29tZSBtb3JlIGNhcmUgaW4gcmVnYXJk
cyB0byBsb2NraW5nCj4+ICAgIChlLmcuIGRldmljZV9vbmxpbmUoKSBjYWxsZWQgd2l0aG91dCBk
ZXZpY2VfaG90cGx1Z19sb2NrIC0gYnV0IEknbGwKPj4gICAgbm90IHRvdWNoIHRoYXQgZm9yIG5v
dykuCj4gCj4gQ2FuIHlvdSBtZW50aW9uIHRoYXQgeW91IGZpeGVkIHRoaXMgaW4gbGF0ZXIgcGF0
Y2hlcz8KClN1cmUhCgo+IAo+IAo+IFRoZSBzZXJpZXMgbG9va3MgZ29vZCB0byBtZS4gRmVlbCBm
cmVlIHRvIGFkZCBteSByZXZpZXdlZC1ieToKPiAKPiBSZXZpZXdlZC1ieTogUmFzaG1pY2EgR3Vw
dGEgPHJhc2htaWNhLmdAZ21haWwuY29tPgo+IAoKVGhhbmtzLCByLWIgb25seSBmb3IgdGhpcyBw
YXRjaCBvciBhbGwgb2YgdGhlIHNlcmllcz8KCi0tIAoKVGhhbmtzLAoKRGF2aWQgLyBkaGlsZGVu
YgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
