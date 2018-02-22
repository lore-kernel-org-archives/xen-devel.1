From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/HVM: don't give the wrong impression of
 WRMSR succeeding
Date: Thu, 22 Feb 2018 09:49:20 -0500
Message-ID: <6ce66b9d-d17c-8a97-9636-3b418072dbfe@oracle.com>
References: <5A8ED75E02000078001AA6A4@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=qayk=fq=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eosB0-0007pC-C9
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 14:48:50 +0000
In-Reply-To: <5A8ED75E02000078001AA6A4@prv-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjIvMjAxOCAwODo0NCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gLi4uIGZvciB1bmtu
b3duIE1TUnM6IHdybXNyX2h5cGVydmlzb3JfcmVncygpJ3MgY29tbWVudCBjbGVhcmx5IHNheXMK
PiB0aGF0IHRoZSBmdW5jdGlvbiByZXR1cm5zIDAgZm9yIHVucmVjb2duaXplZCBNU1JzLCBzbwo+
IHtzdm0sdm14fV9tc3Jfd3JpdGVfaW50ZXJjZXB0KCkgc2hvdWxkIG5vdCBjb252ZXJ0IHRoaXMg
aW50byBzdWNjZXNzLgo+Cj4gQXQgdGhlIHRpbWUgaXQgd2VudCBpbiwgY29tbWl0IDAxM2UzNGY1
YTYgKCJ4ODY6IGhhbmRsZSBwYWdlZCBnZm4gaW4KPiB3cm1zcl9oeXBlcnZpc29yX3JlZ3MiKSB3
YXMgcHJvYmFibHkgb2theSwgc2luY2UgcHJpb3IgdG8gdGhhdCB0aGUKPiByZXR1cm4gdmFsdWUg
d2Fzbid0IGNoZWNrZWQgYXQgYWxsLiBCdXQgdGhhdCdzIG5vdCBob3cgd2Ugd2FudCB0aGluZ3MK
PiB0byBiZSBoYW5kbGVkIG5vd2FkYXlzLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMu
b3N0cm92c2t5QG9yYWNsZS5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
