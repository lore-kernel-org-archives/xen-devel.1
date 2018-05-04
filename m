From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v9 3/9] xen/x86: support per-domain flag for
 xpti
Date: Fri, 4 May 2018 16:06:50 +0100
Message-ID: <20180504150650.bokic7isgpb7h2ht@citrix.com>
References: <20180426113318.21838-1-jgross@suse.com>
 <20180426113318.21838-4-jgross@suse.com> <1524815725.3304.2.camel@citrix.com>
 <a210abb4-e0d7-9b21-dff5-4e86bc234d8b@suse.com>
 <5AE2DC1D02000078001BF07D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lzaf=hx=citrix.com=prvs=6550d3289=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fEcIP-0005aV-Pc
 for xen-devel@lists.xenproject.org; Fri, 04 May 2018 15:06:53 +0000
Content-Disposition: inline
In-Reply-To: <5AE2DC1D02000078001BF07D@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBcHIgMjcsIDIwMTggYXQgMDI6MTU6MjVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI3LjA0LjE4IGF0IDA5OjU5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToK
PiA+IE9uIDI3LzA0LzE4IDA5OjU1LCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+ID4+IE9uIFRodSwg
MjAxOC0wNC0yNiBhdCAxMzozMyArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiA+Pj4gaW5k
ZXggYjM1MzM1MmFkZi4uMjIwZDFiYTAyMCAxMDA2NDQKPiA+Pj4gLS0tIGEvZG9jcy9taXNjL3hl
bi1jb21tYW5kLWxpbmUubWFya2Rvd24KPiA+Pj4gKysrIGIvZG9jcy9taXNjL3hlbi1jb21tYW5k
LWxpbmUubWFya2Rvd24KPiA+Pj4gQEAgLTE5NTUsMTQgKzE5NTUsMjQgQEAgY2x1c3RlcmVkIG1v
ZGUuICBUaGUgZGVmYXVsdCwgZ2l2ZW4gbm8gaGludCBmcm9tIHRoZSAqKkZBRFQqKiwgaXMgY2x1
c3Rlcgo+ID4+PiAgbW9kZS4KPiA+Pj4gIAo+ID4+PiAgIyMjIHhwdGkKPiA+Pj4gLT4gYD0gPGJv
b2xlYW4+YAo+ID4+PiArPiBgPSBMaXN0IG9mIFsgZGVmYXVsdCB8IDxib29sZWFuPiB8IGRvbTA9
PGJvb2w+IHwgZG9tdT08Ym9vbD4gXWAKPiA+Pj4gIAo+ID4+PiAtPiBEZWZhdWx0OiBgZmFsc2Vg
IG9uIEFNRCBoYXJkd2FyZQo+ID4+PiArPiBEZWZhdWx0OiBgZmFsc2VgIG9uIGhhcmR3YXJlIG5v
dCB0byBiZSB2dWxuZXJhYmxlIHRvIE1lbHRkb3duIChlLmcuIEFNRCkKPiA+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAga25vd24KPiA+IAo+ID4gWWVzLCBpbmRlZWQuCj4gCj4gUmVjb3JkZWQgZm9yIGV2ZW50
dWFsIGFwcGxpY2F0aW9uIG9mIHRoZSBzZXJpZXM7IG5vIG5lZWQgdG8gcmVzZW5kIGp1c3QgZm9y
IHRoaXMuCgpPb3BzLCBJIG1pc3NlZCB0aGlzIHdoaWxlIGZpeGluZyB1cCB0aGUgY29uZmxpY3Rz
LiAKCkkgd2lsbCBzdWJtaXQgYSBwYXRjaCB0byBmaXggdGhpcy4KCldlaS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
