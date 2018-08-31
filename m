From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFCv2 1/6] mm/memory_hotplug: make
 remove_memory() take the device_hotplug_lock
Date: Fri, 31 Aug 2018 15:12:05 +0200
Message-ID: <5b1f79cd-553b-4f9d-2690-8d7fb553278e__48779.8632275828$1535721068$gmane$org@redhat.com>
References: <20180821104418.12710-1-david@redhat.com>
 <20180821104418.12710-2-david@redhat.com>
 <46a0119b-da16-0203-a8c2-d127738517f4@microsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ckrf=lo=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1fvjDi-0007tG-IU
 for xen-devel@lists.xenproject.org; Fri, 31 Aug 2018 13:12:14 +0000
In-Reply-To: <46a0119b-da16-0203-a8c2-d127738517f4@microsoft.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pasha Tatashin <Pavel.Tatashin@microsoft.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Cc: Michal Hocko <mhocko@suse.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, Paul Mackerras <paulus@samba.org>, Rashmica Gupta <rashmica.g@gmail.com>, Michael Neuling <mikey@neuling.org>, Michael Ellerman <mpe@ellerman.id.au>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Len Brown <lenb@kernel.org>, YASUAKI ISHIMATSU <yasu.isimatu@gmail.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Dan Williams <dan.j.williams@intel.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, Mathieu Malaterre <malat@debian.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>"linux-kernel@vger.kernel.org" <l>
List-Id: xen-devel@lists.xenproject.org

T24gMzAuMDguMjAxOCAyMTozNSwgUGFzaGEgVGF0YXNoaW4gd3JvdGU6Cj4+ICsKPj4gK3ZvaWQg
X19yZWYgcmVtb3ZlX21lbW9yeShpbnQgbmlkLCB1NjQgc3RhcnQsIHU2NCBzaXplKQo+IAo+IFJl
bW92ZSBfX3JlZiwgb3RoZXJ3aXNlIGxvb2tzIGdvb2Q6CgpJbmRlZWQsIHdpbGwgZG8uCgpUaGFu
a3MgZm9yIHRoZSByZXZpZXcuIFdpbGwgcmVzZW5kIGluIHR3byB3ZWVrcyB3aGVuIEknbSBiYWNr
IGZyb20gdmFjYXRpb24uCgpDaGVlcnMhCgo+IAo+IFJldmlld2VkLWJ5OiBQYXZlbCBUYXRhc2hp
biA8cGF2ZWwudGF0YXNoaW5AbWljcm9zb2Z0LmNvbT4KPiAKPj4gK3sKPj4gKwlsb2NrX2Rldmlj
ZV9ob3RwbHVnKCk7Cj4+ICsJX19yZW1vdmVfbWVtb3J5KG5pZCwgc3RhcnQsIHNpemUpOwo+PiAr
CXVubG9ja19kZXZpY2VfaG90cGx1ZygpOwo+PiArfQo+PiAgRVhQT1JUX1NZTUJPTF9HUEwocmVt
b3ZlX21lbW9yeSk7Cj4+ICAjZW5kaWYgLyogQ09ORklHX01FTU9SWV9IT1RSRU1PVkUgKi8KCgot
LSAKClRoYW5rcywKCkRhdmlkIC8gZGhpbGRlbmIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
