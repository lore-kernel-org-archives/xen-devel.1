From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 6/8] p2m: change write_p2m_entry to
 return an error code
Date: Mon, 18 Feb 2019 04:05:52 -0700
Message-ID: <5C6A91900200007800217873@prv1-mh.provo.novell.com>
References: <20190215141837.1420-1-roger.pau@citrix.com>
 <20190215141837.1420-7-roger.pau@citrix.com>
 <22FE20B9-55D7-4FDA-A9A3-3E318FAD7D57@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xuKF=QZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gvgkM-0006yD-CK
 for xen-devel@lists.xenproject.org; Mon, 18 Feb 2019 11:06:02 +0000
In-Reply-To: <22FE20B9-55D7-4FDA-A9A3-3E318FAD7D57@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAyLjE5IGF0IDE4OjQ4LCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPj4gT24gRmViIDE1LCAyMDE5LCBhdCAyOjE4IFBNLCBSb2dlciBQYXUgTW9ubmUgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPiB3cm90ZToKPj4gQEAgLTMyMSw3ICszMjEsNyBAQCBzdGF0aWMgaW50
IHAybV9wdF9zZXRfcmVjYWxjX3JhbmdlKHN0cnVjdCBwMm1fZG9tYWluICpwMm0sCj4+ICAgICAg
ICAgICAgIGlmICggKGwxZV9nZXRfZmxhZ3MoZSkgJiBfUEFHRV9QUkVTRU5UKSAmJiAhbmVlZHNf
cmVjYWxjKGwxLCBlKSApCj4+ICAgICAgICAgICAgIHsKPj4gICAgICAgICAgICAgICAgIHNldF9y
ZWNhbGMobDEsIGUpOwo+PiAtICAgICAgICAgICAgICAgIHAybS0+d3JpdGVfcDJtX2VudHJ5KHAy
bSwgZmlyc3RfZ2ZuLCBwZW50LCBlLCBsZXZlbCk7Cj4+ICsgICAgICAgICAgICAgICAgQlVHX09O
KHAybS0+d3JpdGVfcDJtX2VudHJ5KHAybSwgZmlyc3RfZ2ZuLCBwZW50LCBlLCBsZXZlbCkpOwo+
PiAgICAgICAgICAgICB9Cj4gCj4gQWdhaW4gaGVyZTsgdGhlb3JldGljYWxseSwgdGhlIG9ubHkg
Y2hhbmdlIGhhcyBiZWVuIHRoYXQgUkVDQUxDX0ZMQUdTIGhhdmUgCj4gYmVlbiBhZGRlZC4KPiAK
PiBBbmQgc28gb24uCj4gCj4gVGhvdWdodHM/ICAoTG9va2luZyBmb3IgaW5wdXQgZnJvbSBKYW4g
aGVyZSBhcyB3ZWxsLikKCkknZCBpbmRlZWQgcHJlZmVyIGEgbW9yZSBmaW5lIGdyYWluZWQgKGp1
c3RpZmllZCBwZXIgaW5zdGFuY2UpIGFwcHJvYWNoCmxpa2UgeW91IHN1Z2dlc3QsIGJ1dCBJIHdh
c24ndCByZWFsbHkgb3Bwb3NlZCB0byBob3cgaXQgd2FzIGRvbmUgc28gZmFyCmFzIGl0IGRpZG4n
dCBzZWVtIGxpa2UgYW55IG9mIHRoZSBCVUdfT04oKS1zIHNob3VsZCBhY3R1YWxseSBiZSBhYmxl
IHRvCnRyaWdnZXIsIGNvbnNpZGVyaW5nIHRoYXQgdGhlcmUgd2FzIG5vIGZhaWx1cmUgcG9zc2li
bGUgdGhlcmUgdGlsbCBub3cuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
