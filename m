From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] tools/xl: use libxl_domain_info to get
 domain type for vcpu-pin
Date: Tue, 9 Apr 2019 13:36:37 +0100
Message-ID: <20190409123637.GI30543@zion.uk.xensource.com>
References: <1554811318-1931-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDpzW-0001pP-NY
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:36:42 +0000
Content-Disposition: inline
In-Reply-To: <1554811318-1931-1-git-send-email-igor.druzhinin@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMDksIDIwMTkgYXQgMDE6MDE6NThQTSArMDEwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gUGFyc2luZyB0aGUgY29uZmlnIHNlZW1zIHRvIGJlIGFuIG92ZXJraWxsIGZvciB0
aGlzIHBhcnRpY3VsYXIgdGFzawo+IGFuZCB0aGUgY29uZmlnIG1pZ2h0IHNpbXBseSBiZSBhYnNl
bnQuIFR5cGUgcmV0dXJuZWQgZnJvbSBsaWJ4bF9kb21haW5faW5mbwo+IHNob3VsZCBiZSBlaXRo
ZXIgTElCWExfRE9NQUlOX1RZUEVfSFZNIG9yIExJQlhMX0RPTUFJTl9UWVBFX1BWIGJ1dCBpbgo+
IHRoYXQgY29udGV4dCBkaXN0aW5jdGlvbiBiZXR3ZWVuIFBWSCBhbmQgSFZNIHNob3VsZCBiZSBp
cnJlbGV2YW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpo
aW5pbkBjaXRyaXguY29tPgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
