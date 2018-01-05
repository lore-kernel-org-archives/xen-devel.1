From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 13/74] xen/domctl: Return arch_config
 via getdomaininfo
Date: Fri, 05 Jan 2018 03:58:20 -0700
Message-ID: <5A4F685C020000780019B527@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-14-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ivak=ea=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eXPhf-00020U-IJ
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2018 10:58:23 +0000
In-Reply-To: <20180104130625.28605-14-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, wei.liu2@citrix.com
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAxLjE4IGF0IDE0OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oCj4gKysrIGIveGVuL2luY2x1ZGUvcHVi
bGljL2RvbWN0bC5oCj4gQEAgLTExNiw2ICsxMTYsNyBAQCBzdHJ1Y3QgeGVuX2RvbWN0bF9nZXRk
b21haW5pbmZvIHsKPiAgICAgIHVpbnQzMl90IHNzaWRyZWY7Cj4gICAgICB4ZW5fZG9tYWluX2hh
bmRsZV90IGhhbmRsZTsKPiAgICAgIHVpbnQzMl90IGNwdXBvb2w7Cj4gKyAgICBzdHJ1Y3QgeGVu
X2FyY2hfZG9tYWluY29uZmlnIGFyY2hfY29uZmlnOwo+ICB9OwoKU3VjaCBhbiBhZGRpdGlvbiBy
ZXF1aXJlcyB0aGUgaW50ZXJmYWNlIHZlcnNpb24gdG8gYmUgYnVtcGVkLgpBcyBJIGFzc3VtZSB3
ZSB3aWxsIHdhbnQgdG8gYmFja3BvcnQgdGhpcyB0byA0LjEwLCB3ZSBzaG91bGQKbWFrZSBzdXJl
IHRoaXMgKGFuZCBwZXJoYXBzIG90aGVycyBpbiB0aGlzIHNlcmllcywgYnV0IG5vbmUKb3V0c2lk
ZSkgaXMgdGhlIG9ubHkgZG9tY3RsIGludGVyZmFjZSBjaGFuZ2UgZm9yIHRoaXMgdmVyc2lvbiwK
aS5lLiBmb3IgYW55IG90aGVycyB1bnRpbCA0LjExIGdvZXMgb3V0IHdlJ2QgbmVlZCB0byByZW1l
bWJlcgp0byBidW1wIGl0IGEgc2Vjb25kIHRpbWUgdGhlbi4KCldpdGggdGhhdApSZXZpZXdlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
