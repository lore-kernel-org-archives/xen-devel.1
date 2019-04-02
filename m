From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 4/7] x86/IOMMU: introduce init-ops structure
Date: Tue, 2 Apr 2019 03:00:48 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19C9C800E@SHSMSX104.ccr.corp.intel.com>
References: <5C9CDDAF020000780022282A@prv1-mh.provo.novell.com>
 <5C9CDF770200007800222847@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w3CH=SE=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hB9fQ-0000T9-9G
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 03:00:52 +0000
In-Reply-To: <5C9CDF770200007800222847@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFRo
dXJzZGF5LCBNYXJjaCAyOCwgMjAxOSAxMDo1MiBQTQo+IAo+IERvIGF3YXkgd2l0aCB0aGUgQ1BV
IHZlbmRvciBkZXBlbmRlbmN5LCBhbmQgc2V0IHRoZSBpbml0IG9wcyBwb2ludGVyCj4gYmFzZWQg
b24gd2hhdCBBQ1BJIHRhYmxlcyBoYXZlIGJlZW4gZm91bmQuCj4gCj4gQWxzbyB0YWtlIHRoZSBv
cHBvcnR1bml0eSBhbmQgYWRkIF9fcmVhZF9tb3N0bHkgdG8gaW9tbXVfb3BzLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBL
ZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
