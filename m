From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 4/9] x86: patch ctxt_switch_masking()
 indirect call to direct one
Date: Fri, 21 Sep 2018 11:51:13 +0100
Message-ID: <20180921105113.seqbtofruqi33vsb@zion.uk.xensource.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5B97C45702000078001E7485@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4pl1=md=citrix.com=prvs=7953d62ed=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g3J1p-0005Lx-HS
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 10:51:17 +0000
Content-Disposition: inline
In-Reply-To: <5B97C45702000078001E7485@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMTEsIDIwMTggYXQgMDc6MzQ6MTVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2
aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cgo+IC0tLQo+IHYyOiBEcm9w
IG9wZW4tY29kZWQgbnVtYmVyIGZyb20gbWFjcm8gaW52b2NhdGlvbi4KPiAKPiAtLS0gYS94ZW4v
YXJjaC94ODYvY3B1L2NvbW1vbi5jCj4gKysrIGIveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYwo+
IEBAIC0xODQsNyArMTg0LDcgQEAgdm9pZCBjdHh0X3N3aXRjaF9sZXZlbGxpbmcoY29uc3Qgc3Ry
dWN0Cj4gIAl9Cj4gIAo+ICAJaWYgKGN0eHRfc3dpdGNoX21hc2tpbmcpCj4gLQkJY3R4dF9zd2l0
Y2hfbWFza2luZyhuZXh0KTsKPiArCQlhbHRlcm5hdGl2ZV92Y2FsbChjdHh0X3N3aXRjaF9tYXNr
aW5nLCBuZXh0KTsKPiAgfQo+ICAKPiAgYm9vbF90IG9wdF9jcHVfaW5mbzsKPiAKPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
