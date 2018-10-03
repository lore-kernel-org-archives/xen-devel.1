From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC] mm/memory_hotplug: Introduce memory
 block types
Date: Wed, 3 Oct 2018 19:14:05 +0200
Message-ID: <06a35970-e478-18f8-eae6-4022925a5192__11510.9472455972$1538586797$gmane$org@redhat.com>
References: <20180928150357.12942-1-david@redhat.com>
 <20181001084038.GD18290@dhcp22.suse.cz>
 <d54a8509-725f-f771-72f0-15a9d93e8a49@redhat.com>
 <20181002134734.GT18290@dhcp22.suse.cz>
 <98fb8d65-b641-2225-f842-8804c6f79a06@redhat.com>
 <8736tndubn.fsf@vitty.brq.redhat.com> <20181003134444.GH4714@dhcp22.suse.cz>
 <87zhvvcf3b.fsf@vitty.brq.redhat.com>
 <49456818-238e-2d95-9df6-d1934e9c8b53@linux.intel.com>
 <87tvm3cd5w.fsf@vitty.brq.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=keg1=mp=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1g7kj6-0001Ej-Jl
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 17:14:20 +0000
In-Reply-To: <87tvm3cd5w.fsf@vitty.brq.redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Vitaly Kuznetsov <vkuznets@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Michal Hocko <mhocko@kernel.org>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Rashmica Gupta <rashmica.g@gmail.com>, Dan Williams <dan.j.williams@intel.com>, linux-s390@vger.kernel.org, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>, Rob
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTAvMjAxOCAxNjozNCwgVml0YWx5IEt1em5ldHNvdiB3cm90ZToKPiBEYXZlIEhhbnNl
biA8ZGF2ZS5oYW5zZW5AbGludXguaW50ZWwuY29tPiB3cml0ZXM6Cj4gCj4+IE9uIDEwLzAzLzIw
MTggMDY6NTIgQU0sIFZpdGFseSBLdXpuZXRzb3Ygd3JvdGU6Cj4+PiBJdCBpcyBtb3JlIHRoYW4g
anVzdCBtZW1tYXBzIChlLmcuIGZvcmtpbmcgdWRldiBwcm9jZXNzIGRvaW5nIG1lbW9yeQo+Pj4g
b25saW5pbmcgYWxzbyBuZWVkcyBtZW1vcnkpIGJ1dCB5ZXMsIHRoZSBtYWluIGlkZWEgaXMgdG8g
bWFrZSB0aGUKPj4+IG9ubGluaW5nIHN5bmNocm9ub3VzIHdpdGggaG90cGx1Zy4KPj4KPj4gVGhh
dCdzIGEgZ29vZCB0aGVvcmV0aWNhbCBjb25jZXJuLgo+Pgo+PiBCdXQsIGlzIGl0IGEgcHJvYmxl
bSB3ZSBuZWVkIHRvIHNvbHZlIGluIHByYWN0aWNlPwo+IAo+IFllcywgdW5mb3J0dW5hdGVseS4g
SXQgd2FzIHByZXZpb3VzbHkgZGlzY292ZXJlZCB0aGF0IHdoZW4gd2UgdHJ5IHRvCj4gaG90cGx1
ZyB0b25zIG9mIG1lbW9yeSB0byBhIGxvdyBtZW1vcnkgc3lzdGVtICh0aGlzIGlzIGEgY29tbW9u
IHNjZW5hcmlvCj4gd2l0aCBWTXMpIHdlIGVuZCB1cCB3aXRoIE9PTSBiZWNhdXNlIGZvciBhbGwg
bmV3IG1lbW9yeSBibG9ja3Mgd2UgbmVlZAo+IHRvIGFsbG9jYXRlIHBhZ2UgdGFibGVzLCBzdHJ1
Y3QgcGFnZXMsIC4uLiBhbmQgd2UgbmVlZCBtZW1vcnkgdG8gZG8KPiB0aGF0LiBUaGUgdXNlcnNw
YWNlIHByb2dyYW0gZG9pbmcgbWVtb3J5IG9ubGluaW5nIGFsc28gbmVlZHMgbWVtb3J5IHRvCj4g
cnVuIGFuZCBpbiBjYXNlIGl0IHByZWZlcnMgdG8gZm9yayB0byBoYW5kbGUgaHVuZHJlZHMgb2Yg
bm90ZmlmaWNhdGlvbnMKPiAuLi4gd2VsbCwgaXQgbWF5IGdldCBPT01raWxsZWQgYmVmb3JlIGl0
IG1hbmFnZXMgdG8gb25saW5lIGFueXRoaW5nLgo+IAo+IEFsbG9jYXRpbmcgYWxsIGtlcm5lbCBv
YmplY3RzIGZyb20gdGhlIG5ld2x5IGhvdHBsdWdnZWQgYmxvY2tzIHdvdWxkCj4gZGVmaW5pdGVs
eSBoZWxwIHRvIG1hbmFnZSB0aGUgc2l0dWF0aW9uIGJ1dCBhcyBJIHNhaWQgdGhpcyB3b24ndCBz
b2x2ZQo+IHRoZSAnZm9ya2luZyB1ZGV2JyBwcm9ibGVtIGNvbXBsZXRlbHkgKGl0IHdpbGwgbGlr
ZWx5IHJlbWFpbiBpbgo+ICdleHRyZW1lJyBjYXNlcyBvbmx5LiBXZSBjYW4gcHJvYmFibHkgd29y
ayBhcm91bmQgaXQgYnkgb25saW5pbmcgd2l0aCBhCj4gZGVkaWNhdGVkIHByb2Nlc3Mgd2hpY2gg
ZG9lc24ndCBkbyBtZW1vcnkgYWxsb2NhdGlvbikuCj4gCgpJIGd1ZXNzIHRoZSBwcm9ibGVtIGlz
IGV2ZW4gd29yc2UuIFdlIGFsd2F5cyBoYXZlIHR3byBwaGFzZXMKCjEuIGFkZCBtZW1vcnkgLSBy
ZXF1aXJlcyBtZW1vcnkgYWxsb2NhdGlvbgoyLiBvbmxpbmUgbWVtb3J5IC0gbWlnaHQgcmVxdWly
ZSBtZW1vcnkgYWxsb2NhdGlvbnMgZS5nLiBmb3Igc2xhYi9zbHViCgpTbyBpZiB3ZSBqdXN0IGFk
ZGVkIG1lbW9yeSBidXQgZG9uJ3QgaGF2ZSBzdWZmaWNpZW50IG1lbW9yeSB0byBzdGFydCBhCnVz
ZXIgc3BhY2UgcHJvY2VzcyB0byB0cmlnZ2VyIG9ubGluaW5nLCB0aGVuIHdlIG1vc3QgbGlrZWx5
IGFsc28gZG9uJ3QKaGF2ZSBzdWZmaWNpZW50IG1lbW9yeSB0byBvbmxpbmUgdGhlIG1lbW9yeSBy
aWdodCBhd2F5IChpbiBzb21lIHNjZW5hcmlvcykuCgpXZSB3b3VsZCBoYXZlIHRvIGFsbG9jYXRl
IGFsbCBuZXcgbWVtb3J5IGZvciAxIGFuZCAyIGZyb20gdGhlIG1lbW9yeSB0bwpiZSBvbmxpbmVk
LiBJIGd1ZXNzIHRoZSBsYXR0ZXIgcGFydCBpcyBsZXNzIHRyaXZpYWwuCgpTbyB3aGlsZSBvbmxp
bmluZyB0aGUgbWVtb3J5IGZyb20gdGhlIGtlcm5lbCBtaWdodCBtYWtlIHRoaW5ncyBhIGxpdHRs
ZQptb3JlIHJvYnVzdCwgd2Ugd291bGQgc3RpbGwgaGF2ZSB0aGUgY2hhbmNlIGZvciBPT00gLyBv
bmxpbmluZyBmYWlsaW5nLgoKLS0gCgpUaGFua3MsCgpEYXZpZCAvIGRoaWxkZW5iCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
