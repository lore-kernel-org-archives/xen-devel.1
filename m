From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH v2] memory_hotplug: Free pages as higher
 order
Date: Tue, 25 Sep 2018 11:59:09 +0200
Message-ID: <ccdbaf76-cbdd-759e-c6de-c5b738f156e9__17914.518263615$1537869480$gmane$org@suse.cz>
References: <1537854158-9766-1-git-send-email-arunks@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qarp=mh=suse.cz=vbabka@srs-us1.protection.inumbo.net>)
 id 1g4k7f-0002wT-2c
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 09:59:15 +0000
In-Reply-To: <1537854158-9766-1-git-send-email-arunks@codeaurora.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arun KS <arunks@codeaurora.org>, kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com, boris.ostrovsky@oracle.com, jgross@suse.com, akpm@linux-foundation.org, dan.j.williams@intel.com, mhocko@suse.com, iamjoonsoo.kim@lge.com, osalvador@suse.de, malat@debian.org, yasu.isimatu@gmail.com, devel@linuxdriverproject.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, xen-devel@lists.xenproject.org
Cc: vinmenon@codeaurora.org, vatsa@codeaurora.org, getarunks@gmail.com
List-Id: xen-devel@lists.xenproject.org

T24gOS8yNS8xOCA3OjQyIEFNLCBBcnVuIEtTIHdyb3RlOgo+IFdoZW4gZnJlZSBwYWdlcyBhcmUg
ZG9uZSB3aXRoIGhpZ2hlciBvcmRlciwgdGltZSBzcGVuZCBvbgo+IGNvYWxlc2NpbmcgcGFnZXMg
YnkgYnVkZHkgYWxsb2NhdG9yIGNhbiBiZSByZWR1Y2VkLiBXaXRoCj4gc2VjdGlvbiBzaXplIG9m
IDI1Nk1CLCBob3QgYWRkIGxhdGVuY3kgb2YgYSBzaW5nbGUgc2VjdGlvbgo+IHNob3dzIGltcHJv
dmVtZW50IGZyb20gNTAtNjAgbXMgdG8gbGVzcyB0aGFuIDEgbXMsIGhlbmNlCj4gaW1wcm92aW5n
IHRoZSBob3QgYWRkIGxhdGVuY3kgYnkgNjAlLgo+IAo+IE1vZGlmeSBleHRlcm5hbCBwcm92aWRl
cnMgb2Ygb25saW5lIGNhbGxiYWNrIHRvIGFsaWduIHdpdGgKPiB0aGUgY2hhbmdlLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEFydW4gS1MgPGFydW5rc0Bjb2RlYXVyb3JhLm9yZz4KCkhpLAoKPiBAQCAt
NjU1LDI2ICs2NTUsNTMgQEAgdm9pZCBfX29ubGluZV9wYWdlX2ZyZWUoc3RydWN0IHBhZ2UgKnBh
Z2UpCj4gIH0KPiAgRVhQT1JUX1NZTUJPTF9HUEwoX19vbmxpbmVfcGFnZV9mcmVlKTsKPiAgCj4g
LXN0YXRpYyB2b2lkIGdlbmVyaWNfb25saW5lX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCj4gK3N0
YXRpYyBpbnQgZ2VuZXJpY19vbmxpbmVfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSwgdW5zaWduZWQg
aW50IG9yZGVyKQo+ICB7Cj4gLQlfX29ubGluZV9wYWdlX3NldF9saW1pdHMocGFnZSk7Cj4gLQlf
X29ubGluZV9wYWdlX2luY3JlbWVudF9jb3VudGVycyhwYWdlKTsKPiAtCV9fb25saW5lX3BhZ2Vf
ZnJlZShwYWdlKTsKPiArCXVuc2lnbmVkIGxvbmcgbnJfcGFnZXMgPSAxIDw8IG9yZGVyOwo+ICsJ
c3RydWN0IHBhZ2UgKnAgPSBwYWdlOwo+ICsJdW5zaWduZWQgaW50IGxvb3A7Cj4gKwo+ICsJZm9y
IChsb29wID0gMCA7IGxvb3AgPCBucl9wYWdlcyA7IGxvb3ArKywgcCsrKSB7Cj4gKwkJX19DbGVh
clBhZ2VSZXNlcnZlZChwKTsKPiArCQlzZXRfcGFnZV9jb3VudChwLCAwKTsKPiArCX0KPiArCj4g
KwlhZGp1c3RfbWFuYWdlZF9wYWdlX2NvdW50KHBhZ2UsIG5yX3BhZ2VzKTsKPiArCXNldF9wYWdl
X3JlZmNvdW50ZWQocGFnZSk7Cj4gKwlfX2ZyZWVfcGFnZXMocGFnZSwgb3JkZXIpOwo+ICsKPiAr
CXJldHVybiAwOwoKVGhpcyBzZWVtcyBsaWtlIGFsbW9zdCBjb21wbGV0ZSBjb3B5IG9mIF9fZnJl
ZV9wYWdlc19ib290X2NvcmUoKSwgY291bGQKeW91IGRvIHNvbWUgY29kZSByZXVzZSBpbnN0ZWFk
PyBJIHRoaW5rIE1pY2hhbCBIb2NrbyBhbHNvIHN1Z2dlc3RlZCB0aGF0LgoKVGhhbmtzLApWbGFz
dGltaWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
