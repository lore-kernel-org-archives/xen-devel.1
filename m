From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH] VMX: don't needlessly write CR4 guest/host
 mask
Date: Mon, 2 Jul 2018 05:44:23 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D191235A5F@SHSMSX101.ccr.corp.intel.com>
References: <5B36312402000078001CF2A2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/r+i=js=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1fZrdX-0005AT-FG
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 05:44:31 +0000
In-Reply-To: <5B36312402000078001CF2A2@prv1-mh.provo.novell.com>
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
Cc: "Nakajima, Jun" <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IEZy
aWRheSwgSnVuZSAyOSwgMjAxOCA5OjE2IFBNCj4gCj4gSW4gc2hhZG93IG1vZGUgdGhlIGZpZWxk
IG5ldmVyIGNoYW5nZXMgZnJvbSB+MFVMLCBzbyB0aGVyZSdzIG5vIG5lZWQgZm9yCj4gYSBWTVdS
SVRFIChvciBhbiB1cGRhdGUgb2YgaXRzIGNhY2hlZCB2YWx1ZSkuCj4gCj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IEtldmluIFRpYW4g
PGtldmluLnRpYW5AaW50ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
