From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 7/7] x86/IOMMU: initialize iommu_ops in
 vendor-independent code
Date: Thu, 28 Mar 2019 17:50:25 +0000
Message-ID: <80a0095f-93ff-2f92-f8fd-f58d78b0f026@citrix.com>
References: <5C9CDDAF020000780022282A@prv1-mh.provo.novell.com>
 <5C9CE0270200007800222881@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9APk=R7=citrix.com=prvs=98327f9ff=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h9ZBE-0002oK-Vf
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 17:51:09 +0000
In-Reply-To: <5C9CE0270200007800222881@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDMvMjAxOSAxNDo1NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gLS0tIGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMKPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC94ODYvaW9tbXUuYwo+IEBAIC0yNiw2ICsyNiwxOSBAQAo+ICBjb25zdCBzdHJ1Y3QgaW9tbXVf
aW5pdF9vcHMgKl9faW5pdGRhdGEgaW9tbXVfaW5pdF9vcHM7Cj4gIHN0cnVjdCBpb21tdV9vcHMg
X19yZWFkX21vc3RseSBpb21tdV9vcHM7Cj4gIAo+ICtpbnQgX19pbml0IGlvbW11X2hhcmR3YXJl
X3NldHVwKHZvaWQpCj4gK3sKPiArICAgIGlmICggIWlvbW11X2luaXRfb3BzICkKPiArICAgICAg
ICByZXR1cm4gLUVOT0RFVjsKPiArCj4gKyAgICBpZiAoICFpb21tdV9vcHMuaW5pdCApCj4gKyAg
ICAgICAgaW9tbXVfb3BzID0gKmlvbW11X2luaXRfb3BzLT5vcHM7Cj4gKyAgICBlbHNlCj4gKyAg
ICAgICAgQVNTRVJUKGlvbW11X29wcy5pbml0ID09IGlvbW11X2luaXRfb3BzLT5vcHMtPmluaXQp
OwoKV2hhdCBpcyB0aGlzIEFTU0VSVCgpIGludGVuZGVkIHRvIGNhdGNoP8KgIFdlIHBhc3MgdGhy
b3VnaCB0aGlzIGZ1bmN0aW9uCmV4YWN0bHkgb25jZSwgbWFraW5nIHRoZSBlbHNlIHBhdGggZGVh
ZC4KCkRvIHlvdSBoYXZlIHNvbWUgcGxhbnMgaW4gZnV0dXJlIHNlcmllcyB3aGljaCBtYWtlIHRo
aXMgYSBub24taW5pdCBmdW5jdGlvbj8KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
