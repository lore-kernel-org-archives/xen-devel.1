From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 0/4] block/xen_disk: legacy code removal and
 cleanup
Date: Wed, 2 May 2018 16:58:16 +0100
Message-ID: <20180502155816.GD14376__16134.4050466598$1525276633$gmane$org@perard>
References: <1525089699-13411-1-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=s6pm=hv=citrix.com=prvs=653480f21=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fDu97-0003oP-G4
 for xen-devel@lists.xenproject.org; Wed, 02 May 2018 15:58:21 +0000
Content-Disposition: inline
In-Reply-To: <1525089699-13411-1-git-send-email-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMzAsIDIwMTggYXQgMDE6MDE6MzVQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoZSBncmFudCBjb3B5IG9wZXJhdGlvbiB3YXMgYWRkZWQgdG8gbGlieGVuZ250dGFi
IGluIFhlbiA0LjguMCAocmVsZWFzZWQKPiBuZWFybHkgMTggbW9udGhzIGFnbykgYnV0IHRoZSB4
ZW5fZGlzayBQViBiYWNrZW5kIFFFTVUgaXMgc3RpbGwgY2FycnlpbmcKPiBhIHNpZ25pZmljYW50
IGFtb3VudCBvZiBjb2RlIHB1cmVseSB0byByZW1haW4gY29tcGF0aWJsZSB3aXRoIG9sZGVyCj4g
dmVyc2lvbnMgb2YgWGVuLgo+IAo+IEFzIGNhbiBiZSBpbmZlcnJlZCBmcm9tIHRoZSBkaWZmIHN0
YXRzIGJlbG93LCByZW1vdmluZyB0aGlzIHN1cHBvcnQgZm9yCj4gb2xkZXIgdmVyc2lvbnMgb2Yg
WGVuIGZyb20gUUVNVSByZWR1Y2VzIHRoZSBzaXplIG9mIHRoZSB4ZW5fZGlzayBzb3VyY2UgYnkK
PiBtb3JlIHRoYW4gMzUwIGxpbmVzICh+MjUlKS4gVGhlIG1ham9yaXR5IG9mIHRoaXMgaXMgZG9u
ZSBpbiBwYXRjaGVzICMxCj4gYW5kICMyLiBGdXJ0aGVyIHNpbXBsaWZpY2F0aW9ucyBhcmUgbWFk
ZSBpbiBwYXRjaCAjMyBhbmQgdGhlbiBzb21lIGNvc21ldGljCj4gd29yayBpcyBkb25lIGluIHBh
dGNoICM0LgoKRklZLCBJIGRvbid0IGxpa2UgdGhpcyBwYXRjaCBzZXJpZXMuIFdlJ3ZlIGJlZW4g
Y2hlY2tpbmcgdGhhdCBRRU1VCmJ1aWxkcyBhZ2FpbnN0IG9sZGVyIHZlcnNpb24uIEkndmUgY2hl
Y2sgdGhhdCBpdCBidWlsZHMgYWdhaW5zdCA0LjUgYW5kCm5ld2VyLgoKQWxzbyB0aGUgZmFjdCB0
aGF0IEZyZWVCU0QgZG9lc24ndCBoYXZlIHN1cHBvcnQgZm9yIGdyYW50IGNvcHkgcHJvYmFibHkK
bWVhbiB0aGF0IGl0IGlzIHRvbyBzb29uIHRvIHJlbW92ZSB0aGUgY29tcGF0aWJpbGl0eSBjb2Rl
IGZyb20gcWVtdS4KClJlZ2FyZHMsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
