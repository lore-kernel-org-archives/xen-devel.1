From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 7/7] x86/IOMMU: initialize iommu_ops in
 vendor-independent code
Date: Tue, 2 Apr 2019 11:16:43 +0100
Message-ID: <c5babaad-cee3-f16c-e7df-9bfe4ab5f516@citrix.com>
References: <5C9CDDAF020000780022282A@prv1-mh.provo.novell.com>
 <5C9CE0270200007800222881@prv1-mh.provo.novell.com>
 <80a0095f-93ff-2f92-f8fd-f58d78b0f026@citrix.com>
 <5C9DE2250200007800222B61@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QSF0=SE=citrix.com=prvs=9886cf734=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hBGTK-0007kf-Ab
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 10:16:50 +0000
In-Reply-To: <5C9DE2250200007800222B61@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDMvMjAxOSAwOToxNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjguMDMuMTkg
YXQgMTg6NTAsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMjgvMDMv
MjAxOSAxNDo1NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC94ODYvaW9tbXUuYwo+Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2
L2lvbW11LmMKPj4+IEBAIC0yNiw2ICsyNiwxOSBAQAo+Pj4gIGNvbnN0IHN0cnVjdCBpb21tdV9p
bml0X29wcyAqX19pbml0ZGF0YSBpb21tdV9pbml0X29wczsKPj4+ICBzdHJ1Y3QgaW9tbXVfb3Bz
IF9fcmVhZF9tb3N0bHkgaW9tbXVfb3BzOwo+Pj4gIAo+Pj4gK2ludCBfX2luaXQgaW9tbXVfaGFy
ZHdhcmVfc2V0dXAodm9pZCkKPj4+ICt7Cj4+PiArICAgIGlmICggIWlvbW11X2luaXRfb3BzICkK
Pj4+ICsgICAgICAgIHJldHVybiAtRU5PREVWOwo+Pj4gKwo+Pj4gKyAgICBpZiAoICFpb21tdV9v
cHMuaW5pdCApCj4+PiArICAgICAgICBpb21tdV9vcHMgPSAqaW9tbXVfaW5pdF9vcHMtPm9wczsK
Pj4+ICsgICAgZWxzZQo+Pj4gKyAgICAgICAgQVNTRVJUKGlvbW11X29wcy5pbml0ID09IGlvbW11
X2luaXRfb3BzLT5vcHMtPmluaXQpOwo+PiBXaGF0IGlzIHRoaXMgQVNTRVJUKCkgaW50ZW5kZWQg
dG8gY2F0Y2g/ICBXZSBwYXNzIHRocm91Z2ggdGhpcyBmdW5jdGlvbgo+PiBleGFjdGx5IG9uY2Us
IG1ha2luZyB0aGUgZWxzZSBwYXRoIGRlYWQuCj4gaW9tbXVfb3BzIG1heSBoYXZlIGdvdCBzZXQg
YWxyZWFkeSBkdXJpbmcgeDJBUElDIElSIGVuYWJsaW5nIChzZWUKPiBwYXRjaCA2KS4KCkluIHdo
aWNoIGNhc2UgYQoKLyogeDJhcGljIHNldHVwIG1heSBoYXZlIHByZXZpb3VzbHkgaW5pdGlhbGlz
ZWQgdGhlIElPTU1VIG9wcy4gKi8KCm9yIHNpbWlsYXIgd291bGQgZG8gbmljZWx5LCB0byBleHBs
YWluIHRoaXMgbG9naWMuCgpXaXRoIHRoYXQsIFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
