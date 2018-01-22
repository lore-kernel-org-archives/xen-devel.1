From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/6] x86: make CPU state flush requests
	explicit
Date: Mon, 22 Jan 2018 09:32:35 +0000
Message-ID: <e922c002-0fbc-41d3-58a2-ae3c66458f46@citrix.com>
References: <5A62238B02000078001A0768@prv-mh.provo.novell.com>
 <5A6224F502000078001A078B@prv-mh.provo.novell.com>
 <a84b24c8-2973-e0f2-d543-8698971db4b3@citrix.com>
 <5A65BD8802000078001A0EEF@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zvfe=er=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1edYT1-0002ih-N1
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 09:32:39 +0000
In-Reply-To: <5A65BD8802000078001A0EEF@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDEvMjAxOCAwOTozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTkuMDEuMTgg
YXQgMTg6NDAsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMTkvMDEv
MTggMTY6MDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4
Ni9mbHVzaHRsYi5oCj4+PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2ZsdXNodGxiLmgKPj4+
IEBAIC0xMDEsNiArMTAxLDggQEAgdm9pZCB3cml0ZV9jcjModW5zaWduZWQgbG9uZyBjcjMpOwo+
Pj4gICNkZWZpbmUgRkxVU0hfQ0FDSEUgICAgICAweDQwMAo+Pj4gICAvKiBWQSBmb3IgdGhlIGZs
dXNoIGhhcyBhIHZhbGlkIG1hcHBpbmcgKi8KPj4+ICAjZGVmaW5lIEZMVVNIX1ZBX1ZBTElEICAg
MHg4MDAKPj4+ICsgLyogRmx1c2ggQ1BVIHN0YXRlICovCj4+PiArI2RlZmluZSBGTFVTSF9TVEFU
RSAgICAgIDB4MTAwMAo+PiBTVEFURSBjb3VsZCBsZWdpdGltYXRlbHkgZGVzY3JpYmUgYW55IG9m
IHRoZSBvdGhlciBGTFVTSCBmbGFncy4gCj4+IEZMVVNIX1ZDUFVfU1RBVEUgPwo+IEZpbmUgYnkg
bWUuCgpJbiB3aGljaCBjYXNlLCBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
