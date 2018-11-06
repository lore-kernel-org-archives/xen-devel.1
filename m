From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] p2m: move p2m-common.h inclusion point
Date: Tue, 6 Nov 2018 16:51:46 +0000
Message-ID: <143a4b57-9133-4d7b-8ae7-660af78d12a0@citrix.com>
References: <5BB7397802000078001EEBA2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pbld=nr=citrix.com=prvs=8415d0394=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gK4Zz-0006w7-CS
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 16:51:51 +0000
In-Reply-To: <5BB7397802000078001EEBA2@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDUvMjAxOCAxMToxNCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIGhlYWRlciBp
cyAoaGVuY2UgaXRzIG5hbWUpIHN1cHBvc2VkIHRvIGJlIGEgaGVscGVyIGZvciB0aGUgcGVyLWFy
Y2gKPiBwMm0uaCBmaWxlcy4gSXQgd2FzIG5ldmVyIHN1cHBvc2VkIHRvIGJlIGluY2x1ZGVkIGRp
cmVjdGx5LCBhbmQgZm9yIHRoZQo+IHB1cnBvc2Ugb2YgcHV0dGluZyBjb21tb24gZnVuY3Rpb24g
ZGVjbGFyYXRpb25zIGludG8gdGhlIGNvbW1vbiBoZWFkZXIKPiBpdCBpcyBtb3JlIGhlbHBmdWwg
aWYgdGhpbmdzIGxpa2UgcDJtX3QgYXJlIGFscmVhZHkgYXZhaWxhYmxlIGF0IHRoZQo+IGluY2x1
c2lvbiBwb2ludC4KPiAKPiBUYWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgYWxzbyBkaXRjaCBhIGR1
cGxpY2F0ZSBwdWJsaWMvbWVtb3J5LmggZnJvbSB0aGUKPiBBUk0gaGVhZGVyLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBHZW9y
Z2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
