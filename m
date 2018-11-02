From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 14/16] x86: make entry point code build
 when !CONFIG_PV
Date: Fri, 02 Nov 2018 07:45:06 -0600
Message-ID: <5BDC54E202000078001F7416@prv1-mh.provo.novell.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <af9f79239874ca4257e136b74460646d36363650.1539959287.git-series.wei.liu2@citrix.com>
 <5BD7213602000078001F5DF4@prv1-mh.provo.novell.com>
 <20181102130813.362jdoaaz6ravnym@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wbrw=nn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gIZl9-0000S6-OO
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 13:45:11 +0000
In-Reply-To: <20181102130813.362jdoaaz6ravnym@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjExLjE4IGF0IDE0OjA4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBPY3QgMjksIDIwMTggYXQgMDk6MDM6MThBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAxOS4xMC4xOCBhdCAxNjoyOCwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IEBAIC01NDgsMTAgKzU1MCwxNCBAQCBFTlRSWShyZXRfZnJvbV9pbnRyKQo+PiA+
ICAgICAgICAgIEdFVF9DVVJSRU5UKGJ4KQo+PiA+ICAgICAgICAgIHRlc3RiICQzLCBVUkVHU19j
cyglcnNwKQo+PiA+ICAgICAgICAgIGp6ICAgIHJlc3RvcmVfYWxsX3hlbgo+PiA+ICsjaWZkZWYg
Q09ORklHX1BWCj4+ID4gICAgICAgICAgbW92cSAgVkNQVV9kb21haW4oJXJieCksICVyYXgKPj4g
PiAgICAgICAgICBjbXBiICAkMCwgRE9NQUlOX2lzXzMyYml0X3B2KCVyYXgpCj4+ID4gICAgICAg
ICAgamUgICAgdGVzdF9hbGxfZXZlbnRzCj4+ID4gICAgICAgICAgam1wICAgY29tcGF0X3Rlc3Rf
YWxsX2V2ZW50cwo+PiA+ICsjZWxzZQo+PiA+ICsgICAgICAgIEJVRwo+PiA+ICsjZW5kaWYKPj4g
Cj4+IEhtbSwgbm90IHN1cmUgaGVyZSAoYW5kIGVsc2V3aGVyZSk6IEFub3RoZXIgb3B0aW9uIGlz
IHRvCj4+IHN0cmVhbWxpbmUgZXhlY3V0aW9uIGJ5IHJlcGxhY2luZyB0aGUgY29uZGl0aW9uYWwg
YnJhbmNoIHdpdGggYW4KPj4gdW5jb25kaXRpb25hbCBvbmUgaW4gdGhlICFQViBjYXNlLiBBbmRy
ZXcsIGRvIHlvdSBoYXZlIGFueQo+PiB0aG91Z2h0cyBlaXRoZXIgd2F5Pwo+IAo+IE15IG9yaWdp
bmFsIHRob3VnaHQgd2FzIHRvIGNhdGNoIHBvdGVudGlhbCBpc3N1ZXMgaW4gWGVuIGNvZGUgd2hp
Y2gKPiBtZXNzZXMgdXAgd2l0aCB0aGUgcGVybWlzc2lvbiBsZXZlbC4gIFVzaW5nIHVuY29uZGl0
aW9uYWwganVtcCBpcyBmaW5lCj4gYnkgbWUsIHRvby4gQnV0IGluIHRoYXQgY2FzZSBJIHdpbGwg
c2VlayB0byBhdCBsZWFzdCBhZGQgYW4gYXNzZXJ0aW9uCj4gZm9yIGRlYnVnIGJ1aWxkLgoKQXNz
ZXJ0aW9uIGFkZGl0aW9ucyBhcmUgZGVmaW5pdGVseSBmaW5lIHdpdGggbWUuCgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
