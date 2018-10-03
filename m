From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC] mm/memory_hotplug: Introduce memory
 block types
Date: Wed, 3 Oct 2018 19:06:28 +0200
Message-ID: <37fab0d1-4b5d-ff69-9091-2f9e34b47e4e__38058.4624749192$1538586337$gmane$org@redhat.com>
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
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=keg1=mp=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1g7kbl-0000V7-Jw
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 17:06:45 +0000
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
IHRvIHRoZSB1c2Vyc3BhY2UuCj4gCgpBcyBhbHJlYWR5IHN0YXRlZCwgSSBndWVzcyB3ZSBzaG91
bGQgdGhlbiBwcm92aWRlIHVzZXIgc3BhY2Ugd2l0aApzdWZmaWNpZW50IGluZm9ybWF0aW9uIHRv
IG1ha2UgYSBnb29kIGRlY2lzaW9uICh0byBpbXBsZW1lbnQgcnVsZXMpLgoKVGhlIGVCUEYgaXMg
YmFzaWNhbGx5IHRoZSBzYW1lIGlkZWEsIG9ubHkgdGhlIHJ1bGVzIGFyZSBmb3JtdWxhdGVkCmRp
ZmZlcmVudGx5IGFuZCBkaXJlY3RseSBoYW5kbGUgaW4gdGhlIGtlcm5lbC4gU3RpbGwgaXQgbWln
aHQgYmUgZS5lLgpyZWxldmFudCBpZiBtZW1vcnkgaXMgc3RhbmRieSBtZW1vcnkgKHRoYXQncyB3
aGF0IEkgcmVtZW1iZXIgdGhlCm9mZmljaWFsIHMzOTB4IG5hbWUpLCBvciBzb21ldGhpbmcgZWxz
ZS4KClJpZ2h0IG5vdywgdGhlICh1ZGV2KSBydWxlcyB3ZSBoYXZlIG1ha2UgYXNzdW1wdGlvbnMg
YmFzZWQgb24gZ2VuZXJhbApzeXN0ZW0gcHJvcGVydGllcyAoczM5MHgsIEh5cGVyViAuLi4pLgoK
LS0gCgpUaGFua3MsCgpEYXZpZCAvIGRoaWxkZW5iCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
