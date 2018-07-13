From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 03/16] x86/HVM: switch
 virtual_intr_delivery_enabled() hook to simple boolean
Date: Fri, 13 Jul 2018 13:18:18 +0100
Message-ID: <e350a8bc-2269-c6dc-4534-fa749e5d721e@citrix.com>
References: <5B46030502000078001D322E@prv1-mh.provo.novell.com>
 <5B46052502000078001D3255@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=aqzi=j5=citrix.com=prvs=725a9f4ea=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fdxA3-0002Q2-P3
 for xen-devel@lists.xenproject.org; Fri, 13 Jul 2018 12:26:59 +0000
In-Reply-To: <5B46052502000078001D3255@prv1-mh.provo.novell.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDcvMTggMTQ6MjQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEZyb206IFN1cmF2ZWUgU3V0
aGlrdWxwYW5pdCA8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+Cj4KPiBUaGlzIHBhdGNo
IG1vZGlmaWVzIHRoZSBodm1fZnVuY3MudmlydHVhbF9pbnRyX2RlbGl2ZXJ5X2VuYWJsZWQoKQo+
IHRvIGJlY29tZSBhIGJvb2wgdmFyaWFibGUgYXMgVk1YIGRvZXMgYW5kIFNWTSB3aWxsIHNpbXBs
eSByZXR1cm4gYQo+IHN0YXRpYyB2YWx1ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFN1cmF2ZWUgU3V0
aGlrdWxwYW5pdCA8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
