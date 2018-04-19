From: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH] Input: xen-kbdfront - allow better run-time
 configuration
Date: Thu, 19 Apr 2018 09:10:29 -0400
Message-ID: <CAKf6xpsM03AB-mHaYdpVfipRdtx9uO1rS=bHZdEi3fkfTo6b4g__17124.2182179869$1524143370$gmane$org@mail.gmail.com>
References: <20180418150445.9805-1-andr2000@gmail.com>
 <ccb7a33b-7862-9803-fb24-67861d5ecab9@suse.com>
 <2bff035e-303e-d644-5f51-5e64150c097c@gmail.com>
 <c833ab0d-746c-c734-3dbe-e02ae7951d1d@suse.com>
 <d935e7d9-090f-a8b1-7f12-5e0a7f0adf1b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=njkc=hi=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1f99Ka-0003yl-Bb
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 13:10:32 +0000
Received: by mail-lf0-x241.google.com with SMTP id r7-v6so96042lfr.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Apr 2018 06:10:31 -0700 (PDT)
In-Reply-To: <d935e7d9-090f-a8b1-7f12-5e0a7f0adf1b@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, lyan@suse.com, andrii_chepurnyi@epam.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, dmitry.torokhov@gmail.com, open list <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgMTksIDIwMTggYXQgOTowMSBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28K
PGFuZHIyMDAwQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPaywgc28gSSdsbCBzZW5kIHYyIHdpdGgg
dGhlIGZvbGxvd2luZyBjaGFuZ2VzOgo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5wdXQvbWlz
Yy94ZW4ta2JkZnJvbnQuYwo+IGIvZHJpdmVycy9pbnB1dC9taXNjL3hlbi1rYmRmcm9udC5jCj4g
aW5kZXggYTMzMDZhYWQ0MGIwLi5kOGNjYTIxMmY3MzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9p
bnB1dC9taXNjL3hlbi1rYmRmcm9udC5jCj4gKysrIGIvZHJpdmVycy9pbnB1dC9taXNjL3hlbi1r
YmRmcm9udC5jCj4gQEAgLTUxLDEzICs1MSwxMyBAQCBtb2R1bGVfcGFyYW1fYXJyYXkocHRyX3Np
emUsIGludCwgTlVMTCwgMDQ0NCk7Cj4gIE1PRFVMRV9QQVJNX0RFU0MocHRyX3NpemUsCj4gICAg
ICAgICAiUG9pbnRpbmcgZGV2aWNlIHdpZHRoLCBoZWlnaHQgaW4gcGl4ZWxzIChkZWZhdWx0IDgw
MCw2MDApIik7Cj4KPiAtc3RhdGljIHVuc2lnbmVkIGludCBub19wdHJfZGV2Owo+IC1tb2R1bGVf
cGFyYW0obm9fcHRyX2RldiwgdWludCwgMCk7Cj4gK3N0YXRpYyBib29sIG5vX3B0cl9kZXY7Cj4g
K21vZHVsZV9wYXJhbShub19wdHJfZGV2LCBib29sLCAwKTsKPiAgTU9EVUxFX1BBUk1fREVTQyhu
b19wdHJfZGV2LAo+ICAgICAgICAgIklmIHNldCB0aGVuIG5vIHZpcnR1YWwgcG9pbnRpbmcgZGV2
aWNlIGV4cG9zZWQgdG8gdGhlIGd1ZXN0Iik7Cj4KPiAtc3RhdGljIHVuc2lnbmVkIGludCBub19r
YmRfZGV2Owo+IC1tb2R1bGVfcGFyYW0obm9fa2JkX2RldiwgdWludCwgMCk7Cj4gK3N0YXRpYyBi
b29sIG5vX2tiZF9kZXY7Cj4gK21vZHVsZV9wYXJhbShub19rYmRfZGV2LCBib29sLCAwKTsKPiAg
TU9EVUxFX1BBUk1fREVTQyhub19rYmRfZGV2LAo+ICAgICAgICAgIklmIHNldCB0aGVuIG5vIHZp
cnR1YWwga2V5Ym9hcmQgZGV2aWNlIGV4cG9zZWQgdG8gdGhlIGd1ZXN0Iik7CgpJIHByZWZlciBk
aXJlY3QgbG9naWMgb3ZlciBpbnZlcnNlIGxvZ2ljLiAgTWF5YmUganVzdCB1c2Uga2JkX2RldiwK
ZGVmYXVsdCB0byB0cnVlLCBidXQgYWxsb3cgaXQgdG8gYmUgc2V0IG9mZj8KCnN0YXRpYyBib29s
IGtiZF9kZXYgPSB0cnVlOwptb2R1bGVfcGFyYW0oa2JkX2RldiwgYm9vbCwgMCk7CgpSZWdhcmRz
LApKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
