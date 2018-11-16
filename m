From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 1/5] vpci: fix updating the command
 register
Date: Fri, 16 Nov 2018 15:32:45 +0100
Message-ID: <20181116143245.vpk3vgpbcqujvofb@mac>
References: <20181114115740.1050-1-roger.pau@citrix.com>
 <20181114115740.1050-2-roger.pau@citrix.com>
 <5BEEB15D02000078001FCB9A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=f3fv=n3=citrix.com=prvs=8510c96a3=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gNfB0-0005jq-AA
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 14:32:54 +0000
Content-Disposition: inline
In-Reply-To: <5BEEB15D02000078001FCB9A@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMTYsIDIwMTggYXQgMDU6MDA6MjlBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE0LjExLjE4IGF0IDEyOjU3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gQEAgLTQxMyw3ICs0MTIsNyBAQCBzdGF0aWMgdm9pZCByb21fd3JpdGUoY29uc3Qg
c3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsCj4gPiAgICAgICAgICBoZWFk
ZXItPnJvbV9lbmFibGVkID0gbmV3X2VuYWJsZWQ7Cj4gPiAgICAgICAgICBwY2lfY29uZl93cml0
ZTMyKHBkZXYtPnNlZywgcGRldi0+YnVzLCBzbG90LCBmdW5jLCByZWcsIHZhbCk7Cj4gPiAgICAg
IH0KPiA+IC0gICAgZWxzZSBpZiAoIG1vZGlmeV9iYXJzKHBkZXYsIG5ld19lbmFibGVkLCB0cnVl
KSApCj4gPiArICAgIGVsc2UgaWYgKCBtb2RpZnlfYmFycyhwZGV2LCBuZXdfZW5hYmxlZCA/IFBD
SV9DT01NQU5EX01FTU9SWSA6IDAsIHRydWUpICkKPiAKPiBEbyB5b3UgcmVhbGx5IG1lYW4gdG8g
Y2xlYXIgYWxsIG90aGVyIGRlZmluZWQgYml0cyBvZiB0aGUgY29tbWFuZAo+IHJlZ2lzdGVyIGhl
cmU/CgpUaGlzIGlzIGEgUk9NIEJBUiB3cml0ZSwgbm90IGEgY29tbWFuZCByZWdpc3RlciB3cml0
ZS4gcm9tX3dyaXRlCnBhc3NlcyBQQ0lfQ09NTUFORF9NRU1PUlkgbWVyZWx5IHRvIHNpZ25hbCB0
aGlzIGlzIGEgbWFwcGluZwpvcGVyYXRpb24sIGJ1dCB0aGUgdmFsdWUgd291bGQgbmV2ZXIgYmUg
d3JpdHRlbiB0byB0aGUgY29tbWFuZApyZWdpc3RlciwgdGhlcmUncyBhbiBBU1NFUlQoIXJvbV9v
bmx5KSBqdXN0IGJlZm9yZSB0aGUgZGVmZXJyZWQgd3JpdGUKb2YgdGhlIGNvbW1hbmQgcmVnaXN0
ZXIgaW4gbW9kaWZ5X2RlY29kaW5nLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
