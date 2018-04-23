From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] xpti: fix bug in double fault handling
Date: Mon, 23 Apr 2018 15:05:25 +0100
Message-ID: <02f281ed-b488-5afa-9017-ed63c9fd016c@citrix.com>
References: <20180423135927.16996-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=suz6=hm=citrix.com=prvs=644318916=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fAc7J-0003Og-Bn
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 14:06:53 +0000
In-Reply-To: <20180423135927.16996-1-jgross@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDQvMTggMTQ6NTksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gV2hlbiBlbnRlcmluZyB0
aGUgaHlwZXJ2aXNvciB2aWEgdGhlIGRvdWJsZSBmYXVsdCBoYW5kbGVyIHJlc2V0dGluZwo+IHhl
bl9jcjMgd2FzIG1pc3NpbmcuIFRoaXMgbGVkIHRvIHN3aXRjaGluZyB0byBwdl9jcjMgd2hlbiBy
ZXR1cm5pbmcKPiBmcm9tIHRoZSBuZXh0IGZvbGxvd2luZyBleGNlcHRpb24sIHNvIHJlcGFpciB0
aGlzIGluIG9yZGVyIHRvIGFsbG93Cj4gZXhjZXB0aW9uIGhhbmRsaW5nIHRvIHdvcmsgZXZlbiBh
ZnRlciBhIGRvdWJsZSBmYXVsdC4KPgo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgpUZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+Cgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYveDg2XzY0L2VudHJ5LlMgfCA0ICsrKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvZW50cnkuUyBiL3hlbi9hcmNoL3g4Ni94ODZf
NjQvZW50cnkuUwo+IGluZGV4IDQ1ZDk4NDJkMDkuLjFjZDdkOTM4OTIgMTAwNjQ0Cj4gLS0tIGEv
eGVuL2FyY2gveDg2L3g4Nl82NC9lbnRyeS5TCj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC9l
bnRyeS5TCj4gQEAgLTc2NywxMiArNzY3LDE0IEBAIEVOVFJZKGRvdWJsZV9mYXVsdCkKPiAgICAg
ICAgICAvKiBXQVJOSU5HISBgcmV0YCwgYGNhbGwgKmAsIGBqbXAgKmAgbm90IHNhZmUgYmVmb3Jl
IHRoaXMgcG9pbnQuICovCj4gIAo+ICAgICAgICAgIG1vdiAgIFNUQUNLX0NQVUlORk9fRklFTEQo
eGVuX2NyMykoJXIxNCksICVyYngKPiAtICAgICAgICB0ZXN0ICAlcmJ4LCAlcmJ4Cj4gKyAgICAg
ICAgbmVnICAgJXJieAo+ICAgICAgICAgIGp6ICAgIC5MZGJsZl9jcjNfb2theQo+ICAgICAgICAg
IGpucyAgIC5MZGJsZl9jcjNfbG9hZAo+ICsgICAgICAgIG1vdiAgICVyYngsIFNUQUNLX0NQVUlO
Rk9fRklFTEQoeGVuX2NyMykoJXIxNCkKPiAgICAgICAgICBuZWcgICAlcmJ4Cj4gIC5MZGJsZl9j
cjNfbG9hZDoKPiAgICAgICAgICBtb3YgICAlcmJ4LCAlY3IzCj4gKyAgICAgICAgbW92cSAkMCwg
U1RBQ0tfQ1BVSU5GT19GSUVMRCh4ZW5fY3IzKSglcjE0KQo+ICAuTGRibGZfY3IzX29rYXk6Cj4g
IAo+ICAgICAgICAgIG1vdnEgICVyc3AsJXJkaQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
