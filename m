From: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH RFC] mm/memory_hotplug: Introduce memory
 block types
Date: Wed, 03 Oct 2018 16:34:03 +0200
Message-ID: <87tvm3cd5w.fsf__33031.9899986081$1538577189$gmane$org@vitty.brq.redhat.com>
References: <20180928150357.12942-1-david@redhat.com>
 <20181001084038.GD18290@dhcp22.suse.cz>
 <d54a8509-725f-f771-72f0-15a9d93e8a49@redhat.com>
 <20181002134734.GT18290@dhcp22.suse.cz>
 <98fb8d65-b641-2225-f842-8804c6f79a06@redhat.com>
 <8736tndubn.fsf@vitty.brq.redhat.com> <20181003134444.GH4714@dhcp22.suse.cz>
 <87zhvvcf3b.fsf@vitty.brq.redhat.com>
 <49456818-238e-2d95-9df6-d1934e9c8b53@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=71au=mp=redhat.com=vkuznets@srs-us1.protection.inumbo.net>)
 id 1g7iEJ-0004cu-Jy
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 14:34:23 +0000
In-Reply-To: <49456818-238e-2d95-9df6-d1934e9c8b53@linux.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dave Hansen <dave.hansen@linux.intel.com>, Michal Hocko <mhocko@kernel.org>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, "H.
 Peter Anvin" <hpa@zytor.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Rashmica Gupta <rashmica.g@gmail.com>, Dan Williams <dan.j.williams@intel.com>, linux-s390@vger.kernel.org, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, David Hildenbrand <david@redhat.com>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>Pavel Tatashin <p>
List-Id: xen-devel@lists.xenproject.org

RGF2ZSBIYW5zZW4gPGRhdmUuaGFuc2VuQGxpbnV4LmludGVsLmNvbT4gd3JpdGVzOgoKPiBPbiAx
MC8wMy8yMDE4IDA2OjUyIEFNLCBWaXRhbHkgS3V6bmV0c292IHdyb3RlOgo+PiBJdCBpcyBtb3Jl
IHRoYW4ganVzdCBtZW1tYXBzIChlLmcuIGZvcmtpbmcgdWRldiBwcm9jZXNzIGRvaW5nIG1lbW9y
eQo+PiBvbmxpbmluZyBhbHNvIG5lZWRzIG1lbW9yeSkgYnV0IHllcywgdGhlIG1haW4gaWRlYSBp
cyB0byBtYWtlIHRoZQo+PiBvbmxpbmluZyBzeW5jaHJvbm91cyB3aXRoIGhvdHBsdWcuCj4KPiBU
aGF0J3MgYSBnb29kIHRoZW9yZXRpY2FsIGNvbmNlcm4uCj4KPiBCdXQsIGlzIGl0IGEgcHJvYmxl
bSB3ZSBuZWVkIHRvIHNvbHZlIGluIHByYWN0aWNlPwoKWWVzLCB1bmZvcnR1bmF0ZWx5LiBJdCB3
YXMgcHJldmlvdXNseSBkaXNjb3ZlcmVkIHRoYXQgd2hlbiB3ZSB0cnkgdG8KaG90cGx1ZyB0b25z
IG9mIG1lbW9yeSB0byBhIGxvdyBtZW1vcnkgc3lzdGVtICh0aGlzIGlzIGEgY29tbW9uIHNjZW5h
cmlvCndpdGggVk1zKSB3ZSBlbmQgdXAgd2l0aCBPT00gYmVjYXVzZSBmb3IgYWxsIG5ldyBtZW1v
cnkgYmxvY2tzIHdlIG5lZWQKdG8gYWxsb2NhdGUgcGFnZSB0YWJsZXMsIHN0cnVjdCBwYWdlcywg
Li4uIGFuZCB3ZSBuZWVkIG1lbW9yeSB0byBkbwp0aGF0LiBUaGUgdXNlcnNwYWNlIHByb2dyYW0g
ZG9pbmcgbWVtb3J5IG9ubGluaW5nIGFsc28gbmVlZHMgbWVtb3J5IHRvCnJ1biBhbmQgaW4gY2Fz
ZSBpdCBwcmVmZXJzIHRvIGZvcmsgdG8gaGFuZGxlIGh1bmRyZWRzIG9mIG5vdGZpZmljYXRpb25z
Ci4uLiB3ZWxsLCBpdCBtYXkgZ2V0IE9PTWtpbGxlZCBiZWZvcmUgaXQgbWFuYWdlcyB0byBvbmxp
bmUgYW55dGhpbmcuCgpBbGxvY2F0aW5nIGFsbCBrZXJuZWwgb2JqZWN0cyBmcm9tIHRoZSBuZXds
eSBob3RwbHVnZ2VkIGJsb2NrcyB3b3VsZApkZWZpbml0ZWx5IGhlbHAgdG8gbWFuYWdlIHRoZSBz
aXR1YXRpb24gYnV0IGFzIEkgc2FpZCB0aGlzIHdvbid0IHNvbHZlCnRoZSAnZm9ya2luZyB1ZGV2
JyBwcm9ibGVtIGNvbXBsZXRlbHkgKGl0IHdpbGwgbGlrZWx5IHJlbWFpbiBpbgonZXh0cmVtZScg
Y2FzZXMgb25seS4gV2UgY2FuIHByb2JhYmx5IHdvcmsgYXJvdW5kIGl0IGJ5IG9ubGluaW5nIHdp
dGggYQpkZWRpY2F0ZWQgcHJvY2VzcyB3aGljaCBkb2Vzbid0IGRvIG1lbW9yeSBhbGxvY2F0aW9u
KS4KCi0tIApWaXRhbHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
