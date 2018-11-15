From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V6 3/4] x86/mm: allocate logdirty_ranges for
 altp2ms
Date: Thu, 15 Nov 2018 14:14:59 +0200
Message-ID: <81dd8bbf-7e23-f1bc-48fe-96d9292ae0e9@bitdefender.com>
References: <1542228002-21075-1-git-send-email-rcojocaru@bitdefender.com>
 <1542228002-21075-4-git-send-email-rcojocaru@bitdefender.com>
 <5BED50F502000078001FC510@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cmxx=n2=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gNGY7-00057I-M1
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 12:15:07 +0000
In-Reply-To: <5BED50F502000078001FC510@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMTUvMTggMTI6NTYgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE0LjExLjE4
IGF0IDIxOjQwLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9tbS9wMm0uYwo+PiArKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPj4gQEAg
LTIyODIsNiArMjI4MiwzNCBAQCBib29sX3QgcDJtX2FsdHAybV9sYXp5X2NvcHkoc3RydWN0IHZj
cHUgKnYsIHBhZGRyX3QgZ3BhLAo+PiAgICAgIHJldHVybiAxOwo+PiAgfQo+PiAgCj4+ICtzdGF0
aWMgdm9pZCBwMm1fcmVzZXRfYWx0cDJtKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBp
ZHgsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgcmVzZXRfcmVtYXBwZWQs
IGJvb2wgZnJlZV9sb2dkaXJ0eV9yYW5nZXMpCj4gCj4gRXNwZWNpYWxseSB0aGUgY2FsbCBzaXRl
cyBhcmUgcXVpdGUgdWdseSB0byByZWFkIHdpdGggdHdvIGJvb2xlYW5zIGxpa2UKPiB0aGVzZS4g
RGlkIHlvdSBjb25zaWRlciBpbnRyb2R1Y2luZyBhbiB1bnNpZ25lZCBpbnQgZmxhZ3MgcGFyYW1l
dGVyCj4gaW5zdGVhZCwgd2l0aCBzdWl0YWJsZSBzeW1ib2xzIGNvbnN0YW50cyAjZGVmaW5lLWQg
dG8gbWFrZSB2aXNpYmxlCj4gYXQgdGhlIGNhbGwgc2l0ZXMgd2hhdCBiZWhhdmlvciBpcyB3YW50
ZWQ/CgpUaGF0J3MgYSB2ZXJ5IGdvb2QgaWRlYSwgSSdsbCBkbyB0aGF0LgoKClRoYW5rcywKUmF6
dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
