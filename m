From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH] VT-d: change bogus return value of
 intel_iommu_lookup_page()
Date: Tue, 28 May 2019 05:29:22 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19CA4E69F@SHSMSX104.ccr.corp.intel.com>
References: <5CDAAECA020000780022E947@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3VDd=T4=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hVUfz-0004Ct-HI
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 05:29:31 +0000
In-Reply-To: <5CDAAECA020000780022E947@prv1-mh.provo.novell.com>
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
Cc: Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFR1
ZXNkYXksIE1heSAxNCwgMjAxOSA4OjA0IFBNCj4gCj4gVGhlIGZ1bmN0aW9uIHBhc3NlcyAwIGFz
ICJhbGxvYyIgYXJndW1lbnQgdG8gYWRkcl90b19kbWFfcGFnZV9tYWRkcigpLAo+IHNvIC1FTk9N
RU0gc2ltcGx5IG1ha2VzIG5vIHNlbnNlIChhbmQgaXRzIHVzZSB3YXMgcHJvYmFibHkgc2ltcGx5
IGEKPiBjb3B5LWFuZC1wYXN0ZSBlZmZlY3Qgb3JpZ2luYXRpbmcgYXQgaW50ZWxfaW9tbXVfbWFw
X3BhZ2UoKSkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgo+IAoKQWNrZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
