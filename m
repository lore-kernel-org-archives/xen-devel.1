From: Praveen Kumar <kpraveen.lkml@gmail.com>
Subject: Re: Xen and safety certification,
 Minutes of the meeting on Apr 4th
Date: Fri, 13 Apr 2018 00:08:37 +0530
Message-ID: <CABcWhv7kAAyzVPFJr0AKepjpjh_vf+OsS4cHzzspN-HvBBGLDg@mail.gmail.com>
References: <5D69D457-6EAB-4FF9-AF94-3D818F9035EC@citrix.com>
 <4d359a64b6bc43b9a489a0754c4b4ae8@dornerworks.com>
 <999c02cc-31b1-c404-7f88-84789c0d84b0@epam.com>
 <alpine.DEB.2.10.1804061323500.6016@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dcfj=hb=gmail.com=kpraveen.lkml@srs-us1.protection.inumbo.net>)
 id 1f6h7b-0007cm-Tj
 for xen-devel@lists.xenproject.org; Thu, 12 Apr 2018 18:38:59 +0000
Received: by mail-it0-x234.google.com with SMTP id 15-v6so115955itl.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Apr 2018 11:38:58 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1804061323500.6016@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, "davorin.mista@aggios.com" <davorin.mista@aggios.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>, "paul_luperto@prqa.com" <paul_luperto@prqa.com>, Lars Kurth <lars.kurth@citrix.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, "julien.grall@arm.com" <julien.grall@arm.com>, "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, Rich Persaud <persaur@gmail.com>, "committers@xenproject.org" <committers@xenproject.org>, "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jonathan Daugherty <jtd@galois.com>, Denys Balatsko <denys.balatsko@globallogic.com>, "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>, Jarvis Roach <Jarvis.Roach@dor>
List-Id: xen-devel@lists.xenproject.org

SGkgQWxsLAoKPj4gV2UnZCBsaWtlIHRvIGV4cGxvcmUgYm90aCBGcmVlUlRPUyBpbiBkb20wIGFu
ZCBkb20wLWxlc3Mgb3B0aW9ucy4gSSB0aGluawo+PiB0aGVyZSB3ZXJlIHNvbWUgcGF0Y2hlcyB3
aGlsZSBhZ28gZm9yIGRvbTAtbGVzcyB4ZW4uCj4KPiAiRG9tMC1sZXNzIiBpcyBhIGdyZWF0IG5h
bWUgYWN0dWFsbHkgOi0pCj4KPiBVcCB1bnRpbCBub3csIHdlIGRpc2N1c3NlZCB0aGlzIHRvcGlj
IHVuZGVyIHRoZSBuYW1lIG9mICJjcmVhdGUgbXVsdGlwbGUKPiBndWVzdHMgZnJvbSBkZXZpY2Ug
dHJlZSIuIFRoZXJlIGFyZSBubyBwYXRjaGVzIChhcyBmYXIgYXMgSSBrbm93KSwgYnV0Cj4gaXQg
d2FzIHN1Ym1pdHRlZCBhcyB0aGUgWGVuIG9uIEFSTSBwcm9qZWN0IGZvciBPdXRyZWFjaHkgdGhp
cyB5ZWFyLgo+IFRoZXJlIGFyZSBwYXRjaGVzIGZvciBhIGRpZmZlcmVudCBwcm9qZWN0IHRvIHNl
dHVwIHNoYXJlZCBtZW1vcnkgcmVnaW9ucwo+IGZyb20gdGhlIHhsIGNvbmZpZyBmaWxlIChubyBu
ZWVkIGZvciBncmFudCB0YWJsZSBvciB4ZW5idXMgc3VwcG9ydCkuCj4KPgoKSSBoYXZlIGJlZW4g
aW4gZGlzY3Vzc2lvbiB3aXRoIFN0ZWZhbm8gb3ZlciB0aGlzIHRvcGljIGFuZCB3b3VsZCBiZQpp
bnRlcmVzdGVkIHRvIHRha2UgdGhpcyB1cC4KClJlZ2FyZHMsCgp+UHJhdmVlbi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
