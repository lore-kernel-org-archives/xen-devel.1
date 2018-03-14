From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC PATCH 1/6] ci: add Dockerfile for CentOS 7.2
Date: Wed, 14 Mar 2018 10:56:16 +0000
Message-ID: <fe04352a-cce7-11bd-ec26-30f814b8e818@arm.com>
References: <cover.fc61971d5999dddd95c2bee5d18d572bfcc28399.1520911150.git-series.cardoe@cardoe.com>
 <ebb0926a801b494560f5305d8ceaa4d40934d301.1520911150.git-series.cardoe@cardoe.com>
 <f430f5e5-3c8d-f0b9-4f7b-f8f50f121005@arm.com>
 <c8019016-1a14-2ba8-d189-d606afa3d811@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <c8019016-1a14-2ba8-d189-d606afa3d811@cardoe.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xen.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGkgRG91ZywKCk9uIDAzLzEzLzIwMTggMDM6NDggUE0sIERvdWcgR29sZHN0ZWluIHdyb3RlOgo+
IE9uIDMvMTMvMTggOTo1MiBBTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSBEb3VnLAo+Pgo+
PiBPbiAxMy8wMy8xOCAwMzozMSwgRG91ZyBHb2xkc3RlaW4gd3JvdGU6Cj4+PiArIyB3b3JrIGFy
b3VuZCBodHRwczovL2dpdGh1Yi5jb20vbW9ieS9tb2J5L2lzc3Vlcy8xMDE4MAo+Pj4gKyMgYW5k
IGluc3RhbGwgWGVuIGRlcGVuZHMKPj4+ICtSVU4gcnBtIC0tcmVidWlsZGRiICYmIFwKPj4+ICvC
oMKgwqAgeXVtIC15IGluc3RhbGwgXAo+Pj4gK8KgwqDCoMKgwqDCoMKgIHl1bS1wbHVnaW4tb3Zs
IFwKPj4+ICvCoMKgwqDCoMKgwqDCoCBnY2MgXAo+Pj4gK8KgwqDCoMKgwqDCoMKgIGdjYy1jKysg
XAo+Pj4gK8KgwqDCoMKgwqDCoMKgIG5jdXJzZXMtZGV2ZWwgXAo+Pj4gK8KgwqDCoMKgwqDCoMKg
IHpsaWItZGV2ZWwgXAo+Pj4gK8KgwqDCoMKgwqDCoMKgIG9wZW5zc2wtZGV2ZWwgXAo+Pj4gK8Kg
wqDCoMKgwqDCoMKgIHB5dGhvbi1kZXZlbCBcCj4+PiArwqDCoMKgwqDCoMKgwqAgbGlidXVpZC1k
ZXZlbCBcCj4+PiArwqDCoMKgwqDCoMKgwqAgcGtnY29uZmlnIFwKPj4+ICvCoMKgwqDCoMKgwqDC
oCBnZXR0ZXh0IFwKPj4+ICvCoMKgwqDCoMKgwqDCoCBmbGV4IFwKPj4+ICvCoMKgwqDCoMKgwqDC
oCBiaXNvbiBcCj4+PiArwqDCoMKgwqDCoMKgwqAgbGliYWlvLWRldmVsIFwKPj4+ICvCoMKgwqDC
oMKgwqDCoCBnbGliMi1kZXZlbCBcCj4+PiArwqDCoMKgwqDCoMKgwqAgeWFqbC1kZXZlbCBcCj4+
PiArwqDCoMKgwqDCoMKgwqAgcGl4bWFuLWRldmVsIFwKPj4+ICvCoMKgwqDCoMKgwqDCoCBnbGli
Yy1kZXZlbCBcCj4+PiArwqDCoMKgwqDCoMKgwqAgZ2xpYmMtZGV2ZWwuaTY4NiBcCj4+Cj4+IFRo
aXMgbG9va3MgZmFpcmx5IHg4Ni4gRG8geW91IGhhdmUgYW55IHBsYW4gdG8gYWRkIGFybSBzdXBw
b3J0Pwo+Pgo+PiBJbiBhbnkgY2FzZSwgdGhlIFJFQURNRSBzaG91bGQgZXhwbGFpbiB3aGF0IGFy
Y2hpdGVjdHVyZXMgYXJlIHN1cHBvcnRlZC4KPj4KPj4gQ2hlZXJzLAo+Pgo+IAo+IFllcyBpdCBk
ZWZpbml0ZWx5IHg4Ni4gSSBwbGFuIG9uIGFkZGluZyBBUk0gc3VwcG9ydCBJIGp1c3QgaGF2ZW4n
dCBoYWQKPiBlbm91Z2ggdGltZSB0byBnYXRoZXIgdXAgd2hhdCB0aGUgZGVwZW5kZW5jaWVzIG5l
ZWQgdG8gYmUuIFNpbmNlIGl0cwo+IGdvaW5nIHRvIGJlIGEgY3Jvc3MgY29tcGlsZSBlbnZpcm9u
bWVudCBJIG5lZWQgdG8gdGFrZSB0aGUgdGltZSB0byBzZXR1cAo+IG9uZS4gRG8geW91IGhhdmUg
YSByZWNvbW1lbmRhdGlvbj8gSSdtIHN1cmUgdGhlcmUgYXJlIGRvY3MgSSBqdXN0Cj4gaGF2ZW4n
dCBsb29rZWQgYXQgdGhlbS4KClRvIHN1bW1hcml6ZSB3aGF0IHdhcyBzYWlkIG9uIElSQywgSSB3
b3VsZCByZWNvbW1lbmQgdG8gdXNlIFFFTVUgCnVzZXItZW11bGF0aW9uIGluc3RlYWQuIFN0ZWZh
bm8gbWVudGlvbmVkIGhlIHdhcyB3b3JraW5nIG9uIGl0IGFuZCB3aWxsIApzZW5kIGFuIGUtbWFp
bCBhYm91dCBpdC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
