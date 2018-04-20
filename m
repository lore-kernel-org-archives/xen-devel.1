From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: correct assertion in
 destroy_perdomain_mapping()
Date: Fri, 20 Apr 2018 16:21:22 +0100
Message-ID: <454ed889-4f81-728c-9234-75b3d71812e1@citrix.com>
References: <5ADA014A02000078001BD11B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sfiv=hj=citrix.com=prvs=641bd8182=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1f9Xqp-0003eG-NN
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 15:21:27 +0000
In-Reply-To: <5ADA014A02000078001BD11B@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDQvMTggMTY6MDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IGh2bV9kb21haW5faW5pdGlh
bGlzZSgpIG1heSBjYWxsIHRoaXMgd2l0aCBuciBiZWluZyB6ZXJvLCB3aGljaCB0cmlnZ2Vycwo+
IHRoZSAiZG9lcyBub3QgY3Jvc3MgTDMgYm91bmRhcnkiIGNoZWNrLgo+Cj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSXMgdGhpcyB0aGUgY29ycmVjdCBm
aXg/CgpJdHMgdW5jbGVhciB3aGF0IHRoZSBjYWxsIHRvIGNyZWF0ZV9wZXJkb21haW5fbWFwcGlu
ZygpIGlzIGRvaW5nLCBidXQgaXQKaXMgdGhlIHNvbGUgY2FsbGVyIHdoaWNoIHBhc3NlcyAwLgoK
SSBwcmVzdW1lIGl0IGlzIHRvIGFsbG9jYXRlIGQtPmFyY2gucGVyZG9tYWluX2wzX3BnIGJ1dApk
ZXN0cm95X3BlcmRvbWFpbl9tYXBwaW5nKCkgZG9lc24ndCBmcmVlIHRoaXMgcGFnZSwgc28gSSd2
ZSBnb3Qgbm8gaWRlYQp3aGF0IHRoZSBkZXN0cm95IGNhbGwgaXMgdHJ5aW5nIHRvIGFjaGlldmUu
Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
