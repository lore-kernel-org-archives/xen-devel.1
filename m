From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/2] x86/dom0: take alignment into
 account when populating p2m in PVH mode
Date: Fri, 4 Jan 2019 16:16:25 +0100
Message-ID: <20190104151625.66oyamzmt2rroqnl@mac.bytemobile.com>
References: <20181228111857.49444-1-roger.pau@citrix.com>
 <20181228111857.49444-2-roger.pau@citrix.com>
 <5C2F70DB020000780020A3EC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CPMs=PM=citrix.com=prvs=9008e7f41=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gfRD9-0006jy-H9
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 15:16:35 +0000
Content-Disposition: inline
In-Reply-To: <5C2F70DB020000780020A3EC@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMDQsIDIwMTkgYXQgMDc6NDI6MzVBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI4LjEyLjE4IGF0IDEyOjE4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMKPiA+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCj4gPiBAQCAtOTEsMTYgKzkxLDU0IEBAIHN0YXRp
YyBpbnQgX19pbml0IHB2aF9wb3B1bGF0ZV9tZW1vcnlfcmFuZ2Uoc3RydWN0IGRvbWFpbiAqZCwK
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGxvbmcgc3RhcnQsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIG5yX3BhZ2VzKQo+ID4gIHsKPiA+IC0gICAgdW5zaWduZWQgaW50
IG9yZGVyID0gTUFYX09SREVSLCBpID0gMDsKPiA+ICsgICAgc3RydWN0IHsKPiA+ICsgICAgICAg
IHVuc2lnbmVkIGxvbmcgYWxpZ247Cj4gCj4gSXQncyAuaW5pdC4qIGRhdGEgb25seSwgYnV0IGFu
eXdheSAtIHdoeSAibG9uZyIgaW5zdGVhZCBvZiAiaW50Ij8KCkEgbWlzdGFrZSwgdW5zaWduZWQg
aW50IGlzIGZpbmUgdG8gc3RvcmUgdGhlIGN1cnJlbnQgYWxpZ25tZW50cywgd2lsbApzZW5kIGEg
cGF0Y2ggdG8gZml4IGl0LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
