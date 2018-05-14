From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 4/5] libxc/pvh: set default MTRR type to
 write-back
Date: Mon, 14 May 2018 17:00:51 +0100
Message-ID: <20180514160051.uf3idifgc4n6p7wl@citrix.com>
References: <20180510171505.37309-1-roger.pau@citrix.com>
 <20180510171505.37309-5-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zpky=ib=citrix.com=prvs=66564b2c0=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fIFuB-0004qY-JF
 for xen-devel@lists.xenproject.org; Mon, 14 May 2018 16:00:55 +0000
Content-Disposition: inline
In-Reply-To: <20180510171505.37309-5-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMTAsIDIwMTggYXQgMDY6MTU6MDRQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IEBAIC0xMDE0LDYgKzEwMzQsMzAgQEAgc3RhdGljIGludCB2Y3B1X2h2bShzdHJ1
Y3QgeGNfZG9tX2ltYWdlICpkb20pCj4gICAgICBpZiAoIGRvbS0+c3RhcnRfaW5mb19zZWcucGZu
ICkKPiAgICAgICAgICBic3BfY3R4LmNwdS5yYnggPSBkb20tPnN0YXJ0X2luZm9fc2VnLnBmbiA8
PCBQQUdFX1NISUZUOwo+ICAKPiArICAgIC8qIFNldCB0aGUgTVRSUi4gKi8KPiArICAgIGJzcF9j
dHgubXRycl9kLnR5cGVjb2RlID0gSFZNX1NBVkVfQ09ERShNVFJSKTsKPiArICAgIGJzcF9jdHgu
bXRycl9kLmluc3RhbmNlID0gMDsKPiArICAgIGJzcF9jdHgubXRycl9kLmxlbmd0aCA9IEhWTV9T
QVZFX0xFTkdUSChNVFJSKTsKPiArCj4gKyAgICBtdHJyX3JlY29yZCA9IGh2bV9nZXRfc2F2ZV9y
ZWNvcmQoZnVsbF9jdHgsIEhWTV9TQVZFX0NPREUoTVRSUiksIDApOwo+ICsgICAgaWYgKCAhbXRy
cl9yZWNvcmQgKQo+ICsgICAgewo+ICsgICAgICAgIHhjX2RvbV9wYW5pYyhkb20tPnhjaCwgWENf
SU5URVJOQUxfRVJST1IsCj4gKyAgICAgICAgICAgICAgICAgICAgICIlczogdW5hYmxlIHRvIGdl
dCBNVFJSIHNhdmUgcmVjb3JkIiwgX19mdW5jX18pOwo+ICsgICAgICAgIGdvdG8gb3V0Owo+ICsg
ICAgfQoKV2lsbCB0aGlzIGJyZWFrIGNyb3NzIHZlcnNpb24gbWlncmF0aW9uIHdoZW4gdGhlIG9s
ZGVyIGh5cGVydmlzb3IKZG9lc24ndCBoYXZlIHN1Y2ggcmVjb3JkPwoKV2VpLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
