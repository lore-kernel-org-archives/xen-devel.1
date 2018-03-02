From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Setting up a Xen x86 community call
Date: Fri, 2 Mar 2018 16:39:59 +0100
Message-ID: <B2025C1A-199C-4019-9ECF-AFF34FE8D702@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=e9sj=fy=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1ermmz-0001Gb-Av
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 15:40:05 +0000
Received: by mail-wm0-x244.google.com with SMTP id w128so3956657wmw.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 Mar 2018 07:40:03 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, tamas@tklengyel.com, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, daniel.kiper@oracle.com, Susie Li <susie.li@intel.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <royger@freebsd.org>, John Ji <john.ji@intel.com>, Babu Moger <Babu.Moger@amd.com>, Rich Persaud <persaur@gmail.com>, paul.durrant@citrix.com, committers@xenproject.org, Jan Beulich <jbeulich@suse.com>, "Hurwitz,
 Sherry" <sherry.hurwitz@amd.com>, Chao Peng <chao.p.peng@linux.intel.com>, joao.m.martins@oracle.com, Brian Woods <brian.woods@amd.com>, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLCAKKHNvcnJ5IGZvciB0aGUgZXh0ZW5zaXZlIGRpc3RyaWJ1dGlvbiBsaXN0IC0gSSB3
ZW50IHRocm91Z2ggTUFJTlRBSU5FUlMgYW5kIHBlb3BsZSB3aG8gbWF5IGhhdmUgYW4gaW50ZXJl
c3QpCgpJIHdvdWxkIGxpa2UgdG8gc3RhcnQgb3JnYW5pemluZyBhIHJlY3VycmluZyB4ODYgY29t
bXVuaXR5IGNhbGwgdG8gZGlzY3VzcyBhbmQgc3luYy11cCBvbiB1cGNvbWluZyBmZWF0dXJlcyBm
b3IgWGVuIG9uIHg4Ni4gVGhpcyBjYWxsIHdvdWxkIG1pcnJvciBhbmQgZm9sbG93IGEgc2ltaWxh
ciBzdHJ1Y3R1cmUgdG8gdGhlIEFSTSBjYWxsIChzZWUgaHR0cDovL3hlbi5tYXJrbWFpbC5vcmcv
dGhyZWFkL3hxZHh2cWNqcGYyeTVmdHUgZm9yIHRoZSBsYXN0IG9uZSkKCkkgZXhwZWN0IHRoYXQg
dGhlIGNhbGwgd2lsbCBjb250YWluCgphKSBDb29yZGluYXRpb24gYW5kIFBsYW5uaW5nIApDb29y
ZGluYXRpbmcgd2hvIGRvZXMgd2hhdCwgd2hhdCBuZWVkcyBhdHRlbnRpb24sIHdoYXQgaXMgYmxv
Y2tlZCwgZXRjLiAKSSB3b3VsZCBwcmVwYXJlIGEgbGlzdCBvZiBub24tbWVyZ2VkIHBhdGNoIHNl
cmllcyBvZiBhIGNlcnRhaW4gc2l6ZSAoZS5nLiBtb3JlIHRoYW4gNSBwYXRjaGVzKSBhbmQgYXR0
YWNoIHRvIHRoZSBpbnZpdGUKSWYgYW55dGhpbmcgaXMgbWlzc2VkLCBJIHdvdWxkIGV4cGVjdCB0
aGF0IHRoZXNlIGFyZSBzZW50IHRvIG1lIGJlZm9yZSB0aGUgbWVldGluZwoKYikgRGVzaWduIGFu
ZCBhcmNoaXRlY3R1cmUgcmVsYXRlZCBkaXNjdXNzaW9uczogaW4gcGFydGljdWxhciBmb3IgYmln
Z2VyLCBtb3JlIGNvbXBsZXggaXRlbXMsIC4uLiAKQWx0aG91Z2ggYWxsIG9mIHRoaXMgY291bGQg
YmUgZG9uZSBieSBlbWFpbCwgaW4gcmVhbGl0eSwgd2UgYXJlIGFsbCBodW1hbiBhbmQgbWFueSBw
ZW9wbGUgZmluZCBpdCBlYXNpZXIgdG8gY29sbGFib3JhdGUKYW5kIGNvbW11bmljYXRlIGJ5IHRh
bGtpbmcgdG8gZWFjaCBvdGhlciwgcmF0aGVyIHRoYW4gYnkgZW1haWwuIFRoaXMgaXMgbm90IGEg
bXVzdCwgYnV0IGFuIG9wdGlvbiB0byBoaWdobGlnaHQgaXNzdWVzCgpjKSBEZW1vcywgU2hhcmlu
ZyBvZiBFeHBlcmllbmNlcywgU29tZXRpbWVzIGRpc2N1c3Npb24gb2Ygc3BlY2lmaWMgaXNzdWVz
L2J1Z3MvcHJvYmxlbXMvLi4uClRoaXMgaXMgc29tZXRoaW5nIHdoaWNoIGhhcHBlbnMgZnJlcXVl
bnRseSBvbiB0aGUgQVJNIGNhbGwgYW5kIHNlZW1zIHRvIHdvcmsgdmVyeSB3ZWxsCgpJIHdvdWxk
IHN1Z2dlc3QgdG8gc3RhcnQgd2l0aCBhIDEgaG91ciBtb250aGx5IG1lZXRpbmc6IHBvc3NpYmx5
IGV2ZXJ5IDJuZCBUdWUgb3IgVGh1IGVhY2ggbW9udGggKGRlcGVuZHMgb24gdGltaW5nKS4gSSBr
bm93IHRoYXQgcGVvcGxlIGFyZSBzcHJlYWQgYWNyb3NzIGRpZmZlcmVudCB0aW1lem9uZXMgKGZy
b20gQ2hpbmEgdG8gdGhlIFVTKSwgc28gSSB3b3VsZCBsaWtlIHRvIGdhdGhlciB0aG91Z2h0cyBi
ZWZvcmUgY2hvb3NpbmcgYSB0aW1lLiBXZSBtYXkgaGF2ZSB0byBoYXZlIGFsdGVybmF0aW5nIHRp
bWUtc2xvdHMgZXZlcnkgb3RoZXIgbW9udGg6IGJ1dCB0aGlzIGlzIG5vdCBpZGVhbCBmb3Igc29t
ZS4KClRvIGRvIHRoaXMsIHBsZWFzZQoqIFJhaXNlIHlvdXIgaGFuZHMgb24gd2hldGhlciB5b3Ug
b3IgeW91ciBvcmcgd291bGQgd2FudCB0byBwYXJ0aWNpcGF0ZQoqIFByb3ZpZGUgeW91ciB0aW1l
em9uZQoqIFByb3ZpZGUgYSBVVEMgdGltZSByYW5nZSB3aGVuIHlvdSBjYW4gYXR0ZW5kIAoKWW91
ciBzaW5jZXJlbHksCkxhcnMKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
