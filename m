From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 2/6] xenbus: implement the xenwatch
 multithreading framework
Date: Mon, 17 Sep 2018 16:00:19 -0400
Message-ID: <96909a80-516c-07c9-eaa4-adc42114848a__12019.4039577202$1537214279$gmane$org@oracle.com>
References: <1536910456-13337-1-git-send-email-dongli.zhang@oracle.com>
 <1536910456-13337-3-git-send-email-dongli.zhang@oracle.com>
 <affabca4-0683-f088-7b25-d239ff882fa0@oracle.com>
 <1443a6e8-0a94-6081-b1c6-1f426bbaea38@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sv8h=l7=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1g1zfi-0000AE-Us
 for xen-devel@lists.xenproject.org; Mon, 17 Sep 2018 19:59:02 +0000
In-Reply-To: <1443a6e8-0a94-6081-b1c6-1f426bbaea38@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongli Zhang <dongli.zhang@oracle.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, wei.liu2@citrix.com, konrad.wilk@oracle.com, srinivas.eeda@oracle.com, paul.durrant@citrix.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gOS8xNi8xOCA5OjQ4IFBNLCBEb25nbGkgWmhhbmcgd3JvdGU6Cj4gSGkgQm9yaXMsCj4KPiBP
biAwOS8xNy8yMDE4IDA1OjIwIEFNLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+Cj4+IE9uIDkv
MTQvMTggMzozNCBBTSwgRG9uZ2xpIFpoYW5nIHdyb3RlOgo+Pj4gKwo+Pj4gKy8qIFJ1bm5pbmcg
aW4gdGhlIGNvbnRleHQgb2YgZGVmYXVsdCB4ZW53YXRjaCBrdGhyZWFkLiAqLwo+Pj4gK3ZvaWQg
bXR3YXRjaF9jcmVhdGVfZG9tYWluKGRvbWlkX3QgZG9taWQpCj4+PiArewo+Pj4gKyAgICBzdHJ1
Y3QgbXR3YXRjaF9kb21haW4gKmRvbWFpbjsKPj4+ICsKPj4+ICsgICAgaWYgKCFkb21pZCkgewo+
Pj4gKyAgICAgICAgcHJfZXJyKCJEZWZhdWx0IHhlbndhdGNoIHRocmVhZCBpcyBmb3IgZG9tMFxu
Iik7Cj4+PiArICAgICAgICByZXR1cm47Cj4+PiArICAgIH0KPj4+ICsKPj4+ICsgICAgc3Bpbl9s
b2NrKCZtdHdhdGNoX2luZm8tPmRvbWFpbl9sb2NrKTsKPj4+ICsKPj4+ICsgICAgZG9tYWluID0g
bXR3YXRjaF9maW5kX2RvbWFpbihkb21pZCk7Cj4+PiArICAgIGlmIChkb21haW4pIHsKPj4+ICsg
ICAgICAgIGF0b21pY19pbmMoJmRvbWFpbi0+cmVmY250KTsKPj4+ICsgICAgICAgIHNwaW5fdW5s
b2NrKCZtdHdhdGNoX2luZm8tPmRvbWFpbl9sb2NrKTsKPj4+ICsgICAgICAgIHJldHVybjsKPj4+
ICsgICAgfQo+Pj4gKwo+Pj4gKyAgICBkb21haW4gPSBremFsbG9jKHNpemVvZigqZG9tYWluKSwg
R0ZQX0FUT01JQyk7Cj4+IElzIHRoZXJlIGEgcmVhc29uIChiZXNpZGVzIHRoaXMgYmVpbmcgZG9u
ZSB1bmRlciBzcGlubG9jaykgZm9yIHVzaW5nIEdGUF9BVE9NSUM/Cj4+IElmIGRvbWFpbl9sb2Nr
IGlzIHRoZSBvbmx5IHJlYXNvbiBJJ2QgcHJvYmFibHkgZHJvcCB0aGUgbG9jayBhbmQgZG8gR0ZQ
X0tFUk5FTC4KPiBzcGluX2xvY2sgaXMgdGhlIHJlYXNvbi4KPgo+IFdvdWxkIHlvdSBsaWtlIHRv
IHN3aXRjaCB0byBhIG11dGV4IGhlcmU/CgpJJ2QgdXNlIG11dGV4LgoKLWJvcmlzCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
