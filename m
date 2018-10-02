From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 01/12] x86: infrastructure to allow
 converting certain indirect calls to direct ones
Date: Tue, 2 Oct 2018 14:28:53 +0100
Message-ID: <7977a721-e2f6-db00-ee6a-2744cde3cc66@arm.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BB343D802000078001ED9F6@prv1-mh.provo.novell.com>
 <5BB3447802000078001EDA08@prv1-mh.provo.novell.com>
 <f04b3731-481c-b7a0-f5b5-e0e611b391b1@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gf1e=mo=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1g7KjS-0008FI-MO
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 13:28:58 +0000
In-Reply-To: <f04b3731-481c-b7a0-f5b5-e0e611b391b1@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3LAoKT24gMDIvMTAvMjAxOCAxNDoyMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBP
biAwMi8xMC8xOCAxMToxMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IC0tLSBhL3hlbi9pbmNsdWRl
L3hlbi9saWIuaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbGliLmgKPj4gQEAgLTY2LDYgKzY2
LDEwIEBACj4+ICAgCj4+ICAgI2RlZmluZSBST1VORFVQKHgsIGEpICgoKHgpICsgKGEpIC0gMSkg
JiB+KChhKSAtIDEpKQo+PiAgIAo+PiArI2RlZmluZSBjb3VudF92YV9hcmdfKGRvdCwgYTEsIGEy
LCBhMywgYTQsIGE1LCBhNiwgYTcsIGE4LCB4LCAuLi4pIHgKPj4gKyNkZWZpbmUgY291bnRfdmFf
YXJnKGFyZ3MuLi4pIFwKPj4gKyAgICBjb3VudF92YV9hcmdfKC4sICMjIGFyZ3MsIDgsIDcsIDYs
IDUsIDQsIDMsIDIsIDEsIDApCj4gCj4gVGhpcyBwYXJ0aWN1bGFyIGJpdCBvZiByZXZpZXcgc3Bs
aXQgb3V0IGZvciBvYnZpb3VzIHJlYXNvbnMuCj4gCj4gV2UgYWxyZWFkeSBoYXZlIF9fY291bnRf
YXJncygpIGluIHRoZSBBUk0gU01DQ0MgaW5mcmFzdHJ1Y3R1cmUuwqAgUGxlYXNlCj4gY2FuIHdl
IGRlZHVwIHRoYXQgKGJyb2tlbiBvdXQgaW50byBhIHNlcGFyYXRlIHBhdGNoKSByYXRoZXIgdGhh
bgo+IGludHJvZHVjaW5nIGEgY29tcGV0aW5nIHZlcnNpb24uCj4gCj4gVGhlIEFSTSB2ZXJzaW9u
IGlzIGJ1Z2d5LsKgIEl0IGlzIG9mZi1ieS10d28gaW4gdGhlIGJhc2UgY2FzZSwgYW5kCj4gZG9l
c24ndCBjb21waWxlIGlmIGZld2VyIHRoYW4gdHdvIHBhcmFtZXRlcnMgYXJlIHBhc3NlZC7CoCBU
aGlzIHZlcnNpb24KPiBmdW5jdGlvbnMgY29ycmVjdGx5LCBidXQgc2hvdWxkIGJlIG5hbWVkIHdp
dGggYSBwbHVyYWwuCgpUaGUgQVJNIHZlcnNpb24gaXMgKm5vdCogYnVnZ3kuIFdoYXQgdGhlIEFS
TSB2ZXJzaW9uIGNvdW50IGlzIHRoZSBudW1iZXIgCm9mIHBhcmFtZXRlcnMgZm9yIHRoZSBTTUND
QyBmdW5jdGlvbiwgKm5vdCogdGhlIG51bWJlciBvZiBwYXJhbWV0ZXIgZm9yIAp0aGUgY2FsbC4K
ClRoaXMgbWF0Y2hlcyB0aGUgU01DQ0Mgd2hlcmUgdGhlIGZpcnN0IHBhcmFtZXRlciBpcyBhbHdh
eXMgdGhlIGZ1bmN0aW9uIApJRCwgdGhlIGxhc3QgcGFyYW1ldGVyIGlzIGFsd2F5cyB0aGUgcmVz
dWx0IHN0cnVjdHVyZS4KClRoZSBjb2RlIHdpbGwgZW5kIHVwIHRvIGJlIGxlc3MgcmVhZGFibGUg
dXNpbmcgYSBnZW5lcmljIGNvdW50LiBJIGFtIApwbGFubmluZyB0byBOYWNrIGFueXRoaW5nIHRy
eWluZyB0byB1c2UgYSBnZW5lcmljIGNvdW50IGluIHRoZSBTTUNDQyBjb2RlLgoKQ2hlZXJzLAoK
LS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
