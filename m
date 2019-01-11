From: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-devel] [PATCH] xen: Fix event channel
 interface for XenDevice-s
Date: Fri, 11 Jan 2019 18:16:45 +0000
Message-ID: <CAFEAcA-+_-Eq_qm-G4+Guy9nL-Xja9k6fEOUJPd6_3LoG9P0Qg@mail.gmail.com>
References: <20190111180941.6198-1-anthony.perard@citrix.com>
 <20190111181127.GN1508@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p0N+=PT=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1gi1MY-0008HO-0O
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 18:16:58 +0000
Received: by mail-ot1-x344.google.com with SMTP id a11so13906565otr.10
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jan 2019 10:16:57 -0800 (PST)
In-Reply-To: <20190111181127.GN1508@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAxMSBKYW4gMjAxOSBhdCAxODoxMywgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBKYW4gMTEsIDIwMTkgYXQgMDY6MDk6
NDFQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiBQYXRjaCAieGVuOiBhZGQgZXZl
bnQgY2hhbm5lbCBpbnRlcmZhY2UgZm9yIFhlbkRldmljZS1zIiBtYWtlcyB1c2Ugb2YKPiA+IHRo
ZSB0eXBlIHhlbmV2dGNobl9wb3J0X29yX2Vycm9yX3QsIGJ1dCB0aGlzIGlzbid0IGF2YWlhYmxl
IGJlZm9yZSBYZW4KPiA+IDQuNy4gQWxzbyB0aGUgZnVuY3Rpb24geGVuX2RldmljZV9iaW5kX2V2
ZW50X2NoYW5uZWwgYXNzaWduIHRoZSByZXR1cm4KPiA+IHZhbHVlIG9mIHhlbmV2dGNobl9iaW5k
X2ludGVyZG9tYWluIHRvIGNoYW5uZWwtPmxvY2FsX3BvcnQgYnV0IGNoZWNrIHRoZQo+ID4gcmVz
dWx0IGZvciBlcnJvciB3aXRoIHhlbmRldi0+bG9jYWxfcG9ydC4KPiA+Cj4gPiBGaXggYnk6Cj4g
PiAtIHJlbW92aW5nIGxvY2FsX3BvcnQgZnJvbSBzdHJ1Y3QgWGVuRGV2aWNlIGFzIGl0IGlzbid0
IHVzZSBhbnl3ZXJlLgo+ID4gLSBhZGRpbmcgYSBjb21wYXRpYmlsaXR5IHR5cGVkZWYgZm9yIHhl
bmV2dGNobl9wb3J0X29yX2Vycm9yX3QgZm9yIFhlbgo+ID4gICA0LjYgYW5kIGVhcmxpZXIuCj4g
Pgo+ID4gQXMgZXh0cmEsIHJlcGxhY2UgdGhlIHR5cGUgb2YgWGVuRXZlbnRDaGFubmVsLT5sb2Nh
bF9wb3J0IGJ5Cj4gPiBldnRjaG5fcG9ydF90Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFudGhv
bnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+Cj4gTm90ZXM6Cj4gVGhpcyBw
YXRjaCBmaXggInhlbjogYWRkIGV2ZW50IGNoYW5uZWwgaW50ZXJmYWNlIGZvciBYZW5EZXZpY2Ut
cyIgdGhhdAo+IGlzbid0IGNvbW1pdGVkIHlldCwgb2YgdGhlIHBhdGNoIHNlcmllcyAiWGVuIFBW
IGJhY2tlbmQgJ3FkZXZpZmljYXRpb24nIi4KClRoYW5rcyBmb3IgdGhlIGZpeC4gSSBhc3N1bWUg
eW91J3JlIGdvaW5nIHRvIHNxdWFzaCBpdCBpbnRvIHRoZQphcHByb3ByaWF0ZSBwYXRjaCBpbiB0
aGF0IHB1bGxyZXF1ZXN0ID8KCnRoYW5rcwotLSBQTU0KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
