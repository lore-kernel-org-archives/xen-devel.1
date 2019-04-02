From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 5/7] x86/IOMMU: abstract Intel-specific
 iommu_supports_eim()
Date: Tue, 2 Apr 2019 03:02:46 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19C9C8022@SHSMSX104.ccr.corp.intel.com>
References: <5C9CDDAF020000780022282A@prv1-mh.provo.novell.com>
 <5C9CDFAB020000780022287B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w3CH=SE=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hB9hQ-0000bX-5r
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 03:02:56 +0000
In-Reply-To: <5C9CDFAB020000780022287B@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFRo
dXJzZGF5LCBNYXJjaCAyOCwgMjAxOSAxMDo1MiBQTQo+IAo+IEludHJvZHVjZSBhIHJlc3BlY3Rp
dmUgZWxlbWVudCBpbiBzdHJ1Y3QgaW9tbXVfaW5pdF9vcHMuCj4gCj4gVGFrZSB0aGUgbGliZXJ0
eSBhbmQgYWxzbyBzd2l0Y2ggaW50ZWxfaW9tbXVfc3VwcG9ydHNfZWltKCkgdG8gYm9vbC8KPiB0
cnVlL2ZhbHNlLCB0byBmdWxseSBtYXRjaCB0aGUgaG9vaydzIHR5cGUuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEtldmlu
IFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
