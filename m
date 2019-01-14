From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [Qemu-devel] [PATCH] xen: Fix event channel
 interface for XenDevice-s
Date: Mon, 14 Jan 2019 12:07:56 +0000
Message-ID: <20190114120756.GA1271@perard.uk.xensource.com>
References: <20190111180941.6198-1-anthony.perard@citrix.com>
 <20190111181127.GN1508@perard.uk.xensource.com>
 <CAFEAcA-+_-Eq_qm-G4+Guy9nL-Xja9k6fEOUJPd6_3LoG9P0Qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ahuc=PW=citrix.com=prvs=9106bec1f=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gj129-0007Wm-Uf
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 12:08:01 +0000
Content-Disposition: inline
In-Reply-To: <CAFEAcA-+_-Eq_qm-G4+Guy9nL-Xja9k6fEOUJPd6_3LoG9P0Qg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMTEsIDIwMTkgYXQgMDY6MTY6NDVQTSArMDAwMCwgUGV0ZXIgTWF5ZGVsbCB3
cm90ZToKPiBPbiBGcmksIDExIEphbiAyMDE5IGF0IDE4OjEzLCBBbnRob255IFBFUkFSRCA8YW50
aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBKYW4gMTEsIDIw
MTkgYXQgMDY6MDk6NDFQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiA+IFBhdGNo
ICJ4ZW46IGFkZCBldmVudCBjaGFubmVsIGludGVyZmFjZSBmb3IgWGVuRGV2aWNlLXMiIG1ha2Vz
IHVzZSBvZgo+ID4gPiB0aGUgdHlwZSB4ZW5ldnRjaG5fcG9ydF9vcl9lcnJvcl90LCBidXQgdGhp
cyBpc24ndCBhdmFpYWJsZSBiZWZvcmUgWGVuCj4gPiA+IDQuNy4gQWxzbyB0aGUgZnVuY3Rpb24g
eGVuX2RldmljZV9iaW5kX2V2ZW50X2NoYW5uZWwgYXNzaWduIHRoZSByZXR1cm4KPiA+ID4gdmFs
dWUgb2YgeGVuZXZ0Y2huX2JpbmRfaW50ZXJkb21haW4gdG8gY2hhbm5lbC0+bG9jYWxfcG9ydCBi
dXQgY2hlY2sgdGhlCj4gPiA+IHJlc3VsdCBmb3IgZXJyb3Igd2l0aCB4ZW5kZXYtPmxvY2FsX3Bv
cnQuCj4gPiA+Cj4gPiA+IEZpeCBieToKPiA+ID4gLSByZW1vdmluZyBsb2NhbF9wb3J0IGZyb20g
c3RydWN0IFhlbkRldmljZSBhcyBpdCBpc24ndCB1c2UgYW55d2VyZS4KPiA+ID4gLSBhZGRpbmcg
YSBjb21wYXRpYmlsaXR5IHR5cGVkZWYgZm9yIHhlbmV2dGNobl9wb3J0X29yX2Vycm9yX3QgZm9y
IFhlbgo+ID4gPiAgIDQuNiBhbmQgZWFybGllci4KPiA+ID4KPiA+ID4gQXMgZXh0cmEsIHJlcGxh
Y2UgdGhlIHR5cGUgb2YgWGVuRXZlbnRDaGFubmVsLT5sb2NhbF9wb3J0IGJ5Cj4gPiA+IGV2dGNo
bl9wb3J0X3QuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgo+ID4KPiA+IE5vdGVzOgo+ID4gVGhpcyBwYXRjaCBmaXgg
InhlbjogYWRkIGV2ZW50IGNoYW5uZWwgaW50ZXJmYWNlIGZvciBYZW5EZXZpY2UtcyIgdGhhdAo+
ID4gaXNuJ3QgY29tbWl0ZWQgeWV0LCBvZiB0aGUgcGF0Y2ggc2VyaWVzICJYZW4gUFYgYmFja2Vu
ZCAncWRldmlmaWNhdGlvbiciLgo+IAo+IFRoYW5rcyBmb3IgdGhlIGZpeC4gSSBhc3N1bWUgeW91
J3JlIGdvaW5nIHRvIHNxdWFzaCBpdCBpbnRvIHRoZQo+IGFwcHJvcHJpYXRlIHBhdGNoIGluIHRo
YXQgcHVsbHJlcXVlc3QgPwoKWWVzLCBpdCdzIGEgZ29vZCBpZGVhIHRvIHNxdWFzaCBpdC4gSSds
bCByZXN1Ym1pdCB0aGUgcHVsbHJlcSBzaG9ydGx5LgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
