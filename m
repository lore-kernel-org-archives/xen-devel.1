From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v2 09/13] optee: add support for arbitrary
 shared memory
Date: Tue, 11 Sep 2018 22:33:50 +0300
Message-ID: <d1c4a572-bbb6-6c2b-f61f-9ae5aa82c47b@epam.com>
References: <1535993677-20816-1-git-send-email-volodymyr_babchuk@epam.com>
 <1535993677-20816-10-git-send-email-volodymyr_babchuk@epam.com>
 <4dd245b3-beba-e9fd-5367-f45358b07d8d@arm.com>
 <ee29941b-f838-3b93-1bab-d7a82c563be2@epam.com>
 <1eb0ed93-4dc9-3650-2681-f69d2c47baa9@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kz4p=lz=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1fzoQD-0005GM-TB
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 19:34:01 +0000
In-Reply-To: <1eb0ed93-4dc9-3650-2681-f69d2c47baa9@arm.com>
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

SGkgSnVsaWVuLAoKT24gMTEuMDkuMTggMTY6MzcsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSBW
b2xvZHlteXIsCj4gCj4gT24gMTAvMDkvMTggMTk6MDQsIFZvbG9keW15ciBCYWJjaHVrIHdyb3Rl
Ogo+PiBPbiAxMC4wOS4xOCAxNzowMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gT24gMDMvMDkv
MTggMTc6NTQsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgpbLi4uXQo+Pj4KPj4+PiArwqDCoMKg
IGlmICggIXBhZ2VzX2RhdGFfeGVuX3N0YXJ0ICkKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IGZhbHNlOwo+Pj4+ICsKPj4+PiArwqDCoMKgIHNobV9idWYgPSBhbGxvY2F0ZV9zaG1fYnVmKGN0
eCwgcGFyYW0tPnUudG1lbS5zaG1fcmVmLCBudW1fcGFnZXMpOwo+Pj4KPj4+IEluIGFsb2NhdGVf
c2htX2J1ZiB5b3UgYXJlIG5vdyBnbG9iYWxseSBsaW1pdGluZyB0aGUgbnVtYmVyIG9mIHBhZ2Vz
IAo+Pj4gKCAoMTYzODQpIHRvIHBpbi4gSG93ZXZlciwgdGhpcyBkb2VzIG5vdCBsaW1pdCBwZXIg
Y2FsbC4KPj4+Cj4+PiBXaXRoIHRoZSBjdXJyZW50IGxpbWl0LCB5b3Ugd291bGQgY291bGQgY2Fs
bCB1cCB0byAxNjM4NCB0aW1lcyAKPj4+IGxvb2t1cF9hbmRfcGluX2d1ZXN0X3JhbV9hZGRyKC4u
LikuIE9uIEFybSwgZm9yIHAybSByZWxhdGVkIAo+Pj4gb3BlcmF0aW9uLCB3ZSBsaW1pdCB0byA1
MTIgaXRlcmF0aW9ucyBpbiBvbmUgZ28gYmVmb3JlIGNoZWNraW5nIHRoZSAKPj4+IHByZWVtcHRp
b24uCj4+PiBTbyBJIHRoaW5rIDE2Mzg0IHRpbWVzIGlzIGZhciB0b28gbXVjaC4KPj4gU28sIGlu
IG90aGVyIHdvcmRzLCBJIGNhbiB0cmFuc2xhdGUgb25seSAyTUIgYnVmZmVyIChpZiA0MDk2S0Ig
cGFnZXMgCj4+IGFyZSB1c2VkKSwgaXMgaXQgcmlnaHQ/Cj4gCj4gMk1CIGZvciB0aGUgd2hvbGUg
Y29tbWFuZC4gU28gaWYgeW91IGhhdmUgNSBidWZmZXIgaW4gdGhlIGNvbW1hbmQsIHRoZW4gCj4g
dGhlIHN1bSBvZiB0aGUgYnVmZmVyIHNob3VsZCBub3QgYmUgYmlnZ2VyIHRoYW4gMk1CLgo0ICBi
dWZmZXJzLCBidXQgeWVzLCBpdCBjYW4gYmUgdXAgdG8gOE1CLiBPa2F5LCBJJ2xsIGFkZCBwZXIt
Y2FsbCAKY291bnRlciB0byBsaW1pdCBtZW1vcnkgdXNhZ2UgZm9yIGEgd2hvbGUgY2FsbC4KCj4g
SG93ZXZlciwgMk1CIG1pZ2h0IGJlIHRvbyBiaWcgY29uc2lkZXJpbmcgdGhhdCB5b3UgYWxzbyBu
ZWVkIHRvIGFjY291bnQgCj4gdGhlIFNNQyBjYWxsLiBEb2VzIGJ1ZmZlciBjYW4gYmUgcGFzc2Vk
IGZvciBmYXN0IGNhbGw/Ck5vLCBhbGwgc3VjaCBjYWxscyBhcmUgeWllbGRpbmcgY2FsbHMsIHNv
IHlvdSBjYW4gaWdub3JlIHRpbWUgdXNlZCBmb3IgClNNQyBjYWxsIGl0c2VsZi4KCgotLSAKVm9s
b2R5bXlyIEJhYmNodWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
