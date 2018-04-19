From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH] Input: xen-kbdfront - allow better run-time
 configuration
Date: Thu, 19 Apr 2018 16:22:53 +0300
Message-ID: <1d737998-6b90-ba33-bafa-8a8d4dc568d8__41805.3476875231$1524144100$gmane$org@gmail.com>
References: <20180418150445.9805-1-andr2000@gmail.com>
 <ccb7a33b-7862-9803-fb24-67861d5ecab9@suse.com>
 <2bff035e-303e-d644-5f51-5e64150c097c@gmail.com>
 <c833ab0d-746c-c734-3dbe-e02ae7951d1d@suse.com>
 <d935e7d9-090f-a8b1-7f12-5e0a7f0adf1b@gmail.com>
 <CAKf6xpsM03AB-mHaYdpVfipRdtx9uO1rS=bHZdEi3fkfTo6b4g@mail.gmail.com>
 <5ed20b99-263d-d906-9349-d064eead36ad@gmail.com>
 <d4075815-2b41-781d-3541-6a17a181512d@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jw3m=hi=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1f99Wc-0004y2-Jg
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 13:22:58 +0000
Received: by mail-lf0-x242.google.com with SMTP id d20-v6so147717lfe.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Apr 2018 06:22:57 -0700 (PDT)
In-Reply-To: <d4075815-2b41-781d-3541-6a17a181512d@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Jason Andryuk <jandryuk@gmail.com>
Cc: lyan@suse.com, andrii_chepurnyi@epam.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, dmitry.torokhov@gmail.com, open list <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMTkvMjAxOCAwNDoxOSBQTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxOS8wNC8x
OCAxNToxMiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+IE9uIDA0LzE5LzIwMTgg
MDQ6MTAgUE0sIEphc29uIEFuZHJ5dWsgd3JvdGU6Cj4+PiBPbiBUaHUsIEFwciAxOSwgMjAxOCBh
dCA5OjAxIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbwo+Pj4gPGFuZHIyMDAwQGdtYWlsLmNv
bT4gd3JvdGU6Cj4+Pj4gT2ssIHNvIEknbGwgc2VuZCB2MiB3aXRoIHRoZSBmb2xsb3dpbmcgY2hh
bmdlczoKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L21pc2MveGVuLWtiZGZy
b250LmMKPj4+PiBiL2RyaXZlcnMvaW5wdXQvbWlzYy94ZW4ta2JkZnJvbnQuYwo+Pj4+IGluZGV4
IGEzMzA2YWFkNDBiMC4uZDhjY2EyMTJmNzM3IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvaW5w
dXQvbWlzYy94ZW4ta2JkZnJvbnQuYwo+Pj4+ICsrKyBiL2RyaXZlcnMvaW5wdXQvbWlzYy94ZW4t
a2JkZnJvbnQuYwo+Pj4+IEBAIC01MSwxMyArNTEsMTMgQEAgbW9kdWxlX3BhcmFtX2FycmF5KHB0
cl9zaXplLCBpbnQsIE5VTEwsIDA0NDQpOwo+Pj4+ICDCoCBNT0RVTEVfUEFSTV9ERVNDKHB0cl9z
aXplLAo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgICJQb2ludGluZyBkZXZpY2Ugd2lkdGgsIGhlaWdo
dCBpbiBwaXhlbHMgKGRlZmF1bHQgODAwLDYwMCkiKTsKPj4+Pgo+Pj4+IC1zdGF0aWMgdW5zaWdu
ZWQgaW50IG5vX3B0cl9kZXY7Cj4+Pj4gLW1vZHVsZV9wYXJhbShub19wdHJfZGV2LCB1aW50LCAw
KTsKPj4+PiArc3RhdGljIGJvb2wgbm9fcHRyX2RldjsKPj4+PiArbW9kdWxlX3BhcmFtKG5vX3B0
cl9kZXYsIGJvb2wsIDApOwo+Pj4+ICDCoCBNT0RVTEVfUEFSTV9ERVNDKG5vX3B0cl9kZXYsCj4+
Pj4gIMKgwqDCoMKgwqDCoMKgwqAgIklmIHNldCB0aGVuIG5vIHZpcnR1YWwgcG9pbnRpbmcgZGV2
aWNlIGV4cG9zZWQgdG8gdGhlIGd1ZXN0Iik7Cj4+Pj4KPj4+PiAtc3RhdGljIHVuc2lnbmVkIGlu
dCBub19rYmRfZGV2Owo+Pj4+IC1tb2R1bGVfcGFyYW0obm9fa2JkX2RldiwgdWludCwgMCk7Cj4+
Pj4gK3N0YXRpYyBib29sIG5vX2tiZF9kZXY7Cj4+Pj4gK21vZHVsZV9wYXJhbShub19rYmRfZGV2
LCBib29sLCAwKTsKPj4+PiAgwqAgTU9EVUxFX1BBUk1fREVTQyhub19rYmRfZGV2LAo+Pj4+ICDC
oMKgwqDCoMKgwqDCoMKgICJJZiBzZXQgdGhlbiBubyB2aXJ0dWFsIGtleWJvYXJkIGRldmljZSBl
eHBvc2VkIHRvIHRoZSBndWVzdCIpOwo+Pj4gSSBwcmVmZXIgZGlyZWN0IGxvZ2ljIG92ZXIgaW52
ZXJzZSBsb2dpYy7CoCBNYXliZSBqdXN0IHVzZSBrYmRfZGV2LAo+Pj4gZGVmYXVsdCB0byB0cnVl
LCBidXQgYWxsb3cgaXQgdG8gYmUgc2V0IG9mZj8KPj4+Cj4+PiBzdGF0aWMgYm9vbCBrYmRfZGV2
ID0gdHJ1ZTsKPj4+IG1vZHVsZV9wYXJhbShrYmRfZGV2LCBib29sLCAwKTsKPj4gSSBoYXZlIG5v
IHByZWZlcmVuY2UgaGVyZSwgZWl0aGVyIHdheSB3b3JrcyBmb3IgbWUKPj4gSnVlcmdlbiwgd2hh
dCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhlIGFib3ZlPwo+IEkgcmVhbGx5IGhhdmUgbm8gcHJlZmVy
ZW5jZSBoZXJlLiBXaGF0IHNob3VsZCBiZSB0YWtlbiBpbnRvIGFjY291bnQgaXMKPiB0aGF0IGJv
b2xlYW4gcGFyYW1ldGVycyBkb24ndCBuZWVkIGEgdmFsdWUsIG1lYW5pbmcgInRydWUiIGluIHRo
YXQgY2FzZS4KPiBUaGlzIHdvdWxkIG1ha2Ugbm8gc2Vuc2UgZm9yICJrYmRfZGV2IiBhcyBpdCB3
b3VsZG4ndCBjaGFuZ2UgdGhlCj4gZGVmYXVsdC4KVGhlbiBJJ2xsIGdvIHdpdGggdGhlIGRpZmYg
YWJvdmUsIGUuZy4gYm9vbGVhbiBub197a2JkfHB0cn0pZGV2Cj4gSnVlcmdlbgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
