From: Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH RFC] mm/memory_hotplug: Introduce memory
 block types
Date: Wed, 3 Oct 2018 07:07:47 -0700
Message-ID: <49456818-238e-2d95-9df6-d1934e9c8b53__35229.6335077428$1538575728$gmane$org@linux.intel.com>
References: <20180928150357.12942-1-david@redhat.com>
 <20181001084038.GD18290@dhcp22.suse.cz>
 <d54a8509-725f-f771-72f0-15a9d93e8a49@redhat.com>
 <20181002134734.GT18290@dhcp22.suse.cz>
 <98fb8d65-b641-2225-f842-8804c6f79a06@redhat.com>
 <8736tndubn.fsf@vitty.brq.redhat.com> <20181003134444.GH4714@dhcp22.suse.cz>
 <87zhvvcf3b.fsf@vitty.brq.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=r8hh=mp=linux.intel.com=dave.hansen@srs-us1.protection.inumbo.net>)
 id 1g7hqa-0002NU-VI
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 14:09:52 +0000
In-Reply-To: <87zhvvcf3b.fsf@vitty.brq.redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Vitaly Kuznetsov <vkuznets@redhat.com>, Michal Hocko <mhocko@kernel.org>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Rashmica Gupta <rashmica.g@gmail.com>, Dan Williams <dan.j.williams@intel.com>, linux-s390@vger.kernel.org, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, David Hildenbrand <david@redhat.com>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>Pavel Tatashin <p>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDMvMjAxOCAwNjo1MiBBTSwgVml0YWx5IEt1em5ldHNvdiB3cm90ZToKPiBJdCBpcyBt
b3JlIHRoYW4ganVzdCBtZW1tYXBzIChlLmcuIGZvcmtpbmcgdWRldiBwcm9jZXNzIGRvaW5nIG1l
bW9yeQo+IG9ubGluaW5nIGFsc28gbmVlZHMgbWVtb3J5KSBidXQgeWVzLCB0aGUgbWFpbiBpZGVh
IGlzIHRvIG1ha2UgdGhlCj4gb25saW5pbmcgc3luY2hyb25vdXMgd2l0aCBob3RwbHVnLgoKVGhh
dCdzIGEgZ29vZCB0aGVvcmV0aWNhbCBjb25jZXJuLgoKQnV0LCBpcyBpdCBhIHByb2JsZW0gd2Ug
bmVlZCB0byBzb2x2ZSBpbiBwcmFjdGljZT8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
