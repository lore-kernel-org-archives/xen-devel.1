From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC PATCH] xen/arm: Add MVEBU UART driver for
	Armada 3700 SoC
Date: Mon, 12 Mar 2018 14:43:43 +0000
Message-ID: <b15cf813-6612-3b2a-bf47-951ffb04f2b5@arm.com>
References: <1520700252-19385-1-git-send-email-amittomer25@gmail.com>
 <1520700252-19385-2-git-send-email-amittomer25@gmail.com>
 <00ed1948-9c91-0216-6113-d8482e018ed7@arm.com>
 <CABHD4K-7iOrLwJZTroV=fpB12oJZu8etmQY3nt5ETRcoa66RzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=tain=gc=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1evOg4-0005GH-JY
 for xen-devel@lists.xenproject.org; Mon, 12 Mar 2018 14:43:52 +0000
In-Reply-To: <CABHD4K-7iOrLwJZTroV=fpB12oJZu8etmQY3nt5ETRcoa66RzQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Tomer <amittomer25@gmail.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andre Przywara <andre.przywara@arm.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMi8wMy8xOCAxNDozNiwgQW1pdCBUb21lciB3cm90ZToKPiBIaQoKSGkgQW1pdCwKCj4g
Cj4gVGhhbmtzIGZvciB0aGUgY29tbWVudHMuCj4gCj4+IE9PSSwgZG8geW91IGhhdmUgYW55IHBs
YW4gZm9yIGFkZGluZyBlYXJseXByaW50ayBzdXBwb3J0IGZvciB0aGF0IHBsYXRmb3JtPwo+IAo+
IEkgZGlkbid0IHRoaW5rIGFib3V0IGl0IGJ1dCBJIHdvdWxkIGxvb2sgaW50byBpdC4KClRoaXMg
aXMgcXVpdGUgdXNlZnVsIHRvIGdldCBvdXRwdXQgd2l0aG91dCBhbnkgc2VyaWFsIGRyaXZlci4g
SSBhbSBxdWl0ZSAKaW1wcmVzc2VkIHlvdSBtYW5hZ2VkIHRvIGRlYnVnIHlvdXIgc2VyaWFsIGRy
aXZlciB3aXRob3V0IGl0IDopLgoKPiAKPj4gUGxlYXNlIGdpdmUgYSBsaW5rIHRvIHRoZSBMaW51
eCBkcml2ZXIuIFRoaXMgd291bGQgaGVscCBtZSBmb3IgcmV2aWV3aW5nIGFuZAo+PiBhbHNvIGZv
ciBmdXR1cmUgcmVmZXJlbmNlLgo+IAo+IE9rLgo+IAo+PiBUaGlzIGlzIHBhcnQgb2YgeGVuL2Ry
aXZlcnMvY2hhci8qIHNvIGV2ZW4gaWYgdGhlIGRyaXZlciBpZiBvbmx5IGZvciBBUk0KPj4gaGFy
ZHdhcmUsIHlvdSBsaWtlbHkgd2FudCB0byBDQyAiVEhFIFJFU1QiIG1haW50YWluZXJzIGFzIHRo
aXMgaXMgdW5kZXIKPj4gZHJpdmVycy9jaGFyLiBzY3JpcHRzL2dldF9tYWludGFpbmVycy5wbCBj
YW4gaGVscCB5b3UgdG8gZmluZCByZWxldmFudAo+PiBtYWludGFpbmVycyB0byBDQyBvbiBlYWNo
IHBhdGNoLgo+IAo+IE9rLgo+IAo+ICAgPHhlbi8qPiBpbmNsdWRlIHNob3VsZCBiZSBmaXJzdCwg
dGhlbiA8YXNtLyo+Lgo+IAo+IE9rLCBJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IGl0
IHNob3VsZCBiZSBzb3J0ZWQgaW4gYWxwaGFiZXRpY2FsIG9yZGVyLgoKVGhleSBzaG91bGQgYmUg
c29ydGVkIGFscGhhYmV0aWNhbCwgYnV0IGFsbCA8YXNtLyo+IHNob3VsZCBiZSBhZnRlciAKPHhl
bi8qPiBzbyBjb21tb24gaGVhZGVycyBnZXRzIGluY2x1ZGVkIGZpcnN0LCB0aGVuIHRoZSBhcmNo
IHNwZWNpZmljIG9uZXMuCj4+PiArCj4+PiArI2RlZmluZSBUWF9GSUZPX1NJWkUgICAgICAgICAg
ICAzMgo+Pj4gKyNkZWZpbmUgUlhfRklGT19TSVpFICAgICAgICAgICAgNjQKPj4+ICsKPj4+ICtz
dGF0aWMgc3RydWN0IG12ZWJ1MzcwMF91YXJ0IHsKPj4+ICsgICAgdW5zaWduZWQgaW50IGJhdWQs
IGRhdGFfYml0cywgcGFyaXR5LCBzdG9wX2JpdHM7Cj4+Cj4+Cj4+IEFyZSBhbGwgdGhvc2UgZmll
bGRzIG5lY2Vzc2FyeT8gRm9yIGluc3RhbmNlLCB5b3UgYWx3YXlzIHNldCBiYXVkIGJ1dCBuZXZl
cgo+PiByZWFkIGl0Lgo+IAo+IE5vdCBzdXJlIGFib3V0IHRoaXMgYXMgSSBkb24ndCBrbm93IGlm
IHRoZXNlIGZpZWxkcyBhcmUgdXNlZCBieSBYRU4KPiBzZXJpYWwgaW5mcmFzdHJ1Y3R1cmUgbGF0
ZXIgb24uCgpUaGlzIGlzIGFuIGludGVybmFsIHN0cnVjdHVyZS4gSSBjYW4ndCBzZWUgaG93IHRo
ZSBzZXJpYWwgY29kZSB3b3VsZCAKa25vdyB0aGUgbGF5b3V0IGFuZCBhY2Nlc3MgdGhlIGZpZWxk
cy4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
