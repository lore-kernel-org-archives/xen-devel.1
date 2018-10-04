From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Subject: Re: [PATCH RFC] mm/memory_hotplug: Introduce memory
 block types
Date: Thu, 4 Oct 2018 19:50:10 +0200
Message-ID: <20181004195010.3616fc40__40119.4421727725$1538675350$gmane$org@kitsune.suse.cz>
References: <20181001084038.GD18290@dhcp22.suse.cz>
 <d54a8509-725f-f771-72f0-15a9d93e8a49@redhat.com>
 <20181002134734.GT18290@dhcp22.suse.cz>
 <98fb8d65-b641-2225-f842-8804c6f79a06@redhat.com>
 <8736tndubn.fsf@vitty.brq.redhat.com>
 <20181003134444.GH4714@dhcp22.suse.cz>
 <87zhvvcf3b.fsf@vitty.brq.redhat.com>
 <49456818-238e-2d95-9df6-d1934e9c8b53@linux.intel.com>
 <87tvm3cd5w.fsf@vitty.brq.redhat.com>
 <06a35970-e478-18f8-eae6-4022925a5192@redhat.com>
 <20181004061938.GB22173@dhcp22.suse.cz>
 <efd50413-4be4-06c4-5ef0-711fdf05db71@redhat.com>
 <20181004172807.1eef3a6b@kitsune.suse.cz>
 <14992b68-5402-9168-0050-b3c6ac4a8c90@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ka6p=mq=suse.de=msuchanek@srs-us1.protection.inumbo.net>)
 id 1g87lT-000222-9L
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 17:50:19 +0000
In-Reply-To: <14992b68-5402-9168-0050-b3c6ac4a8c90@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Rashmica Gupta <rashmica.g@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>, Rob Herring <robh@kernel.org>, mike.travis@hpe.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCA0IE9jdCAyMDE4IDE3OjQ1OjEzICswMjAwCkRhdmlkIEhpbGRlbmJyYW5kIDxkYXZp
ZEByZWRoYXQuY29tPiB3cm90ZToKCj4gT24gMDQvMTAvMjAxOCAxNzoyOCwgTWljaGFsIFN1Y2jD
oW5layB3cm90ZToKCj4gPiAKPiA+IFRoZSBzdGF0ZSBvZiB0aGUgYXJ0IGlzIHRvIGRldGVybWlu
ZSB3aGF0IHRvIGRvIHdpdGggaG90cGx1Z2dlZAo+ID4gbWVtb3J5IGluIHVzZXJzcGFjZSBiYXNl
ZCBvbiBwbGF0Zm9ybSBhbmQgdmlydHVhbGl6YXRpb24gdHlwZS4gIAo+IAo+IEV4YWN0bHkuCj4g
Cj4gPiAKPiA+IENoYW5naW5nIHRoZSBkZWZhdWx0IHRvIGRlcGVuZCBvbiB0aGUgZHJpdmVyIHRo
YXQgYWRkZWQgdGhlIG1lbW9yeQo+ID4gcmF0aGVyIHRoYW4gcGxhdGZvcm0gdHlwZSBzaG91bGQg
c29sdmUgdGhlIGlzc3VlIG9mIFZNcyBncm93aW5nCj4gPiBkaWZmZXJlbnQgdHlwZXMgb2YgbWVt
b3J5IGRldmljZSBlbXVsYXRpb24uICAKPiAKPiBZZXMsIG15IG9yaWdpbmFsIHByb3Bvc2FsICh0
aGlzIHBhdGNoKSB3YXMgdG8gaGFuZGxlIGl0IGluIHRoZSBrZXJuZWwKPiBmb3Iga25vd24gdHlw
ZXMuIEJ1dCBhcyB3ZSBsZWFybmVkLCB0aGVyZSBtaWdodCBiZSBzb21lIHVzZSBjYXNlcyB0aGF0
Cj4gbWlnaHQgc3RpbGwgcmVxdWlyZSB0byBtYWtlIGEgZGVjaXNpb24gaW4gdXNlciBzcGFjZS4K
PiAKPiBTbyBwcm92aWRpbmcgdGhlIHVzZXIgc3BhY2UgZWl0aGVyIHdpdGggc29tZSB0eXBlIGhp
bnQgKGF1dG8tb25saW5lCj4gdnMuIHN0YW5kYnkpIG9yIHRoZSBkcml2ZXIgdGhhdCBhZGRlZCBp
dCAoc3lzdGVtIHZzLiBoeXBlci12IC4uLikKPiB3b3VsZCBzb2x2ZSB0aGUgaXNzdWUuCgpJcyB0
aGF0IG5vdCBhdmFpbGFibGUgaW4gdGhlIHVkZXYgZXZlbnQ/CgpUaGFua3MKCk1pY2hhbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
