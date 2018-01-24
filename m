From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 3/3] drop "domain_" prefix from struct
 domain's dirty CPU mask
Date: Wed, 24 Jan 2018 01:53:22 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D190EED939@SHSMSX101.ccr.corp.intel.com>
References: <5A67176A02000078001A1734@prv-mh.provo.novell.com>
 <5A67199102000078001A1775@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=z7j7=et=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1eeAG9-0007SV-Fx
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 01:53:53 +0000
In-Reply-To: <5A67199102000078001A1775@prv-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFR1
ZXNkYXksIEphbnVhcnkgMjMsIDIwMTggNjoxNyBQTQo+IAo+IEl0IGJlaW5nIGEgZmllbGQgb2Yg
c3RydWN0IGRvbWFpbiBpcyBzdWZmaWNpZW50IHRvIHJlY29nbml6ZSBpdHMKPiBwdXJwb3NlLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBSZXZp
ZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogR2Vv
cmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IC0tLQo+IHYyOiBXaGl0ZSBz
cGFjZSBjaGFuZ2VzIChjb25zb2xpZGF0ZSBzcGxpdCBsaW5lIHN0YXRlbWVudHMgaW50byBzaW5n
bGUKPiAgICAgbGluZSBvbmVzKS4gUmUtYmFzZS4KClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxr
ZXZpbi50aWFuQGludGVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
