From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] x86/msr: Definitions for
 MSR_INTEL_CORE_THREAD_COUNT
Date: Mon, 15 Apr 2019 09:29:56 +0100
Message-ID: <1d3c66a8-d964-0e92-ba68-9cf5cb1fb384@citrix.com>
References: <1555172532-23814-1-git-send-email-andrew.cooper3@citrix.com>
 <1555172532-23814-3-git-send-email-andrew.cooper3@citrix.com>
 <5CB43C2E02000078001553EC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6R5j=SR=citrix.com=prvs=00163ee2b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hFx0r-0001UQ-91
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 08:30:49 +0000
In-Reply-To: <5CB43C2E02000078001553EC@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDQvMjAxOSAwOTowOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gMDQvMTMvMTkgNjoyMiBQTSA+Pj4tLS0gYS94
ZW4vYXJjaC94ODYvbXNyLmMrKysgYi94ZW4vYXJjaC94ODYvbXNyLmMKPj4gQEAgLTEzMSw2ICsx
MzEsNyBAQCBpbnQgZ3Vlc3RfcmRtc3IoY29uc3Qgc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90IG1z
ciwgdWludDY0X3QgKnZhbCkKPj4gY2FzZSBNU1JfUFJFRF9DTUQ6Cj4+IGNhc2UgTVNSX0ZMVVNI
X0NNRDoKPj4gLyogV3JpdGUtb25seSAqLwo+PiArICAgIGNhc2UgTVNSX0lOVEVMX0NPUkVfVEhS
RUFEX0NPVU5UOgo+PiBjYXNlIE1TUl9UU1hfRk9SQ0VfQUJPUlQ6Cj4+IC8qIE5vdCBvZmZlcmVk
IHRvIGd1ZXN0cy4gKi8KPj4gZ290byBncF9mYXVsdDsKPiBJbiBhIHByaXZhdGUgdGFsayB3ZSBo
YWQsIGRpZG4ndCB5b3UgbWVudGlvbiB0aGVyZSBpcyBhdCBsZWFzdCBvbmUgT1MgKHdhcyBpdCBP
U1gpCj4gdGhhdCB1bmNvbmRpdGlvbmFsbHkgcmVhZHkgdGhpcyBNU1I/IERlc3BpdGUgYXNzdW1p
bmcgdGhlcmUgYXJlIG90aGVyIGlzc3Vlcwo+IHdpdGggT1NYLCB3b3VsZG4ndCBpdCBiZSBiZXR0
ZXIgdG8gYXZvaWQgZ2l2aW5nICNHUCgwKSBiYWNrIGhlcmU/IEkgcmVhbGl6ZSB3ZSBjYW4ndAo+
IHlldCBnaXZlIGJhY2sgYSBmdWxseSBjb25zaXN0ZW50IHZhbHVlIGhlcmUsIGxvb2tpbmcgYXQg
d2hhdCBjb25jbHVzaW9ucyBMaW51eAo+IGRyYXdzIGZyb20gb3RoZXIgQ1BVSUQgb3V0cHV0LCBj
b3VsZG4ndCAweDAwMDEwMDAxIGJlIHVzZWQgYXMgImZha2UiIHZhbHVlPwoKSSBkaWQgY29uc2lk
ZXIgdGhhdCBvcHRpb24sIGJ1dCBmb3IgYW55b25lIGxvb2tpbmcgYXQgdGhpcyBNU1IsIGl0IGlz
Cmxpa2VseSB0byBtYWtlIHRoZSBzaXR1YXRpb24gd29yc2UgcmF0aGVyIHRoYW4gYmV0dGVyLgoK
VGhlIG90aGVyIG9wdGlvbiB0byBjb25zaWRlciBpcyByZXRhaW5pbmcgdGhlIGN1cnJlbnQgbGVh
a3kgYmVoYXZpb3VyLsKgClRoZXJlIGhhdmVuJ3QgYmVlbiBvYnZpb3VzIHByb2JsZW1zIHRodXMg
ZmFyLCBhbmQgdGhlIGFjY3VyYXRlIHRvcG9sb2d5CmluZm9ybWF0aW9uIGlzIGdvaW5nIHRvIGJl
IGFycml2aW5nIHNob3J0bHkgdG8gbWVzaCBpbiB3aXRoIHRoZSBjb3JlCnNjaGVkdWxpbmcgd29y
ay4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
