From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v5 3/5] p2m: change write_p2m_entry to
 return an error code
Date: Thu, 21 Feb 2019 17:04:41 +0000
Message-ID: <20190221170441.q33bdzv7dxw3ofx7@zion.uk.xensource.com>
References: <20190221165041.39394-1-roger.pau@citrix.com>
 <20190221165041.39394-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y0vM=Q4=citrix.com=prvs=948a3d738=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gwrn7-0007Xe-Ct
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 17:05:45 +0000
Content-Disposition: inline
In-Reply-To: <20190221165041.39394-4-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMjEsIDIwMTkgYXQgMDU6NTA6MzlQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgpbLi4uXQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLXB0LmMgYi94
ZW4vYXJjaC94ODYvbW0vcDJtLXB0LmMKPiBpbmRleCAwNGU5ZDgxY2Y2Li4yNTRjNWRmZDE5IDEw
MDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0tcHQuYwo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9tbS9wMm0tcHQuYwo+IEBAIC0xODQsNiArMTg0LDggQEAgcDJtX25leHRfbGV2ZWwoc3RydWN0
IHAybV9kb21haW4gKnAybSwgdm9pZCAqKnRhYmxlLAo+ICAgICAgbDFfcGdlbnRyeV90ICpwMm1f
ZW50cnksIG5ld19lbnRyeTsKPiAgICAgIHZvaWQgKm5leHQ7Cj4gICAgICB1bnNpZ25lZCBpbnQg
ZmxhZ3M7Cj4gKyAgICBpbnQgcmM7CgpTaG91bGRuJ3QgcmMgYmUgaW5pdGlhbGlzZWQgdG8gMCBo
ZXJlPyBUaGVyZSBzZWVtcyB0byBiZSBhIHBhdGggd2hpY2gKY2FuIGxlYXZlIHJjIHVuaW5pdGlh
bGlzZWQgd2l0aG91dCBjYWxsaW5nIHdyaXRlX3AybV9lbnRyeS4KCldlaS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
