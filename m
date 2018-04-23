From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH-for-4.11 v2] xpti: fix bug in double fault
 handling
Date: Mon, 23 Apr 2018 14:06:01 +0100
Message-ID: <134e8c26-d270-d14b-0d8c-27c19a2ac6c4@citrix.com>
References: <20180423123806.12650-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=suz6=hm=citrix.com=prvs=644318916=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fAbAg-0007LP-H7
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 13:06:18 +0000
In-Reply-To: <20180423123806.12650-1-jgross@suse.com>
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

T24gMjMvMDQvMTggMTM6MzgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gV2hlbiBlbnRlcmluZyB0
aGUgaHlwZXJ2aXNvciB2aWEgdGhlIGRvdWJsZSBmYXVsdCBoYW5kbGVyIHJlc2V0dGluZwo+IHhl
bl9jcjMgd2FzIG1pc3NpbmcuIFRoaXMgbGVkIHRvIHN3aXRjaGluZyB0byBwdl9jcjMgd2hlbiBy
ZXR1cm5pbmcKPiBmcm9tIHRoZSBuZXh0IGZvbGxvd2luZyBpbnRlcnJ1cHQuIFNvIHJlcGFpciB0
aGlzIGluIG9yZGVyIHRvIGFsbG93Cj4gaW50ZXJydXB0IGhhbmRsaW5nIHRvIHdvcmsgZXZlbiBh
ZnRlciBhIGRvdWJsZSBmYXVsdC4KPgo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L3g4Nl82NC9lbnRyeS5TIHwgMSAr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni94ODZfNjQvZW50cnkuUyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvZW50cnkuUwo+IGlu
ZGV4IDQ1ZDk4NDJkMDkuLjI1NDI3YjBjZWMgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L3g4
Nl82NC9lbnRyeS5TCj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC9lbnRyeS5TCj4gQEAgLTc3
Myw2ICs3NzMsNyBAQCBFTlRSWShkb3VibGVfZmF1bHQpCj4gICAgICAgICAgbmVnICAgJXJieAo+
ICAuTGRibGZfY3IzX2xvYWQ6Cj4gICAgICAgICAgbW92ICAgJXJieCwgJWNyMwo+ICsgICAgICAg
IG1vdnEgJDAsIFNUQUNLX0NQVUlORk9fRklFTEQoeGVuX2NyMykoJXIxNCkKPiAgLkxkYmxmX2Ny
M19va2F5Ogo+ICAKPiAgICAgICAgICBtb3ZxICAlcnNwLCVyZGkKCldoYXQgYWJvdXQgdGhlIG90
aGVyIHdyaXRlIGludG8geGVuX2NyMyB3aXRoIGEgbmVnYXRlZCB2YWx1ZT/CoCBXb24ndAp0aGlz
IHN0aWxsIGV4cGxvZGUgaWYgd2UgZ2V0IGFuIE5NSSBvciBNQ0UgYXQgdGhlIHdyb25nIG1vbWVu
dD8KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
