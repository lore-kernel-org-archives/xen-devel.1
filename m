From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/3] xen: drop in_atomic()
Date: Wed, 22 May 2019 12:19:30 +0200
Message-ID: <f100e5be-cf19-bf28-c113-b07b4fe99c59@suse.com>
References: <20190522094549.28397-1-jgross@suse.com>
 <20190522094549.28397-2-jgross@suse.com> <5CE52014020000780023147E@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aAGA=TW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hTOLO-0001gQ-2x
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 10:19:34 +0000
In-Reply-To: <5CE52014020000780023147E@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDUvMjAxOSAxMjoxMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjIuMDUuMTkg
YXQgMTE6NDUsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiAtLS0gYS94ZW4vYXJjaC94ODYv
aHZtL2h2bS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPj4gQEAgLTMxODUsMjIg
KzMxODUsNiBAQCBzdGF0aWMgZW51bSBodm1fdHJhbnNsYXRpb25fcmVzdWx0IF9faHZtX2NvcHko
Cj4+ICAKPj4gICAgICBBU1NFUlQoaXNfaHZtX3ZjcHUodikpOwo+PiAgCj4+IC0gICAgLyoKPj4g
LSAgICAgKiBYWFggRGlzYWJsZSBmb3IgNC4xLjA6IFBWLW9uLUhWTSBkcml2ZXJzIHdpbGwgZG8g
Z3JhbnQtdGFibGUgb3BzCj4+IC0gICAgICogc3VjaCBhcyBxdWVyeV9zaXplLiBHcmFudC10YWJs
ZSBjb2RlIGN1cnJlbnRseSBkb2VzIGNvcHlfdG8vZnJvbV9ndWVzdAo+PiAtICAgICAqIGFjY2Vz
c2VzIHVuZGVyIHRoZSBiaWcgcGVyLWRvbWFpbiBsb2NrLCB3aGljaCB0aGlzIHRlc3Qgd291bGQg
ZGlzYWxsb3cuCj4+IC0gICAgICogVGhlIHRlc3QgaXMgbm90IG5lZWRlZCB1bnRpbCB3ZSBpbXBs
ZW1lbnQgc2xlZXBpbmctb24td2FpdHF1ZXVlIHdoZW4KPj4gLSAgICAgKiB3ZSBhY2Nlc3MgYSBw
YWdlZC1vdXQgZnJhbWUsIGFuZCB0aGF0J3MgcG9zdCA0LjEuMCBub3cuCj4+IC0gICAgICovCj4+
IC0jaWYgMAo+PiAtICAgIC8qCj4+IC0gICAgICogSWYgdGhlIHJlcXVpcmVkIGd1ZXN0IG1lbW9y
eSBpcyBwYWdlZCBvdXQsIHRoaXMgZnVuY3Rpb24gbWF5IHNsZWVwLgo+PiAtICAgICAqIEhlbmNl
IHdlIGJhaWwgaW1tZWRpYXRlbHkgaWYgY2FsbGVkIGZyb20gYXRvbWljIGNvbnRleHQuCj4+IC0g
ICAgICovCj4+IC0gICAgaWYgKCBpbl9hdG9taWMoKSApCj4+IC0gICAgICAgIHJldHVybiBIVk1U
UkFOU191bmhhbmRsZWFibGU7Cj4+IC0jZW5kaWYKPiAKPiBEZWFsaW5nIHdpdGggdGhpcyBUT0RP
IGl0ZW0gaXMgb2YgY291cnNlIG11Y2ggYXBwcmVjaWF0ZWQsIGJ1dAo+IHNob3VsZCBpdCByZWFs
bHkgYmUgZGVsZXRlZCBhbHRvZ2V0aGVyPyBUaGUgYmlnLWRvbWFpbi1sb2NrIGlzc3VlCj4gaXMg
Z29uZSBhZmFpciwgaW4gd2hpY2ggY2FzZSBkcm9wcGluZyB0aGUgI2lmIDAgd291bGQgc2VlbQo+
IHBvc3NpYmxlIHRvIG1lLCBldmVuIGlmIGl0J3Mgbm90IHN0cmljdGx5IG5lZWRlZCB3aXRob3V0
IHRoZSBzbGVlcC0KPiBvbi13YWl0cXVldWUgYmVoYXZpb3IgbWVudGlvbmVkLgoKUXVlc3Rpb24g
aXMgd2hldGhlciBpdCBpcyB3b3J0aCB0byBrZWVwIGl0IHJlc3VsdGluZyBpbiB0aGUgbmVlZCB0
bwprZWVwIHByZWVtcHRfY291bnQoKSBhcyB3ZWxsLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
