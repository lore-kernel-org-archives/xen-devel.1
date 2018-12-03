From: Wei Yang <richard.weiyang@gmail.com>
Subject: Re: [PATCH RFCv2 1/4] mm/memory_hotplug: Introduce
 memory block types
Date: Mon, 3 Dec 2018 20:58:36 +0000
Message-ID: <20181203205836.7xpab6ljc3kngrqm__48665.6030909673$1543870658$gmane$org@master>
References: <20181130175922.10425-1-david@redhat.com>
 <20181130175922.10425-2-david@redhat.com>
 <20181201012507.lxfscl6ho3gc6gnn@master>
 <af797dbb-0537-19ec-ef31-d72a3f979791@redhat.com>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qoyc=om=gmail.com=richard.weiyang@srs-us1.protection.inumbo.net>)
 id 1gTvId-0002YD-AP
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 20:58:39 +0000
Received: by mail-ed1-x544.google.com with SMTP id y56so11984282edd.11
 for <xen-devel@lists.xenproject.org>; Mon, 03 Dec 2018 12:58:38 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <af797dbb-0537-19ec-ef31-d72a3f979791@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Oscar Salvador <osalvador@suse.com>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org, Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org, x86@kernel.org, Pavel Tatashin <pasha.tatashin@oracle.com>, linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org, Michal Such??nek <msuchanek@suse.de>, Pavel Tatashin <pavel.tatashin@microsoft.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "mike.travis@hpe.com" <mike.travis@hpe.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Dan Williams <dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, Andrew Banman <andrew.banman@hpe.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Rafael J. Wysock
List-Id: xen-devel@lists.xenproject.org

Wy4uLl0KPj4+Cj4+PiArCWlmICh0eXBlID09IE1FTU9SWV9CTE9DS19OT05FKQo+Pj4gKwkJcmV0
dXJuIC1FSU5WQUw7Cj4+IAo+PiBObyBvbmUgd2lsbCBwYXNzIGluIHRoaXMgdmFsdWUuIENhbiB3
ZSBvbWl0IHRoaXMgY2hlY2sgZm9yIG5vdz8KPgo+SSBjb3VsZCBtb3ZlIGl0IHRvIHBhdGNoIG5y
IDIgSSBndWVzcywgYnV0IGFzIEkgaW50cm9kdWNlCj5NRU1PUllfQkxPQ0tfTk9ORSBoZXJlIGl0
IG1hZGUgc2Vuc2UgdG8ga2VlcCBpdCBpbiBoZXJlLgo+CgpZZXMsIHRoaXMgbWFrZSBzZW5zZSB0
byBtZSBub3cuCgo+KGFuZCBJIHRoaW5rIGF0IGxlYXN0IGZvciBub3cgaXQgbWFrZXMgc2Vuc2Ug
dG8gbm90IHNxdWFzaCBwYXRjaCAxIGFuZAo+MiwgdG8gZWFzaWVyIGRpc2N1c3MgdGhlIG5ldyB1
c2VyIGludGVyZmFjZS9jb25jZXB0IGludHJvZHVjZWQgaW4gdGhpcwo+cGF0Y2gpLgo+Cj5UaGFu
a3MhCj4KPi0tIAo+Cj5UaGFua3MsCj4KPkRhdmlkIC8gZGhpbGRlbmIKCi0tIApXZWkgWWFuZwpI
ZWxwIHlvdSwgSGVscCBtZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
