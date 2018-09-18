From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 09/13] optee: add support for arbitrary
 shared memory
Date: Tue, 18 Sep 2018 17:19:19 +0100
Message-ID: <3479d5cd-222c-e610-816f-6e6c7f285f3c@arm.com>
References: <1535993677-20816-1-git-send-email-volodymyr_babchuk@epam.com>
 <1535993677-20816-10-git-send-email-volodymyr_babchuk@epam.com>
 <4dd245b3-beba-e9fd-5367-f45358b07d8d@arm.com>
 <ee29941b-f838-3b93-1bab-d7a82c563be2@epam.com>
 <1eb0ed93-4dc9-3650-2681-f69d2c47baa9@arm.com>
 <d1c4a572-bbb6-6c2b-f61f-9ae5aa82c47b@epam.com>
 <5ce9ca5f-0549-f888-381d-2990ba655d32@arm.com>
 <53637866-ab4b-33ec-c4b3-ecc41700223d@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=p3eu=ma=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1g2Iii-0000G6-8p
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 16:19:24 +0000
In-Reply-To: <53637866-ab4b-33ec-c4b3-ecc41700223d@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Volodymyr Babchuk <volodymyr_babchuk@epam.com>, xen-devel@lists.xenproject.org, xen-devel@lists.xen.org
Cc: tee-dev@lists.linaro.org, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwOS8xMi8yMDE4IDAxOjQ1IFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiBIaSwK
CkhpIFZvbG9keW15ciwKCj4gT24gMTIuMDkuMTggMTQ6MDIsIEp1bGllbiBHcmFsbCB3cm90ZToK
Pj4gT24gMDkvMTEvMjAxOCAwODozMyBQTSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Pj4g
SG93ZXZlciwgMk1CIG1pZ2h0IGJlIHRvbyBiaWcgY29uc2lkZXJpbmcgdGhhdCB5b3UgYWxzbyBu
ZWVkIHRvIAo+Pj4+IGFjY291bnQgdGhlIFNNQyBjYWxsLiBEb2VzIGJ1ZmZlciBjYW4gYmUgcGFz
c2VkIGZvciBmYXN0IGNhbGw/Cj4+PiBObywgYWxsIHN1Y2ggY2FsbHMgYXJlIHlpZWxkaW5nIGNh
bGxzLCBzbyB5b3UgY2FuIGlnbm9yZSB0aW1lIHVzZWQgCj4+PiBmb3IgU01DIGNhbGwgaXRzZWxm
Lgo+Pgo+PiBIb3cgY29tZSB5b3UgY2FuIGlnbm9yZSBpdD8gSXQgaGFzIGEgY29zdCB0byB0cmFw
IHRvIEVMMy4KPiBTdHJpY3RseSBzcGVha2luZywgeWVzLiBBbGwgc3RlcHMgaGFzIGNvc3Q6IHRy
YXAgdG8gRUwzLCBkaXNwYXRjaCBpbiBFTDMsCj4gc3dpdGNoIHRvIFMtRUwxLCBuZXcgdGhyZWFk
IHByZXBhcmF0aW9uIGluIE9QLVRFRSwgY29udGV4dCBzd2l0Y2ggaW4gCj4gT1AtVEVFLgo+IEkg
d2FudGVkIHRvIHRlbGwsIHRoYXQgaW4gbXkgb3BpbmlvbiwgdGhpcyBpcyBuZWdsaWdpYmxlIGlu
IGNvbXBhcmlzb24gCj4gd2l0aCB0aGUgYWN0dWFsIGNhbGwgcHJvY2Vzc2luZy4gQnV0IG1heWJl
LCBJJ20gd3JvbmcgdGhlcmUuCgpJdCB3b3VsZCBiZSBpbnRlcmVzdGluZyB0byBoYXZlIGEgYnJl
YWtkb3duIG9uIHRoZSB0aW1lIHNwZW50IGluIHRoZSAKY2FsbCAod2l0aCB2aXJ0dWFsaXphdGlv
bikuIERpZCB5b3UgaGF2ZSBhIGNoYW5jZSB0byBkbyB0aGF0PwoKQ2hlZXJzLAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
