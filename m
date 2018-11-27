From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] xen: only clobber multicall elements
 without error
Date: Tue, 27 Nov 2018 09:16:36 +0000
Message-ID: <e458293e-2208-b56b-2397-3897d2363534@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=By1U=OG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gRZU2-0000v4-74
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 09:16:42 +0000
References: =?UTF-8?B?PDIwMTgxMTIzMTMyNTE2LjI4Njgx77+977+977+977+9Me+/vQ==?=
 =?UTF-8?B?77+977+977+9amdyb3NzQHN1c2UuY29tPiA8NUJGQkQxQzYwMjAwMDA3ODAwMUZG?=
 =?UTF-8?B?RTA5QHN1c2UuY29tPiA8ZDM4YjFjMzPvv701Y2Nh77+9NTcyYe+/vWE5NDLvv71i?=
 =?UTF-8?Q?1db8ca309a2=40suse=2ecom=3e_=3c5BFBFCD3020000780020004F=40suse=2e?=
 =?UTF-8?Q?com=3e_=3c955bec0d-f574-53c5-91a5-1d6ea0bc4f2a=40suse=2ecom=3e_?=
 =?UTF-8?Q?=3c5BFC0A1302000078002000E1=40suse=2ecom=3e_=3c06592737-411f-d518?=
 =?UTF-8?Q?-d972-6b4cdc704d9b=40suse=2ecom=3e_=3c4c7158b4-d4da-994e-545b-8f5?=
 =?UTF-8?Q?dec97dbb6=40arm=2ecom=3e_=3c2b040ede-2103-b93c-c005-5ff39ae21c4c?=
 =?UTF-8?Q?=40suse=2ecom=3e_=3c1d49ab74-9aaf-d3e4-9e19-ecba83c247c1=40arm=2e?=
 =?UTF-8?Q?com=3e_=3c7c650150-e836-bbcf-4a2b-fe077620c747=40suse=2ecom=3e?=
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMS8yNy8xOCA3OjM0IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDI2LzEx
LzIwMTggMTc6NTEsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4KPj4KPj4gT24gMjYvMTEvMjAxOCAx
NjoxNywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+IE9uIDI2LzExLzIwMTggMTc6MDEsIEp1bGll
biBHcmFsbCB3cm90ZToKPj4+Pgo+Pj4+Cj4+Pj4gT24gMjYvMTEvMjAxOCAxNToyOSwgSnVlcmdl
biBHcm9zcyB3cm90ZToKPj4+Pj4gT24gMjYvMTEvMjAxOCAxNTo1OCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4+Pj4+PiBPbiAyNi4xMS4xOCBhdCAxNToyMywgPGpncm9zc0BzdXNlLmNvbT4gd3Jv
dGU6Cj4+Pj4+Pj4gT24gMjYvMTEvMjAxOCAxNTowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+
Pj4+Pj4+IE9uIDI2LjExLjE4IGF0IDE0OjUyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4g
U2Vjb25kbHksIHlvdSBhcmUgaW50cm9kdWNpbmcgYW4gQUJJIGNoYW5nZSB3aXRob3V0IGV4cGxp
Y2l0bHkgdGVsbGluZwo+PiBpdC4gVGhpcyBzaG91bGQgYmUgY2xhcmlmaWVkIGluIHRoZSBwdWJs
aWMgaW50ZXJmYWNlIGFuZCBwcm9iYWJseSB0aGUKPj4gbXVsdGljYWxsIGNvZGUgdG8gYXZvaWQg
cmUtaW50cm9kdWNpbmcgdGhlIGNsb2JiZXJpbmcgaW4gdGhlIGZ1dHVyZS4KPiAKPiBObywgSSBk
b24ndCB0aGluayBJJ20gaW50cm9kdWNpbmcgYW4gQUJJIGNoYW5nZS4gVGhlcmUgaXMgbm8gZ3Vh
cmFudGVlCj4gWGVuIHdpbGwgY2xvYmJlciBhbGwgbXVsdGljYWxsIGFyZ3VtZW50cy4gSW4gZmFj
dCBhIE5ERUJVRyBoeXBlcnZpc29yCj4gbmV2ZXIgZG9lcy4gVGhlIGd1ZXN0IG11c3Qgbm90IHJl
bHkgb24gbm9uLWNsb2JiZXJlZCB2YWx1ZXMsIG9mIGNvdXJzZS4KClRoZSBsYXN0IHNlbnRlbmNl
IGlzIHdoYXQgdGhlIEFCSSBwcm9taXNlcyB5b3UuIFRoZSByZXN0IGlzIGEgCmltcGxlbWVudGF0
aW9uIGRlY2lzaW9uIHRvIGF2b2lkIHBlcmZvcm1hbmNlIGltcGFjdC4KCklmIHlvdSBkb24ndCBj
aGFuZ2UgdGhlIEFCSSwgdGhlbiBob3cgdGhlIGd1ZXN0IHdpbGwgYmUgYWJsZSB0byBrbm93IHRo
ZSAKdmFsdWVzIGFyZSBjb3JyZWN0PyBGdXJ0aGVybW9yZSwgYXMgeW91ciBjaGFuZ2UgYXJlIG5v
dCBkb2N1bWVudGVkIGhvdyAKZG8geW91IGd1YXJhbnRlZSB0aGF0IHRoaXMgd2lsbCBub3QgYmUg
cmV2ZXJ0ZWQgaW4gdGhlIGZ1dHVyZT8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
