From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Fri, 22 Feb 2019 13:00:05 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1902221253050.30151@sstabellini-ThinkPad-X260>
References: <20190222095721.24764-1-andr2000@gmail.com>
 <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
 <a30ca582-0993-9652-112e-467f49605405@arm.com>
 <f3438c56-1e7c-88fa-fb0e-b770eccf6d88@gmail.com>
 <bbc8f1bc-c8dd-6784-fbe4-0667127d37af@arm.com>
 <63101f28-a1ad-bffd-158a-c7e1380f6e18@gmail.com>
 <547c3711-02a3-9071-5bb1-494ca45eb4a6@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O0ff=Q5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gxHvy-0008SL-Q2
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 21:00:38 +0000
In-Reply-To: <547c3711-02a3-9071-5bb1-494ca45eb4a6@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Artem_Mygaiev@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyMiBGZWIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiA+IEJUVywgSSBj
aGVja2VkIHRoZSBzZXJpZXMgd2l0aCAtV3N3aXRjaC1kZWZhdWx0Ogo+ID4gPiA+IC1Xc3dpdGNo
LWRlZmF1bHQKPiA+ID4gPiBXYXJuIHdoZW5ldmVyIGEgc3dpdGNoIHN0YXRlbWVudCBkb2VzIG5v
dCBoYXZlIGEgZGVmYXVsdCBjYXNlLgo+ID4gPiA+ID4gRnVydGhlcm1vcmUsIHVzaW5nIEJVRygp
IGlzIGEgcHJldHR5IGJhZCBpZGVhIGluIHN3aXRjaC4gCj4gPiA+ID4gSXQgaXMgYW5kIG5vdCBv
bmx5IGluIHRoZSBzd2l0Y2guIFRoZSByZWFzb24gSSBwdXQgQlVHIGlzIHRoYXQgSSB0cmllZAo+
ID4gPiA+IHRvIGZvbGxvdwo+ID4gPiA+IHRoZSBleGlzdGluZyAiZXJyb3IgaGFuZGxpbmciIGF0
IHRob3NlIHBsYWNlcy4KPiA+ID4gCj4gPiA+IEl0IGlzIG5vdCBiZWNhdXNlIEJVRygpIGlzIGJl
ZW4gdXNlZCB0b2RheSBpbiBzb21lIHBsYWNlcyB0aGF0IHdlIG5lZWQgdG8KPiA+ID4gY29udGlu
dWUgdG8gc3ByZWFkIGl0Lgo+ID4gPiAKPiA+ID4gPiBVc2Ugb2YgQlVHKCkgaXRzZWxmIGlzIGFu
b3RoZXIgdG9waWMgd2hpY2ggd2lsbCBhbHNvIG5lZWQgdG8gYmUKPiA+ID4gPiBhZGRyZXNzZWQK
PiA+ID4gCj4gPiA+IFNvIHdlIHNob3VsZCBub3QgYWRkIG1vcmUgb2YgdGhlbS4uLgo+ID4gQWdh
aW4sIEkgc2VlIHRoaXMgYXMgYSBkZWRpY2F0ZWQgY2hhbmdlLiBTbywgaW4gdGhlIGN1cnJlbnQg
c2VyaWVzIEkgdGhpbmsKPiA+IGl0IGlzCj4gPiBhY2NlcHRhYmxlIHRvIHVzZSB0aGUgZXhpc3Rp
bmcgd2F5IG9mIGVycm9yIGhhbmRsaW5nIGlmIGFueSBhdCBhbGwuCj4gCj4gVGhhdCdzIG5vdCBo
b3cgaXQgd29ya3MgaW4gdXBzdHJlYW0uIElmIHlvdSBrbm93IHNvbWUgY29uc3RydWN0cyBhcmUg
d3JvbmcsIGl0Cj4gaXMgYmVzdCB0byB0cnkgdG8gYWRkcmVzcyBwYXJ0aWFsbHkgdGhlIHByb2Js
ZW0gZGlyZWN0bHkgdGhlbiBoYXZpbmcgc28geW91Cj4gcmVkdWNlIHRoZSBhbW91bnRzIG9mIGNo
YW5nZSBhZnRlcndhcmRzLgo+IAo+IFNvIHBsZWFzZSB0cnkgdG8gbm90IGludHJvZHVjZSBtb3Jl
IEJVRygpIGluIHRoZSBjb2RlIGJhc2UuCgpIaSBPbGVrc2FuZHIsIEp1bGllbiwKCkp1bGllbidz
IHJpZ2h0IHRoYXQgd2Ugc2hvdWxkIG5vdCBpbnRyb2R1Y2UgYW55IG1vcmUgQlVHKClzLiBJbiBm
YWN0LAplYWNoIG9mIHRoZW0gbWFrZXMgdGhlIGNvZGUgbGVzcyBzYWZlLCBub3QgbW9yZSBzYWZl
ISBUaGUgcHVycG9zZSBvZgpNSVNSQUMgMTYuNCBpcyAiZGVmZW5zaXZlIHByb2dyYW1taW5nIjog
d3JpdGUgdGhlIGNvZGUgaW4gYSB3YXkgdGhhdCBpcwptb3JlIChub3QgbGVzcyEpIHJlc2lsaWVu
dCB0byBmYWlsdXJlLgoKU28sIEkgdGhpbmsgaXQgaXMgYSBnb29kIGlkZWEgdG8gaW50cm9kdWNl
IGEgZGVmYXVsdCBsYWJlbCBiZWNhdXNlIGl0CmNhbiBoZWxwIHVzIHNwb3QgdW5leHBlY3RlZCBp
c3N1ZXMuIEluc3RlYWQgb2YgY2FsbGluZyBCVUcoKSBpbiB0aGUKZGVmYXVsdCBoYW5kbGVyLCB3
aGljaCBpcyBkZXRyaW1lbnRhbCwgd2Ugc2hvdWxkIHJldHVybiBhbiBlcnJvciB3aGVuCnBvc3Np
YmxlLCBvciBqdXN0IHByaW50IGEgd2FybmluZy4KCkFzIDE2LjQgY2xlYXJseSBzdGF0ZSwgZXZl
biBhIHNpbXBsZSBjb21tZW50IHdvdWxkIGJlIGVub3VnaCB0byBhZGRyZXNzCnRoZSBydWxlLiBX
ZSBqdXN0IG5lZWQgdG8gZXhwbGFpbiB3aHkgYSBkZWZhdWx0IGxhYmVsIGlzIG5vdCBuZWVkZWQu
ClN1Y2ggYXM6CgogIGRlZmF1bHQ6CiAgLyogdW5yZWFjaGFibGUgYmVjYXVzZSBibGFoIGFuZCBi
bGFoICovCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
