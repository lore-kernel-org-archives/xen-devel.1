From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFCv2 0/6] mm: online/offline_pages called
 w.o. mem_hotplug_lock
Date: Sat, 1 Sep 2018 16:03:58 +0200
Message-ID: <d4b6608b-0b21-b925-4adc-d11e4706f69d__47242.8986955949$1535810583$gmane$org@redhat.com>
References: <20180821104418.12710-1-david@redhat.com>
 <20180831205457.GB3945@techadventures.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=fbr0=lp=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1fw6VW-000390-5h
 for xen-devel@lists.xenproject.org; Sat, 01 Sep 2018 14:04:10 +0000
In-Reply-To: <20180831205457.GB3945@techadventures.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oscar Salvador <osalvador@techadventures.net>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Michal Hocko <mhocko@suse.com>, linux-doc@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, Rashmica Gupta <rashmica.g@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>, Pavel Tatashin <pasha.tatashin@oracle.com>, linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>, YASUAKI ISHIMATSU <yasu.isimatu@gmail.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Dan Williams <dan.j.williams@intel.com>, Joonsoo
List-Id: xen-devel@lists.xenproject.org

T24gMzEuMDguMjAxOCAyMjo1NCwgT3NjYXIgU2FsdmFkb3Igd3JvdGU6Cj4gT24gVHVlLCBBdWcg
MjEsIDIwMTggYXQgMTI6NDQ6MTJQTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+
IFRoaXMgaXMgdGhlIHNhbWUgYXBwcm9hY2ggYXMgaW4gdGhlIGZpcnN0IFJGQywgYnV0IHRoaXMg
dGltZSB3aXRob3V0Cj4+IGV4cG9ydGluZyBkZXZpY2VfaG90cGx1Z19sb2NrIChyZXF1ZXN0ZWQg
YnkgR3JlZykgYW5kIHdpdGggc29tZSBtb3JlCj4+IGRldGFpbHMgYW5kIGRvY3VtZW50YXRpb24g
cmVnYXJkaW5nIGxvY2tpbmcuIFRlc3RlZCBvbmx5IG9uIHg4NiBzbyBmYXIuCj4gCj4gSGkgRGF2
aWQsCj4gCj4gSSB3b3VsZCBsaWtlIHRvIHJldmlldyB0aGlzIGJ1dCBJIGFtIG9uIHZhY2F0aW9u
LCBzbyBJIHdpbGwgbm90IGJlIGFibGUgdG8gZ2V0IHRvIGl0Cj4gc29vbi4KPiBJIHBsYW4gdG8g
ZG8gaXQgb25jZSBJIGFtIGJhY2suCgpTdXJlLCBJIHdvbid0IGJlIHJlc2VuZGluZyB3aXRoaW4g
bmV4dCB0d28gd2Vla3MgZWl0aGVyIHdheSwgYXMgSSBhbQphbHNvIG9uIHZhY2F0aW9uLgoKSGF2
ZSBhIG5pY2UgdmFjYXRpb24hCgo+IAo+IFRoYW5rcwo+IAoKCi0tIAoKVGhhbmtzLAoKRGF2aWQg
LyBkaGlsZGVuYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
