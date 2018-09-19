From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 2/4] x86/mm: use optional cache in
 guest_walk_tables()
Date: Wed, 19 Sep 2018 16:50:44 +0100
Message-ID: <20180919155044.lqni6rs4xreyqbl3@zion.uk.xensource.com>
References: <5B97BEB202000078001E73FB@prv1-mh.provo.novell.com>
 <5B97BFC902000078001E740D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wwm0=mb=citrix.com=prvs=79313d28f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g2ekc-0001rt-2a
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 15:50:50 +0000
Content-Disposition: inline
In-Reply-To: <5B97BFC902000078001E740D@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMTEsIDIwMTggYXQgMDc6MTQ6NDlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIGNhY2hpbmcgaXNuJ3QgYWN0dWFsbHkgaW1wbGVtZW50ZWQgaGVyZSwgdGhpcyBp
cyBqdXN0IHNldHRpbmcgdGhlCj4gc3RhZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
