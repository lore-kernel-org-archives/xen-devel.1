From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH 1/1] x86/boot: Allocate one extra module
 slot for Xen image placement
Date: Thu, 27 Sep 2018 12:25:40 +0200
Message-ID: <20180927102540.GB4558@olila.i.net-space.pl>
References: <1538042707-31855-1-git-send-email-daniel.kiper@oracle.com>
 <a06c4a79-beec-ec91-f940-d91693ca9121@citrix.com>
 <20180927101020.GA4558@olila.i.net-space.pl>
 <c500fb3e-5b05-7d90-20ad-c1fdeccad6a7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fvyv=mj=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1g5TUS-0001OT-N9
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 10:25:48 +0000
Content-Disposition: inline
In-Reply-To: <c500fb3e-5b05-7d90-20ad-c1fdeccad6a7@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBTZXAgMjcsIDIwMTggYXQgMTE6MTk6MjRBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNy8wOS8xOCAxMToxMCwgRGFuaWVsIEtpcGVyIHdyb3RlOgo+ID4gT24gVGh1
LCBTZXAgMjcsIDIwMTggYXQgMTE6MDY6MjRBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToK
PiA+PiBPbiAyNy8wOS8xOCAxMTowNSwgRGFuaWVsIEtpcGVyIHdyb3RlOgo+ID4+PiBDb21taXQg
OTU4OTkyNyAoeDg2L21iMjogYXZvaWQgWGVuIGltYWdlIHdoZW4gbG9va2luZyBmb3IKPiA+Pj4g
bW9kdWxlL2NyYXNoa2VybmVsIHBvc2l0aW9uKSBmaXhlZCByZWxvY2F0aW9uIGlzc3VlcyBmb3IK
PiA+Pj4gTXVsdGlib290MiBwcm90b2NvbC4gVW5mb3J0dW5hdGVseSBpdCBtaXNzZWQgdG8gYWxs
b2NhdGUKPiA+Pj4gbW9kdWxlIHNsb3QgZm9yIFhlbiBpbWFnZSBwbGFjZW1lbnQgaW4gZWFybHkg
Ym9vdCBwYXRoLgo+ID4+PiBTbywgbGV0J3MgZml4IGl0IHJpZ2h0IG5vdy4KPiA+Pj4KPiA+Pj4g
UmVwb3J0ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPj4+IFNpZ25lZC1v
ZmYtYnk6IERhbmllbCBLaXBlciA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+Cj4gPj4gQWNrZWQt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gPiBXb3chISEg
VGhlIHF1aWNrZXN0IHJldmlldyB3aGljaCBJIGhhdmUgZ290IGV2ZXIhIExlc3MgdGhhbiAyIG1p
bnMuLi4gOi0pKSkKPgo+IE9idmlvdXMgcGF0Y2ggaXMgb2J2aW91cy7CoCBObyBwb2ludCBsZXR0
aW5nIGl0IGxhbmd1aXNoLgoKWWVwLCB0aG91Z2ggZXZlbiBpbiB0aGF0IGNhc2UgaXQgY291bnRz
Li4uCgpEYW5pZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
