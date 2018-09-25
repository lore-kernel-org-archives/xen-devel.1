From: Rashmica Gupta <rashmica.g@gmail.com>
Subject: Re: [PATCH RFCv2 3/6] mm/memory_hotplug: fix
 online/offline_pages called w.o. mem_hotplug_lock
Date: Tue, 25 Sep 2018 11:26:51 +1000
Message-ID: <1537838811.10753.2.camel__11013.6377778419$1537838761$gmane$org@gmail.com>
References: <20180821104418.12710-1-david@redhat.com>
 <20180821104418.12710-4-david@redhat.com>
 <70372ef5-e332-6c07-f08c-50f8808bde6d@gmail.com>
 <5f80ca56-9f34-4e6e-bc83-8f8b3c888163@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yjuo=mh=gmail.com=rashmica.g@srs-us1.protection.inumbo.net>)
 id 1g4c82-0005lN-Qs
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 01:27:06 +0000
Received: by mail-pf1-x443.google.com with SMTP id k19-v6so10025864pfi.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Sep 2018 18:27:05 -0700 (PDT)
In-Reply-To: <5f80ca56-9f34-4e6e-bc83-8f8b3c888163@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Michal Hocko <mhocko@suse.com>, linux-doc@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>, "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Michael Ellerman <mpe@ellerman.id.au>, Pavel Tatashin <pasha.tatashin@oracle.com>, linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>, Dan Williams <dan.j.williams@intel.com>, YASUAKI ISHIMATSU <yasu.isimatu@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>, Math
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAyMDE4LTA5LTE3IGF0IDA5OjMyICswMjAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90
ZToKPiBBbSAwMy4wOS4xOCB1bSAwMjozNiBzY2hyaWViIFJhc2htaWNhOgo+ID4gSGkgRGF2aWQs
Cj4gPiAKPiA+IAo+ID4gT24gMjEvMDgvMTggMjA6NDQsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3Rl
Ogo+ID4gCj4gPiA+IFRoZXJlIHNlZW0gdG8gYmUgc29tZSBwcm9ibGVtcyBhcyByZXN1bHQgb2Yg
MzA0NjdlMGIzYmUgKCJtbSwKPiA+ID4gaG90cGx1ZzoKPiA+ID4gZml4IGNvbmN1cnJlbnQgbWVt
b3J5IGhvdC1hZGQgZGVhZGxvY2siKSwgd2hpY2ggdHJpZWQgdG8gZml4IGEKPiA+ID4gcG9zc2li
bGUKPiA+ID4gbG9jayBpbnZlcnNpb24gcmVwb3J0ZWQgYW5kIGRpc2N1c3NlZCBpbiBbMV0gZHVl
IHRvIHRoZSB0d28gbG9ja3MKPiA+ID4gCWEpIGRldmljZV9sb2NrKCkKPiA+ID4gCWIpIG1lbV9o
b3RwbHVnX2xvY2sKPiA+ID4gCj4gPiA+IFdoaWxlIGFkZF9tZW1vcnkoKSBmaXJzdCB0YWtlcyBi
KSwgZm9sbG93ZWQgYnkgYSkgZHVyaW5nCj4gPiA+IGJ1c19wcm9iZV9kZXZpY2UoKSwgb25saW5p
bmcgb2YgbWVtb3J5IGZyb20gdXNlciBzcGFjZSBmaXJzdCB0b29rCj4gPiA+IGIpLAo+ID4gPiBm
b2xsb3dlZCBieSBhKSwgZXhwb3NpbmcgYSBwb3NzaWJsZSBkZWFkbG9jay4KPiA+IAo+ID4gRG8g
eW91IG1lYW4gIm9ubGluaW5nIG9mIG1lbW9yeSBmcm9tIHVzZXIgc3BhY2UgZmlyc3QgdG9vayBh
KSwKPiA+IGZvbGxvd2VkIGJ5IGIpIj8gCj4gCj4gVmVyeSByaWdodCwgdGhhbmtzLgo+IAo+ID4g
Cj4gPiA+IEluIFsxXSwgYW5kIGl0IHdhcyBkZWNpZGVkIHRvIG5vdCBtYWtlIHVzZSBvZgo+ID4g
PiBkZXZpY2VfaG90cGx1Z19sb2NrLCBidXQKPiA+ID4gcmF0aGVyIHRvIGVuZm9yY2UgYSBsb2Nr
aW5nIG9yZGVyLgo+ID4gPiAKPiA+ID4gVGhlIHByb2JsZW1zIEkgc3BvdHRlZCByZWxhdGVkIHRv
IHRoaXM6Cj4gPiA+IAo+ID4gPiAxLiBNZW1vcnkgYmxvY2sgZGV2aWNlIGF0dHJpYnV0ZXM6IFdo
aWxlIC5zdGF0ZSBmaXJzdCBjYWxscwo+ID4gPiAgICBtZW1faG90cGx1Z19iZWdpbigpIGFuZCB0
aGUgY2FsbHMgZGV2aWNlX29ubGluZSgpIC0gd2hpY2gKPiA+ID4gdGFrZXMKPiA+ID4gICAgZGV2
aWNlX2xvY2soKSAtIC5vbmxpbmUgZG9lcyBubyBsb25nZXIgY2FsbAo+ID4gPiBtZW1faG90cGx1
Z19iZWdpbigpLCBzbwo+ID4gPiAgICBlZmZlY3RpdmVseSBjYWxscyBvbmxpbmVfcGFnZXMoKSB3
aXRob3V0IG1lbV9ob3RwbHVnX2xvY2suCj4gPiA+IAo+ID4gPiAyLiBkZXZpY2Vfb25saW5lKCkg
c2hvdWxkIGJlIGNhbGxlZCB1bmRlciBkZXZpY2VfaG90cGx1Z19sb2NrLAo+ID4gPiBob3dldmVy
Cj4gPiA+ICAgIG9ubGluaW5nIG1lbW9yeSBkdXJpbmcgYWRkX21lbW9yeSgpIGRvZXMgbm90IHRh
a2UgY2FyZSBvZgo+ID4gPiB0aGF0Lgo+ID4gPiAKPiA+ID4gSW4gYWRkaXRpb24sIEkgdGhpbmsg
dGhlcmUgaXMgYWxzbyBzb21ldGhpbmcgd3JvbmcgYWJvdXQgdGhlCj4gPiA+IGxvY2tpbmcgaW4K
PiA+ID4gCj4gPiA+IDMuIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJudi9tZW10cmFjZS5j
IGNhbGxzCj4gPiA+IG9mZmxpbmVfcGFnZXMoKQo+ID4gPiAgICB3aXRob3V0IGxvY2tzLiBUaGlz
IHdhcyBpbnRyb2R1Y2VkIGFmdGVyIDMwNDY3ZTBiM2JlLiBBbmQKPiA+ID4gc2tpbW1pbmcgb3Zl
cgo+ID4gPiAgICB0aGUgY29kZSwgSSBhc3N1bWUgaXQgY291bGQgbmVlZCBzb21lIG1vcmUgY2Fy
ZSBpbiByZWdhcmRzIHRvCj4gPiA+IGxvY2tpbmcKPiA+ID4gICAgKGUuZy4gZGV2aWNlX29ubGlu
ZSgpIGNhbGxlZCB3aXRob3V0IGRldmljZV9ob3RwbHVnX2xvY2sgLSBidXQKPiA+ID4gSSdsbAo+
ID4gPiAgICBub3QgdG91Y2ggdGhhdCBmb3Igbm93KS4KPiA+IAo+ID4gQ2FuIHlvdSBtZW50aW9u
IHRoYXQgeW91IGZpeGVkIHRoaXMgaW4gbGF0ZXIgcGF0Y2hlcz8KPiAKPiBTdXJlIQo+IAo+ID4g
Cj4gPiAKPiA+IFRoZSBzZXJpZXMgbG9va3MgZ29vZCB0byBtZS4gRmVlbCBmcmVlIHRvIGFkZCBt
eSByZXZpZXdlZC1ieToKPiA+IAo+ID4gUmV2aWV3ZWQtYnk6IFJhc2htaWNhIEd1cHRhIDxyYXNo
bWljYS5nQGdtYWlsLmNvbT4KPiA+IAo+IAo+IFRoYW5rcywgci1iIG9ubHkgZm9yIHRoaXMgcGF0
Y2ggb3IgYWxsIG9mIHRoZSBzZXJpZXM/CgpTb3JyeSwgSSBzb21laG93IG1pc3NlZCB0aGlzLiBU
byBhbGwgb2YgdGhlIHNlcmllcy4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
