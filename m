From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/7] x86/IOMMU: abstract Intel-specific
 iommu_supports_eim()
Date: Thu, 28 Mar 2019 17:03:21 +0000
Message-ID: <12128275-0096-1a02-6fa1-4ded2c149090@citrix.com>
References: <5C9CDDAF020000780022282A@prv1-mh.provo.novell.com>
 <5C9CDFAB020000780022287B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9APk=R7=citrix.com=prvs=98327f9ff=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h9YV5-0006Qx-Qu
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 17:07:35 +0000
In-Reply-To: <5C9CDFAB020000780022287B@prv1-mh.provo.novell.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDMvMjAxOSAxNDo1MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSW50cm9kdWNlIGEgcmVz
cGVjdGl2ZSBlbGVtZW50IGluIHN0cnVjdCBpb21tdV9pbml0X29wcy4KPgo+IFRha2UgdGhlIGxp
YmVydHkgYW5kIGFsc28gc3dpdGNoIGludGVsX2lvbW11X3N1cHBvcnRzX2VpbSgpIHRvIGJvb2wv
Cj4gdHJ1ZS9mYWxzZSwgdG8gZnVsbHkgbWF0Y2ggdGhlIGhvb2sncyB0eXBlLgo+Cj4gU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
