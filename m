From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 01/12] x86: infrastructure to allow
 converting certain indirect calls to direct ones
Date: Tue, 2 Oct 2018 14:21:21 +0100
Message-ID: <f04b3731-481c-b7a0-f5b5-e0e611b391b1@citrix.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BB343D802000078001ED9F6@prv1-mh.provo.novell.com>
 <5BB3447802000078001EDA08@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=okrt=mo=citrix.com=prvs=806f63693=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g7Kc7-00080q-SA
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 13:21:23 +0000
In-Reply-To: <5BB3447802000078001EDA08@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTAvMTggMTE6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IC0tLSBhL3hlbi9pbmNsdWRl
L3hlbi9saWIuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9saWIuaAo+IEBAIC02Niw2ICs2Niwx
MCBAQAo+ICAKPiAgI2RlZmluZSBST1VORFVQKHgsIGEpICgoKHgpICsgKGEpIC0gMSkgJiB+KChh
KSAtIDEpKQo+ICAKPiArI2RlZmluZSBjb3VudF92YV9hcmdfKGRvdCwgYTEsIGEyLCBhMywgYTQs
IGE1LCBhNiwgYTcsIGE4LCB4LCAuLi4pIHgKPiArI2RlZmluZSBjb3VudF92YV9hcmcoYXJncy4u
LikgXAo+ICsgICAgY291bnRfdmFfYXJnXyguLCAjIyBhcmdzLCA4LCA3LCA2LCA1LCA0LCAzLCAy
LCAxLCAwKQoKVGhpcyBwYXJ0aWN1bGFyIGJpdCBvZiByZXZpZXcgc3BsaXQgb3V0IGZvciBvYnZp
b3VzIHJlYXNvbnMuCgpXZSBhbHJlYWR5IGhhdmUgX19jb3VudF9hcmdzKCkgaW4gdGhlIEFSTSBT
TUNDQyBpbmZyYXN0cnVjdHVyZS7CoCBQbGVhc2UKY2FuIHdlIGRlZHVwIHRoYXQgKGJyb2tlbiBv
dXQgaW50byBhIHNlcGFyYXRlIHBhdGNoKSByYXRoZXIgdGhhbgppbnRyb2R1Y2luZyBhIGNvbXBl
dGluZyB2ZXJzaW9uLgoKVGhlIEFSTSB2ZXJzaW9uIGlzIGJ1Z2d5LsKgIEl0IGlzIG9mZi1ieS10
d28gaW4gdGhlIGJhc2UgY2FzZSwgYW5kCmRvZXNuJ3QgY29tcGlsZSBpZiBmZXdlciB0aGFuIHR3
byBwYXJhbWV0ZXJzIGFyZSBwYXNzZWQuwqAgVGhpcyB2ZXJzaW9uCmZ1bmN0aW9ucyBjb3JyZWN0
bHksIGJ1dCBzaG91bGQgYmUgbmFtZWQgd2l0aCBhIHBsdXJhbC4KCn5BbmRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
