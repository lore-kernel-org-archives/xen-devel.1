From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xsm: fix clang build
Date: Thu, 6 Sep 2018 17:16:32 +0100
Message-ID: <20180906161632.7rp42tnssukqd54t@zion.uk.xensource.com>
References: <20180905144606.37519-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xusr=lu=citrix.com=prvs=7806f00aa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fxwxQ-0006pO-A1
 for xen-devel@lists.xenproject.org; Thu, 06 Sep 2018 16:16:36 +0000
Content-Disposition: inline
In-Reply-To: <20180905144606.37519-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMDUsIDIwMTggYXQgMDQ6NDY6MDZQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IGViaXRtYXAuYzoyNDQ6MzI6IGVycm9yOiBpbnZhbGlkIGNvbnZlcnNpb24gc3Bl
Y2lmaWVyICdaJyBbLVdlcnJvciwtV2Zvcm1hdC1pbnZhbGlkLXNwZWNpZmllcl0KPiAgICAgICAg
ICAgICAgICAibWF0Y2ggbXkgc2l6ZSAlWmQgKGhpZ2ggYml0IHdhcyAlZClcbiIsIG1hcHVuaXQs
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfl4KPiBlYml0bWFwLmM6MjQ1OjE2OiBl
cnJvcjogZm9ybWF0IHNwZWNpZmllcyB0eXBlICdpbnQnIGJ1dCB0aGUgYXJndW1lbnQgaGFzIHR5
cGUgJ3Vuc2lnbmVkIGxvbmcnCj4gICAgICAgWy1XZXJyb3IsLVdmb3JtYXRdCj4gICAgICAgICAg
ICAgICAgc2l6ZW9mKHU2NCkgKiA4LCBlLT5oaWdoYml0KTsKPiAgICAgICAgICAgICAgICBefn5+
fn5+fn5+fn5+fn4KPiBlYml0bWFwLmM6MjQ1OjMzOiBlcnJvcjogZGF0YSBhcmd1bWVudCBub3Qg
dXNlZCBieSBmb3JtYXQgc3RyaW5nIFstV2Vycm9yLC1XZm9ybWF0LWV4dHJhLWFyZ3NdCj4gICAg
ICAgICAgICAgICAgc2l6ZW9mKHU2NCkgKiA4LCBlLT5oaWdoYml0KTsKPiAKPiBVc2UgJXpkIGlu
c3RlYWQgb2YgJVpkLCB3aGljaCBpcyBjb21wbGlhbnQgd2l0aCBDOTkuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
