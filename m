From: Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v4 15/20] x86emul: correctly handle CMPXCHG*
 comparison failures
Date: Thu, 1 Mar 2018 07:16:48 +0000
Message-ID: <20180301071648.GA24673@deinos.phlegethon.org>
References: <5A96B3B902000078001ACB6D@prv-mh.provo.novell.com>
 <5A96B82902000078001ACC28@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=uopr=fx=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1erISW-0002za-6G
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 07:16:56 +0000
Content-Disposition: inline
In-Reply-To: <5A96B82902000078001ACC28@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QXQgMDY6MDkgLTA3MDAgb24gMjggRmViICgxNTE5Nzk4MTg1KSwgSmFuIEJldWxpY2ggd3JvdGU6
Cj4gSWYgdGhlIC0+Y21weGNoZygpIGhvb2sgZmluZHMgYSBtaXNtYXRjaCwgd2Ugc2hvdWxkIGRl
YWwgd2l0aCB0aGlzIHRoZQo+IHNhbWUgd2F5IGFzIHdoZW4gdGhlICJtYW51YWwiIGNvbXBhcmlz
b24gcmVwb3J0cyBhIG1pc21hdGNoLgo+IAo+IFRoaXMgaW52b2x2ZXMgcmV2ZXJ0aW5nIGJmY2Uw
ZTYyYzMgKCJ4ODYvZW11bDogRHJvcAo+IFg4NkVNVUxfQ01QWENIR19GQUlMRUQiKSwgYWxiZWl0
IHdpdGggWDg2RU1VTF9DTVBYQ0hHX0ZBSUxFRCBub3cKPiBiZWNvbWluZyBhIHZhbHVlIGRpc3Rp
bmN0IGZyb20gWDg2RU1VTF9SRVRSWS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4gQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+CgpTaGFkb3cgcGFydHMgQWNrZWQtYnk6IFRpbSBEZWVnYW4gPHRpbUB4
ZW4ub3JnPgoKQW5kIGFsc28gZm9yIHRoZSBvdGhlciBwYXJ0cyBvZiB0aGUgc2VyaWVzICgxMy8y
MCwgMTkvMjAgYW5kIDIwLzIwKS4KClRpbS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
