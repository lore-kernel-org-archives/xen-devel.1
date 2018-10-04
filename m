From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH RFC] mm/memory_hotplug: Introduce memory
 block types
Date: Thu, 4 Oct 2018 08:19:38 +0200
Message-ID: <20181004061938.GB22173__46226.6168011867$1538633917$gmane$org@dhcp22.suse.cz>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=etb5=mq=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1g7wzD-0006LD-L5
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 06:19:47 +0000
Content-Disposition: inline
In-Reply-To: <06a35970-e478-18f8-eae6-4022925a5192@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Rashmica Gupta <rashmica.g@gmail.com>, Dan Williams <dan.j.williams@intel.com>, linux-s390@vger.kernel.org, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, Pavel
List-Id: xen-devel@lists.xenproject.org

T24gV2VkIDAzLTEwLTE4IDE5OjE0OjA1LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPiBPbiAw
My8xMC8yMDE4IDE2OjM0LCBWaXRhbHkgS3V6bmV0c292IHdyb3RlOgo+ID4gRGF2ZSBIYW5zZW4g
PGRhdmUuaGFuc2VuQGxpbnV4LmludGVsLmNvbT4gd3JpdGVzOgo+ID4gCj4gPj4gT24gMTAvMDMv
MjAxOCAwNjo1MiBBTSwgVml0YWx5IEt1em5ldHNvdiB3cm90ZToKPiA+Pj4gSXQgaXMgbW9yZSB0
aGFuIGp1c3QgbWVtbWFwcyAoZS5nLiBmb3JraW5nIHVkZXYgcHJvY2VzcyBkb2luZyBtZW1vcnkK
PiA+Pj4gb25saW5pbmcgYWxzbyBuZWVkcyBtZW1vcnkpIGJ1dCB5ZXMsIHRoZSBtYWluIGlkZWEg
aXMgdG8gbWFrZSB0aGUKPiA+Pj4gb25saW5pbmcgc3luY2hyb25vdXMgd2l0aCBob3RwbHVnLgo+
ID4+Cj4gPj4gVGhhdCdzIGEgZ29vZCB0aGVvcmV0aWNhbCBjb25jZXJuLgo+ID4+Cj4gPj4gQnV0
LCBpcyBpdCBhIHByb2JsZW0gd2UgbmVlZCB0byBzb2x2ZSBpbiBwcmFjdGljZT8KPiA+IAo+ID4g
WWVzLCB1bmZvcnR1bmF0ZWx5LiBJdCB3YXMgcHJldmlvdXNseSBkaXNjb3ZlcmVkIHRoYXQgd2hl
biB3ZSB0cnkgdG8KPiA+IGhvdHBsdWcgdG9ucyBvZiBtZW1vcnkgdG8gYSBsb3cgbWVtb3J5IHN5
c3RlbSAodGhpcyBpcyBhIGNvbW1vbiBzY2VuYXJpbwo+ID4gd2l0aCBWTXMpIHdlIGVuZCB1cCB3
aXRoIE9PTSBiZWNhdXNlIGZvciBhbGwgbmV3IG1lbW9yeSBibG9ja3Mgd2UgbmVlZAo+ID4gdG8g
YWxsb2NhdGUgcGFnZSB0YWJsZXMsIHN0cnVjdCBwYWdlcywgLi4uIGFuZCB3ZSBuZWVkIG1lbW9y
eSB0byBkbwo+ID4gdGhhdC4gVGhlIHVzZXJzcGFjZSBwcm9ncmFtIGRvaW5nIG1lbW9yeSBvbmxp
bmluZyBhbHNvIG5lZWRzIG1lbW9yeSB0bwo+ID4gcnVuIGFuZCBpbiBjYXNlIGl0IHByZWZlcnMg
dG8gZm9yayB0byBoYW5kbGUgaHVuZHJlZHMgb2Ygbm90ZmlmaWNhdGlvbnMKPiA+IC4uLiB3ZWxs
LCBpdCBtYXkgZ2V0IE9PTWtpbGxlZCBiZWZvcmUgaXQgbWFuYWdlcyB0byBvbmxpbmUgYW55dGhp
bmcuCj4gPiAKPiA+IEFsbG9jYXRpbmcgYWxsIGtlcm5lbCBvYmplY3RzIGZyb20gdGhlIG5ld2x5
IGhvdHBsdWdnZWQgYmxvY2tzIHdvdWxkCj4gPiBkZWZpbml0ZWx5IGhlbHAgdG8gbWFuYWdlIHRo
ZSBzaXR1YXRpb24gYnV0IGFzIEkgc2FpZCB0aGlzIHdvbid0IHNvbHZlCj4gPiB0aGUgJ2Zvcmtp
bmcgdWRldicgcHJvYmxlbSBjb21wbGV0ZWx5IChpdCB3aWxsIGxpa2VseSByZW1haW4gaW4KPiA+
ICdleHRyZW1lJyBjYXNlcyBvbmx5LiBXZSBjYW4gcHJvYmFibHkgd29yayBhcm91bmQgaXQgYnkg
b25saW5pbmcgd2l0aCBhCj4gPiBkZWRpY2F0ZWQgcHJvY2VzcyB3aGljaCBkb2Vzbid0IGRvIG1l
bW9yeSBhbGxvY2F0aW9uKS4KPiA+IAo+IAo+IEkgZ3Vlc3MgdGhlIHByb2JsZW0gaXMgZXZlbiB3
b3JzZS4gV2UgYWx3YXlzIGhhdmUgdHdvIHBoYXNlcwo+IAo+IDEuIGFkZCBtZW1vcnkgLSByZXF1
aXJlcyBtZW1vcnkgYWxsb2NhdGlvbgo+IDIuIG9ubGluZSBtZW1vcnkgLSBtaWdodCByZXF1aXJl
IG1lbW9yeSBhbGxvY2F0aW9ucyBlLmcuIGZvciBzbGFiL3NsdWIKPiAKPiBTbyBpZiB3ZSBqdXN0
IGFkZGVkIG1lbW9yeSBidXQgZG9uJ3QgaGF2ZSBzdWZmaWNpZW50IG1lbW9yeSB0byBzdGFydCBh
Cj4gdXNlciBzcGFjZSBwcm9jZXNzIHRvIHRyaWdnZXIgb25saW5pbmcsIHRoZW4gd2UgbW9zdCBs
aWtlbHkgYWxzbyBkb24ndAo+IGhhdmUgc3VmZmljaWVudCBtZW1vcnkgdG8gb25saW5lIHRoZSBt
ZW1vcnkgcmlnaHQgYXdheSAoaW4gc29tZSBzY2VuYXJpb3MpLgo+IAo+IFdlIHdvdWxkIGhhdmUg
dG8gYWxsb2NhdGUgYWxsIG5ldyBtZW1vcnkgZm9yIDEgYW5kIDIgZnJvbSB0aGUgbWVtb3J5IHRv
Cj4gYmUgb25saW5lZC4gSSBndWVzcyB0aGUgbGF0dGVyIHBhcnQgaXMgbGVzcyB0cml2aWFsLgo+
IAo+IFNvIHdoaWxlIG9ubGluaW5nIHRoZSBtZW1vcnkgZnJvbSB0aGUga2VybmVsIG1pZ2h0IG1h
a2UgdGhpbmdzIGEgbGl0dGxlCj4gbW9yZSByb2J1c3QsIHdlIHdvdWxkIHN0aWxsIGhhdmUgdGhl
IGNoYW5jZSBmb3IgT09NIC8gb25saW5pbmcgZmFpbGluZy4KClllcywgX3RoZW9yZXRpY2FsbHlf
LiBJcyB0aGlzIGEgcHJhY3RpY2FsIHByb2JsZW0gZm9yIHJlYXNvbmFibGUKY29uZmlndXJhdGlv
bnMgdGhvdWdoPyBJIG1lYW4sIHRoaXMgd2lsbCBuZXZlciBiZSBwZXJmZWN0IGFuZCB3ZSBzaW1w
bHkKY2Fubm90IHN1cHBvcnQgYWxsIHBvc3NpYmxlIGNvbmZpZ3VyYXRpb25zLiBXZSBzaG91bGQg
Zm9jdXMgb24KcmVhc29uYWJsZSBzdWJzZXQgb2YgdGhlbS4gRnJvbSBteSBwcmFjdGljYWwgZXhw
ZXJpZW5jZSB0aGUgdmFzdAptYWpvcml0eSBvZiBtZW1vcnkgaXMgY29uc3VtZWQgYnkgbWVtbWFw
cyAocm91Z2hseSAxLjUlKS4gVGhhdCBpcyBub3QgYQpsb3QgYnV0IEkgYWdyZWUgdGhhdCBhbGxv
Y2F0aW5nIHRoYXQgZnJvbSB0aGUgem9uZSBub3JtYWwgYW5kIG9mZiBub2RlCmlzIG5vdCBncmVh
dC4gRXNwZWNpYWxseSB0aGUgc2Vjb25kIHBhcnQgd2hpY2ggaXMgbm90aWNlYWJsZSBmb3Igd2hv
bGUKbm9kZSBob3RwbHVnLgoKSSBoYXZlIGEgZmVlbGluZyB0aGF0IGFyZ3VpbmcgYWJvdXQgZm9y
ayBub3QgYWJsZSB0byBwcm9jZWVkIG9yIE9PTWluZwpmb3IgdGhlIG1lbW9yeSBob3RwbHVnIGlz
IGEgYml0IG9mIGEgc3RyZXRjaCBhbmQgYSBzaWduIGEgb2YKbWlzY29uZmlndXJhdGlvbi4KLS0g
Ck1pY2hhbCBIb2NrbwpTVVNFIExhYnMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
