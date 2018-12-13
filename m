From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 25/25] argo: implement the get_config op to
 query notification config
Date: Thu, 13 Dec 2018 07:32:12 -0700
Message-ID: <5C126D6C0200007800205E41@prv1-mh.provo.novell.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-26-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gXS2E-0005HH-FS
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 14:32:18 +0000
In-Reply-To: <1543627984-21394-26-git-send-email-christopher.w.clark@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <voreekf@madingley.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjEyLjE4IGF0IDAyOjMzLCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IC0tLSBhL3hlbi9jb21tb24vYXJnby5jCj4gKysrIGIveGVuL2NvbW1vbi9hcmdv
LmMKPiBAQCAtMTY1Niw2ICsxNjU2LDQ2IEBAIGFyZ29fc2VuZHYoc3RydWN0IGRvbWFpbiAqc3Jj
X2QsIGNvbnN0IGFyZ29fYWRkcl90ICpzcmNfYWRkciwKPiAgICAgIHJldHVybiAoIHJldCA8IDAg
KSA/IHJldCA6IGxlbjsKPiAgfQo+ICAKPiArc3RhdGljIHZvaWQKPiArYXJnb19nZXRfY29uZmln
KHN0cnVjdCBkb21haW4gKmQsIGFyZ29fZ2V0X2NvbmZpZ190ICpnZXRfY29uZmlnKQo+ICt7Cj4g
KyAgICB1bnNpZ25lZCBpbnQgbWV0aG9kID0gYXJnb19zaWduYWxfbWV0aG9kKGQpOwo+ICsKPiAr
ICAgIGdldF9jb25maWctPnNpZ25hbF9tZXRob2QgPSBtZXRob2Q7Cj4gKwo+ICsgICAgc3dpdGNo
ICggbWV0aG9kICkKPiArICAgIHsKPiArICAgICAgICBjYXNlIEFSR09fU0lHTkFMX01FVEhPRF9F
VlRDSE46Cj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICByZWFkX2xvY2soJmFyZ29fbG9jayk7
Cj4gKyAgICAgICAgICAgIHJlYWRfbG9jaygmZC0+YXJnby0+bG9jayk7Cj4gKwo+ICsgICAgICAg
ICAgICBnZXRfY29uZmlnLT5zaWduYWwuZXZ0Y2huID0gZC0+YXJnby0+ZXZ0Y2huX3BvcnQ7Cj4g
Kwo+ICsgICAgICAgICAgICByZWFkX3VubG9jaygmZC0+YXJnby0+bG9jayk7Cj4gKyAgICAgICAg
ICAgIHJlYWRfdW5sb2NrKCZhcmdvX2xvY2spOwo+ICsKPiArICAgICAgICAgICAgYXJnb19kcHJp
bnRrKCJzaWduYWwgZm9yIGRvbTolZCBldnRjaG4gJXVcbiIsIGQtPmRvbWFpbl9pZCwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgIGdldF9jb25maWctPnNpZ25hbC5ldnRjaG4pOwo+ICsKPiAr
ICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAgfQo+ICsgICAgICAgIGNhc2UgQVJHT19TSUdO
QUxfTUVUSE9EX1ZJUlE6Cj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICBnZXRfY29uZmlnLT5z
aWduYWwudmlycSA9IFZJUlFfQVJHTzsKPiArCj4gKyAgICAgICAgICAgIGFyZ29fZHByaW50aygi
c2lnbmFsIGZvciBkb206JWQgdmlycSAldVxuIiwgZC0+ZG9tYWluX2lkLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgZ2V0X2NvbmZpZy0+c2lnbmFsLnZpcnEpOwo+ICsgICAgICAgICAgICBi
cmVhazsKPiArICAgICAgICB9Cj4gKyAgICAgICAgZGVmYXVsdDoKPiArICAgICAgICB7Cj4gKyAg
ICAgICAgICAgIEJVRygpOwo+ICsgICAgICAgICAgICBicmVhazsKPiArICAgICAgICB9CgpUaGVy
ZSBhcmUgcXVpdGUgYSBmZXcgc3RyYXkgYnJhY2VzIGhlcmUuCgo+ICt0eXBlZGVmIHN0cnVjdCBh
cmdvX2dldF9jb25maWcKPiArewo+ICsgICAgdWludDMyX3Qgc2lnbmFsX21ldGhvZDsKPiArICAg
IHVuaW9uCj4gKyAgICB7Cj4gKyAgICAgICAgZXZ0Y2huX3BvcnRfdCBldnRjaG47Cj4gKyAgICAg
ICAgdWludDMyX3QgdmlycTsKPiArICAgIH0gc2lnbmFsOwo+ICsgICAgdWludDMyX3QgcmVzZXJ2
ZWQ7CgpKdWRnaW5nIGZyb20gdGhlIGRlc2NyaXB0aW9uLCBkaWQgeW91IHBlcmhhcHMgbWVhbiB0
byBwdXQKdWludDMyX3QgcmVzZXJ2ZWRbMl0gaW5zaWRlIHRoZSB1bmlvbj8KClRoZW4gYWdhaW4g
ImdldF9jb25maWciIHNvdW5kcyBtdWNoIG1vcmUgZ2VuZXJpYyB0aGFuIGp1c3QKb2J0YWluaW5n
IHRoZSBub3RpZmljYXRpb24gbWV0aG9kLgoKPiBAQCAtMjQ0LDYgKzI1NywyMSBAQCBzdHJ1Y3Qg
YXJnb19yaW5nX21lc3NhZ2VfaGVhZGVyCj4gICAqLwo+ICAjZGVmaW5lIEFSR09fTUVTU0FHRV9P
UF9ub3RpZnkgICAgICAgICAgICAgIDQKPiAgCj4gKy8qCj4gKyAqIEFSR09fTUVTU0FHRV9PUF9n
ZXRfY29uZmlnCj4gKyAqCj4gKyAqIFF1ZXJpZXMgWGVuIGZvciBhcmdvIGNvbmZpZ3VyYXRpb24g
dmFsdWVzLgo+ICsgKgo+ICsgKiBVc2VkIGJ5IGEgZ3Vlc3QgdG8gb2J0YWluIHRoZSBzaWduYWwg
bWV0aG9kIGluIHVzZSBmb3IgQXJnbyBub3RpZmljYXRpb25zCj4gKyAqIGFuZCB0aGUgZXZlbnQg
Y2hhbm5lbCBwb3J0IG9yIGlzYSBpcnEgaW4gdXNlLgoKSVNBIElSUT8gSXQncyBhIHZJUlEgdGhh
dCB5b3UgaGF2ZSBhcyBhbHRlcm5hdGl2ZSB0byBiYXJlCmV2ZW50LWNoYW5uZWwgc2lnbmFsaW5n
LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
