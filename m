From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v6 1/9] xen/evtchn: block
 speculative out-of-bound accesses
Date: Tue, 12 Feb 2019 06:08:52 -0700
Message-ID: <5C62C5640200007800215E66@prv1-mh.provo.novell.com>
References: <1c2b8322-1b66-ccc6-9ba9-e86eafb0227a@amazon.de>
 <1549633489-12724-1-git-send-email-nmanthey@amazon.de>
 <1549633489-12724-2-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <0101E7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <5C532AC00200007800212EA2@prv1-mh.provo.novell.com>
 <A18FF6C80200006BB1E090C7@prv1-mh.provo.novell.com>
 <01CCAAAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <01CCEAAF02000039B1E090C7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gtXo2-00071p-Ue
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 13:08:58 +0000
In-Reply-To: <01CCEAAF02000039B1E090C7@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjAyLjE5IGF0IDE0OjQ0LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBA
QCAtODEzLDYgKzgxNywxMyBAQCBpbnQgc2V0X2dsb2JhbF92aXJxX2hhbmRsZXIoc3RydWN0IGRv
bWFpbiAqZCwgdWludDMyX3QgdmlycSkKPiAgCj4gICAgICBpZiAodmlycSA+PSBOUl9WSVJRUykK
PiAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArCj4gKyAgIC8qCj4gKyAgICAqIE1ha2Ugc3Vy
ZSB0aGUgZ3Vlc3QgY29udHJvbGxlZCB2YWx1ZSB2aXJxIGlzIGJvdW5kZWQgZXZlbiBkdXJpbmcK
PiArICAgICogc3BlY3VsYXRpdmUgZXhlY3V0aW9uLgo+ICsgICAgKi8KPiArICAgIHZpcnEgPSBh
cnJheV9pbmRleF9ub3NwZWModmlycSwgQVJSQVlfU0laRShnbG9iYWxfdmlycV9oYW5kbGVycykp
Owo+ICsKPiAgICAgIGlmICghdmlycV9pc19nbG9iYWwodmlycSkpCj4gICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7CgpEaWRuJ3Qgd2UgYWdyZWUgZWFybGllciBvbiB0aGF0IHRoaXMgYWRkaXRpb24g
aXMgcG9pbnRsZXNzLCBhcyB0aGUgb25seQpjYWxsZXIgaXMgdGhlIFhFTl9ET01DVExfc2V0X3Zp
cnFfaGFuZGxlciBoYW5kbGVyLCBhbmQgbW9zdApkb21jdGwtcyAoaW5jbHVkaW5nIHRoaXMgb25l
KSBhcmUgZXhjbHVkZWQgZnJvbSBzZWN1cml0eSBjb25zaWRlcmF0aW9ucwpkdWUgdG8gWFNBLTc3
PwoKPiBAQCAtOTU1LDIyICs5NjcsMjIgQEAgbG9uZyBldnRjaG5fYmluZF92Y3B1KHVuc2lnbmVk
IGludCBwb3J0LCB1bnNpZ25lZCBpbnQgdmNwdV9pZCkKPiAgICAgIHsKPiAgICAgIGNhc2UgRUNT
X1ZJUlE6Cj4gICAgICAgICAgaWYgKCB2aXJxX2lzX2dsb2JhbChjaG4tPnUudmlycSkgKQo+IC0g
ICAgICAgICAgICBjaG4tPm5vdGlmeV92Y3B1X2lkID0gdmNwdV9pZDsKPiArICAgICAgICAgICAg
Y2huLT5ub3RpZnlfdmNwdV9pZCA9IHYtPnZjcHVfaWQ7Cj4gICAgICAgICAgZWxzZQo+ICAgICAg
ICAgICAgICByYyA9IC1FSU5WQUw7Cj4gICAgICAgICAgYnJlYWs7Cj4gICAgICBjYXNlIEVDU19V
TkJPVU5EOgo+ICAgICAgY2FzZSBFQ1NfSU5URVJET01BSU46Cj4gLSAgICAgICAgY2huLT5ub3Rp
ZnlfdmNwdV9pZCA9IHZjcHVfaWQ7Cj4gKyAgICAgICAgY2huLT5ub3RpZnlfdmNwdV9pZCA9IHYt
PnZjcHVfaWQ7Cj4gICAgICAgICAgYnJlYWs7Cj4gICAgICBjYXNlIEVDU19QSVJROgo+IC0gICAg
ICAgIGlmICggY2huLT5ub3RpZnlfdmNwdV9pZCA9PSB2Y3B1X2lkICkKPiArICAgICAgICBpZiAo
IGNobi0+bm90aWZ5X3ZjcHVfaWQgPT0gdi0+dmNwdV9pZCApCj4gICAgICAgICAgICAgIGJyZWFr
Owo+ICAgICAgICAgIHVubGlua19waXJxX3BvcnQoY2huLCBkLT52Y3B1W2Nobi0+bm90aWZ5X3Zj
cHVfaWRdKTsKPiAtICAgICAgICBjaG4tPm5vdGlmeV92Y3B1X2lkID0gdmNwdV9pZDsKPiArICAg
ICAgICBjaG4tPm5vdGlmeV92Y3B1X2lkID0gdi0+dmNwdV9pZDsKClJpZ2h0IG5vdyB3ZSB1bmRl
cnN0YW5kIHdoeSBhbGwgb2YgdGhlc2UgY2hhbmdlcyBhcmUgZG9uZSwgYnV0CndpdGhvdXQgYSBj
b21tZW50IHRoaXMgaXMgbGlhYmxlIHRvIGJlIGNvbnZlcnRlZCBiYWNrIGFzIGFuCm9wdGltaXph
dGlvbiBkb3duIHRoZSByb2FkLgoKRXZlcnl0aGluZyBlbHNlIGhlcmUgbG9va3MgZmluZSB0byBt
ZSBub3cuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
