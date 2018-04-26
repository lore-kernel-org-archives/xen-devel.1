From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] Input: xen-kbdfront - allow better run-time
 configuration
Date: Thu, 26 Apr 2018 12:16:24 -0700
Message-ID: <20180426191624.GB162443__17325.1682696447$1524770135$gmane$org@dtor-ws>
References: <20180418150445.9805-1-andr2000@gmail.com>
 <ccb7a33b-7862-9803-fb24-67861d5ecab9@suse.com>
 <2bff035e-303e-d644-5f51-5e64150c097c@gmail.com>
 <20180423185325.GB66646@dtor-ws>
 <8ef84389-4659-d4bb-271f-53155062b7b6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9jap=hp=gmail.com=dmitry.torokhov@srs-us1.protection.inumbo.net>)
 id 1fBmNb-0006iB-2b
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 19:16:31 +0000
Received: by mail-pg0-x242.google.com with SMTP id l2so3321562pgc.7
 for <xen-devel@lists.xenproject.org>; Thu, 26 Apr 2018 12:16:28 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <8ef84389-4659-d4bb-271f-53155062b7b6@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, lyan@suse.com, andrii_chepurnyi@epam.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMjQsIDIwMTggYXQgMDg6NTU6MTlBTSArMDMwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4gT24gMDQvMjMvMjAxOCAwOTo1MyBQTSwgRG1pdHJ5IFRvcm9raG92
IHdyb3RlOgo+ID4gT24gVGh1LCBBcHIgMTksIDIwMTggYXQgMDI6NDQ6MTlQTSArMDMwMCwgT2xl
a3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4gPiA+IE9uIDA0LzE5LzIwMTggMDI6MjUgUE0s
IEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gPiA+ID4gT24gMTgvMDQvMTggMTc6MDQsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+ID4gPiA+ID4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+ID4gPiA+ID4gCj4gPiA+
ID4gPiBJdCBpcyBub3cgb25seSBwb3NzaWJsZSB0byBjb250cm9sIGlmIG11bHRpLXRvdWNoIHZp
cnR1YWwgZGV2aWNlCj4gPiA+ID4gPiBpcyBjcmVhdGVkIG9yIG5vdCAodmlhIHRoZSBjb3JyZXNw
b25kaW5nIFhlblN0b3JlIGVudHJpZXMpLAo+ID4gPiA+ID4gYnV0IGtleWJvYXJkIGFuZCBwb2lu
dGVyIGRldmljZXMgYXJlIGFsd2F5cyBjcmVhdGVkLgo+ID4gPiA+IFdoeSBkb24ndCB5b3Ugd2Fu
dCB0byBnbyB0aGF0IHJvdXRlIGZvciBrZXlib2FyZCBhbmQgbW91c2UsIHRvbz8KPiA+ID4gPiBP
ciBkb2VzIHRoaXMgcmVhbGx5IG1ha2Ugbm8gc2Vuc2U/Cj4gPiA+IFdlbGwsIEkgd291bGQgcHJl
ZmVyIG5vdCB0byB0b3VjaCBhbnl0aGluZyBvdXRzaWRlIExpbnV4IGFuZAo+ID4gPiB0aGlzIGRy
aXZlci4gQW5kIHRoZXNlIHNldHRpbmdzIHNlZW0gdG8gYmUgaW1wbGVtZW50YXRpb24gc3BlY2lm
aWMuCj4gPiA+IFNvLCB0aGlzIGlzIHdoeSBpbnRyb2R1Y2UgTGludXggbW9kdWxlIHBhcmFtZXRl
cnMgYW5kIGRvbid0IGV4dGVuZAo+ID4gPiB0aGUga2JkaWYgcHJvdG9jb2wuCj4gPiBXaHkgZG8g
eW91IGNvbnNpZGVyIHRoaXMgaW1wbGVtZW50YXRpb24gc3BlY2lmaWM/IEhvdyBvdGhlciBndWVz
dHMKPiA+IGRlY2lkZSB0byBmb3JlZ28gY3JlYXRpb24gb2YgcmVsYXRpdmUgcG9pbnRlciBkZXZp
Y2Ugb3Iga2V5Ym9hcmQtbGlrZQo+ID4gZGV2aWNlPwo+ID4gCj4gPiBZb3UgYWxyZWFkeSBoYXZl
ICJmZWF0dXJlcyIgZm9yIGFic29sdXRlIHBvaW50aW5nIGRldmljZSBhbmQgbXVsdGl0b3VjaCwK
PiA+IHNvIHBsZWFzZSBleHRlbmQgdGhlIHByb3RvY29sIHByb3Blcmx5IHNvIHlvdSBpbmRlZWQg
ZG8gbm90IGNvZGUKPiA+IHNvbWV0aGluZyBpbXBsZW1lbnRhdGlvbi1zcGVjaWZpYyAoaS5lLiBt
b2R1bGUgcGFyYW1ldGVycykuCj4gT2ssIGJ1dCBpbiBvcmRlciB0byBwcmVzZXJ2ZSB0aGUgZGVm
YXVsdCBiZWhhdmlvciwgZS5nLgo+IHBvaW50ZXIgYW5kIGtleWJvYXJkIGRldmljZXMgYXJlIGFs
d2F5cyBjcmVhdGVkIG5vdywgSSdsbCBoYXZlCj4gdG8gaGF2ZSByZXZlcnNlIGZlYXR1cmVzIGlu
IHRoZSBwcm90b2NvbDoKPiDCoC0gZmVhdHVyZS1uby1wb2ludGVyCj4gwqAtIGZlYXR1cmUtbm8t
a2V5Ym9hcmQKPiBUaGUgYWJvdmUgbWF5IGJlIHNldCBhcyBhIHBhcnQgb2YgZnJvbnRlbmQncyBj
b25maWd1cmF0aW9uIGFuZAo+IGlmIG1pc3NlZCBhcmUgY29uc2lkZXJlZCB0byBiZSBzZXQgdG8g
ZmFsc2UuCgpJIHRoaW5rIHlvdSBjYW4gaGF2ZSB0aGVtIGFzICJmZWF0dXJlLXBvaW50ZXIiIGFu
ZCAiZmVhdHVyZS1rZXlib2FyZCIKKG5vIG5lZ2F0aW9uKSwgYnV0IGFzc3VtZSBub3QgcHJlc2Vu
dCBjb25zaWRlcmVkIGVuYWJsZWQuIEkuZS4KCglrYmQgPSB4ZW5idXNfcmVhZF91bnNpZ25lZCgu
Li4sIFhFTktCRF9GSUVMRF9GRUFUX0tFWUJPQVJELCAxKTsKCWlmIChrYmQpIHsKCQkuLi4KCX0K
ClRoYW5rcy4KCi0tIApEbWl0cnkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
