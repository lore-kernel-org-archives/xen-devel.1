From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 02/18] argo: introduce the
 argo_message_op hypercall boilerplate
Date: Thu, 20 Dec 2018 08:18:45 -0700
Message-ID: <5C1BB2D502000078002081E8@prv1-mh.provo.novell.com>
References: <1545287955-27684-1-git-send-email-christopher.w.clark@gmail.com>
 <1545287955-27684-3-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ga065-0007Gt-BW
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 15:18:49 +0000
In-Reply-To: <1545287955-27684-3-git-send-email-christopher.w.clark@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjEyLjE4IGF0IDA3OjM4LCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IFByZXNlbmNlIGlzIGdhdGVkIHVwb24gQ09ORklHX0FSR08uCj4gCj4gUmVnaXN0
ZXJzIHRoZSBoeXBlcmNhbGwgcHJldmlvdXNseSByZXNlcnZlZCBmb3IgdGhpcy4KPiBUYWtlcyA1
IGFyZ3VtZW50cywgZG9lcyBub3RoaW5nIGFuZCByZXR1cm5zIC1FTk9TWVMuCj4gCj4gV2lsbCBi
ZSBhdm9pZGluZyBhIGNvbXBhdCBBQkkgYnkgdXNpbmcgZml4ZWQtc2l6ZSB0eXBlcyBpbiBoeXBl
cmNhbGwgb3BzIHNvCj4gSFlQRVJDQUxMLCByYXRoZXIgdGhhbiBDT01QQVRfQ0FMTCwgaXMgdGhl
IGNvcnJlY3QgbWFjcm8gZm9yIHRoZSBoeXBlcmNhbGwKPiB0YWJsZXMuCj4gCj4gRXZlbiB0aG91
Z2ggaGFuZGxlcyB3aWxsIGJlIHVzZWQgZm9yICh1cCB0bykgdHdvIG9mIHRoZSBhcmd1bWVudHMg
dG8gdGhlCj4gaHlwZXJjYWxsLCB0aGVyZSB3aWxsIGJlIG5vIG5lZWQgZm9yIGFueSBYTEFUXyog
dHJhbnNsYXRpb24gZnVuY3Rpb25zCj4gYmVjYXVzZSB0aGUgcmVmZXJlbmNlZCBkYXRhIHN0cnVj
dHVyZXMgaGF2ZSBiZWVuIGNvbnN0cnVjdGVkIHRvIGJlIGV4YWN0bHkKPiB0aGUgc2FtZSBzaXpl
IGFuZCBiaXQgcGF0dGVybiBvbiBib3RoIDMyLWJpdCBhbmQgNjQtYml0IGd1ZXN0cywgYW5kIHBh
ZGRlZAo+IHRvIGJlIGludGVnZXIgbXVsdGlwbGVzIG9mIDMyIGJpdHMgaW4gc2l6ZS4gVGhpcyBt
ZWFucyB0aGF0IHRoZSBzYW1lCj4gY29weV90b19ndWVzdCBhbmQgY29weV9mcm9tX2d1ZXN0IGxv
Z2ljIGNhbiBiZSByZWxpZWQgdXBvbiB0byBwZXJmb3JtIGFzCj4gcmVxdWlyZWQgd2l0aG91dCBh
bnkgZnVydGhlciBpbnRlcnZlbnRpb24uIFRlc3RpbmcgY29tbXVuaWNhdGlvbiB3aXRoIDMyCj4g
YW5kIDY0IGJpdCBndWVzdHMgaGFzIGNvbmZpcm1lZCB0aGlzIHdvcmtzIGFzIGludGVuZGVkLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhlci5jbGFyazZA
YmFlc3lzdGVtcy5jb20+CgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgp3aXRoIG9uZSBmdXJ0aGVyIHF1ZXN0aW9uOgoKPiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMv
eGVuLmgKPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmgKPiBAQCAtMTE4LDcgKzExOCw3
IEBAIERFRklORV9YRU5fR1VFU1RfSEFORExFKHhlbl91bG9uZ190KTsKPiAgI2RlZmluZSBfX0hZ
UEVSVklTT1JfZG9tY3RsICAgICAgICAgICAgICAgMzYKPiAgI2RlZmluZSBfX0hZUEVSVklTT1Jf
a2V4ZWNfb3AgICAgICAgICAgICAgMzcKPiAgI2RlZmluZSBfX0hZUEVSVklTT1JfdG1lbV9vcCAg
ICAgICAgICAgICAgMzgKPiAtI2RlZmluZSBfX0hZUEVSVklTT1JfeGNfcmVzZXJ2ZWRfb3AgICAg
ICAgMzkgLyogcmVzZXJ2ZWQgZm9yIFhlbkNsaWVudCAqLwo+ICsjZGVmaW5lIF9fSFlQRVJWSVNP
Ul9hcmdvX21lc3NhZ2Vfb3AgICAgICAzOQoKSXMgIm1lc3NhZ2Ugb3AiIHJlYWxseSBhcHByb3By
aWF0ZT8gSS5lLiB3b3VsZG4ndApfX0hZUEVSVklTT1JfYXJnb19vcCBiZSBhIGJldHRlciBmaXQg
Y29uc2lkZXJpbmcgdGhhdCB0aGlzIGlzCm5vdCBqdXN0IGFib3V0IG1lc3NhZ2UgZXhjaGFuZ2Us
IGJ1dCBhbHNvIGNvbmZpZ3VyYXRpb24gZXRjPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
