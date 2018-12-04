From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Subject: Re: [PATCH RFCv2 3/4] mm/memory_hotplug: Introduce and
 use more memory types
Date: Tue, 4 Dec 2018 10:44:54 +0100
Message-ID: <20181204104454.522a3ba2__48710.178564261$1543916623$gmane$org@naga.suse.cz>
References: <20181130175922.10425-1-david@redhat.com>
 <20181130175922.10425-4-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XWT3=ON=suse.de=msuchanek@srs-us1.protection.inumbo.net>)
 id 1gU7GI-00032R-DQ
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 09:45:02 +0000
In-Reply-To: <20181130175922.10425-4-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, Rashmica Gupta <rashmica.g@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org, Michael Neuling <mikey@neuling.org>, Stefano Stabellini <sstabellini@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>, Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org, YueHaibing <yuehaibing@huawei.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>, Vasily Gorbik <gor@linux.ibm.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAzMCBOb3YgMjAxOCAxODo1OToyMSArMDEwMApEYXZpZCBIaWxkZW5icmFuZCA8ZGF2
aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cgo+IExldCdzIGludHJvZHVjZSBuZXcgdHlwZXMgZm9yIGRp
ZmZlcmVudCBraW5kcyBvZiBtZW1vcnkgYmxvY2tzIGFuZCB1c2UKPiB0aGVtIGluIGV4aXN0aW5n
IGNvZGUuIEFzIEkgZG9uJ3Qgc2VlIGFuIGVhc3kgd2F5IHRvIHNwbGl0IHRoaXMgdXAsCj4gZG8g
aXQgaW4gb25lIGh1bmsgZm9yIG5vdy4KPiAKPiBhY3BpOgo+ICBVc2UgRElNTSBvciBESU1NX1VO
UkVNT1ZBQkxFIGRlcGVuZGluZyBvbiBob3RyZW1vdmUgc3VwcG9ydCBpbiB0aGUga2VybmVsLgo+
ICBQcm9wZXJseSBjaGFuZ2UgdGhlIHR5cGUgd2hlbiB0cnlpbmcgdG8gYWRkIG1lbW9yeSB0aGF0
IHdhcyBhbHJlYWR5Cj4gIGRldGVjdGVkIGFuZCB1c2VkIGR1cmluZyBib290IChzbyB0aGlzIG1l
bW9yeSB3aWxsIGNvcnJlY3RseSBlbmQgdXAgYXMKPiAgImFjcGkiIGluIHVzZXIgc3BhY2UpLgo+
IAo+IHBzZXJpZXM6Cj4gIFVzZSBESU1NIG9yIERJTU1fVU5SRU1PVkFCTEUgZGVwZW5kaW5nIG9u
IGhvdHJlbW92ZSBzdXBwb3J0IGluIHRoZSBrZXJuZWwuCj4gIEFzIGZhciBhcyBJIHNlZSwgaGFu
ZGxpbmcgbGlrZSBpbiB0aGUgYWNwaSBjYXNlIGZvciBleGlzdGluZyBibG9ja3MgaXMKPiAgbm90
IHJlcXVpcmVkLgo+IAo+IHByb2JlZCBtZW1vcnkgZnJvbSB1c2VyIHNwYWNlOgo+ICBVc2UgRElN
TV9VTlJFTU9WQUJMRSBhcyB0aGVyZSBpcyBubyBpbnRlcmZhY2UgdG8gZ2V0IHJpZCBvZiB0aGlz
IGNvZGUKPiAgYWdhaW4uCj4gCj4gaHZfYmFsbG9vbix4ZW4vYmFsbG9vbjoKPiAgVXNlIEJBTExP
T04uIEFzIHNpbXBsZSBhcyB0aGF0IDopCj4gCj4gczM5MHgvc2NscDoKPiAgVXNlIGEgZGVkaWNh
dGVkIHR5cGUgUzM5MFhfU1RBTkRCWSBhcyB0aGlzIHR5cGUgb2YgbWVtb3J5IGFuZCBpdCdzCj4g
IHNlbWFudGljcyBhcmUgdmVyeSBzMzkweCBzcGVjaWZpYy4KPiAKPiBwb3dlcm52L21lbXRyYWNl
Ogo+ICBPbmx5IGFsbG93IHRvIHVzZSBCT09UIG1lbW9yeSBmb3IgbWVtdHJhY2UuIEkgY29uc2lk
ZXIgdGhpcyBjb2RlIGluCj4gIGdlbmVyYWwgZGFuZ2Vyb3VzLCBidXQgd2UgaGF2ZSB0byBrZWVw
IGl0IHdvcmtpbmcgLi4uIG1vc3QgcHJvYmFibHkganVzdAo+ICBhIGRlYnVnIGZlYXR1cmUuCgpJ
IGRvbid0IHRoaW5rIGl0IHNob3VsZCBiZSBhcmJpdHJhcmlseSByZXN0cmljdGVkIGxpa2UgdGhh
dC4KClRoYW5rcwoKTWljaGFsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
