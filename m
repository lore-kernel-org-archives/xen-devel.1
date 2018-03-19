From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v5 12/14] x86/HVM: use x86emul_write_xcr()
Date: Mon, 19 Mar 2018 12:57:07 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D191085D53@SHSMSX101.ccr.corp.intel.com>
References: <5AAA7BAF02000078001B2242@prv-mh.provo.novell.com>
 <5AAA7F3102000078001B22CA@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=v4ca=gj=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1exuLn-0006lA-Bx
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 12:57:19 +0000
In-Reply-To: <5AAA7F3102000078001B22CA@prv-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFRo
dXJzZGF5LCBNYXJjaCAxNSwgMjAxOCA5OjEyIFBNCj4gCj4gLi4uICBpbnN0ZWFkIG9mIGRpcmVj
dGx5IGNhbGxpbmcgaGFuZGxlX3hzZXRidigpLCB0byBtYWtlIHVzZSBvZiB0aGUKPiBhZGRpdGlv
bmFsIGNoZWNraW5nIHRoZXJlLgo+IAo+IEFsc28gZG9uJ3QgY2FsbCBodm1fbW9uaXRvcl9jclgo
WENSMCwgLi4uKSBmb3IgaW5kZXhlcyBvdGhlciB0aGFuIHplcm8KPiBhbnltb3JlLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5
OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
