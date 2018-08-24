From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Backport request -
 3a2b8525b883baa87fe89b3da58f5c09fa599b99 to staging-4.9
Date: Fri, 24 Aug 2018 09:46:18 +0100
Message-ID: <20180824084618.ejprzlpogibbqdn4@citrix.com>
References: <4ef3af75faaf88e164744c7007947590@crc.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n8yf=lh=citrix.com=prvs=76773b150=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ft7jb-00063T-4h
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 08:46:23 +0000
Content-Disposition: inline
In-Reply-To: <4ef3af75faaf88e164744c7007947590@crc.id.au>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Steven Haigh <netwiz@crc.id.au>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q0MgSWFuCgpPbiBGcmksIEF1ZyAyNCwgMjAxOCBhdCAxMjozMjo1N1BNICsxMDAwLCBTdGV2ZW4g
SGFpZ2ggd3JvdGU6Cj4gQ29tbWl0Ogo+IGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9w
PXhlbi5naXQ7YT1jb21taXQ7aD0zYTJiODUyNWI4ODNiYWE4N2ZlODliM2RhNThmNWMwOWZhNTk5
Yjk5Cj4gCj4gSSd2ZSBhbHNvIHJ1biBhY3Jvc3MgdGhpcyBidWlsZGluZyB0aGUgc3RhZ2luZy00
LjkgYnJhbmNoIG9uIFJIRUw3Lgo+IAo+IEJ1aWxkIGVycm9ycyB3aXRoOgo+IGdjYyAgLW02NCAt
REJVSUxEX0lEIC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1zdGQ9Z251OTkgLVdhbGwKPiAtV3N0cmlj
dC1wcm90b3R5cGVzIC1XZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVtZW50Cj4gLVduby11bnVzZWQt
YnV0LXNldC12YXJpYWJsZSAtV25vLXVudXNlZC1sb2NhbC10eXBlZGVmcyAgIC1PMgo+IC1mb21p
dC1mcmFtZS1wb2ludGVyCj4gLURfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fPV9fWEVOX0xBVEVT
VF9JTlRFUkZBQ0VfVkVSU0lPTl9fIC1NTUQgLU1GCj4gLnhzLXRlc3Quby5kIC1EX0xBUkdFRklM
RV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFICAgLVdlcnJvcgo+IC1JL2J1aWxkZGlyL2J1
aWxkL0JVSUxEL3Rvb2xzL3Rlc3RzL3hlbnN0b3JlLy4uLy4uLy4uL3Rvb2xzL3hlbnN0b3JlL2lu
Y2x1ZGUKPiAtSS9idWlsZGRpci9idWlsZC9CVUlMRC90b29scy90ZXN0cy94ZW5zdG9yZS8uLi8u
Li8uLi90b29scy9pbmNsdWRlICAtYyAtbwo+IHhzLXRlc3QubyB4cy10ZXN0LmMKPiBCVUlMRFNU
REVSUjogeHMtdGVzdC5jOiBJbiBmdW5jdGlvbiAnY2FsbF90ZXN0JzoKPiBCVUlMRFNUREVSUjog
eHMtdGVzdC5jOjExMTo4OiBlcnJvcjogJ3JldCcgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCBp
biB0aGlzCj4gZnVuY3Rpb24gWy1XZXJyb3I9bWF5YmUtdW5pbml0aWFsaXplZF0KPiBCVUlMRFNU
REVSUjogICAgICBpZiAoIHJldCApCj4gQlVJTERTVERFUlI6ICAgICAgICAgXgo+IAo+IC0tIAo+
IFN0ZXZlbiBIYWlnaAo+IAo+ID8gbmV0d2l6QGNyYy5pZC5hdSAgICAgPyBodHRwOi8vd3d3LmNy
Yy5pZC5hdQo+ID8gKzYxICgzKSA5MDAxIDYwOTAgICAgPyAwNDEyIDkzNSA4OTcKPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
