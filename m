From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH 11/12] hvmloader: use libacpi to build
 MCFG table
Date: Tue, 20 Mar 2018 03:36:57 -0600
Message-ID: <5AB0E44902000078001B3D54@prv-mh.provo.novell.com>
References: <cover.1520867740.git.x1917x@gmail.com>
 <d9da7e43b56986b7aca9c84ee93e41587f9d5ac1.1520867741.git.x1917x@gmail.com>
 <20180319174909.wrvclevtvttybuhi@MacBook-Pro-de-Roger.local>
 <20180320072053.0000138d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=3grj=gk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eyDhX-00052e-3k
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 09:37:03 +0000
In-Reply-To: <20180320072053.0000138d@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexey G <x1917x@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAzLjE4IGF0IDIyOjIwLCA8eDE5MTd4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24g
TW9uLCAxOSBNYXIgMjAxOCAxNzo0OTowOSArMDAwMAo+IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPiB3cm90ZToKPj5PbiBUdWUsIE1hciAxMywgMjAxOCBhdCAwNDozMzo1
NkFNICsxMDAwLCBBbGV4ZXkgR2VyYXNpbWVua28gd3JvdGU6Cj4+PiAtLS0gYS90b29scy9maXJt
d2FyZS9odm1sb2FkZXIvdXRpbC5jCj4+PiArKysgYi90b29scy9maXJtd2FyZS9odm1sb2FkZXIv
dXRpbC5jCj4+PiBAQCAtNzgyLDYgKzc4Miw2OSBAQCBpbnQgZ2V0X3BjX21hY2hpbmVfdHlwZSh2
b2lkKQo+Pj4gICAgICByZXR1cm4gbWFjaGluZV90eXBlOwo+Pj4gIH0KPj4+ICAKPj4+ICsjZGVm
aW5lIFBDSUVYQkFSX0FERFJfTUFTS182NE1CICAgICAofigoMVVMTCA8PCAyNikgLSAxKSkKPj4+
ICsjZGVmaW5lIFBDSUVYQkFSX0FERFJfTUFTS18xMjhNQiAgICAofigoMVVMTCA8PCAyNykgLSAx
KSkKPj4+ICsjZGVmaW5lIFBDSUVYQkFSX0FERFJfTUFTS18yNTZNQiAgICAofigoMVVMTCA8PCAy
OCkgLSAxKSkKPj4+ICsjZGVmaW5lIFBDSUVYQkFSX0xFTkdUSF9CSVRTKHJlZykgICAoKChyZWcp
ID4+IDEpICYgMykKPj4+ICsjZGVmaW5lIFBDSUVYQkFSRU4gICAgICAgICAgICAgICAgICAxICAK
Pj4KPj5QQ0lFWEJBUl9FTkFCTEUgbWF5YmU/Cj4gCj4gUENJRVhCQVJFTiBpcyBqdXN0IGFuIG9m
ZmljaWFsIG5hbWUgb2YgdGhpcyBiaXQgZnJvbSB0aGUKPiBJbnRlbCBkYXRhc2hlZXQuIDopIE9L
LCB3aWxsIHJlbmFtZSBpdCB0byBQQ0lFWEJBUl9FTkFCTEUuCgpJIHRoaW5rIHVzaW5nIG5hbWVz
IGZyb20gdGhlIGRhdGFzaGVldCAod2hlcmUgdGhleSBleGlzdCkgaXMKcHJlZmVyYWJsZSBpbiBj
YXNlcyBsaWtlIHRoaXMgb25lLgoKPj4+ICsgICAgc3dpdGNoIChQQ0lFWEJBUl9MRU5HVEhfQklU
UyhyZWcpKQo+Pj4gKyAgICB7Cj4+PiArICAgIGNhc2UgMDoKPj4+ICsgICAgICAgIGJhc2UgJj0g
UENJRVhCQVJfQUREUl9NQVNLXzI1Nk1COwo+Pj4gKyAgICAgICAgYnJlYWs7Cj4+PiArICAgIGNh
c2UgMToKPj4+ICsgICAgICAgIGJhc2UgJj0gUENJRVhCQVJfQUREUl9NQVNLXzEyOE1COwo+Pj4g
KyAgICAgICAgYnJlYWs7Cj4+PiArICAgIGNhc2UgMjoKPj4+ICsgICAgICAgIGJhc2UgJj0gUENJ
RVhCQVJfQUREUl9NQVNLXzY0TUI7Cj4+PiArICAgICAgICBicmVhazsgIAo+Pgo+Pk1pc3Npbmcg
bmV3bGluZXMsIHBsdXMgdGhpcyBsb29rcyBsaWtlIGl0IHdhbnRzIHRvIHVzZSB0aGUgZGVmaW5l
cwo+PmludHJvZHVjZWQgaW4gcGF0Y2ggNyAoUENJRVhCQVJfezY0LDEyOCwyNTZ9X0JVU0VTKS4g
QWxzbyBhbnkgcmVhc29uCj4+dGhpcyBwYXRjaCBhbmQgcGF0Y2ggNyBjYW5ub3QgYmUgcHV0IHNl
cXVlbnRpYWxseT8KPiAKPiBJIHRoaW5rIGFsbCB0aGVzZSAjZGVmaW5lcyBzaG91bGQgZmluZCBh
IHdheSB0byBwY2lfcmVncy5oLCBpdCBzZWVtcwo+IGxpa2UgYW4gYXBwcm9wcmlhdGUgcGxhY2Ug
Zm9yIHRoZW0uCgpJIGRvbid0IHRoaW5rIGRldmljZSBzcGVjaWZpYyBkZWZpbmVzIGJlbG9uZyBp
bnRvIHBjaV9yZWdzLmguCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
