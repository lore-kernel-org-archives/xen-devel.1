From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC] mm/memory_hotplug: Introduce memory
 block types
Date: Thu, 4 Oct 2018 10:12:22 +0200
Message-ID: <db839c89-0ce8-52f8-8199-4a28197a91e8__4435.14142320982$1538640695$gmane$org@redhat.com>
References: <20180928150357.12942-1-david@redhat.com>
 <20181001084038.GD18290@dhcp22.suse.cz>
 <d54a8509-725f-f771-72f0-15a9d93e8a49@redhat.com>
 <20181002134734.GT18290@dhcp22.suse.cz>
 <98fb8d65-b641-2225-f842-8804c6f79a06@redhat.com>
 <8736tndubn.fsf@vitty.brq.redhat.com> <20181003134444.GH4714@dhcp22.suse.cz>
 <87zhvvcf3b.fsf@vitty.brq.redhat.com> <20181003142444.GJ4714@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=tvfk=mq=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1g7ykQ-0007NQ-8X
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 08:12:38 +0000
In-Reply-To: <20181003142444.GJ4714@dhcp22.suse.cz>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michal Hocko <mhocko@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Rashmica Gupta <rashmica.g@gmail.com>, Dan Williams <dan.j.williams@intel.com>, linux-s390@vger.kernel.org, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, Pavel
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTAvMjAxOCAxNjoyNCwgTWljaGFsIEhvY2tvIHdyb3RlOgo+IE9uIFdlZCAwMy0xMC0x
OCAxNTo1MjoyNCwgVml0YWx5IEt1em5ldHNvdiB3cm90ZToKPiBbLi4uXQo+Pj4gQXMgRGF2aWQg
c2FpZCBzb21lIG9mIHRoZSBtZW1vcnkgY2Fubm90IGJlIG9ubGluZWQgd2l0aG91dCBmdXJ0aGVy
IHN0ZXBzCj4+PiAoZS5nLiB3aGVuIGl0IGlzIHN0YW5kYnkgYXMgRGF2aWQgY2FsbGVkIGl0KSBh
bmQgdGhlbiBJIGZhaWwgdG8gc2VlIGhvdwo+Pj4gZUJQRiBoZWxwIGluIGFueSB3YXkuCj4+Cj4+
IGFuZCBhbHNvLCB3ZSBjYW4gZmlnaHQgdGlsbCB0aGUgZW5kIG9mIGRheXMgaGVyZSB0cnlpbmcg
dG8gY29tZSB1cCB3aXRoCj4+IGFuIG9ubGluaW5nIHNvbHV0aW9uIHdoaWNoIHdvdWxkIHdvcmsg
Zm9yIGV2ZXJ5b25lIGFuZCBlQlBGIHdvdWxkIG1vdmUKPj4gdGhpcyBkZWNpc2lvbiB0byBkaXN0
cm8gbGV2ZWwuCj4gCj4gVGhlIHBvaW50IGlzIHRoYXQgdGhlcmUgaXMgX25vXyBnZW5lcmFsIG9u
bGluaW5nIHNvbHV0aW9uLiBUaGlzIGlzCj4gYmFzaWNhbGx5IHBvbGljeSB3aGljaCBiZWxvbmdz
IHRvIHRoZSB1c2Vyc3BhY2UuCj4gCgpWaXRhbHlzIHBvaW50IHdhcyB0aGF0IHRoaXMgcG9saWN5
IGlzIHRvIGJlIGZvcm11bGF0ZWQgYnkgdXNlciBzcGFjZSB2aWEKZUJQRiBhbmQgaGFuZGxlZCBi
eSB0aGUga2VybmVsLiBTbyB0aGUgd29yayBvZiBmb3JtdWxhdGluZyB0aGUgcG9saWN5CndvdWxk
IHN0aWxsIGhhdmUgdG8gYmUgZG9uZSBieSB1c2VyIHNwYWNlLgoKSSBndWVzcyB0aGUgb25seSBw
cm9ibGVtIHRoaXMgd291bGQgcGFydGlhbGx5IHNvbHZlIGlzIG9ubGluaW5nIG9mCm1lbW9yeSBm
YWlsaW5nIGFzIHdlIGNhbiBubyBsb25nZXIgZm9yayBpbiB1c2VyIHNwYWNlLiBKdXN0IGFzIHlv
dSBzYWlkLApJIGFsc28gdGhpbmsgdGhpcyBpcyByYXRoZXIgc29tZSBzZXJpb3VzIG1pc2NvbmZp
Z3VyYXRpb24uIFdlIHdpbGwKYWxyZWFkeSBtb3N0IHByb2JhYmx5IGhhdmUgb3RoZXIgYXBwbGlj
YXRpb25zIHRyaWdnZXJpbmcgT09NIGFscmVhZHkuCgotLSAKClRoYW5rcywKCkRhdmlkIC8gZGhp
bGRlbmIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
