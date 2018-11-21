From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V8 4/7] x86/p2m: refactor p2m_reset_altp2m()
Date: Wed, 21 Nov 2018 12:57:27 +0200
Message-ID: <477bb458-e5a3-6ea8-fe74-8c3ab6d2ba9d@bitdefender.com>
References: <1542795594-4252-1-git-send-email-rcojocaru@bitdefender.com>
 <1542795594-4252-5-git-send-email-rcojocaru@bitdefender.com>
 <5BF5384502000078001FE654@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rqmg=oa=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gPQCN-0005fo-FI
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 10:57:35 +0000
In-Reply-To: <5BF5384502000078001FE654@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMjEvMTggMTI6NDkgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIxLjExLjE4
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
X2FsdHAybSgpIHdhcyBhIG1pc3Rha2UgYmVmb3JlLCB3aGljaCB5b3Ugbm93IGZpeC4KClJpZ2h0
LCB0aGF0J3MgYW4gb21pc3Npb24gSSdsbCByZWN0aWZ5IGluIHRoZSBuZXh0IHZlcnNpb24uCgpB
Y2NvcmRpbmcgdG8gYSBwcmV2aW91cyByZXZpZXcgZnJvbSBHZW9yZ2UsIEknbSBub3Qgbm93IGZp
eGluZyBhIHByb2JsZW0Kc2luY2UgdGhlIGFzc2lnbm1lbnQgd2FzIG5vdCByZXF1aXJlZCwgaG93
ZXZlciBpdCBpcyBoYXJtbGVzcyAoYW5kCnBlcmhhcHMgcHJlZmVycmFibGUpLiBBRkFJQ1QgaXQg
ZG9lcyBub3QgZml4IGEgY29ycmVjdG5lc3MgaXNzdWUuCgoKVGhhbmtzLApSYXp2YW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
