From: Tim Deegan <tim@xen.org>
Subject: Re: [PATCH 5/3] x86/shadow: emulate_gva_to_mfn() should
 respect p2m_ioreq_server
Date: Wed, 14 Nov 2018 12:41:50 +0000
Message-ID: <20181114124150.GC25646@deinos.phlegethon.org>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
 <5BEAABA302000078001FB62E@prv1-mh.provo.novell.com>
 <dc11f02ac58c4834899caa1faca021e6@AMSPEX02CL03.citrite.net>
 <5BEAB3E802000078001FB6A8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=g2e8=nz=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1gMuUX-0002zs-IJ
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 12:41:57 +0000
Content-Disposition: inline
In-Reply-To: <5BEAB3E802000078001FB6A8@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

QXQgMDQ6MjIgLTA3MDAgb24gMTMgTm92ICgxNTQyMDgyOTM2KSwgSmFuIEJldWxpY2ggd3JvdGU6
Cj4gPj4+IE9uIDEzLjExLjE4IGF0IDExOjU5LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4+IFN1YmplY3Q6IFtQQVRDSCA1LzNdIHg4Ni9zaGFkb3c6IGVtdWxhdGVfZ3ZhX3Rv
X21mbigpIHNob3VsZCByZXNwZWN0Cj4gPj4gcDJtX2lvcmVxX3NlcnZlcgo+ID4+IAo+ID4+IFdy
aXRlcyB0byBzdWNoIHBhZ2VzIHdvdWxkIG5lZWQgdG8gYmUgaGFuZGVkIHRvIHRoZSBlbXVsYXRv
ciwgd2hpY2ggd2UncmUKPiA+PiBub3QgcHJlcGFyZWQgdG8gZG8gYXQgdGhpcyBwb2ludC4KPiA+
PiAKPiA+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4g
Pj4gCj4gPj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3NoYWRvdy9odm0uYwo+ID4+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9tbS9zaGFkb3cvaHZtLmMKPiA+PiBAQCAtMzM4LDcgKzMzOCw3IEBAIHN0YXRp
YyBtZm5fdCBlbXVsYXRlX2d2YV90b19tZm4oc3RydWN0IHYKPiA+PiAgICAgIHsKPiA+PiAgICAg
ICAgICByZXR1cm4gX21mbihCQURfR0ZOX1RPX01GTik7Cj4gPj4gICAgICB9Cj4gPj4gLSAgICBp
ZiAoIHAybV9pc19kaXNjYXJkX3dyaXRlKHAybXQpICkKPiA+PiArICAgIGlmICggcDJtX2lzX2Rp
c2NhcmRfd3JpdGUocDJtdCkgfHwgcDJtdCA9PSBwMm1faW9yZXFfc2VydmVyICkKPiA+PiAgICAg
IHsKPiA+PiAgICAgICAgICBwdXRfcGFnZShwYWdlKTsKPiA+PiAgICAgICAgICByZXR1cm4gX21m
bihSRUFET05MWV9HRk4pOwo+ID4gCj4gPiBJcyB0aGlzIHdoYXQgd2Ugd2FudCBoZXJlPyBJIHdv
dWxkIGhhdmUgdGhvdWdodCB3ZSB3YW50IHRvIHJldHVybiAKPiA+IEJBRF9HRk5fVE9fTUZOIGlu
IHRoZSBwMm1faW9yZXFfc2VydmVyIGNhc2Ugc28gdGhhdCB0aGUgY2FsbGVyIHRyZWF0cyB0aGlz
IGluIAo+ID4gdGhlIHNhbWUgd2F5IGl0IHdvdWxkIE1NSU8uCj4gCj4gSSdtIG5vdCBzdXJlIHdo
aWNoIGJlaGF2aW9yIGlzIGJldHRlcjsgSSdtIGNlcnRhaW5seSBmaW5lIHdpdGggc3dpdGNoaW5n
Cj4gYXMgeW91IHNheSwgYnV0IEknZCBmaXJzdCBsaWtlIHRvIHNlZSBUaW0ncyBvcGluaW9uIGFz
IHdlbGwuCgpJJ20gbm90IGNsZWFyIG9uIHdoYXQgYmVoYXZpb3VyIHlvdSB3YW50IGZvciB0aGlz
IGtpbmQgb2YgcGFnZSBpbgpnZW5lcmFsIC0tIEkgc3VzcGVjdCBJIGhhdmUgbWlzc2VkIG9yIGZv
cmdvdHRlbiBzb21lIGNvbnRleHQuICBJZiB0aGUKZ3Vlc3QncyBub3Qgc3VwcG9zZWQgdG8gd3Jp
dGUgdG8gaXQsIHRoZW4gSU1PIHlvdSBzaG91bGQgYWRkIGl0IHRvClAyTV9ESVNDQVJEX1dSSVRF
X1RZUEVTIHJhdGhlciB0aGFuIHNwZWNpYWwtY2FzaW5nIGl0IGhlcmUuCgpDaGVlcnMsCgpUaW0u
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
