From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 12/12] xen: clarify the security-support
 status of Kconfig options on ARM
Date: Wed, 25 Jul 2018 17:40:49 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1807251738120.20701@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1807061537300.13502@sstabellini-ThinkPad-X260>
 <1530918843-14318-12-git-send-email-sstabellini@kernel.org>
 <4ee54631-55cd-da09-f7d5-6bf7e8de9198@arm.com>
 <alpine.DEB.2.10.1807241509020.20701@sstabellini-ThinkPad-X260>
 <8049223f-0f2c-45a7-ceb6-e067f4719bdd@arm.com>
 <187f86ee-e6b6-db7f-196d-28550aeebb54@citrix.com>
 <56067f51-6e39-6a06-399a-64918603532f@arm.com>
 <CAFLBxZakhFWmGMo65cq5f0E_b737dn6t=kFrzPQ59-HuQEXerg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAFLBxZakhFWmGMo65cq5f0E_b737dn6t=kFrzPQ59-HuQEXerg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyNSBKdWwgMjAxOCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiBXZWQsIEp1bCAy
NSwgMjAxOCBhdCAxMDo1MCBBTSwgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4g
d3JvdGU6Cj4gPj4gQW55dGhpbmcgeW91IGNhbiBzZWxlY3QgaW4gbWVudWNvbmZpZyB3aXRob3V0
IHBhc3NpbmcKPiA+PiBYRU5fQ09ORklHX0VYUEVSVD15IGlzIHNlY3VyaXR5IHN1cHBvcnRlZC4g
IEFueXRoaW5nIGhpZGRlbiBiZWhpbmQKPiA+PiBYRU5fQ09ORklHX0VYUEVSVCBpcyBzZWN1cml0
eSBzdXBwb3J0ZWQgaW4gaXRzIGRlZmF1bHQgY29uZmlndXJhdGlvbi4KPiA+Cj4gPgo+ID4gQ291
bGQgeW91IGNsYXJpZnkgd2hhdCB5b3UgbWVhbiBieSBzZWN1cml0eSBzdXBwb3J0ZWQgaGVyZT8g
Rm9yIGluc3RhbmNlLAo+ID4gImxpdmVwYXRjaCIgaXMgc2VsZWN0YWJsZSBvbiBBcm0gd2l0aCBY
RU5fQ09ORklHX0VYUEVSVD15IGJ1dCBpdCBpcyBtYXJrZWQKPiA+IGFzICJleHBlcmltZW50YWwi
IGluIFNVUFBPUlQuTUQuCj4gCj4gSSB0aGluayBBbmR5IG1lYW5zIHNvbWV0aGluZyBsaWtlLCAi
c3VwcG9ydGVkIHdoZW4gbm8gYWRtaW4gYWN0aW9uIGlzCj4gdGFrZW4gdG8gYWN0aXZhdGUgaXQi
LiAgTGl2ZXBhdGNoIGRvZXNuJ3QganVzdCBoYXBwZW4gYnkgaXRzZWxmOyB5b3UKPiBoYXZlIHRv
IHRha2UgYW4gYWN0aW9uIHRvIHRyaWdnZXIgdGhlIGJlaGF2aW9yLCBzbyBpdCdzIG5vdCBzdXBw
b3J0ZWQuCgpJIGFtIE9LIGZvbGxvd2luZyB0aGUgc2FtZSBtb2RlbCBvbiBBUk0gdG9vLiBEbyB3
ZSBhbGwgYWdyZWU/CgpJZiBzbywgSSBjYW4ganVzdCByZW1vdmUgdGhpcyBwYXRjaCBmcm9tIHRo
ZSBzZXJpZXMsIGJlY2F1c2UgdGhlCnByZXZpb3VzIHBhdGNoIGFscmVhZHkgY2xhcmlmaWVzIHRo
ZSByb2xlIG9mIEVYUEVSVC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
