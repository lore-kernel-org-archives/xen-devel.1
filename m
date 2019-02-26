From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Tue, 26 Feb 2019 13:10:52 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1902261310310.20689@sstabellini-ThinkPad-X260>
References: <20190222095721.24764-1-andr2000@gmail.com>
 <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
 <a30ca582-0993-9652-112e-467f49605405@arm.com>
 <f3438c56-1e7c-88fa-fb0e-b770eccf6d88@gmail.com>
 <bbc8f1bc-c8dd-6784-fbe4-0667127d37af@arm.com>
 <63101f28-a1ad-bffd-158a-c7e1380f6e18@gmail.com>
 <547c3711-02a3-9071-5bb1-494ca45eb4a6@arm.com>
 <alpine.DEB.2.10.1902221253050.30151@sstabellini-ThinkPad-X260>
 <b405a7ae-174f-c8d9-41cc-ec511fb69c77@citrix.com>
 <5C73D41B0200007800219C82@prv1-mh.provo.novell.com>
 <CAFLBxZYmBdR7Mte6i75Nn_a7rYx+0eh88mE3ukBb3tZNNVnZ7Q@mail.gmail.com>
 <alpine.DEB.2.10.1902250942570.4000@sstabellini-ThinkPad-X260>
 <eeec5cb2-5242-5331-21cb-e84317b85351@arm.com>
 <alpine.DEB.2.10.1902251311320.4000@sstabellini-ThinkPad-X260>
 <014390ec-6f3d-ce86-b760-c6b52362d22f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CyNJ=RB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gyk06-0000Yy-RE
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 21:10:54 +0000
In-Reply-To: <014390ec-6f3d-ce86-b760-c6b52362d22f@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <dunlapg@umich.edu>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAyNSBGZWIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDIv
MjUvMTkgOToxMyBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gSSB0aGluayBpdCBp
cyBmaW5lIHRvIGV4cGxvaXQgY29tcGlsZXIgc3BlY2lmaWMgY2hlY2tzIHdoZW4gYXZhaWxhYmxl
Lgo+ID4gSG93ZXZlciwgSSBkb24ndCB0aGluayB3ZSBzaG91bGQgbWFrZSBhbnkgZGVjaXNpb25z
IG9uIGNvZGUgY29ycmVjdG5lc3MKPiA+IGJhc2VkIG9uIHRoZSBjb21waWxlciBjaGVja3MgdGhh
dCB3ZSBpbnRyb2R1Y2UuCj4gPiAKPiA+IEluIG90aGVyIHdvcmRzLCBJIHRoaW5rIGl0IGlzIGEg
Z29vZCBpZGVhIHRvIHVzZSAtV3N3aXRjaC1lbnVtIGlmCj4gPiBwb3NzaWJsZSwgYnV0IGl0IGlz
IG5vdCBhIHJlYXNvbiBmb3Igbm90IGhhdmluZyBkZWZhdWx0IGxhYmVscyBpbiBwbGFjZQo+ID4g
YXMgc3VnZ2VzdGVkIGJ5IDE2LjQuIFRoZSBjb2RlIHNob3VsZCBiZSBhcyBjb3JyZWN0IGFuZCBz
YWZlIGFzCj4gPiBwb3NzaWJsZSwgd2l0aG91dCByZXF1aXJpbmcgZXh0ZXJuYWwgY29tcGlsZXIt
c3BlY2lmaWMgY2hlY2tzLgo+IAo+IEFzIEkgc2FpZCBvbiBhbiBhbnN3ZXIgdG8gT2xla3NhbmRy
LCBJIGFtIG5vdCBhZ2FpbnN0IG9mIGhhdmluZyAiZGVmYXVsdCIKPiBsYWJlbHMgYXMgbG9uZyBh
cyB0aGV5IGNvbnRhaW4gc2Vuc2libGUgYWN0aW9ucy4KCkdvb2QhCgoKPiBCdXQgdGhpcyBkb2Vz
IG5vdCByZWFsbHkgYWRkcmVzcyBteSBwb2ludCBhYm92ZSByZWdhcmRpbmcgd2F5IHRvIGhlbHAg
dGhlCj4gcmV2aWV3LiBKYW4gaXMgYWdhaW5zdCAtV3N3aXRjaC1lbnVtLCBhbmQgSSBjYW4gdW5k
ZXJzdGFuZCBoaXMgcG9pbnQuIFNvIGhvdwo+IGRvIHlvdSBkZWFsIHdpdGggbWlzc2luZyBpdGVt
PwoKSSB3b25kZXIgaWYgQ292ZXJpdHkgb3IgUFJRQSBjYW4gaGVscCB3aXRoIHRoYXQuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
