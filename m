From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH RFC 2] [DO NOT APPLY] introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
Date: Tue, 28 May 2019 12:17:42 +0300
Message-ID: <d94e7186-5f5d-1d93-4462-af18ba7da018@gmail.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <c31fb2f8-1703-61db-fd7d-f41db6a137d8@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M056=T4=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hVYEt-000655-9U
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 09:17:47 +0000
Received: by mail-lf1-x142.google.com with SMTP id u27so13974875lfg.10
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2019 02:17:46 -0700 (PDT)
In-Reply-To: <c31fb2f8-1703-61db-fd7d-f41db6a137d8@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKT24gMjguMDUuMTkgMTE6NTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBJ
IGFtIG5vdCBhbnN3ZXJpbmcgb24gdGhlIGNvbnRlbnQgeWV0LCBJIHdpbGwgZG8gdGhhdCBzZXBh
cmF0ZWx5LiBUaGUgdGhyZWFkaW5nIGZvciB0aGlzIHNlcmllcyBsb29rcyBxdWl0ZSBjb25mdXNp
bmcuIFRoZSBoZWFkIG9mIHRoZSB0aHJlYWQgaXMgdGhpcyBwYXRjaCAoaS5lIFJGQyAyKSBidXQg
dGhlbiB5b3UgaGF2ZSBhIGNvdmVyIGxldHRlciB3aXRoaW4gdGhlIHRocmVhZCB0YWdnZWQgIlYz
Ii4KCkFjdHVhbGx5IEkndmUgbm90aWNlZCB0aGUgbWFuZ2xlZCB0aHJlYWRpbmcuIEJ1dCBub3Qg
c3VyZSB3aHkgaXQgaXMgc28uIEkganVzdCBwYXNzZWQgYSBmb2xkZXIgd2l0aCB0aG9zZSBwYXRj
aGVzIHRvIGdpdC1zZW5kLW1haWwuCgo+ICBGcm9tIHdoYXQgSSB1bmRlcnN0YW5kLCB0aGUgMiBl
LW1haWxzIHRhZ2dlZCAiVjMiIGlzIHRoZSBvcmlnaW5hbCB2ZXJzaW9uIHdoZXJlIGFzIFJGQyAy
IGFuZCBSRkMgMyBhcmUgdmFyaWFudHMuIEFtIEkgY29ycmVjdD8KClllcywgc3VyZS4KCj4gSWYg
c28sIGZvciBuZXh0IHRpbWUsIEkgd291bGQgcmVjb21tZW5kIHRvIGhhdmUgdGhlIGNvdmVyIGxl
dHRlciBmaXJzdCBhbmQgdGhlbiBhbGwgdGhlIHBhdGNoZXMgc2VuZCAiSW4tUmVwbHktVG8iIHRo
ZSBjb3ZlciBsZXR0ZXIuIFRoaXMgbWFrZXMgZWFzaWVyIHRvIHRyYWNrIHNlcmllcy4KCkl0IG1p
Z2h0IGhlbHAuIEJ1dCBiZWZvcmUgaXQgd29ya2VkIHdlbGwgd2l0aG91dCBhZGRpdGlvbmFsIHRy
aWNrcy4KCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
