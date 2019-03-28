From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/7] x86/IOMMU: introduce init-ops structure
Date: Thu, 28 Mar 2019 17:01:26 +0000
Message-ID: <824a61ae-f3e8-3f34-157d-7fe44d292a67@citrix.com>
References: <5C9CDDAF020000780022282A@prv1-mh.provo.novell.com>
 <5C9CDF770200007800222847@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9APk=R7=citrix.com=prvs=98327f9ff=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h9YTH-0006I0-0U
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 17:05:43 +0000
In-Reply-To: <5C9CDF770200007800222847@prv1-mh.provo.novell.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDMvMjAxOSAxNDo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gRG8gYXdheSB3aXRoIHRo
ZSBDUFUgdmVuZG9yIGRlcGVuZGVuY3ksIGFuZCBzZXQgdGhlIGluaXQgb3BzIHBvaW50ZXIKPiBi
YXNlZCBvbiB3aGF0IEFDUEkgdGFibGVzIGhhdmUgYmVlbiBmb3VuZC4KCiJiYXNlZCBvbiB3aGlj
aCBBUENJIHRhYmxlcy4uLiIKCj4KPiBBbHNvIHRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBhZGQg
X19yZWFkX21vc3RseSB0byBpb21tdV9vcHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
