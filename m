From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V8 4/7] x86/p2m: refactor p2m_reset_altp2m()
Date: Wed, 21 Nov 2018 04:40:25 -0700
Message-ID: <5BF5442902000078001FE6D9@prv1-mh.provo.novell.com>
References: <1542795594-4252-1-git-send-email-rcojocaru@bitdefender.com>
 <1542795594-4252-5-git-send-email-rcojocaru@bitdefender.com>
 <5BF5384502000078001FE654@prv1-mh.provo.novell.com>
 <477bb458-e5a3-6ea8-fe74-8c3ab6d2ba9d@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FfYJ=OA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gPQrw-0001MJ-7c
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 11:40:32 +0000
In-Reply-To: <477bb458-e5a3-6ea8-fe74-8c3ab6d2ba9d@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjExLjE4IGF0IDExOjU3LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gMTEvMjEvMTggMTI6NDkgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAy
MS4xMS4xOCBhdCAxMToxOSwgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Pj4g
UmVmYWN0b3IgcDJtX3Jlc2V0X2FsdHAybSgpIHNvIHRoYXQgaXQgY2FuIGJlIHVzZWQgdG8gcmVt
b3ZlCj4+PiByZWR1bmRhbnQgY29kZXBhdGhzLCBmaXhpbmcgdGhlIGxvY2tpbmcgd2hpbGUgd2Un
cmUgYXQgaXQuCj4+IAo+PiBTdGlsbCBubyB3b3JkIGFib3V0IC4uLgo+PiAKPj4+ICtzdGF0aWMg
dm9pZCBwMm1fcmVzZXRfYWx0cDJtKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBpZHgs
Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIGFsdHAybV9yZXNldF90eXBl
IHJlc2V0X3R5cGUpCj4+PiArewo+Pj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtOwo+Pj4g
Kwo+Pj4gKyAgICBBU1NFUlQoaWR4IDwgTUFYX0FMVFAyTSk7Cj4+PiArICAgIHAybSA9IGQtPmFy
Y2guYWx0cDJtX3AybVtpZHhdOwo+Pj4gKwo+Pj4gKyAgICBwMm1fbG9jayhwMm0pOwo+Pj4gKwo+
Pj4gKyAgICBwMm1fZmx1c2hfdGFibGVfbG9ja2VkKHAybSk7Cj4+PiArCj4+PiArICAgIGlmICgg
cmVzZXRfdHlwZSA9PSBBTFRQMk1fREVBQ1RJVkFURSApCj4+PiArICAgICAgICBwMm1fZnJlZV9s
b2dkaXJ0eShwMm0pOwo+Pj4gKwo+Pj4gKyAgICAvKiBVbmluaXQgYW5kIHJlaW5pdCBlcHQgdG8g
Zm9yY2UgVExCIHNob290ZG93biAqLwo+Pj4gKyAgICBlcHRfcDJtX3VuaW5pdChwMm0pOwo+Pj4g
KyAgICBlcHRfcDJtX2luaXQocDJtKTsKPj4+ICsKPj4+ICsgICAgcDJtLT5taW5fcmVtYXBwZWRf
Z2ZuID0gZ2ZuX3goSU5WQUxJRF9HRk4pOwo+Pj4gKyAgICBwMm0tPm1heF9yZW1hcHBlZF9nZm4g
PSAwOwo+PiAKPj4gLi4uIHRoZXNlIG5vdyBkb25lIGV2ZW4gd2hlbiBwcmV2aW91c2x5IHRoZXkg
d2VyZW4ndD8gSW4gZmFjdCwKPj4gaGF2aW5nIGxvb2tlZCBhZ2FpbiwgaXQgc2VlbXMgYXMgaWYg
dGhlaXIgb21pc3Npb24gZnJvbSBlLmcuCj4+IHAybV9mbHVzaF9hbHRwMm0oKSB3YXMgYSBtaXN0
YWtlIGJlZm9yZSwgd2hpY2ggeW91IG5vdyBmaXguCj4gCj4gUmlnaHQsIHRoYXQncyBhbiBvbWlz
c2lvbiBJJ2xsIHJlY3RpZnkgaW4gdGhlIG5leHQgdmVyc2lvbi4KPiAKPiBBY2NvcmRpbmcgdG8g
YSBwcmV2aW91cyByZXZpZXcgZnJvbSBHZW9yZ2UsIEknbSBub3Qgbm93IGZpeGluZyBhIHByb2Js
ZW0KPiBzaW5jZSB0aGUgYXNzaWdubWVudCB3YXMgbm90IHJlcXVpcmVkLCBob3dldmVyIGl0IGlz
IGhhcm1sZXNzIChhbmQKPiBwZXJoYXBzIHByZWZlcnJhYmxlKS4gQUZBSUNUIGl0IGRvZXMgbm90
IGZpeCBhIGNvcnJlY3RuZXNzIGlzc3VlLgoKTm90IGEgY29ycmVjdG5lc3Mgb25lLCBhZ3JlZWQs
IGJ1dCBhbiBlZmZpY2llbmN5IG9uZT8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
