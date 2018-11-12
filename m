From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] guest/pvh: special case the low 1MB
Date: Mon, 12 Nov 2018 03:31:24 -0700
Message-ID: <5BE9567C02000078001FAC18@prv1-mh.provo.novell.com>
References: <20181109172250.12894-1-roger.pau@citrix.com>
 <20181109172250.12894-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=18fz=nx=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gM9VB-0008PA-Pw
 for xen-devel@lists.xenproject.org; Mon, 12 Nov 2018 10:31:29 +0000
In-Reply-To: <20181109172250.12894-3-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjExLjE4IGF0IDE4OjIyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFdoZW4gcnVubmluZyBhcyBhIFBWSCBndWVzdCBYZW4gb25seSBzcGVjaWFsIGNhc2VzIHRoZSB0
cmFtcG9saW5lCj4gY29kZSBpbiB0aGUgbG93IDFNQiwgd2l0aG91dCBhbHNvIHJlc2VydmluZyB0
aGUgc3BhY2UgdXNlZCBieSB0aGUKPiByZWxvY2F0ZWQgbWV0YWRhdGEgb3IgdGhlIHRyYW1wb2xp
bmUgc3RhY2suCj4gCj4gRml4IHRoaXMgYnkgYWx3YXlzIHJlc2VydmluZyB0aGUgbG93IDFNQiBy
ZWdhcmRsZXNzIG9mIHdoZXRoZXIgWGVuIGlzCj4gcnVubmluZyBhcyBhIGd1ZXN0IG9yIG5hdGl2
ZWx5Lgo+IAo+IFJlcG9ydGVkLWJ5OiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJp
eC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+CgpOb3Qgb3Zlcmx5IG5pY2UgdG8gd2FzdGUgc29tZSBzcGFjZSBoZXJlLCBidXQgbGlr
ZWx5IGJldHRlciB0aGFuCnRyeWluZyB0byBjb3ZlciBhbGwgb2YgdGhlIGJpdHMgYW5kIHBpZWNl
cyBpbmRpdmlkdWFsbHkuCgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
