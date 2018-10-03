From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH RFC] mm/memory_hotplug: Introduce memory
 block types
Date: Wed, 3 Oct 2018 16:24:44 +0200
Message-ID: <20181003142444.GJ4714__36449.545416008$1538576644$gmane$org@dhcp22.suse.cz>
References: <20180928150357.12942-1-david@redhat.com>
 <20181001084038.GD18290@dhcp22.suse.cz>
 <d54a8509-725f-f771-72f0-15a9d93e8a49@redhat.com>
 <20181002134734.GT18290@dhcp22.suse.cz>
 <98fb8d65-b641-2225-f842-8804c6f79a06@redhat.com>
 <8736tndubn.fsf@vitty.brq.redhat.com>
 <20181003134444.GH4714@dhcp22.suse.cz>
 <87zhvvcf3b.fsf@vitty.brq.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ovvu=mp=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1g7i55-0003lA-DY
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 14:24:51 +0000
Content-Disposition: inline
In-Reply-To: <87zhvvcf3b.fsf@vitty.brq.redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Rashmica Gupta <rashmica.g@gmail.com>, Dan Williams <dan.j.williams@intel.com>, linux-s390@vger.kernel.org, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, David Hildenbrand <david@redhat.com>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Len
List-Id: xen-devel@lists.xenproject.org

T24gV2VkIDAzLTEwLTE4IDE1OjUyOjI0LCBWaXRhbHkgS3V6bmV0c292IHdyb3RlOgpbLi4uXQo+
ID4gQXMgRGF2aWQgc2FpZCBzb21lIG9mIHRoZSBtZW1vcnkgY2Fubm90IGJlIG9ubGluZWQgd2l0
aG91dCBmdXJ0aGVyIHN0ZXBzCj4gPiAoZS5nLiB3aGVuIGl0IGlzIHN0YW5kYnkgYXMgRGF2aWQg
Y2FsbGVkIGl0KSBhbmQgdGhlbiBJIGZhaWwgdG8gc2VlIGhvdwo+ID4gZUJQRiBoZWxwIGluIGFu
eSB3YXkuCj4gCj4gYW5kIGFsc28sIHdlIGNhbiBmaWdodCB0aWxsIHRoZSBlbmQgb2YgZGF5cyBo
ZXJlIHRyeWluZyB0byBjb21lIHVwIHdpdGgKPiBhbiBvbmxpbmluZyBzb2x1dGlvbiB3aGljaCB3
b3VsZCB3b3JrIGZvciBldmVyeW9uZSBhbmQgZUJQRiB3b3VsZCBtb3ZlCj4gdGhpcyBkZWNpc2lv
biB0byBkaXN0cm8gbGV2ZWwuCgpUaGUgcG9pbnQgaXMgdGhhdCB0aGVyZSBpcyBfbm9fIGdlbmVy
YWwgb25saW5pbmcgc29sdXRpb24uIFRoaXMgaXMKYmFzaWNhbGx5IHBvbGljeSB3aGljaCBiZWxv
bmdzIHRvIHRoZSB1c2Vyc3BhY2UuCi0tIApNaWNoYWwgSG9ja28KU1VTRSBMYWJzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
