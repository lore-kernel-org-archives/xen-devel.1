From: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH RFC] mm/memory_hotplug: Introduce memory
 block types
Date: Wed, 03 Oct 2018 15:38:04 +0200
Message-ID: <8736tndubn.fsf__20691.5427268997$1538573837$gmane$org@vitty.brq.redhat.com>
References: <20180928150357.12942-1-david@redhat.com>
 <20181001084038.GD18290@dhcp22.suse.cz>
 <d54a8509-725f-f771-72f0-15a9d93e8a49@redhat.com>
 <20181002134734.GT18290@dhcp22.suse.cz>
 <98fb8d65-b641-2225-f842-8804c6f79a06@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=71au=mp=redhat.com=vkuznets@srs-us1.protection.inumbo.net>)
 id 1g7hM7-0007q9-GE
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 13:38:23 +0000
In-Reply-To: <98fb8d65-b641-2225-f842-8804c6f79a06@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@kernel.org>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, "H.
 Peter Anvin" <hpa@zytor.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Rashmica Gupta <rashmica.g@gmail.com>, Dan Williams <dan.j.williams@intel.com>, linux-s390@vger.kernel.org, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, Pavel
List-Id: xen-devel@lists.xenproject.org

RGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+IHdyaXRlczoKCj4gT24gMDIvMTAv
MjAxOCAxNTo0NywgTWljaGFsIEhvY2tvIHdyb3RlOgouLi4KPj4gCj4+IFdoeSBkbyB5b3UgbmVl
ZCBhIGdlbmVyaWMgaG90cGx1ZyBydWxlIGluIHRoZSBmaXJzdCBwbGFjZT8gV2h5IGRvbid0IHlv
dQo+PiBzaW1wbHkgcHJvdmlkZSBkaWZmZXJlbnQgc2V0IG9mIHJ1bGVzIGZvciBkaWZmZXJlbnQg
dXNlY2FzZXM/IExldCB1c2Vycwo+PiBkZWNpZGUgd2hpY2ggdXNlY2FzZSB0aGV5IHByZWZlciBy
YXRoZXIgdGhhbiB0cnkgdG8gYmUgY2xldmVyIHdoaWNoCj4+IGFsbW9zdCBhbHdheXMgaGl0cyB3
ZWlyZCBjb3JuZXIgY2FzZXMuCj4+IAo+Cj4gTWVtb3J5IGhvdHBsdWcgaGFzIHRvIHdvcmsgYXMg
cmVsaWFibGUgYXMgd2UgY2FuIG91dCBvZiB0aGUgYm94LiBMZXR0aW5nCj4gdGhlIHVzZXIgbWFr
ZSBzaW1wbGUgZGVjaXNpb25zIGxpa2UgIm9oLCBJIGFtIG9uIGh5cGVyLVYsIEkgd2FudCB0bwo+
IG9ubGluZSBtZW1vcnkgdG8gdGhlIG5vcm1hbCB6b25lIiBkb2VzIG5vdCBmZWVsIHJpZ2h0LiBC
dXQgeWVzLCB3ZQo+IHNob3VsZCBkZWZpbml0ZWx5IGFsbG93IHRvIG1ha2UgbW9kaWZpY2F0aW9u
cy4KCkxhc3QgdGltZSBJIHdhcyB0aGlua2luZyBhYm91dCB0aGUgaW1wZXJmZWN0bmVzcyBvZiB0
aGUgYXV0by1vbmxpbmUKc29sdXRpb24gd2UgaGF2ZSBhbmQgYW55IG90aGVyIHNvbHV0aW9uIHdl
J3JlIGFibGUgdG8gc3VnZ2VzdCBhbiBpZGVhCmNhbWUgdG8gbXkgbWluZCAtIHdoYXQgaWYgd2Ug
YWRkIGFuIGVCUEYgYXR0YWNoIHBvaW50IHRvIHRoZQphdXRvLW9ubGluaW5nIG1lY2hhbmlzbSBl
ZmZlY2l2ZWx5IG9mZmxvYWRpbmcgZGVjaXNpb24tbWFraW5nIHRvCnVzZXJzcGFjZS4gV2UnbGwg
b2YgY291c2UgbmVlZCB0byBwcm92aWRlIGFsbCByZXF1aXJlZCBkYXRhIChlLmcuIGhvdwptZW1v
cnkgYmxvY2tzIGFyZSBhbGlnbmVkIHdpdGggcGh5c2ljYWwgRElNTXMgYXMgaXQgbWFrZXMgbm8g
c2Vuc2UgdG8Kb25saW5lIHBhcnQgb2YgRElNTSBhcyBub3JtYWwgYW5kIHRoZSByZXN0IGFzIG1v
dmFibGUgYXMgaXQncyBnb2luZyB0bwpiZSBpbXBvc3NpYmxlIHRvIHVucGx1ZyBzdWNoIERJTU0g
YW55d2F5cykuCgotLSAKVml0YWx5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
