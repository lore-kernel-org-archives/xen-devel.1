From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/2] make domain_adjust_tot_pages()
 __must_check
Date: Wed, 5 Dec 2018 20:08:45 +0000
Message-ID: <23229f63-1642-c32d-a0f3-b9659cd1352e@citrix.com>
References: <5BF4328902000078001FE240@prv1-mh.provo.novell.com>
 <5C07F95A0200007800203354@prv1-mh.provo.novell.com>
 <5C07FA14020000780020336D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9kzc=oo=citrix.com=prvs=870f008d4=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gUdTW-0000OA-KL
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 20:08:50 +0000
In-Reply-To: <5C07FA14020000780020336D@prv1-mh.provo.novell.com>
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

T24gMDUvMTIvMjAxOCAxNjoxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gRXZlbiBpZiB1bmxpa2Vs
eSwgZG9uYXRlX3BhZ2UoKSBzaG91bGQgbm90IGlnbm9yZSB0aGUgcG9zc2libGUgbmVlZCB0bwo+
IG9idGFpbiBhIGRvbWFpbiByZWZlcmVuY2UuIFRvIG1ha2UgcGVvcGxlIGxvb2sgbW9yZSBjbG9z
ZWx5IHdoZW4gdGhleQo+IGFkZCBuZXcgdXNlcyBvZiBkb21haW5fYWRqdXN0X3RvdF9wYWdlcygp
LCBmb3JjZSBpdHMgcmV0dXJuIHZhbHVlIHRvIGJlCj4gY2hlY2tlZC4gVGhpcyBpbiB0dXJuIHJl
cXVpcmVzIGEgYmVuaWduIGNoYW5nZSB0byBhc3NpZ25fcGFnZXMoKS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClRoaXMgaXMgdmVyeSB3ZWlyZCBj
b2RlIHRvIHJlYWQuwqAgSXQgaXMgYSBzaWRlIGVmZmVjdCBvZiB0aGUgQUJJLCBhbmQgaXQKYXBw
ZWFycyB3ZSBkbyBoYXZlIHRoaXMgc3R5bGUgdXNlZCBlbHNld2hlcmUuCgpUaGVyZWZvcmUsIEFj
a2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKSG93ZXZl
ciwgSSB0aGluayB0aGlzIHdvdWxkIGJlIGltcHJvdmVkIGlmIHdlIGhhZCBoZWxwZXJzIGFsb25n
IHRoZQpsaW5lcyBvZiAiYm9vbCBkb21haW5fe2FkZCxyZW1vdmV9X3BhZ2VzKCkiIHdoZXJlIHRo
ZSBib29sZWFuIHJldHVybgppbmRpY2F0ZWQgd2hldGhlciB5b3UgbmVlZGVkIHRvIHBsYXkgd2l0
aCB0aGUgZG9tYWluIHJlZmVyZW5jZSBjb3VudC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
