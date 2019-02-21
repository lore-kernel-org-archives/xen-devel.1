From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v5 4/5] x86/mm: handle foreign mappings in
 p2m_entry_modify
Date: Thu, 21 Feb 2019 17:09:08 +0000
Message-ID: <20190221170908.qpjrpabnlzpviwbx@zion.uk.xensource.com>
References: <20190221165041.39394-1-roger.pau@citrix.com>
 <20190221165041.39394-5-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y0vM=Q4=citrix.com=prvs=948a3d738=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gwrqS-0007ol-Rz
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 17:09:12 +0000
Content-Disposition: inline
In-Reply-To: <20190221165041.39394-5-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMjEsIDIwMTkgYXQgMDU6NTA6NDBQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+ICAKPiAgc3RhdGljIHZvaWQgZXB0X3AybV90eXBlX3RvX2ZsYWdzKHN0cnVjdCBw
Mm1fZG9tYWluICpwMm0sIGVwdF9lbnRyeV90ICplbnRyeSwKPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L21tL3AybS1wdC5jIGIveGVuL2FyY2gveDg2L21tL3AybS1wdC5jCj4gaW5kZXggMjU0
YzVkZmQxOS4uN2Y5NGZkYjZhMyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLXB0
LmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLXB0LmMKPiBAQCAtMTg0LDcgKzE4NCw3IEBA
IHAybV9uZXh0X2xldmVsKHN0cnVjdCBwMm1fZG9tYWluICpwMm0sIHZvaWQgKip0YWJsZSwKPiAg
ICAgIGwxX3BnZW50cnlfdCAqcDJtX2VudHJ5LCBuZXdfZW50cnk7Cj4gICAgICB2b2lkICpuZXh0
Owo+ICAgICAgdW5zaWduZWQgaW50IGZsYWdzOwo+IC0gICAgaW50IHJjOwo+ICsgICAgaW50IHJj
ID0gMDsKCk9oIGhlcmUgaXQgaXMuIEl0IHNob3VsZCBiZSBtb3ZlZCB0byBwcmV2aW91cyBwYXRj
aC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
