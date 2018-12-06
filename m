From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools/libxl: fix boot of HVM domain with
 Xenstore-stubdom
Date: Thu, 6 Dec 2018 13:00:53 +0000
Message-ID: <20181206130053.g4h47enuo5tseljb@zion.uk.xensource.com>
References: <20181204142857.29967-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rEu3=OP=citrix.com=prvs=871665441=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gUtH0-0000El-IG
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 13:00:58 +0000
Content-Disposition: inline
In-Reply-To: <20181204142857.29967-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBEZWMgMDQsIDIwMTggYXQgMDM6Mjg6NTdQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBUaGUgWGVuc3RvcmUgZG9taWQgaXNuJ3Qgc2V0IGZvciBIVk0gZG9tYWlucy4gVGhp
cyB3aWxsIHJlc3VsdCBpbgo+IGZhaWx1cmUgd2hlbiBib290aW5nIGEgSFZNIGRvbWFpbiBvbiBh
IHN5c3RlbSB3aXRoIFhlbnN0b3JlIG5vdCBydW5uaW5nCj4gaW4gZG9tMC4KPiAKPiBTYW1lIGFw
cGxpZXMgZm9yIGNvbnNvbGUgZG9taWQsIHNvIHNldCBib3RoLgo+IAo+IFRoaXMgaXMgYnJva2Vu
IHNpbmNlIGNvbW1pdCBhMmQ5YTZmYTFmY2QgKCJ0b29scy9saWJ4ZW5jdHJsOiB1c2UgbmV3Cj4g
eGVuZm9yZWlnbm1lbW9yeSBBUEkgdG8gc2VlZCBncmFudCB0YWJsZSIpLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
