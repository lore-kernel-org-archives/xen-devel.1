From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 4/4] firmware/shim: avoid mkdir error during
 Xen tree setup
Date: Wed, 7 Feb 2018 16:14:18 +0000
Message-ID: <20180207161418.ht2t6mcpfgs7xn3y@MacBook-Pro-de-Roger.local>
References: <5A7B21F202000078001A6124@prv-mh.provo.novell.com>
 <5A7B248F02000078001A614B@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=kfjv=fb=citrix.com=prvs=569e52e77=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ejSRI-0007qt-MW
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2018 16:19:16 +0000
Content-Disposition: inline
In-Reply-To: <5A7B248F02000078001A614B@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMDcsIDIwMTggYXQgMDg6MDg6NDdBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gIm1rZGlyIC1wIiByZXBvcnRzIGEgbWlzc2luZyBvcGVyYW5kLCBhcyBjb25maWcvIGhh
cyBubyBzdWJkaXJzLiBPZGRseQo+IGVub3VnaCB0aGlzIGRvZXNuJ3QgY2F1c2UgdGhlIHdob2xl
IGNvbW1hbmQgKGFuZCBoZW5jZSB0aGUgYnVpbGQgdG8KPiBmYWlsKSwgZGVzcGl0ZSB0aGUgInNl
dCAtZSIgbm93IGNvdmVyaW5nIHRoZSBlbnRpcmUgc2V0IG9mIGNvbW1hbmRzIC0KPiBwZXJoYXBz
IGEgcXVpcmsgb2YgdGhlIHJlbGF0aXZlbHkgb2xkIGJhc2ggSSd2ZSBzZWVuIHRoaXMgd2l0aCAo
YSBmZXcKPiBzaW1wbGUgZXhwZXJpbWVudHMgc3VnZ2VzdCB0aGF0IGNvbW1hbmRzIGluc2lkZSAo
KSBwcm9kdWNpbmcgYSBub24tCj4gc3VjY2VzcyBzdGF0dXMgd291bGQgZXhpdCB0aGUgaW5uZXIg
c2hlbGwsIGJ1dCBub3QgdGhlIG91dGVyIG9uZSkuCj4gCj4gQWRkIGEgZHVtbXkgLiBhcmd1bWVu
dCB0byB0aGUgaW52b2NhdGlvbi4KPiAKPiBTdWdnZXN0ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
