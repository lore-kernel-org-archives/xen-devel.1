From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 31/34] xen: refuse to create HVM guests when
 !CONFIG_HVM
Date: Tue, 21 Aug 2018 05:46:25 -0600
Message-ID: <5B7BFB9102000078001E0741@prv1-mh.provo.novell.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <71cdcc5fbe6d8e6e1801270f6ef7fc1563957447.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ip0d=le=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fs57G-0000WP-3t
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 11:46:30 +0000
In-Reply-To: <71cdcc5fbe6d8e6e1801270f6ef7fc1563957447.1534518694.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2NvbW1vbi9kb21haW4uYwo+ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMKPiBA
QCAtMzE4LDggKzMxOCwxNCBAQCBzdHJ1Y3QgZG9tYWluICpkb21haW5fY3JlYXRlKGRvbWlkX3Qg
ZG9taWQsCj4gICAgICBpZiAoICFpc19pZGxlX2RvbWFpbihkKSApCj4gICAgICB7Cj4gICAgICAg
ICAgaWYgKCBjb25maWctPmZsYWdzICYgWEVOX0RPTUNUTF9DREZfaHZtX2d1ZXN0ICkKPiArICAg
ICAgICB7Cj4gKyNpZiBDT05GSUdfSFZNCj4gICAgICAgICAgICAgIGQtPmd1ZXN0X3R5cGUgPSBn
dWVzdF90eXBlX2h2bTsKPiAtICAgICAgICBlbHNlCj4gKyNlbHNlCj4gKyAgICAgICAgICAgIGVy
ciA9IC1FSU5WQUw7Cj4gKyAgICAgICAgICAgIGdvdG8gZmFpbDsKPiArI2VuZGlmCj4gKyAgICAg
ICAgfSBlbHNlCj4gICAgICAgICAgICAgIGQtPmd1ZXN0X3R5cGUgPSBndWVzdF90eXBlX3B2OwoK
V291bGQgeW91IG1pbmQgZG9pbmcgdGhlIENPTkZJR19QViBjYXNlIG9mIHRoaXMgYXMgd2VsbCwg
d2hpY2gKd291bGQgdGhlbiBwcm9iYWJseSBhbHNvIG1ha2UgbW9yZSBhcHBhcmVudCB0aGF0IHRo
ZSAiZWxzZSIKYWJvdmUgYmVsb25ncyBvbiBpdHMgb3duIGxpbmU/IE9mIGNvdXJzZSBvbmNlIGFn
YWluIHBhcnQgb2YgdGhlCmZpbmFsIGxvb2sgb2YgdGhpcyBzZWN0aW9uIGRlcGVuZHMgb24gd2hh
dCBBUk0gZm9sa3Mgd2FudCB0byBkbwp3aXRoIHJlZ2FyZCB0byBDT05GSUdfSFZNLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
