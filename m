From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFCv2 3/4] mm/memory_hotplug: Introduce and
 use more memory types
Date: Tue, 4 Dec 2018 10:47:33 +0100
Message-ID: <b8e03810-41d6-55cb-9546-62c73c7f4d7f__46079.8881053508$1543916789$gmane$org@redhat.com>
References: <20181130175922.10425-1-david@redhat.com>
 <20181130175922.10425-4-david@redhat.com>
 <20181204104454.522a3ba2@naga.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mkj3=on=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1gU7Ix-0003OX-Vp
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 09:47:48 +0000
In-Reply-To: <20181204104454.522a3ba2@naga.suse.cz>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
Cc: Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, Rashmica Gupta <rashmica.g@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org, Michael Neuling <mikey@neuling.org>, Stefano Stabellini <sstabellini@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>, Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org, YueHaibing <yuehaibing@huawei.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>, Vasily Gorbik <gor@linux.ibm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQuMTIuMTggMTA6NDQsIE1pY2hhbCBTdWNow6FuZWsgd3JvdGU6Cj4gT24gRnJpLCAzMCBO
b3YgMjAxOCAxODo1OToyMSArMDEwMAo+IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQu
Y29tPiB3cm90ZToKPiAKPj4gTGV0J3MgaW50cm9kdWNlIG5ldyB0eXBlcyBmb3IgZGlmZmVyZW50
IGtpbmRzIG9mIG1lbW9yeSBibG9ja3MgYW5kIHVzZQo+PiB0aGVtIGluIGV4aXN0aW5nIGNvZGUu
IEFzIEkgZG9uJ3Qgc2VlIGFuIGVhc3kgd2F5IHRvIHNwbGl0IHRoaXMgdXAsCj4+IGRvIGl0IGlu
IG9uZSBodW5rIGZvciBub3cuCj4+Cj4+IGFjcGk6Cj4+ICBVc2UgRElNTSBvciBESU1NX1VOUkVN
T1ZBQkxFIGRlcGVuZGluZyBvbiBob3RyZW1vdmUgc3VwcG9ydCBpbiB0aGUga2VybmVsLgo+PiAg
UHJvcGVybHkgY2hhbmdlIHRoZSB0eXBlIHdoZW4gdHJ5aW5nIHRvIGFkZCBtZW1vcnkgdGhhdCB3
YXMgYWxyZWFkeQo+PiAgZGV0ZWN0ZWQgYW5kIHVzZWQgZHVyaW5nIGJvb3QgKHNvIHRoaXMgbWVt
b3J5IHdpbGwgY29ycmVjdGx5IGVuZCB1cCBhcwo+PiAgImFjcGkiIGluIHVzZXIgc3BhY2UpLgo+
Pgo+PiBwc2VyaWVzOgo+PiAgVXNlIERJTU0gb3IgRElNTV9VTlJFTU9WQUJMRSBkZXBlbmRpbmcg
b24gaG90cmVtb3ZlIHN1cHBvcnQgaW4gdGhlIGtlcm5lbC4KPj4gIEFzIGZhciBhcyBJIHNlZSwg
aGFuZGxpbmcgbGlrZSBpbiB0aGUgYWNwaSBjYXNlIGZvciBleGlzdGluZyBibG9ja3MgaXMKPj4g
IG5vdCByZXF1aXJlZC4KPj4KPj4gcHJvYmVkIG1lbW9yeSBmcm9tIHVzZXIgc3BhY2U6Cj4+ICBV
c2UgRElNTV9VTlJFTU9WQUJMRSBhcyB0aGVyZSBpcyBubyBpbnRlcmZhY2UgdG8gZ2V0IHJpZCBv
ZiB0aGlzIGNvZGUKPj4gIGFnYWluLgo+Pgo+PiBodl9iYWxsb29uLHhlbi9iYWxsb29uOgo+PiAg
VXNlIEJBTExPT04uIEFzIHNpbXBsZSBhcyB0aGF0IDopCj4+Cj4+IHMzOTB4L3NjbHA6Cj4+ICBV
c2UgYSBkZWRpY2F0ZWQgdHlwZSBTMzkwWF9TVEFOREJZIGFzIHRoaXMgdHlwZSBvZiBtZW1vcnkg
YW5kIGl0J3MKPj4gIHNlbWFudGljcyBhcmUgdmVyeSBzMzkweCBzcGVjaWZpYy4KPj4KPj4gcG93
ZXJudi9tZW10cmFjZToKPj4gIE9ubHkgYWxsb3cgdG8gdXNlIEJPT1QgbWVtb3J5IGZvciBtZW10
cmFjZS4gSSBjb25zaWRlciB0aGlzIGNvZGUgaW4KPj4gIGdlbmVyYWwgZGFuZ2Vyb3VzLCBidXQg
d2UgaGF2ZSB0byBrZWVwIGl0IHdvcmtpbmcgLi4uIG1vc3QgcHJvYmFibHkganVzdAo+PiAgYSBk
ZWJ1ZyBmZWF0dXJlLgo+IAo+IEkgZG9uJ3QgdGhpbmsgaXQgc2hvdWxkIGJlIGFyYml0cmFyaWx5
IHJlc3RyaWN0ZWQgbGlrZSB0aGF0Lgo+IAoKV2VsbCBjb2RlIHRoYXQgInJhbmRvbWx5IiBvZmZs
aW5lcy9vbmxpbmVzL3JlbW92ZXMvYWRkcyBtZW1vcnkgYmxvY2tzCnRoYXQgaXQgZG9lcyBub3Qg
b3duIChoaW50OiBub2JvZHkgZWxzZSBpbiB0aGUga2VybmVsIGRvZXMgdGhhdCksIHNob3VsZApi
ZSByZXN0cmljdGVkIHRvIHR5cGVzIHdlIGNhbiBndWFyYW50ZWUgdG8gd29yay4KCj4gVGhhbmtz
Cj4gCj4gTWljaGFsCj4gCgoKLS0gCgpUaGFua3MsCgpEYXZpZCAvIGRoaWxkZW5iCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
