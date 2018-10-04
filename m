From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH RFC] mm/memory_hotplug: Introduce memory
 block types
Date: Thu, 4 Oct 2018 08:28:11 +0200
Message-ID: <20181004062811.GC22173__18199.8628112071$1538634423$gmane$org@dhcp22.suse.cz>
References: <20180928150357.12942-1-david@redhat.com>
 <20181001084038.GD18290@dhcp22.suse.cz>
 <d54a8509-725f-f771-72f0-15a9d93e8a49@redhat.com>
 <20181002134734.GT18290@dhcp22.suse.cz>
 <98fb8d65-b641-2225-f842-8804c6f79a06@redhat.com>
 <20181003135407.GI4714@dhcp22.suse.cz>
 <9fef1f7d-2d7c-03f1-00e3-5fa657eda019@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=etb5=mq=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1g7x7R-00078O-4I
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 06:28:17 +0000
Content-Disposition: inline
In-Reply-To: <9fef1f7d-2d7c-03f1-00e3-5fa657eda019@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org, Pavel Tatashin <pavel.tatashin@microsoft.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Rashmica Gupta <rashmica.g@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-s390@vger.kernel.org, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenpro
List-Id: xen-devel@lists.xenproject.org

T24gV2VkIDAzLTEwLTE4IDE5OjAwOjI5LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKWy4uLl0K
PiBMZXQgbWUgcmVwaHJhc2U6IFlvdSBzdGF0ZSB0aGF0IHVzZXIgc3BhY2UgaGFzIHRvIG1ha2Ug
dGhlIGRlY2lzaW9uIGFuZAo+IHRoYXQgdXNlciBzaG91bGQgYmUgYWJsZSB0byBzZXQvcmVjb25m
aWd1cmUgcnVsZXMuIFRoYXQgaXMgcGVyZmVjdGx5IGZpbmUuCj4gCj4gQnV0IHRoZW4gd2Ugc2hv
dWxkIGdpdmUgdXNlciBzcGFjZSBhY2Nlc3MgdG8gc3VmZmljaWVudCBpbmZvcm1hdGlvbiB0bwo+
IG1ha2UgYSBkZWNpc2lvbi4gVGhpcyBtaWdodCBiZSB0aGUgdHlwZSBvZiBtZW1vcnkgYXMgd2Ug
bGVhcm5lZCAod2hhdAo+IHNvbWUgcGFydCBvZiB0aGlzIHBhdGNoIHByb3Bvc2VzKSwgYnV0IG1h
eWJlIGxhdGVyIG1vcmUsIGUuZy4gdG8gd2hpY2gKPiBwaHlzaWNhbCBkZXZpY2UgbWVtb3J5IGJl
bG9uZ3MgKGUuZy4gdG8gaG90cGx1ZyBpdCBhbGwgbW92YWJsZSBvciBhbGwKPiBub3JtYWwpIC4u
LgoKSSBhbSBwcmV0dHkgc3VyZSB0aGF0IHVzZXIga25vd3MgaGUvc2hlIHdhbnRzIHRvIHVzZSBi
YWxsb29uaW5nIGluCkh5cGVyViBvciBYZW4sIG9yIHRoYXQgdGhlIG1lbW9yeSBob3RwbHVnIHNo
b3VsZCBiZSB1c2VkIGFzIGEgIlJBUyIKZmVhdHVyZSB0byBhbGxvdyBhZGQgYW5kIHJlbW92ZSBE
SU1NcyBmb3IgcmVsaWFiaWxpdHkuIFdoeSBzaG91bGRuJ3Qgd2UKaGF2ZSBhIHBhY2thZ2UgdG8g
ZGVwbG95IGFuIGFwcHJvcHJpYXRlIHNldCBvZiB1ZGV2IHJ1bGVzIGZvciBlYWNoIG9mCnRob3Nl
IHVzZWNhc2VzPyBJIGFtIHByZXR0eSBzdXJlIHlvdSBuZWVkIHNvbWUgb3RoZXIgcGx1bWJpbmcg
dG8gZW5hYmxlCnRoZW0gYW55d2F5IChlLmcuIFJBUyB3b3VsZCByZXF1aXJlIHRvIGhhdmUgbW92
YWJsZV9ub2RlIGtlcm5lbApwYXJhbWV0ZXJzLCBiYWxsb29uaW5nIGEga2VybmVsIG1vZHVsZSBl
dGMuKS4KClJlYWxseSwgb25lIHVkZXYgc2NyaXB0IHRvIHJ1bGUgdGhlbSBhbGwgd2lsbCBzaW1w
bHkgbmV2ZXIgd29yay4KLS0gCk1pY2hhbCBIb2NrbwpTVVNFIExhYnMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
