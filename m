From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v5 12/13] IOMMU/x86: remove indirection from
 certain IOMMU hook accesses
Date: Wed, 14 Nov 2018 03:25:13 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BE49C27@SHSMSX101.ccr.corp.intel.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BE45CB602000078001F9C6A@prv1-mh.provo.novell.com>
 <5BE4614C02000078001F9D19@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=djhp=nz=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1gMlnr-0003MN-Tz
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 03:25:19 +0000
In-Reply-To: <5BE4614C02000078001F9D19@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IEZy
aWRheSwgTm92ZW1iZXIgOSwgMjAxOCAxMjoxNiBBTQo+IAo+IFRoZXJlJ3Mgbm8gbmVlZCB0byBn
byB0aHJvdWdoIGFuIGV4dHJhIGxldmVsIG9mIGluZGlyZWN0aW9uLiBJbiBvcmRlciB0bwo+IGxp
bWl0IGNvZGUgY2h1cm4sIGNhbGwgc2l0ZXMgdXNpbmcgc3RydWN0IGRvbWFpbl9pb21tdSdzIHBs
YXRmb3JtX29wcwo+IGRvbid0IGdldCB0b3VjaGVkIGhlcmUsIGhvd2V2ZXIuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEtl
dmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
