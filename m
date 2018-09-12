From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v2 09/13] optee: add support for arbitrary
 shared memory
Date: Wed, 12 Sep 2018 15:45:00 +0300
Message-ID: <53637866-ab4b-33ec-c4b3-ecc41700223d@epam.com>
References: <1535993677-20816-1-git-send-email-volodymyr_babchuk@epam.com>
 <1535993677-20816-10-git-send-email-volodymyr_babchuk@epam.com>
 <4dd245b3-beba-e9fd-5367-f45358b07d8d@arm.com>
 <ee29941b-f838-3b93-1bab-d7a82c563be2@epam.com>
 <1eb0ed93-4dc9-3650-2681-f69d2c47baa9@arm.com>
 <d1c4a572-bbb6-6c2b-f61f-9ae5aa82c47b@epam.com>
 <5ce9ca5f-0549-f888-381d-2990ba655d32@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tu0h=l2=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1g04WC-0004vM-CL
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 12:45:16 +0000
In-Reply-To: <5ce9ca5f-0549-f888-381d-2990ba655d32@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org, xen-devel@lists.xen.org
Cc: tee-dev@lists.linaro.org, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMi4wOS4xOCAxNDowMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IAo+IAo+IE9uIDA5
LzExLzIwMTggMDg6MzMgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+PiBIaSBKdWxpZW4s
Cj4gCj4gSGksCj4gCj4+IE9uIDExLjA5LjE4IDE2OjM3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+
PiBIaSBWb2xvZHlteXIsCj4+Pgo+Pj4gT24gMTAvMDkvMTggMTk6MDQsIFZvbG9keW15ciBCYWJj
aHVrIHdyb3RlOgo+Pj4+IE9uIDEwLjA5LjE4IDE3OjAyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+
Pj4+IE9uIDAzLzA5LzE4IDE3OjU0LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4gWy4uLl0K
Pj4+Pj4KPj4+Pj4+ICvCoMKgwqAgaWYgKCAhcGFnZXNfZGF0YV94ZW5fc3RhcnQgKQo+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsKPj4+Pj4+ICsKPj4+Pj4+ICvCoMKgwqAgc2ht
X2J1ZiA9IGFsbG9jYXRlX3NobV9idWYoY3R4LCBwYXJhbS0+dS50bWVtLnNobV9yZWYsIAo+Pj4+
Pj4gbnVtX3BhZ2VzKTsKPj4+Pj4KPj4+Pj4gSW4gYWxvY2F0ZV9zaG1fYnVmIHlvdSBhcmUgbm93
IGdsb2JhbGx5IGxpbWl0aW5nIHRoZSBudW1iZXIgb2YgCj4+Pj4+IHBhZ2VzICggKDE2Mzg0KSB0
byBwaW4uIEhvd2V2ZXIsIHRoaXMgZG9lcyBub3QgbGltaXQgcGVyIGNhbGwuCj4+Pj4+Cj4+Pj4+
IFdpdGggdGhlIGN1cnJlbnQgbGltaXQsIHlvdSB3b3VsZCBjb3VsZCBjYWxsIHVwIHRvIDE2Mzg0
IHRpbWVzIAo+Pj4+PiBsb29rdXBfYW5kX3Bpbl9ndWVzdF9yYW1fYWRkciguLi4pLiBPbiBBcm0s
IGZvciBwMm0gcmVsYXRlZCAKPj4+Pj4gb3BlcmF0aW9uLCB3ZSBsaW1pdCB0byA1MTIgaXRlcmF0
aW9ucyBpbiBvbmUgZ28gYmVmb3JlIGNoZWNraW5nIHRoZSAKPj4+Pj4gcHJlZW1wdGlvbi4KPj4+
Pj4gU28gSSB0aGluayAxNjM4NCB0aW1lcyBpcyBmYXIgdG9vIG11Y2guCj4+Pj4gU28sIGluIG90
aGVyIHdvcmRzLCBJIGNhbiB0cmFuc2xhdGUgb25seSAyTUIgYnVmZmVyIChpZiA0MDk2S0IgcGFn
ZXMgCj4+Pj4gYXJlIHVzZWQpLCBpcyBpdCByaWdodD8KPj4+Cj4+PiAyTUIgZm9yIHRoZSB3aG9s
ZSBjb21tYW5kLiBTbyBpZiB5b3UgaGF2ZSA1IGJ1ZmZlciBpbiB0aGUgY29tbWFuZCwgCj4+PiB0
aGVuIHRoZSBzdW0gb2YgdGhlIGJ1ZmZlciBzaG91bGQgbm90IGJlIGJpZ2dlciB0aGFuIDJNQi4K
Pj4gNMKgIGJ1ZmZlcnMsIGJ1dCB5ZXMsIGl0IGNhbiBiZSB1cCB0byA4TUIuIE9rYXksIEknbGwg
YWRkIHBlci1jYWxsIAo+PiBjb3VudGVyIHRvIGxpbWl0IG1lbW9yeSB1c2FnZSBmb3IgYSB3aG9s
ZSBjYWxsLgo+IAo+IFRoYXQgd291bGQgbmVlZCB0byBiZSByZWR1Y2VkIHRvIDJNQiBpbiB0b3Rh
bCBwZXIgY2FsbC4gWW91IHByb2JhYmx5IAo+IHdhbnQgdG8gbG9vayBhdCBtYXhfb3JkZXIoLi4u
KS4KWWVzLCB0aGlzIGlzIHdoYXQgSSB3YXMgc2F5aW5nLiA1MTIgcGFnZXMgcGVyIGNhbGwuCgo+
Pgo+Pj4gSG93ZXZlciwgMk1CIG1pZ2h0IGJlIHRvbyBiaWcgY29uc2lkZXJpbmcgdGhhdCB5b3Ug
YWxzbyBuZWVkIHRvIAo+Pj4gYWNjb3VudCB0aGUgU01DIGNhbGwuIERvZXMgYnVmZmVyIGNhbiBi
ZSBwYXNzZWQgZm9yIGZhc3QgY2FsbD8KPj4gTm8sIGFsbCBzdWNoIGNhbGxzIGFyZSB5aWVsZGlu
ZyBjYWxscywgc28geW91IGNhbiBpZ25vcmUgdGltZSB1c2VkIGZvciAKPj4gU01DIGNhbGwgaXRz
ZWxmLgo+IAo+IEhvdyBjb21lIHlvdSBjYW4gaWdub3JlIGl0PyBJdCBoYXMgYSBjb3N0IHRvIHRy
YXAgdG8gRUwzLgpTdHJpY3RseSBzcGVha2luZywgeWVzLiBBbGwgc3RlcHMgaGFzIGNvc3Q6IHRy
YXAgdG8gRUwzLCBkaXNwYXRjaCBpbiBFTDMsCnN3aXRjaCB0byBTLUVMMSwgbmV3IHRocmVhZCBw
cmVwYXJhdGlvbiBpbiBPUC1URUUsIGNvbnRleHQgc3dpdGNoIGluIApPUC1URUUuCkkgd2FudGVk
IHRvIHRlbGwsIHRoYXQgaW4gbXkgb3BpbmlvbiwgdGhpcyBpcyBuZWdsaWdpYmxlIGluIGNvbXBh
cmlzb24gCndpdGggdGhlIGFjdHVhbCBjYWxsIHByb2Nlc3NpbmcuIEJ1dCBtYXliZSwgSSdtIHdy
b25nIHRoZXJlLgoKLS0gClZvbG9keW15ciBCYWJjaHVrCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
