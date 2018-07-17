From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/2] x86/HPET: adjustments to constants and
 their use
Date: Tue, 17 Jul 2018 11:12:41 +0200
Message-ID: <20180717091241.76pqzqabw2y656nt@mac.bytemobile.com>
References: <5B4DA67502000078001D4B70@prv1-mh.provo.novell.com>
 <5B4DAA5C02000078001D4B81@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jnja=kb=citrix.com=prvs=72919e7bd=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ffM2Z-0007CX-SX
 for xen-devel@lists.xenproject.org; Tue, 17 Jul 2018 09:13:03 +0000
Content-Disposition: inline
In-Reply-To: <5B4DAA5C02000078001D4B81@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMTcsIDIwMTggYXQgMDI6MzU6NDBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gRHJvcCBIUEVUX1ROX1JPVVRFX1NISUZUIGFzIHJlZHVuZGFudCB3aXRoIEhQRVRfVE5f
Uk9VVEUuCj4gCj4gSW50cm9kdWNlIEhQRVRfVE5fSU5UX1JPVVRFX0NBUCBwYXJhbGxlbGluZyB0
aGUgb3RoZXIgSFBFVF9UTl8qX0NBUAo+IGNvbnN0YW50cywgbWFraW5nIGl0IG5lY2Vzc2FyeSB0
byByZW5hbWUgdGhlIHN1Y2ggbmFtZWQgY29uc3RhbnQgaW4KPiBodm0vaHBldC5jLiBVc2UgTUFT
S19FWFRSKCkgLyBNQVNLX0lOU1IoKSBpbnN0ZWFkIG9mIGtpbmQgb2Ygb3Blbi0KPiBjb2Rpbmcg
dGhlbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cgo+
IAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHBldC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2
bS9ocGV0LmMKPiBAQCAtNDEsMTQgKzQxLDggQEAKPiAgI2RlZmluZSBndWVzdF90aW1lX2hwZXQo
aHBldCkgXAo+ICAgICAgKGh2bV9nZXRfZ3Vlc3RfdGltZSh2aHBldF92Y3B1KGhwZXQpKSAvIFNU
SU1FX1BFUl9IUEVUX1RJQ0spCj4gIAo+IC0jZGVmaW5lIEhQRVRfVE5fSU5UX1JPVVRFX0NBUF9T
SElGVCAzMgo+IC0KPiAgLyogY2FuIGJlIHJvdXRlZCB0byBJT0FQSUMucmVkaXJlY3RfdGFibGVb
MjMuLjIwXSAqLwo+IC0jZGVmaW5lIEhQRVRfVE5fSU5UX1JPVVRFX0NBUCAgICAgICgweDAwZjAw
MDAwVUxMIFwKPiAtICAgICAgICAgICAgICAgICAgICA8PCBIUEVUX1ROX0lOVF9ST1VURV9DQVBf
U0hJRlQpCj4gLQo+IC0jZGVmaW5lIEhQRVRfVE5fSU5UX1JPVVRFX0NBUF9NQVNLICgweGZmZmZm
ZmZmVUxMIFwKPiAtICAgICAgICAgICAgICAgICAgICA8PCBIUEVUX1ROX0lOVF9ST1VURV9DQVBf
U0hJRlQpCj4gKyNkZWZpbmUgSFBFVF9UTl9JTlRfUk9VVEVfQ0FQX1ZBTCBNQVNLX0lOU1IoMHgw
MGYwMDAwMCwgSFBFVF9UTl9JTlRfUk9VVEVfQ0FQKQoKSSBtaWdodCBiZSBjbGVhcmVyIHRvIGRl
ZmluZSB0aGlzIGFzOgooMSA8PCAyMCB8IDEgPDwgMjEgfCAxIDw8IDIyIHwgMSA8PCAyMykKYnV0
IGl0J3MgYWxzbyBxdWl0ZSBjdW1iZXJzb21lLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
