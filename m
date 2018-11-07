From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 8/8] xen: Swich parameter in
 get_page_from_gfn to use typesafe gfn
Date: Wed, 7 Nov 2018 13:08:30 +0000
Message-ID: <409e3d54-2ae6-155c-a6bb-cd8f8d80cc26@arm.com>
References: <20181106191454.22143-1-julien.grall@arm.com>
 <20181106191454.22143-9-julien.grall@arm.com>
 <479bb855-0bb7-dd30-a7a4-692b189cc7c5@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=seal=ns=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gKNZT-0001Dz-R1
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 13:08:35 +0000
In-Reply-To: <479bb855-0bb7-dd30-a7a4-692b189cc7c5@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, sstabellini@kernel.org, xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3LAoKT24gMDYvMTEvMjAxOCAyMDoxMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBU
aGlzIGxvb2tzIGxpa2UgaXQgd291bGQgYmUgY2xlYW5lciBieSBub3Qgc3BsaXR0aW5nIG1mbiBv
dXQgaW50byBhCj4gc2VwYXJhdGUgdmFyaWFibGUuCj4gCj4gcGFnZSA9IG1mbl90b19wYWdlKF9t
Zm4oZ2ZuX3goZ2ZuKSkpOwo+IAo+IHJldHVybiBtZm5fdmFsaWQobWZuKSAmJiBnZXRfcGFnZShw
YWdlLCBkKSA/IHBhZ2UgOiBOVUxMOwo+IAo+IFRoZSBvbmx5IHJlYXNvbiB0aGlzIGxvb2tzIG9k
ZCBpcyBiZWNhdXNlIG9mIHRoZSBtZm4gPT4gZ2ZuIGVxdWFsaXR5LAo+IGJ1dCB3ZSBhcmUganVz
dCBiZXNpZGUgYSBjb21tZW50IGV4cGxhaW5pbmcgdGhhdCB3ZSBhcmUgbm9uLXRyYW5zbGF0ZWQu
CgpJIGludHJvZHVjZWQgdGhlIG1mbiB2YXJpYWJsZSB0byBhdm9pZCBkdXBsaWNhdGluZyBfbWZu
KGdmbl94KGdmbikpIGluIHRoZSB0d28gCnBsYWNlcyB3aGVyZSBnZm4gd2FzIHVzZWQuCgpJIGFt
IGhhcHB5IHRvIGR1cGxpY2F0ZWQgaWYgeW91IHByZWZlci4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
