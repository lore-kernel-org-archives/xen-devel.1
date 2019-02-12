From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 8/8] microcode: update microcode on cores
 in parallel
Date: Tue, 12 Feb 2019 06:55:20 -0700
Message-ID: <5C62D0480200007800215F27@prv1-mh.provo.novell.com>
References: <1548659210-16870-1-git-send-email-chao.gao@intel.com>
 <1548659210-16870-9-git-send-email-chao.gao@intel.com>
 <5C62C15D0200007800215E2E@prv1-mh.provo.novell.com>
 <20190212132507.mwp4yyf22oslc7d4@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gtYX4-0003Dx-PL
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 13:55:30 +0000
In-Reply-To: <20190212132507.mwp4yyf22oslc7d4@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Chao Gao <chao.gao@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjAyLjE5IGF0IDE0OjI1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgRmViIDEyLCAyMDE5IGF0IDA1OjUxOjQxQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMjguMDEuMTkgYXQgMDg6MDYsIDxjaGFvLmdhb0BpbnRlbC5jb20+IHdy
b3RlOgo+PiA+IEBAIC0zMTQsOSArMzEwLDcgQEAgc3RhdGljIGludCBhcHBseV9taWNyb2NvZGUo
dW5zaWduZWQgaW50IGNwdSkKPj4gPiAgCj4+ID4gICAgICBtY19pbnRlbCA9IHBhdGNoLT5kYXRh
Owo+PiA+ICAgICAgQlVHX09OKCFtY19pbnRlbCk7Cj4+ID4gLQo+PiA+IC0gICAgLyogc2VyaWFs
aXplIGFjY2VzcyB0byB0aGUgcGh5c2ljYWwgd3JpdGUgdG8gTVNSIDB4NzkgKi8KPj4gPiAtICAg
IHNwaW5fbG9ja19pcnFzYXZlKCZtaWNyb2NvZGVfdXBkYXRlX2xvY2ssIGZsYWdzKTsKPj4gPiAr
ICAgIEJVR19PTihsb2NhbF9pcnFfaXNfZW5hYmxlZCgpKTsKPj4gPiAgCj4+ID4gICAgICAvKiB3
cml0ZSBtaWNyb2NvZGUgdmlhIE1TUiAweDc5ICovCj4+ID4gICAgICB3cm1zcmwoTVNSX0lBMzJf
VUNPREVfV1JJVEUsICh1bnNpZ25lZCBsb25nKW1jX2ludGVsLT5iaXRzKTsKPj4gPiBAQCAtMzI5
LDcgKzMyMyw2IEBAIHN0YXRpYyBpbnQgYXBwbHlfbWljcm9jb2RlKHVuc2lnbmVkIGludCBjcHUp
Cj4+ID4gICAgICByZG1zcmwoTVNSX0lBMzJfVUNPREVfUkVWLCBtc3JfY29udGVudCk7Cj4+ID4g
ICAgICB2YWxbMV0gPSAodWludDMyX3QpKG1zcl9jb250ZW50ID4+IDMyKTsKPj4gPiAgCj4+ID4g
LSAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZtaWNyb2NvZGVfdXBkYXRlX2xvY2ssIGZsYWdz
KTsKPj4gPiAgICAgIGlmICggdmFsWzFdICE9IG1jX2ludGVsLT5oZHIucmV2ICkKPj4gPiAgICAg
IHsKPj4gPiAgICAgICAgICBwcmludGsoS0VSTl9FUlIgIm1pY3JvY29kZTogQ1BVJWQgdXBkYXRl
IGZyb20gcmV2aXNpb24gIgo+PiAKPj4gQW0gSSB1bmRlcnN0YW5kaW5nIHJpZ2h0IHRoYXQgeW91
IG5vdyByZWx5IG9uIHVwcGVyIGxheWVycyBpbiB0aGUKPj4gY2FsbCB0cmVlIHRvIGF2b2lkIGNh
bGxpbmcgaW50byBoZXJlIGluIHBhcmFsbGVsIGZvciB0d28gaHlwZXJ0aHJlYWRzCj4+IG9mIHRo
ZSBzYW1lIGNvcmU/IEkgY2FuJ3Qgc2VlIGhvdyB5b3UgYXZvaWQgdGhpcyBzaXR1YXRpb24gZHVy
aW5nCj4+IEFQIGJyaW5ndXAsIGZvciBleGFtcGxlLiBEaWQgSSBvdmVybG9vayBhbnl0aGluZyBp
biB0aGlzIHJlZ2FyZD8KPiAKPiBJSVJDIG1pY3JvY29kZSB1cGRhdGUgaXMgZG9uZSBpbiB0aGUg
c2VyaWFsaXplZCBwYXJ0IG9mIEFQIGJyaW5ndXAsCj4gYmVmb3JlIHRoZSBjYWxsIHRvIHNtcF9j
YWxsaW4sIHdoaWNoIGd1YXJhbnRlZXMgc2VyaWFsaXphdGlvbi4KCkhtbSwgeWVzLCByaWdodCBu
b3cgaXQgaXMuIEJ1dCBJJ2QgY2FsbCB0aGlzICJoYXBwZW5zIHRvIGJlIHRoYXQgd2F5IgpyYXRo
ZXIgdGhhbiAiaXMgZ3VhcmFudGVlZCB0byBiZSB0aGF0IHdheSIgLSBwcmlvciB0byBjb21taXQK
Zjk3ODM4YmJkOSBpdCBkaWQgaGFwcGVuIGxhdGVyLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
