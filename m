From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 15/16] os-posix: cleanup:
 Replace perror with error_report
Date: Tue, 24 Apr 2018 16:54:07 +0100
Message-ID: <20180424155407.GK20310@redhat.com>
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524156319-11465-16-git-send-email-ian.jackson@eu.citrix.com>
 <b8d20908-c76c-1dc2-2c14-31c185abbbfc@amsat.org>
 <23263.17660.17771.980752@mariner.uk.xensource.com>
 <20180424151830.GI20310@redhat.com>
 <baa5df1e-3e65-4213-045a-ca064fb69c3f@redhat.com>
 <1e72b98a-5553-5990-2327-c86c75952e87@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/1ys=hn=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1fB0Gj-0002Dl-KN
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 15:54:13 +0000
Content-Disposition: inline
In-Reply-To: <1e72b98a-5553-5990-2327-c86c75952e87@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Eric Blake <eblake@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, Ross Lagerwall <ross.lagerwall@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@citrix.com>, Alistair Francis <alistair.francis@xilinx.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMjQsIDIwMTggYXQgMTA6NDM6MDlBTSAtMDUwMCwgRXJpYyBCbGFrZSB3cm90
ZToKPiBPbiAwNC8yNC8yMDE4IDEwOjQwIEFNLCBFcmljIEJsYWtlIHdyb3RlOgo+ID4gT24gMDQv
MjQvMjAxOCAxMDoxOCBBTSwgRGFuaWVsIFAuIEJlcnJhbmfDqSB3cm90ZToKPiA+IAo+ID4+PiAg
LSBzdGF0aWMgdm9pZCB2cmVwb3J0KHJlcG9ydF90eXBlIHR5cGUsIGNvbnN0IGNoYXIgKmZtdCwg
dmFfbGlzdCBhcCkKPiA+Pj4gICsgc3RhdGljIHZvaWQgdnJlcG9ydChyZXBvcnRfdHlwZSB0eXBl
LCBpbnQgZXJybm92YWwsIGNvbnN0IGNoYXIgKmZtdCwgdmFfbGlzdCBhcCkKPiA+Pj4gLi4uCj4g
Pj4+ICArICAgICBpZiAoZXJybm92YWwgPj0gMCkgewo+ID4+PiAgKyAgICAgICAgIGVycm9yX3By
aW50ZigiOiAlcyIsIHN0cmVycm9yKGVycm5vdmFsKTsKPiA+Pj4gICsgICAgIH0KPiA+Pj4KPiA+
Pj4gYW5kIHRoZW4gYWRkIGJvdGgKPiA+Pj4gICBlcnJvcl9yZXBvcnRfZXJybm8KPiA+Pj4gICBl
cnJvcl92cmVwb3J0X2Vycm5vCj4gPj4+IHdpdGggdGhlIG9idmlvdXMgc2VtYW50aWNzLgo+ID4+
Cj4gPj4gVGhhdCB3b3VsZCBiZSBuaWNlLCBiZWNhdXNlIHRoZW4gd2UgY2FuIG1ha2UgdGhlc2Ug
dHdvIGZ1bmN0aW9ucyBhY3R1YWxseQo+ID4+IHVzZSBzdHJlcnJvcl9yKCkgaW5zdGVhZCBvZiBz
dHJlcnJvcigpLCBmb3IgdGhyZWFkIHNhZmV0eSBvbiBhbGwgcGxhdGZvcm1zLgo+ID4gCj4gPiBF
eGNlcHQgdGhhdCBzdHJlcnJvcl9yKCkgaXMgYSBiZWFyIHRvIHVzZSBwb3J0YWJseSwgZ2l2ZW4g
dGhhdCBnbGliYydzCj4gPiBkZWZhdWx0IGRlY2xhcmF0aW9uIGRpZmZlcnMgZnJvbSB0aGUgUE9T
SVggcmVxdWlyZW1lbnQgKHlvdSBjYW4gZm9yY2UKPiA+IGdsaWJjIHRvIGdpdmUgeW91IHRoZSBQ
T1NJWCB2ZXJzaW9uLCBidXQgZG9pbmcgc28gY2F1c2VzIHlvdSB0byBsb3NlCj4gPiBhY2Nlc3Mg
dG8gbWFueSBvdGhlciB1c2VmdWwgZXh0ZW5zaW9ucykuICBJdCdzIHJhdGhlciB0ZWxsaW5nIHRo
YXQgJ2dpdAo+ID4gZ3JlcCBzdHJlcnJvcl9yJyBjdXJyZW50bHkgY29tZXMgdXAgZW1wdHkuCj4g
Cj4gVGhhdCBzYWlkLCBnbGliJ3MgZ19zdHJlcnJvcigpIG1heSBiZSBzdWl0YWJsZSBmb3IgdGhp
cyBwdXJwb3NlLAo+IGFsdGhvdWdoIHdlIGFyZSBjdXJyZW50bHkgdXNpbmcgaXQgb25seSBpbiB0
ZXN0cy9pdnNobWVtLXRlc3QuYy4KClllcywgdGhhdCB1c2VzIHN0cmVycm9yX3IgaW50ZXJuYWxs
eSwgb3Igc3RyZXJyb3JfcyBvbiBXaW5kb3dzOgoKaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dO
T01FL2dsaWIvYmxvYi9tYXN0ZXIvZ2xpYi9nc3RyZnVuY3MuYyNMMTIzNgoKClJlZ2FyZHMsCkRh
bmllbAotLSAKfDogaHR0cHM6Ly9iZXJyYW5nZS5jb20gICAgICAtby0gICAgaHR0cHM6Ly93d3cu
ZmxpY2tyLmNvbS9waG90b3MvZGJlcnJhbmdlIDp8Cnw6IGh0dHBzOi8vbGlidmlydC5vcmcgICAg
ICAgICAtby0gICAgICAgICAgICBodHRwczovL2ZzdG9wMTM4LmJlcnJhbmdlLmNvbSA6fAp8OiBo
dHRwczovL2VudGFuZ2xlLXBob3RvLm9yZyAgICAtby0gICAgaHR0cHM6Ly93d3cuaW5zdGFncmFt
LmNvbS9kYmVycmFuZ2UgOnwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
