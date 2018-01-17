From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 2/6] xen/pvh: place the trampoline at
	page 0x1
Date: Wed, 17 Jan 2018 12:06:17 +0000
Message-ID: <20180117120617.o5xdwcndnuh63suo@citrix.com>
References: <20180117113752.6xl4ra2nuy5p4wzw@citrix.com>
 <20180117120041.34519-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=s8/r=em=citrix.com=prvs=5488b24bb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ebmU5-0002gj-Ss
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2018 12:06:25 +0000
Content-Disposition: inline
In-Reply-To: <20180117120041.34519-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMTcsIDIwMTggYXQgMTI6MDA6NDFQTSArMDAwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFNpbmNlIFBWSCBndWVzdCBqdW1wIHN0cmFpZ2h0IGludG8gdHJhbXBvbGluZV9z
ZXR1cCB0cmFtcG9saW5lX3BoeXMgaXMKPiBub3QgaW5pdGlhbGl6ZWQsIHRodXMgdGhlIHRyYW1w
b2xpbmUgaXMgcmVsb2NhdGVkIHRvIGFkZHJlc3MgMC4KPiAKPiBUaGlzIHdvcmtzLCBidXQgaGFz
IHRoZSB1bmRlc2lyYWJsZSBlZmZlY3Qgb2YgaGF2aW5nIFZBIDAgbWFwcGVkIHRvCj4gTUZOIDAs
IHdoaWNoIG1lYW5zIE5VTEwgcG9pbnRlZCBkZXJlZmVyZW5jZXMgbm8gbG9uZ2VyIHRyaWdnZXIg
YSBwYWdlCj4gZmF1bHQuCj4gCj4gSW4gb3JkZXIgdG8gc29sdmUgdGhpcywgcGxhY2UgdGhlIHRy
YW1wb2xpbmUgYXQgcGFnZSAweDEgYW5kIHJlc2VydmUKPiB0aGUgbWVtb3J5IHVzZWQgYnkgaXQu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
