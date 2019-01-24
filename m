From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH SpectreV1+L1TF v4 01/11] is_control_domain:
 block speculation
Date: Thu, 24 Jan 2019 13:07:12 +0100
Message-ID: <ce71286a-12a4-5f1b-0881-1f8c2623caf9@amazon.de>
References: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
 <1548244285-30813-2-git-send-email-nmanthey@amazon.de>
 <5C486A2E0200007800210694@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jkVq=QA=amazon.de=prvs=920ead099=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gmdnB-0000FP-0k
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 12:07:33 +0000
In-Reply-To: <5C486A2E0200007800210694@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMS8yMy8xOSAxNDoyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjMuMDEuMTkgYXQg
MTI6NTEsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+PiAtLS0gYS94ZW4vaW5jbHVkZS94
ZW4vbm9zcGVjLmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL25vc3BlYy5oCj4+IEBAIC01OCw2
ICs1OCwyMSBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgYXJyYXlfaW5kZXhfbWFza19u
b3NwZWModW5zaWduZWQgbG9uZyBpbmRleCwKPj4gICAgICAodHlwZW9mKF9pKSkgKF9pICYgX21h
c2spOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gIH0pCj4+
ICAKPj4gKy8qCj4+ICsgKiBhbGxvdyB0byBpbnNlcnQgYSByZWFkIG1lbW9yeSBiYXJyaWVyIGlu
dG8gY29uZGl0aW9uYWxzCj4+ICsgKi8KPj4gKyNpZmRlZiBDT05GSUdfWDg2Cj4+ICtzdGF0aWMg
aW5saW5lIGJvb2wgbGZlbmNlX3RydWUodm9pZCkgeyBybWIoKTsgcmV0dXJuIHRydWU7IH0KPj4g
KyNlbHNlCj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgbGZlbmNlX3RydWUodm9pZCkgeyByZXR1cm4g
dHJ1ZTsgfQo+PiArI2VuZGlmCj4+ICsKPj4gKy8qCj4+ICsgKiBwcm90ZWN0IGV2YWx1YXRpb24g
b2YgY29uZGl0aW9uYWwgd2l0aCByZXNwZWN0IHRvIHNwZWN1bGF0aW9uCj4+ICsgKi8KPj4gKyNk
ZWZpbmUgZXZhbHVhdGVfbm9zcGVjKGNvbmRpdGlvbikgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPj4gKyAgICAoKChjb25kaXRpb24pICYmIGxmZW5jZV90cnVlKCkpIHx8
ICFsZmVuY2VfdHJ1ZSgpKQo+IEl0IG1heSBiZSBqdXN0IG1lLCBidXQgSSB0aGluawo+Cj4gI2Rl
ZmluZSBldmFsdWF0ZV9ub3NwZWMoY29uZGl0aW9uKSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ICAgICAoKGNvbmRpdGlvbikgPyBsZmVuY2VfdHJ1ZSgpIDogIWxmZW5j
ZV90cnVlKCkpCj4KPiB3b3VsZCBiZXR0ZXIgZXhwcmVzcyB0aGUgdHdvLXdheSBuYXR1cmUgb2Yg
dGhpcy4KCkkgY29tcGFyZWQgdGhlIGJpbmFyeSBvdXRwdXQgb2YgdGhlIHR3byB2YXJpYW50cywg
YW5kIHRoZXkgYXJlIHRoZSBzYW1lCihmb3IgbXkgYnVpbGQgZW52aXJvbm1lbnQpLiBJJ2xsIHN3
aXRjaCB0byB5b3VyIHZhcmlhbnQsIGluIGNhc2Ugbm9ib2R5Cm9iamVjdHMuCgpCZXN0LApOb3Ji
ZXJ0Cgo+Cj4gSmFuCj4KPgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21i
SApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IENocmlzdGlh
biBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKVXN0LUlEOiBERSAyODkgMjM3IDg3OQpFaW5nZXRy
YWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyBIUkIgMTQ5MTczIEIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
