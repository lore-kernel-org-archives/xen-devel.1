From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] Input: xen-kbdfront - allow better run-time
 configuration
Date: Mon, 23 Apr 2018 11:53:25 -0700
Message-ID: <20180423185325.GB66646__47354.9919123345$1524509532$gmane$org@dtor-ws>
References: <20180418150445.9805-1-andr2000@gmail.com>
 <ccb7a33b-7862-9803-fb24-67861d5ecab9@suse.com>
 <2bff035e-303e-d644-5f51-5e64150c097c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1xdl=hm=gmail.com=dmitry.torokhov@srs-us1.protection.inumbo.net>)
 id 1fAgag-00031I-2s
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 18:53:30 +0000
Received: by mail-pf0-x22e.google.com with SMTP id g14so10059693pfh.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Apr 2018 11:53:29 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <2bff035e-303e-d644-5f51-5e64150c097c@gmail.com>
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

T24gVGh1LCBBcHIgMTksIDIwMTggYXQgMDI6NDQ6MTlQTSArMDMwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4gT24gMDQvMTkvMjAxOCAwMjoyNSBQTSwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiA+IE9uIDE4LzA0LzE4IDE3OjA0LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90
ZToKPiA+ID4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNo
Y2hlbmtvQGVwYW0uY29tPgo+ID4gPiAKPiA+ID4gSXQgaXMgbm93IG9ubHkgcG9zc2libGUgdG8g
Y29udHJvbCBpZiBtdWx0aS10b3VjaCB2aXJ0dWFsIGRldmljZQo+ID4gPiBpcyBjcmVhdGVkIG9y
IG5vdCAodmlhIHRoZSBjb3JyZXNwb25kaW5nIFhlblN0b3JlIGVudHJpZXMpLAo+ID4gPiBidXQg
a2V5Ym9hcmQgYW5kIHBvaW50ZXIgZGV2aWNlcyBhcmUgYWx3YXlzIGNyZWF0ZWQuCj4gPiBXaHkg
ZG9uJ3QgeW91IHdhbnQgdG8gZ28gdGhhdCByb3V0ZSBmb3Iga2V5Ym9hcmQgYW5kIG1vdXNlLCB0
b28/Cj4gPiBPciBkb2VzIHRoaXMgcmVhbGx5IG1ha2Ugbm8gc2Vuc2U/Cj4gV2VsbCwgSSB3b3Vs
ZCBwcmVmZXIgbm90IHRvIHRvdWNoIGFueXRoaW5nIG91dHNpZGUgTGludXggYW5kCj4gdGhpcyBk
cml2ZXIuIEFuZCB0aGVzZSBzZXR0aW5ncyBzZWVtIHRvIGJlIGltcGxlbWVudGF0aW9uIHNwZWNp
ZmljLgo+IFNvLCB0aGlzIGlzIHdoeSBpbnRyb2R1Y2UgTGludXggbW9kdWxlIHBhcmFtZXRlcnMg
YW5kIGRvbid0IGV4dGVuZAo+IHRoZSBrYmRpZiBwcm90b2NvbC4KCldoeSBkbyB5b3UgY29uc2lk
ZXIgdGhpcyBpbXBsZW1lbnRhdGlvbiBzcGVjaWZpYz8gSG93IG90aGVyIGd1ZXN0cwpkZWNpZGUg
dG8gZm9yZWdvIGNyZWF0aW9uIG9mIHJlbGF0aXZlIHBvaW50ZXIgZGV2aWNlIG9yIGtleWJvYXJk
LWxpa2UKZGV2aWNlPwoKWW91IGFscmVhZHkgaGF2ZSAiZmVhdHVyZXMiIGZvciBhYnNvbHV0ZSBw
b2ludGluZyBkZXZpY2UgYW5kIG11bHRpdG91Y2gsCnNvIHBsZWFzZSBleHRlbmQgdGhlIHByb3Rv
Y29sIHByb3Blcmx5IHNvIHlvdSBpbmRlZWQgZG8gbm90IGNvZGUKc29tZXRoaW5nIGltcGxlbWVu
dGF0aW9uLXNwZWNpZmljIChpLmUuIG1vZHVsZSBwYXJhbWV0ZXJzKS4KClRoYW5rcy4KCi0tIApE
bWl0cnkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
