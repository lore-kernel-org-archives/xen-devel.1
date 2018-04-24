From: Alistair Francis <alistair.francis@xilinx.com>
Subject: Re: [PATCH 15/16] os-posix: cleanup: Replace perror
 with error_report
Date: Tue, 24 Apr 2018 14:18:25 -0700
Message-ID: <CAKmqyKOur_B1T-Bh613yukBWbPZ3VbZkNPy-MOCNw=4-BWiJGw__1977.71699536151$1524604690$gmane$org@mail.gmail.com>
References: <1524592709-6553-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524592709-6553-16-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fdoc=hn=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1fB5L1-0002kj-33
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 21:18:59 +0000
Received: by mail-lf0-x244.google.com with SMTP id g12-v6so6329201lfb.10
 for <xen-devel@lists.xenproject.org>; Tue, 24 Apr 2018 14:18:57 -0700 (PDT)
In-Reply-To: <1524592709-6553-16-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel P. Berrange" <berrange@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>, Anthony PERARD <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair.francis@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMjQsIDIwMTggYXQgMTA6NTggQU0sIElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPiB3cm90ZToKPiBwZXJyb3IoKSBpcyBkZWZpbmVkIHRvIGZwcmludGYo
c3RkZXJyLC4uLikuICBIQUNLSU5HIHNheXMKPiBmcHJpbnRmKHN0ZGVyciwuLi4pIGlzIHdyb25n
LiAgU28gcGVycm9yKCkgaXMgdG9vLgo+Cj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElh
bi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQ0M6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJl
ZGhhdC5jb20+Cj4gQ0M6IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT4KPiBD
QzogRGFuaWVsIFAuIEJlcnJhbmdlIDxiZXJyYW5nZUByZWRoYXQuY29tPgo+IENDOiBNaWNoYWVs
IFRva2FyZXYgPG1qdEB0bHMubXNrLnJ1Pgo+IENDOiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFp
ci5mcmFuY2lzQHhpbGlueC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1
ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+CgpSZXZpZXdlZC1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxp
c3RhaXIuZnJhbmNpc0B3ZGMuY29tPgoKQWxpc3RhaXIKCj4gLS0tCj4gdjc6IE5ldyBwYXRjaAo+
IC0tLQo+ICBvcy1wb3NpeC5jIHwgOCArKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL29zLXBvc2l4LmMgYi9v
cy1wb3NpeC5jCj4gaW5kZXggYTJiYTUwZC4uMjRlYjcwMCAxMDA2NDQKPiAtLS0gYS9vcy1wb3Np
eC5jCj4gKysrIGIvb3MtcG9zaXguYwo+IEBAIC0xMjUsNyArMTI1LDcgQEAgdm9pZCBvc19zZXRf
cHJvY19uYW1lKGNvbnN0IGNoYXIgKnMpCj4gICAgICAvKiBDb3VsZCByZXdyaXRlIGFyZ3ZbMF0g
dG9vLCBidXQgdGhhdCdzIGEgYml0IG1vcmUgY29tcGxpY2F0ZWQuCj4gICAgICAgICBUaGlzIHNp
bXBsZSB3YXkgaXMgZW5vdWdoIGZvciBgdG9wJy4gKi8KPiAgICAgIGlmIChwcmN0bChQUl9TRVRf
TkFNRSwgbmFtZSkpIHsKPiAtICAgICAgICBwZXJyb3IoInVuYWJsZSB0byBjaGFuZ2UgcHJvY2Vz
cyBuYW1lIik7Cj4gKyAgICAgICAgZXJyb3JfcmVwb3J0KCJ1bmFibGUgdG8gY2hhbmdlIHByb2Nl
c3MgbmFtZTogJXMiLCBzdHJlcnJvcihlcnJubykpOwo+ICAgICAgICAgIGV4aXQoMSk7Cj4gICAg
ICB9Cj4gICNlbHNlCj4gQEAgLTI0Nyw3ICsyNDcsNyBAQCBzdGF0aWMgdm9pZCBjaGFuZ2Vfcm9v
dCh2b2lkKQo+ICAgICAgICAgICAgICBleGl0KDEpOwo+ICAgICAgICAgIH0KPiAgICAgICAgICBp
ZiAoY2hkaXIoIi8iKSkgewo+IC0gICAgICAgICAgICBwZXJyb3IoIm5vdCBhYmxlIHRvIGNoZGly
IHRvIC8iKTsKPiArICAgICAgICAgICAgZXJyb3JfcmVwb3J0KCJub3QgYWJsZSB0byBjaGRpciB0
byAvOiAlcyIsIHN0cmVycm9yKGVycm5vKSk7Cj4gICAgICAgICAgICAgIGV4aXQoMSk7Cj4gICAg
ICAgICAgfQo+ICAgICAgfQo+IEBAIC0zMDksNyArMzA5LDcgQEAgdm9pZCBvc19zZXR1cF9wb3N0
KHZvaWQpCj4KPiAgICAgIGlmIChkYWVtb25pemUpIHsKPiAgICAgICAgICBpZiAoY2hkaXIoIi8i
KSkgewo+IC0gICAgICAgICAgICBwZXJyb3IoIm5vdCBhYmxlIHRvIGNoZGlyIHRvIC8iKTsKPiAr
ICAgICAgICAgICAgZXJyb3JfcmVwb3J0KCJub3QgYWJsZSB0byBjaGRpciB0byAvOiAlcyIsIHN0
cmVycm9yKGVycm5vKSk7Cj4gICAgICAgICAgICAgIGV4aXQoMSk7Cj4gICAgICAgICAgfQo+ICAg
ICAgICAgIFRGUihmZCA9IHFlbXVfb3BlbigiL2Rldi9udWxsIiwgT19SRFdSKSk7Cj4gQEAgLTM4
Myw3ICszODMsNyBAQCBpbnQgb3NfbWxvY2sodm9pZCkKPgo+ICAgICAgcmV0ID0gbWxvY2thbGwo
TUNMX0NVUlJFTlQgfCBNQ0xfRlVUVVJFKTsKPiAgICAgIGlmIChyZXQgPCAwKSB7Cj4gLSAgICAg
ICAgcGVycm9yKCJtbG9ja2FsbCIpOwo+ICsgICAgICAgIGVycm9yX3JlcG9ydCgibWxvY2thbGw6
ICVzIiwgc3RyZXJyb3IoZXJybm8pKTsKPiAgICAgIH0KPgo+ICAgICAgcmV0dXJuIHJldDsKPiAt
LQo+IDIuMS40Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
