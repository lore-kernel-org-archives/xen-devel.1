From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 7/7] x86/IOMMU: initialize iommu_ops in
 vendor-independent code
Date: Tue, 2 Apr 2019 03:26:03 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19C9C80A2@SHSMSX104.ccr.corp.intel.com>
References: <5C9CDDAF020000780022282A@prv1-mh.provo.novell.com>
 <5C9CE0270200007800222881@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w3CH=SE=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hBA3w-0002XG-5B
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 03:26:12 +0000
In-Reply-To: <5C9CE0270200007800222881@prv1-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFRo
dXJzZGF5LCBNYXJjaCAyOCwgMjAxOSAxMDo1NSBQTQo+IAo+IE1vdmUgdGhpcyBpbnRvIGlvbW11
X2hhcmR3YXJlX3NldHVwKCkgYW5kIG1ha2UgdGhhdCBmdW5jdGlvbiBub24tCj4gaW5saW5lLiBN
b3ZlIGl0cyBkZWNsYXJhdGlvbiBpbnRvIGNvbW1vbiBjb2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBLZXZpbiBUaWFu
IDxrZXZpbi50aWFuQGludGVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
