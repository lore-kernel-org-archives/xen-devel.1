From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 09/13] optee: add support for arbitrary
 shared memory
Date: Wed, 12 Sep 2018 12:02:22 +0100
Message-ID: <5ce9ca5f-0549-f888-381d-2990ba655d32@arm.com>
References: <1535993677-20816-1-git-send-email-volodymyr_babchuk@epam.com>
 <1535993677-20816-10-git-send-email-volodymyr_babchuk@epam.com>
 <4dd245b3-beba-e9fd-5367-f45358b07d8d@arm.com>
 <ee29941b-f838-3b93-1bab-d7a82c563be2@epam.com>
 <1eb0ed93-4dc9-3650-2681-f69d2c47baa9@arm.com>
 <d1c4a572-bbb6-6c2b-f61f-9ae5aa82c47b@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hc24=l2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1g02ug-0003V6-Em
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 11:02:26 +0000
In-Reply-To: <d1c4a572-bbb6-6c2b-f61f-9ae5aa82c47b@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Volodymyr Babchuk <volodymyr_babchuk@epam.com>, xen-devel@lists.xenproject.org, xen-devel@lists.xen.org
Cc: tee-dev@lists.linaro.org, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwOS8xMS8yMDE4IDA4OjMzIFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiBIaSBK
dWxpZW4sCgpIaSwKCj4gT24gMTEuMDkuMTggMTY6MzcsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4g
SGkgVm9sb2R5bXlyLAo+Pgo+PiBPbiAxMC8wOS8xOCAxOTowNCwgVm9sb2R5bXlyIEJhYmNodWsg
d3JvdGU6Cj4+PiBPbiAxMC4wOS4xOCAxNzowMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IE9u
IDAzLzA5LzE4IDE3OjU0LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiBbLi4uXQo+Pj4+Cj4+
Pj4+ICvCoMKgwqAgaWYgKCAhcGFnZXNfZGF0YV94ZW5fc3RhcnQgKQo+Pj4+PiArwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIGZhbHNlOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgc2htX2J1ZiA9IGFsbG9j
YXRlX3NobV9idWYoY3R4LCBwYXJhbS0+dS50bWVtLnNobV9yZWYsIAo+Pj4+PiBudW1fcGFnZXMp
Owo+Pj4+Cj4+Pj4gSW4gYWxvY2F0ZV9zaG1fYnVmIHlvdSBhcmUgbm93IGdsb2JhbGx5IGxpbWl0
aW5nIHRoZSBudW1iZXIgb2YgcGFnZXMgCj4+Pj4gKCAoMTYzODQpIHRvIHBpbi4gSG93ZXZlciwg
dGhpcyBkb2VzIG5vdCBsaW1pdCBwZXIgY2FsbC4KPj4+Pgo+Pj4+IFdpdGggdGhlIGN1cnJlbnQg
bGltaXQsIHlvdSB3b3VsZCBjb3VsZCBjYWxsIHVwIHRvIDE2Mzg0IHRpbWVzIAo+Pj4+IGxvb2t1
cF9hbmRfcGluX2d1ZXN0X3JhbV9hZGRyKC4uLikuIE9uIEFybSwgZm9yIHAybSByZWxhdGVkIAo+
Pj4+IG9wZXJhdGlvbiwgd2UgbGltaXQgdG8gNTEyIGl0ZXJhdGlvbnMgaW4gb25lIGdvIGJlZm9y
ZSBjaGVja2luZyB0aGUgCj4+Pj4gcHJlZW1wdGlvbi4KPj4+PiBTbyBJIHRoaW5rIDE2Mzg0IHRp
bWVzIGlzIGZhciB0b28gbXVjaC4KPj4+IFNvLCBpbiBvdGhlciB3b3JkcywgSSBjYW4gdHJhbnNs
YXRlIG9ubHkgMk1CIGJ1ZmZlciAoaWYgNDA5NktCIHBhZ2VzIAo+Pj4gYXJlIHVzZWQpLCBpcyBp
dCByaWdodD8KPj4KPj4gMk1CIGZvciB0aGUgd2hvbGUgY29tbWFuZC4gU28gaWYgeW91IGhhdmUg
NSBidWZmZXIgaW4gdGhlIGNvbW1hbmQsIAo+PiB0aGVuIHRoZSBzdW0gb2YgdGhlIGJ1ZmZlciBz
aG91bGQgbm90IGJlIGJpZ2dlciB0aGFuIDJNQi4KPiA0wqAgYnVmZmVycywgYnV0IHllcywgaXQg
Y2FuIGJlIHVwIHRvIDhNQi4gT2theSwgSSdsbCBhZGQgcGVyLWNhbGwgCj4gY291bnRlciB0byBs
aW1pdCBtZW1vcnkgdXNhZ2UgZm9yIGEgd2hvbGUgY2FsbC4KClRoYXQgd291bGQgbmVlZCB0byBi
ZSByZWR1Y2VkIHRvIDJNQiBpbiB0b3RhbCBwZXIgY2FsbC4gWW91IHByb2JhYmx5IAp3YW50IHRv
IGxvb2sgYXQgbWF4X29yZGVyKC4uLikuCgo+IAo+PiBIb3dldmVyLCAyTUIgbWlnaHQgYmUgdG9v
IGJpZyBjb25zaWRlcmluZyB0aGF0IHlvdSBhbHNvIG5lZWQgdG8gCj4+IGFjY291bnQgdGhlIFNN
QyBjYWxsLiBEb2VzIGJ1ZmZlciBjYW4gYmUgcGFzc2VkIGZvciBmYXN0IGNhbGw/Cj4gTm8sIGFs
bCBzdWNoIGNhbGxzIGFyZSB5aWVsZGluZyBjYWxscywgc28geW91IGNhbiBpZ25vcmUgdGltZSB1
c2VkIGZvciAKPiBTTUMgY2FsbCBpdHNlbGYuCgpIb3cgY29tZSB5b3UgY2FuIGlnbm9yZSBpdD8g
SXQgaGFzIGEgY29zdCB0byB0cmFwIHRvIEVMMy4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
