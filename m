From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC] mm/memory_hotplug: Introduce memory
 block types
Date: Fri, 5 Oct 2018 09:37:39 +0200
Message-ID: <a0739be1-564a-2853-c814-3290e64f24af__29999.8095994399$1538725003$gmane$org@redhat.com>
References: <20181001084038.GD18290@dhcp22.suse.cz>
 <d54a8509-725f-f771-72f0-15a9d93e8a49@redhat.com>
 <20181002134734.GT18290@dhcp22.suse.cz>
 <98fb8d65-b641-2225-f842-8804c6f79a06@redhat.com>
 <8736tndubn.fsf@vitty.brq.redhat.com> <20181003134444.GH4714@dhcp22.suse.cz>
 <87zhvvcf3b.fsf@vitty.brq.redhat.com>
 <49456818-238e-2d95-9df6-d1934e9c8b53@linux.intel.com>
 <87tvm3cd5w.fsf@vitty.brq.redhat.com>
 <06a35970-e478-18f8-eae6-4022925a5192@redhat.com>
 <20181004061938.GB22173@dhcp22.suse.cz>
 <efd50413-4be4-06c4-5ef0-711fdf05db71@redhat.com>
 <20181004172807.1eef3a6b@kitsune.suse.cz>
 <14992b68-5402-9168-0050-b3c6ac4a8c90@redhat.com>
 <20181004195010.3616fc40@kitsune.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xnbc=mr=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1g8KgN-0002cw-Gk
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 07:37:55 +0000
In-Reply-To: <20181004195010.3616fc40@kitsune.suse.cz>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Rashmica Gupta <rashmica.g@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>, Rob Herring <robh@kernel.org>, mike.travis@hpe.com
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMTAvMjAxOCAxOTo1MCwgTWljaGFsIFN1Y2jDoW5layB3cm90ZToKPiBPbiBUaHUsIDQg
T2N0IDIwMTggMTc6NDU6MTMgKzAyMDAKPiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4gCj4+IE9uIDA0LzEwLzIwMTggMTc6MjgsIE1pY2hhbCBTdWNow6FuZWsg
d3JvdGU6Cj4gCj4+Pgo+Pj4gVGhlIHN0YXRlIG9mIHRoZSBhcnQgaXMgdG8gZGV0ZXJtaW5lIHdo
YXQgdG8gZG8gd2l0aCBob3RwbHVnZ2VkCj4+PiBtZW1vcnkgaW4gdXNlcnNwYWNlIGJhc2VkIG9u
IHBsYXRmb3JtIGFuZCB2aXJ0dWFsaXphdGlvbiB0eXBlLiAgCj4+Cj4+IEV4YWN0bHkuCj4+Cj4+
Pgo+Pj4gQ2hhbmdpbmcgdGhlIGRlZmF1bHQgdG8gZGVwZW5kIG9uIHRoZSBkcml2ZXIgdGhhdCBh
ZGRlZCB0aGUgbWVtb3J5Cj4+PiByYXRoZXIgdGhhbiBwbGF0Zm9ybSB0eXBlIHNob3VsZCBzb2x2
ZSB0aGUgaXNzdWUgb2YgVk1zIGdyb3dpbmcKPj4+IGRpZmZlcmVudCB0eXBlcyBvZiBtZW1vcnkg
ZGV2aWNlIGVtdWxhdGlvbi4gIAo+Pgo+PiBZZXMsIG15IG9yaWdpbmFsIHByb3Bvc2FsICh0aGlz
IHBhdGNoKSB3YXMgdG8gaGFuZGxlIGl0IGluIHRoZSBrZXJuZWwKPj4gZm9yIGtub3duIHR5cGVz
LiBCdXQgYXMgd2UgbGVhcm5lZCwgdGhlcmUgbWlnaHQgYmUgc29tZSB1c2UgY2FzZXMgdGhhdAo+
PiBtaWdodCBzdGlsbCByZXF1aXJlIHRvIG1ha2UgYSBkZWNpc2lvbiBpbiB1c2VyIHNwYWNlLgo+
Pgo+PiBTbyBwcm92aWRpbmcgdGhlIHVzZXIgc3BhY2UgZWl0aGVyIHdpdGggc29tZSB0eXBlIGhp
bnQgKGF1dG8tb25saW5lCj4+IHZzLiBzdGFuZGJ5KSBvciB0aGUgZHJpdmVyIHRoYXQgYWRkZWQg
aXQgKHN5c3RlbSB2cy4gaHlwZXItdiAuLi4pCj4+IHdvdWxkIHNvbHZlIHRoZSBpc3N1ZS4KPiAK
PiBJcyB0aGF0IG5vdCBhdmFpbGFibGUgaW4gdGhlIHVkZXYgZXZlbnQ/Cj4gCgpOb3QgdGhhdCBJ
IGFtIGF3YXJlLiBNZW1vcnkgYmxvY2tzICJkZXZpY2VzIiBoYXZlIG5vIGRyaXZlcnMuCgpscyAt
bGEgL3N5cy9kZXZpY2VzL3N5c3RlbS9tZW1vcnkvbWVtb3J5MC9zdWJzeXN0ZW0vZHJpdmVycwp0
b3RhbCAwCgooYWRkX21lbW9yeSgpL2FkZF9tZW1vcnlfcmVzb3VyY2UoKSBjcmVhdGVzIHRoZSBt
ZW1vcnkgYmxvY2sgZGV2aWNlcwp3aGVuIGNhbGxlZCBmcm9tIGEgZHJpdmVyKQoKCj4gVGhhbmtz
Cj4gCj4gTWljaGFsCj4gCgoKLS0gCgpUaGFua3MsCgpEYXZpZCAvIGRoaWxkZW5iCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
