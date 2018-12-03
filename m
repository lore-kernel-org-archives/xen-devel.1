From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFCv2 2/4] mm/memory_hotplug: Replace "bool
 want_memblock" by "int type"
Date: Mon, 3 Dec 2018 11:33:12 +0100
Message-ID: <5ecbff41-fc41-79fc-696e-4ca1f066f9aa__39723.1789342642$1543833130$gmane$org@redhat.com>
References: <20181130175922.10425-1-david@redhat.com>
 <20181130175922.10425-3-david@redhat.com>
 <20181201015024.3o334nk2fe5mlasj@master>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xtvp=om=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1gTlXd-0005DT-5U
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 10:33:29 +0000
In-Reply-To: <20181201015024.3o334nk2fe5mlasj@master>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Oscar Salvador <osalvador@suse.com>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org, Michal Hocko <mhocko@suse.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-s390@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org, Matthew Wilcox <willy@infradead.org>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Rob Herring <robh@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEuMTIuMTggMDI6NTAsIFdlaSBZYW5nIHdyb3RlOgo+IE9uIEZyaSwgTm92IDMwLCAyMDE4
IGF0IDA2OjU5OjIwUE0gKzAxMDAsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+PiBMZXQncyBw
YXNzIGEgbWVtb3J5IGJsb2NrIHR5cGUgaW5zdGVhZC4gUGFzcyAiTUVNT1JZX0JMT0NLX05PTkUi
IGZvciBkZXZpY2UKPj4gbWVtb3J5IGFuZCBmb3Igbm93ICJNRU1PUllfQkxPQ0tfVU5TUEVDSUZJ
RUQiIGZvciBhbnl0aGluZyBlbHNlLiBObwo+PiBmdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBJIHdv
dWxkIHN1Z2dlc3QgdG8gcHV0IG1vcmUgd29yZHMgdG8gdGhpcy4KClN1cmUsIG1ha2VzIHNlbnNl
LCBJJ2xsIGFkZCBtb3JlIGRldGFpbHMuIFRoYW5rcyEKCj4gCj4gIgo+IEZ1bmN0aW9uIGFyY2hf
YWRkX21lbW9yeSgpJ3MgbGFzdCBwYXJhbWV0ZXIgKndhbnRfbWVtYmxvY2sqIGlzIHVzZWQgdG8K
PiBkZXRlcm1pbiB3aGV0aGVyIGl0IGlzIG5lY2Vzc2FyeSB0byBjcmVhdGUgYSBjb3JyZXNwb25k
aW5nIG1lbW9yeSBibG9jawo+IGRldmljZS4gQWZ0ZXIgaW50cm9kdWNpbmcgdGhlIG1lbW9yeSBi
bG9jayB0eXBlLCB0aGlzIHBhdGNoIHJlcGxhY2VzIHRoZQo+IGJvb2wgdHlwZSAqd2FudF9tZW1i
bG9jayogd2l0aCBtZW1vcnkgYmxvY2sgdHlwZSB3aXRoIGZvbGxvd2luZyBydWxlcwo+IGZvciBu
b3c6Cj4gCj4gICAqIFBhc3MgIk1FTU9SWV9CTE9DS19OT05FIiBmb3IgZGV2aWNlIG1lbW9yeQo+
ICAgKiBQYXNzICJNRU1PUllfQkxPQ0tfVU5TUEVDSUZJRUQiIGZvciBhbnl0aGluZyBlbHNlIAo+
IAo+IFNpbmNlIHRoaXMgcGFyYW1ldGVyIGlzIHBhc3NlZCBkZWVwIHRvIF9fYWRkX3NlY3Rpb24o
KSwgYWxsIGl0cwo+IGRlc2NlbmRlbnRzIGFyZSBlZmZlY3RlZC4gQmVsb3cgbGlzdHMgdGhvc2Ug
ZGVzY2VuZGVudHMuCj4gCj4gICBhcmNoX2FkZF9tZW1vcnkoKQo+ICAgICBhZGRfcGFnZXMoKQo+
ICAgICAgIF9fYWRkX3BhZ2VzKCkKPiAgICAgICAgIF9fYWRkX3NlY3Rpb24oKQo+IAo+ICIKClsu
Li5dCgoKLS0gCgpUaGFua3MsCgpEYXZpZCAvIGRoaWxkZW5iCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
