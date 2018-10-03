From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH RFC] mm/memory_hotplug: Introduce memory
 block types
Date: Wed, 3 Oct 2018 15:44:44 +0200
Message-ID: <20181003134444.GH4714__38168.4191096157$1538574221$gmane$org@dhcp22.suse.cz>
References: <20180928150357.12942-1-david@redhat.com>
 <20181001084038.GD18290@dhcp22.suse.cz>
 <d54a8509-725f-f771-72f0-15a9d93e8a49@redhat.com>
 <20181002134734.GT18290@dhcp22.suse.cz>
 <98fb8d65-b641-2225-f842-8804c6f79a06@redhat.com>
 <8736tndubn.fsf@vitty.brq.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ovvu=mp=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1g7hSO-0000Ky-JJ
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 13:44:52 +0000
Content-Disposition: inline
In-Reply-To: <8736tndubn.fsf@vitty.brq.redhat.com>
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

T24gV2VkIDAzLTEwLTE4IDE1OjM4OjA0LCBWaXRhbHkgS3V6bmV0c292IHdyb3RlOgo+IERhdmlk
IEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPiB3cml0ZXM6Cj4gCj4gPiBPbiAwMi8xMC8y
MDE4IDE1OjQ3LCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4gLi4uCj4gPj4gCj4gPj4gV2h5IGRvIHlv
dSBuZWVkIGEgZ2VuZXJpYyBob3RwbHVnIHJ1bGUgaW4gdGhlIGZpcnN0IHBsYWNlPyBXaHkgZG9u
J3QgeW91Cj4gPj4gc2ltcGx5IHByb3ZpZGUgZGlmZmVyZW50IHNldCBvZiBydWxlcyBmb3IgZGlm
ZmVyZW50IHVzZWNhc2VzPyBMZXQgdXNlcnMKPiA+PiBkZWNpZGUgd2hpY2ggdXNlY2FzZSB0aGV5
IHByZWZlciByYXRoZXIgdGhhbiB0cnkgdG8gYmUgY2xldmVyIHdoaWNoCj4gPj4gYWxtb3N0IGFs
d2F5cyBoaXRzIHdlaXJkIGNvcm5lciBjYXNlcy4KPiA+PiAKPiA+Cj4gPiBNZW1vcnkgaG90cGx1
ZyBoYXMgdG8gd29yayBhcyByZWxpYWJsZSBhcyB3ZSBjYW4gb3V0IG9mIHRoZSBib3guIExldHRp
bmcKPiA+IHRoZSB1c2VyIG1ha2Ugc2ltcGxlIGRlY2lzaW9ucyBsaWtlICJvaCwgSSBhbSBvbiBo
eXBlci1WLCBJIHdhbnQgdG8KPiA+IG9ubGluZSBtZW1vcnkgdG8gdGhlIG5vcm1hbCB6b25lIiBk
b2VzIG5vdCBmZWVsIHJpZ2h0LiBCdXQgeWVzLCB3ZQo+ID4gc2hvdWxkIGRlZmluaXRlbHkgYWxs
b3cgdG8gbWFrZSBtb2RpZmljYXRpb25zLgo+IAo+IExhc3QgdGltZSBJIHdhcyB0aGlua2luZyBh
Ym91dCB0aGUgaW1wZXJmZWN0bmVzcyBvZiB0aGUgYXV0by1vbmxpbmUKPiBzb2x1dGlvbiB3ZSBo
YXZlIGFuZCBhbnkgb3RoZXIgc29sdXRpb24gd2UncmUgYWJsZSB0byBzdWdnZXN0IGFuIGlkZWEK
PiBjYW1lIHRvIG15IG1pbmQgLSB3aGF0IGlmIHdlIGFkZCBhbiBlQlBGIGF0dGFjaCBwb2ludCB0
byB0aGUKPiBhdXRvLW9ubGluaW5nIG1lY2hhbmlzbSBlZmZlY2l2ZWx5IG9mZmxvYWRpbmcgZGVj
aXNpb24tbWFraW5nIHRvCj4gdXNlcnNwYWNlLiBXZSdsbCBvZiBjb3VzZSBuZWVkIHRvIHByb3Zp
ZGUgYWxsIHJlcXVpcmVkIGRhdGEgKGUuZy4gaG93Cj4gbWVtb3J5IGJsb2NrcyBhcmUgYWxpZ25l
ZCB3aXRoIHBoeXNpY2FsIERJTU1zIGFzIGl0IG1ha2VzIG5vIHNlbnNlIHRvCj4gb25saW5lIHBh
cnQgb2YgRElNTSBhcyBub3JtYWwgYW5kIHRoZSByZXN0IGFzIG1vdmFibGUgYXMgaXQncyBnb2lu
ZyB0bwo+IGJlIGltcG9zc2libGUgdG8gdW5wbHVnIHN1Y2ggRElNTSBhbnl3YXlzKS4KCkFuZCBo
b3cgZG9lcyB0aGF0IGRpZmZlciBmcm9tIHRoZSBub3RpZmljYXRpb24gbWVjaGFuaXNtIHdlIGhh
dmU/IEp1c3QKYnkgbm90IHJlbHlpbmcgb24gdGhlIHByb2Nlc3Mgc2NoZWR1bGluZz8gSWYgeWVz
IHRoZW4gdGhpcyByZXZvbHZlcwphcm91bmQgdGhlIGltcGxlbWVudGF0aW9uIGRldGFpbCB0aGF0
IHlvdSBjYXJlIGFib3V0IHRpbWUtdG8taG90LWFkZAp2cy4gdGltZS10by1vbmxpbmUuIEFuZCB0
aGF0IGlzIGEgc29sdmVhYmxlIHByb2JsZW0gLSBqdXN0IGFsbG9jYXRlCm1lbW1hcHMgZnJvbSB0
aGUgaG90LWFkZGVkIG1lbW9yeS4KCkFzIERhdmlkIHNhaWQgc29tZSBvZiB0aGUgbWVtb3J5IGNh
bm5vdCBiZSBvbmxpbmVkIHdpdGhvdXQgZnVydGhlciBzdGVwcwooZS5nLiB3aGVuIGl0IGlzIHN0
YW5kYnkgYXMgRGF2aWQgY2FsbGVkIGl0KSBhbmQgdGhlbiBJIGZhaWwgdG8gc2VlIGhvdwplQlBG
IGhlbHAgaW4gYW55IHdheS4KLS0gCk1pY2hhbCBIb2NrbwpTVVNFIExhYnMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
