From: Tim Deegan <tim@xen.org>
Subject: Re: [PATCH 6/6] x86: use paging_mark_pfn_dirty()
Date: Wed, 20 Dec 2017 08:10:18 +0000
Message-ID: <20171220081018.GG76516@deinos.phlegethon.org>
References: <5A2FFB8D0200007800196DDF@prv-mh.provo.novell.com>
 <5A2FFF290200007800196E34@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=t+nq=dq=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1eRZSL-0003mg-2x
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2017 08:10:25 +0000
Content-Disposition: inline
In-Reply-To: <5A2FFF290200007800196E34@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QXQgMDg6MDkgLTA3MDAgb24gMTIgRGVjICgxNTEzMDY2MTUzKSwgSmFuIEJldWxpY2ggd3JvdGU6
Cj4gLi4uIGluIHByZWZlcmVuY2Ugb3ZlciBwYWdpbmdfbWFya19kaXJ0eSgpLCB3aGVuIHRoZSBQ
Rk4gaXMga25vd24KPiBhbnl3YXkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
