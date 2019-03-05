From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] [v2] xen: avoid link error on ARM
Date: Tue, 5 Mar 2019 15:57:44 +0100
Message-ID: <9a285a75-b9ea-37a9-b5bd-ba2a068dd944__9461.36701838753$1551797931$gmane$org@suse.com>
References: <20190305133057.3998926-1-arnd@arndb.de>
 <35654e1a-d066-0581-749f-7e3b65023988@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rV4c=RI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h1BVs-0007WX-PX
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 14:57:48 +0000
In-Reply-To: <35654e1a-d066-0581-749f-7e3b65023988@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Arnd Bergmann <arnd@arndb.de>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org, Paul Durrant <paul.durrant@citrix.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDMvMjAxOSAxNDo0MywgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDMvNS8xOSA4
OjMwIEFNLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+PiAgCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3hlbi9wcml2Y21kLmMgYi9kcml2ZXJzL3hlbi9wcml2Y21kLmMKPj4gaW5kZXggYjI0ZGRhYzE2
MDRiLi4yOTBiNmFjYTdlMWQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMveGVuL3ByaXZjbWQuYwo+
PiArKysgYi9kcml2ZXJzL3hlbi9wcml2Y21kLmMKPj4gQEAgLTcyMywyNiArNzIzLDYgQEAgc3Rh
dGljIGxvbmcgcHJpdmNtZF9pb2N0bF9yZXN0cmljdChzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCBf
X3VzZXIgKnVkYXRhKQo+PiAgCXJldHVybiAwOwo+PiAgfQo+PiAgCj4+IC1zdHJ1Y3QgcmVtYXBf
cGZuIHsKPj4gLQlzdHJ1Y3QgbW1fc3RydWN0ICptbTsKPj4gLQlzdHJ1Y3QgcGFnZSAqKnBhZ2Vz
Owo+PiAtCXBncHJvdF90IHByb3Q7Cj4+IC0JdW5zaWduZWQgbG9uZyBpOwo+PiAtfTsKPj4gLQo+
PiAtc3RhdGljIGludCByZW1hcF9wZm5fZm4ocHRlX3QgKnB0ZXAsIHBndGFibGVfdCB0b2tlbiwg
dW5zaWduZWQgbG9uZyBhZGRyLAo+PiAtCQkJdm9pZCAqZGF0YSkKPj4gLXsKPj4gLQlzdHJ1Y3Qg
cmVtYXBfcGZuICpyID0gZGF0YTsKPj4gLQlzdHJ1Y3QgcGFnZSAqcGFnZSA9IHItPnBhZ2VzW3It
PmldOwo+PiAtCXB0ZV90IHB0ZSA9IHB0ZV9ta3NwZWNpYWwocGZuX3B0ZShwYWdlX3RvX3Bmbihw
YWdlKSwgci0+cHJvdCkpOwo+PiAtCj4+IC0Jc2V0X3B0ZV9hdChyLT5tbSwgYWRkciwgcHRlcCwg
cHRlKTsKPj4gLQlyLT5pKys7Cj4+IC0KPj4gLQlyZXR1cm4gMDsKPj4gLX0KPj4gLQo+PiAgc3Rh
dGljIGxvbmcgcHJpdmNtZF9pb2N0bF9tbWFwX3Jlc291cmNlKHN0cnVjdCBmaWxlICpmaWxlLCB2
b2lkIF9fdXNlciAqdWRhdGEpCj4+ICB7Cj4+ICAJc3RydWN0IHByaXZjbWRfZGF0YSAqZGF0YSA9
IGZpbGUtPnByaXZhdGVfZGF0YTsKPj4gQEAgLTgwOSwxNSArNzg5LDcgQEAgc3RhdGljIGxvbmcg
cHJpdmNtZF9pb2N0bF9tbWFwX3Jlc291cmNlKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkIF9fdXNl
ciAqdWRhdGEpCj4+ICAJCWdvdG8gb3V0Owo+PiAgCj4+ICAJaWYgKHhlbl9mZWF0dXJlKFhFTkZF
QVRfYXV0b190cmFuc2xhdGVkX3BoeXNtYXApKSB7Cj4+IC0JCXN0cnVjdCByZW1hcF9wZm4gciA9
IHsKPj4gLQkJCS5tbSA9IHZtYS0+dm1fbW0sCj4+IC0JCQkucGFnZXMgPSB2bWEtPnZtX3ByaXZh
dGVfZGF0YSwKPj4gLQkJCS5wcm90ID0gdm1hLT52bV9wYWdlX3Byb3QsCj4+IC0JCX07Cj4+IC0K
Pj4gLQkJcmMgPSBhcHBseV90b19wYWdlX3JhbmdlKHIubW0sIGtkYXRhLmFkZHIsCj4+IC0JCQkJ
CSBrZGF0YS5udW0gPDwgUEFHRV9TSElGVCwKPj4gLQkJCQkJIHJlbWFwX3Bmbl9mbiwgJnIpOwo+
PiArCQlyYyA9IHhlbl9yZW1hcF92bWFfcmFuZ2Uodm1hLCBrZGF0YS5hZGRyLCBrZGF0YS5udW0g
PDwgUEFHRV9TSElGVCk7Cj4gCj4gSSB3b25kZXIgd2hldGhlciBkcml2ZXJzL3hlbi94bGF0ZV9t
bXUuYyBtaWdodCBiZSBhIGdvb2QgcGxhY2UgZm9yIHRoZXNlCj4gcm91dGluZXMuCgpIbW0sIHBy
b2JhYmx5LiBUaGlzIHdvdWxkIHJlcXVpcmUgYSBzdHViIGluIHRoZSBoZWFkZXIgdG8gYXZvaWQK
cHJvYmxlbXMgaW4gY2FzZSBvZiBDT05GSUdfWEVOX0FVVE9fWExBVEUgbm90IGRlZmluZWQsIHRo
b3VnaAoodGhlICNpZmRlZiBpcyBhbHJlYWR5IHRoZXJlKS4KCkkgdGhpbmsgdGhpcyBpcyB0aGUg
Y2xlYW5lc3Qgc29sdXRpb24uCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
