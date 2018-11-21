From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH V8 4/7] x86/p2m: refactor p2m_reset_altp2m()
Date: Wed, 21 Nov 2018 11:48:24 +0000
Message-ID: <1dc9b319-f716-2891-61f4-49992a074789@citrix.com>
References: <1542795594-4252-1-git-send-email-rcojocaru@bitdefender.com>
 <1542795594-4252-5-git-send-email-rcojocaru@bitdefender.com>
 <5BF5384502000078001FE654@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AZPx=OA=citrix.com=prvs=856900a8f=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gPQzf-0001tU-CU
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 11:48:31 +0000
In-Reply-To: <5BF5384502000078001FE654@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMjEvMTggMTA6NDkgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIxLjExLjE4
IGF0IDExOjE5LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+IFJlZmFjdG9y
IHAybV9yZXNldF9hbHRwMm0oKSBzbyB0aGF0IGl0IGNhbiBiZSB1c2VkIHRvIHJlbW92ZQo+PiBy
ZWR1bmRhbnQgY29kZXBhdGhzLCBmaXhpbmcgdGhlIGxvY2tpbmcgd2hpbGUgd2UncmUgYXQgaXQu
Cj4gCj4gU3RpbGwgbm8gd29yZCBhYm91dCAuLi4KPiAKPj4gK3N0YXRpYyB2b2lkIHAybV9yZXNl
dF9hbHRwMm0oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGlkeCwKPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZW51bSBhbHRwMm1fcmVzZXRfdHlwZSByZXNldF90eXBlKQo+
PiArewo+PiArICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm07Cj4+ICsKPj4gKyAgICBBU1NFUlQo
aWR4IDwgTUFYX0FMVFAyTSk7Cj4+ICsgICAgcDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2lkeF07
Cj4+ICsKPj4gKyAgICBwMm1fbG9jayhwMm0pOwo+PiArCj4+ICsgICAgcDJtX2ZsdXNoX3RhYmxl
X2xvY2tlZChwMm0pOwo+PiArCj4+ICsgICAgaWYgKCByZXNldF90eXBlID09IEFMVFAyTV9ERUFD
VElWQVRFICkKPj4gKyAgICAgICAgcDJtX2ZyZWVfbG9nZGlydHkocDJtKTsKPj4gKwo+PiArICAg
IC8qIFVuaW5pdCBhbmQgcmVpbml0IGVwdCB0byBmb3JjZSBUTEIgc2hvb3Rkb3duICovCj4+ICsg
ICAgZXB0X3AybV91bmluaXQocDJtKTsKPj4gKyAgICBlcHRfcDJtX2luaXQocDJtKTsKPj4gKwo+
PiArICAgIHAybS0+bWluX3JlbWFwcGVkX2dmbiA9IGdmbl94KElOVkFMSURfR0ZOKTsKPj4gKyAg
ICBwMm0tPm1heF9yZW1hcHBlZF9nZm4gPSAwOwo+IAo+IC4uLiB0aGVzZSBub3cgZG9uZSBldmVu
IHdoZW4gcHJldmlvdXNseSB0aGV5IHdlcmVuJ3Q/IEluIGZhY3QsCj4gaGF2aW5nIGxvb2tlZCBh
Z2FpbiwgaXQgc2VlbXMgYXMgaWYgdGhlaXIgb21pc3Npb24gZnJvbSBlLmcuCj4gcDJtX2ZsdXNo
X2FsdHAybSgpIHdhcyBhIG1pc3Rha2UgYmVmb3JlLCB3aGljaCB5b3Ugbm93IGZpeC4KCkFzIFJh
enZhbiBzYXlzLCBpdCB3YXNuJ3QgYSBjb3JyZWN0bmVzcyBpc3N1ZTsgaW4gdGhlIG90aGVyIHR3
bwoicmVzZXQtbGlrZSIgYml0cyBvZiBjb2RlLCB0aGUgYWx0cDJtIGlkeCB3YXMgZGlzYWJsZWQ7
IHdoaWNoIGd1YXJhbnRlZWQKdGhhdCBiZWZvcmUgYmVpbmcgdXNlZCBhZ2FpbiBpdCB3b3VsZCBn
byB0aHJvdWdoIHAybV9pbml0X2FsdHAybV9lcHQoKSwKd2hpY2ggcmVzZXRzIHRoZW0uCgpIaXMg
Zmlyc3QgdmVyc2lvbiBvZiB0aGlzIHBhdGNoIGFjdHVhbGx5IGhhZCB0aGVzZSBzZXQgY29uZGl0
aW9uYWxseSwgc28KdGhleSdkIG9ubHkgYmUgcmVzZXQgaW4gdGhlIGNhc2Ugd2hlcmUgdGhleSB3
ZXJlIHJlc2V0IG9yaWdpbmFsbHkuIEkKYXNrZWQgaGltIHRvIHRha2UgaXQgb3V0OiBzYXZpbmcg
dHdvIHJlZHVuZGFudCBtZW1vcnkgd3JpdGVzIGlzbid0IHdvcnRoCnRoZSBleHRyYSBjb25kaXRp
b25hbCBhbmQgdGhlIGV4dHJhIGFyZ3VtZW50LgoKU28gdGhlIGNvZGUgaXMgdGhlIHdheSBpdCBz
aG91bGQgYmU7IGJ1dCBpdCBzaG91bGQgYmUgbWVudGlvbmVkIGluIHRoZQpjb21taXQgbWVzc2Fn
ZSwgc28gdGhhdCByZXZpZXdlcnMgLyBhcmNoYWVvbG9naXN0cyBjYW4gc2ltcGx5IHZlcmlmeSBp
dApyYXRoZXIgdGhhbiByZS1kaXNjb3ZlcmluZyBpdC4KCiAtR2VvcmdlCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
