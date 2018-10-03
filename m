From: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH RFC] mm/memory_hotplug: Introduce memory
 block types
Date: Wed, 03 Oct 2018 15:52:24 +0200
Message-ID: <87zhvvcf3b.fsf__7320.53706092319$1538574681$gmane$org@vitty.brq.redhat.com>
References: <20180928150357.12942-1-david@redhat.com>
 <20181001084038.GD18290@dhcp22.suse.cz>
 <d54a8509-725f-f771-72f0-15a9d93e8a49@redhat.com>
 <20181002134734.GT18290@dhcp22.suse.cz>
 <98fb8d65-b641-2225-f842-8804c6f79a06@redhat.com>
 <8736tndubn.fsf@vitty.brq.redhat.com> <20181003134444.GH4714@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=71au=mp=redhat.com=vkuznets@srs-us1.protection.inumbo.net>)
 id 1g7hZv-0001D9-N9
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 13:52:39 +0000
In-Reply-To: <20181003134444.GH4714@dhcp22.suse.cz>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Rashmica Gupta <rashmica.g@gmail.com>, Dan Williams <dan.j.williams@intel.com>, linux-s390@vger.kernel.org, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, David Hildenbrand <david@redhat.com>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Len
List-Id: xen-devel@lists.xenproject.org

TWljaGFsIEhvY2tvIDxtaG9ja29Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBPbiBXZWQgMDMtMTAt
MTggMTU6Mzg6MDQsIFZpdGFseSBLdXpuZXRzb3Ygd3JvdGU6Cj4+IERhdmlkIEhpbGRlbmJyYW5k
IDxkYXZpZEByZWRoYXQuY29tPiB3cml0ZXM6Cj4+IAo+PiA+IE9uIDAyLzEwLzIwMTggMTU6NDcs
IE1pY2hhbCBIb2NrbyB3cm90ZToKPj4gLi4uCj4+ID4+IAo+PiA+PiBXaHkgZG8geW91IG5lZWQg
YSBnZW5lcmljIGhvdHBsdWcgcnVsZSBpbiB0aGUgZmlyc3QgcGxhY2U/IFdoeSBkb24ndCB5b3UK
Pj4gPj4gc2ltcGx5IHByb3ZpZGUgZGlmZmVyZW50IHNldCBvZiBydWxlcyBmb3IgZGlmZmVyZW50
IHVzZWNhc2VzPyBMZXQgdXNlcnMKPj4gPj4gZGVjaWRlIHdoaWNoIHVzZWNhc2UgdGhleSBwcmVm
ZXIgcmF0aGVyIHRoYW4gdHJ5IHRvIGJlIGNsZXZlciB3aGljaAo+PiA+PiBhbG1vc3QgYWx3YXlz
IGhpdHMgd2VpcmQgY29ybmVyIGNhc2VzLgo+PiA+PiAKPj4gPgo+PiA+IE1lbW9yeSBob3RwbHVn
IGhhcyB0byB3b3JrIGFzIHJlbGlhYmxlIGFzIHdlIGNhbiBvdXQgb2YgdGhlIGJveC4gTGV0dGlu
Zwo+PiA+IHRoZSB1c2VyIG1ha2Ugc2ltcGxlIGRlY2lzaW9ucyBsaWtlICJvaCwgSSBhbSBvbiBo
eXBlci1WLCBJIHdhbnQgdG8KPj4gPiBvbmxpbmUgbWVtb3J5IHRvIHRoZSBub3JtYWwgem9uZSIg
ZG9lcyBub3QgZmVlbCByaWdodC4gQnV0IHllcywgd2UKPj4gPiBzaG91bGQgZGVmaW5pdGVseSBh
bGxvdyB0byBtYWtlIG1vZGlmaWNhdGlvbnMuCj4+IAo+PiBMYXN0IHRpbWUgSSB3YXMgdGhpbmtp
bmcgYWJvdXQgdGhlIGltcGVyZmVjdG5lc3Mgb2YgdGhlIGF1dG8tb25saW5lCj4+IHNvbHV0aW9u
IHdlIGhhdmUgYW5kIGFueSBvdGhlciBzb2x1dGlvbiB3ZSdyZSBhYmxlIHRvIHN1Z2dlc3QgYW4g
aWRlYQo+PiBjYW1lIHRvIG15IG1pbmQgLSB3aGF0IGlmIHdlIGFkZCBhbiBlQlBGIGF0dGFjaCBw
b2ludCB0byB0aGUKPj4gYXV0by1vbmxpbmluZyBtZWNoYW5pc20gZWZmZWNpdmVseSBvZmZsb2Fk
aW5nIGRlY2lzaW9uLW1ha2luZyB0bwo+PiB1c2Vyc3BhY2UuIFdlJ2xsIG9mIGNvdXNlIG5lZWQg
dG8gcHJvdmlkZSBhbGwgcmVxdWlyZWQgZGF0YSAoZS5nLiBob3cKPj4gbWVtb3J5IGJsb2NrcyBh
cmUgYWxpZ25lZCB3aXRoIHBoeXNpY2FsIERJTU1zIGFzIGl0IG1ha2VzIG5vIHNlbnNlIHRvCj4+
IG9ubGluZSBwYXJ0IG9mIERJTU0gYXMgbm9ybWFsIGFuZCB0aGUgcmVzdCBhcyBtb3ZhYmxlIGFz
IGl0J3MgZ29pbmcgdG8KPj4gYmUgaW1wb3NzaWJsZSB0byB1bnBsdWcgc3VjaCBESU1NIGFueXdh
eXMpLgo+Cj4gQW5kIGhvdyBkb2VzIHRoYXQgZGlmZmVyIGZyb20gdGhlIG5vdGlmaWNhdGlvbiBt
ZWNoYW5pc20gd2UgaGF2ZT8gSnVzdAo+IGJ5IG5vdCByZWx5aW5nIG9uIHRoZSBwcm9jZXNzIHNj
aGVkdWxpbmc/IElmIHllcyB0aGVuIHRoaXMgcmV2b2x2ZXMKPiBhcm91bmQgdGhlIGltcGxlbWVu
dGF0aW9uIGRldGFpbCB0aGF0IHlvdSBjYXJlIGFib3V0IHRpbWUtdG8taG90LWFkZAo+IHZzLiB0
aW1lLXRvLW9ubGluZS4gQW5kIHRoYXQgaXMgYSBzb2x2ZWFibGUgcHJvYmxlbSAtIGp1c3QgYWxs
b2NhdGUKPiBtZW1tYXBzIGZyb20gdGhlIGhvdC1hZGRlZCBtZW1vcnkuCgpJdCBpcyBtb3JlIHRo
YW4ganVzdCBtZW1tYXBzIChlLmcuIGZvcmtpbmcgdWRldiBwcm9jZXNzIGRvaW5nIG1lbW9yeQpv
bmxpbmluZyBhbHNvIG5lZWRzIG1lbW9yeSkgYnV0IHllcywgdGhlIG1haW4gaWRlYSBpcyB0byBt
YWtlIHRoZQpvbmxpbmluZyBzeW5jaHJvbm91cyB3aXRoIGhvdHBsdWcuCgo+Cj4gQXMgRGF2aWQg
c2FpZCBzb21lIG9mIHRoZSBtZW1vcnkgY2Fubm90IGJlIG9ubGluZWQgd2l0aG91dCBmdXJ0aGVy
IHN0ZXBzCj4gKGUuZy4gd2hlbiBpdCBpcyBzdGFuZGJ5IGFzIERhdmlkIGNhbGxlZCBpdCkgYW5k
IHRoZW4gSSBmYWlsIHRvIHNlZSBob3cKPiBlQlBGIGhlbHAgaW4gYW55IHdheS4KCmFuZCBhbHNv
LCB3ZSBjYW4gZmlnaHQgdGlsbCB0aGUgZW5kIG9mIGRheXMgaGVyZSB0cnlpbmcgdG8gY29tZSB1
cCB3aXRoCmFuIG9ubGluaW5nIHNvbHV0aW9uIHdoaWNoIHdvdWxkIHdvcmsgZm9yIGV2ZXJ5b25l
IGFuZCBlQlBGIHdvdWxkIG1vdmUKdGhpcyBkZWNpc2lvbiB0byBkaXN0cm8gbGV2ZWwuCgotLSAK
Vml0YWx5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
