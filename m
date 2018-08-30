From: Pasha Tatashin <Pavel.Tatashin@microsoft.com>
Subject: Re: [PATCH RFCv2 0/6] mm: online/offline_pages called
 w.o. mem_hotplug_lock
Date: Thu, 30 Aug 2018 15:54:30 +0000
Message-ID: <b9eb96e7-3846-1aaa-d257-895ca142b1ef__26268.2046661668$1535644407$gmane$org@microsoft.com>
References: <20180821104418.12710-1-david@redhat.com>
 <37ea507e-b16d-ae8d-4da8-128b621869f2@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uez1=ln=microsoft.com=pavel.tatashin@srs-us1.protection.inumbo.net>)
 id 1fvPHM-0002lU-SH
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 15:54:41 +0000
In-Reply-To: <37ea507e-b16d-ae8d-4da8-128b621869f2@redhat.com>
Content-Language: en-US
Content-ID: <C3DB3B11124F444D8932C0F350E2E1D9@namprd21.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Michal Hocko <mhocko@suse.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>, Rashmica Gupta <rashmica.g@gmail.com>, KY Srinivasan <kys@microsoft.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Len Brown <lenb@kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>, YASUAKI ISHIMATSU <yasu.isimatu@gmail.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Dan Williams <dan.j.wi>
List-Id: xen-devel@lists.xenproject.org

DQoNCk9uIDgvMzAvMTggODozMSBBTSwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6DQo+IE9uIDIx
LjA4LjIwMTggMTI6NDQsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOg0KPj4gVGhpcyBpcyB0aGUg
c2FtZSBhcHByb2FjaCBhcyBpbiB0aGUgZmlyc3QgUkZDLCBidXQgdGhpcyB0aW1lIHdpdGhvdXQN
Cj4+IGV4cG9ydGluZyBkZXZpY2VfaG90cGx1Z19sb2NrIChyZXF1ZXN0ZWQgYnkgR3JlZykgYW5k
IHdpdGggc29tZSBtb3JlDQo+PiBkZXRhaWxzIGFuZCBkb2N1bWVudGF0aW9uIHJlZ2FyZGluZyBs
b2NraW5nLiBUZXN0ZWQgb25seSBvbiB4ODYgc28gZmFyLg0KPj4NCj4gDQo+IEknbGwgYmUgb24g
dmFjYXRpb24gZm9yIHR3byB3ZWVrcyBzdGFydGluZyBvbiBTYXR1cmRheS4gSWYgdGhlcmUgYXJl
IG5vDQo+IGNvbW1lbnRzIEknbGwgc2VuZCB0aGlzIGFzICFSRkMgb25jZSBJIHJldHVybi4NCj4N
CkkgYW0gc3R1ZHlpbmcgdGhpcyBzZXJpZXMsIHdpbGwgc2VuZCBteSBjb21tZW50cyBsYXRlciB0
b2RheS4NCg0KUGF2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
