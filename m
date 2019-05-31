From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] adjust special domain creation (and
 call it earlier on x86)
Date: Fri, 31 May 2019 08:32:11 -0700
Message-ID: <a30a6fc9-5c3c-081b-d268-231e89f135be@citrix.com>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5460200007800233DA8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zAi+=T7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hWjW0-0003iS-7c
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 15:32:20 +0000
In-Reply-To: <5CF0F5460200007800233DA8@prv1-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMDUvMjAxOSAwMjozNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQEAgLTUxNiw2ICs1MjEs
MzYgQEAgc3RydWN0IGRvbWFpbiAqZG9tYWluX2NyZWF0ZShkb21pZF90IGRvbQo+ICAgICAgcmV0
dXJuIEVSUl9QVFIoZXJyKTsKPiAgfQo+ICAKPiArdm9pZCBfX2luaXQgc2V0dXBfc3BlY2lhbF9k
b21haW5zKHZvaWQpCj4gK3sKPiArICAgIC8qCj4gKyAgICAgKiBJbml0aWFsaXNlIG91ciBET01J
RF9YRU4gZG9tYWluLgo+ICsgICAgICogQW55IFhlbi1oZWFwIHBhZ2VzIHRoYXQgd2Ugd2lsbCBh
bGxvdyB0byBiZSBtYXBwZWQgd2lsbCBoYXZlCj4gKyAgICAgKiB0aGVpciBkb21haW4gZmllbGQg
c2V0IHRvIGRvbV94ZW4uCj4gKyAgICAgKiBIaWRkZW4gUENJIGRldmljZXMgd2lsbCBhbHNvIGJl
IGFzc29jaWF0ZWQgd2l0aCB0aGlzIGRvbWFpbgo+ICsgICAgICogKGJ1dCBiZSBbcGFydGx5XSBj
b250cm9sbGVkIGJ5IERvbTAgbmV2ZXJ0aGVsZXNzKS4KPiArICAgICAqLwo+ICsgICAgZG9tX3hl
biA9IGRvbWFpbl9jcmVhdGUoRE9NSURfWEVOLCBOVUxMLCBmYWxzZSk7Cj4gKyAgICBCVUdfT04o
SVNfRVJSKGRvbV94ZW4pKTsKCkkga25vdyB0aGlzIGlzIGNvcHlpbmcgY29kZSBsaWtlLWZvci1s
aWtlLCBidXQgdGhpcyBlcnJvciBoYW5kbGluZyBpcwp0ZXJyaWJsZSBpbiBwcmFjdGljZS4KCkV2
ZW4ganVzdDoKCmlmICggSVNfRVJSKGRvbV94ZW4pICkKwqDCoMKgIHBhbmljKCJGYWlsZWQgdG8g
Y3JlYXRlIGRvbV94ZW46ICVkXG4iLCBQVFJfRVJSKGRvbV94ZW4pKTsKCndvdWxkIGJlIGFuIGlt
cHJvdmVtZW50LgoKPiArI2lmZGVmIENPTkZJR19IQVNfUENJCj4gKyAgICBJTklUX0xJU1RfSEVB
RCgmZG9tX3hlbi0+YXJjaC5wZGV2X2xpc3QpOwo+ICsjZW5kaWYKClRoZSBwb3NpdGlvbiBvZiB0
aGlzIGlkZW50aWZpZXMgdGhhdCB3ZSd2ZSBnb3Qgb2J2aW91c2x5IGdvdCBidWdzCihwZXJoYXBz
IGxhdGVudCkgZWxzZXdoZXJlLCBzZWVpbmcgYXMgb3RoZXIgc3BlY2lhbCBkb21haW5zIGRvbid0
IGdldAp3b3JraW5nIGNvbnN0cnVjdHMgc3VjaCBhcyBsaXN0X2VtcHR5KCkuCgpJbiB0aGUgY29k
ZSB3aGljaCBjdXJyZW50bHkgZXhpc3RzLCBJIGNhbid0IHNwb3QgaXQgZXZlciBiZWluZyB0b3Vj
aGVkCmZvciBBUk0sIGJ1dCBpdCBpcyBjb25zdHJ1Y3RlZCBmb3IgYWxsIG5vbi1zcGVjaWFsIHg4
NiBndWVzdHMgYXQgdGhlIHRvcApvZiBhcmNoX2RvbWFpbl9jcmVhdGUoKS4KCkkgdGhpbmsgdGhl
IGJlc3Qgb3B0aW9uLCBnaXZlbiB0aGUgI2lmZGVmIGhlcmUsIGlzIHRvIHJlcG9zaXRpb24gdGhl
CnBkZXYgZmllbGRzIGludG8gc3RydWN0IGRvbWFpbiwgcmF0aGVyIHRoYW4gYXJjaF9kb21haW4s
IGFuZCBoYXZlIHRoaXMKY29kZSBmcmFnbWVudCBuZWFyIHRoZSB0b3Agb2YgZG9tYWluX2NyZWF0
ZSgpIHdoZXJlIHNwZWNpYWwgZG9tYWlucyB3aWxsCmFsbCBiZSBjb3ZlcmVkLgoKfkFuZHJldwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
