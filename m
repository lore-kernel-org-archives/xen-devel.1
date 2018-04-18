From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: Weird altp2m behaviour when switching early to a
 new view
Date: Wed, 18 Apr 2018 11:20:47 +0300
Message-ID: <169a55af-ae07-5b5a-6d34-dc7fb486300f@bitdefender.com>
References: <a592fcb3-c2c6-bd83-01a4-0ac7ba9f3fa5@bitdefender.com>
 <d0ae9d3e-31ee-a03b-dc9d-b86ceb92fe52@citrix.com>
 <b21c7573-7ca0-9ccc-eac7-5ff351fc54ce@bitdefender.com>
 <3bc816d7-2426-470a-36a3-83e2cd5c81ad@bitdefender.com>
 <3076ce00-8655-81fe-6dc1-b891da638ea2@bitdefender.com>
 <efaa504e-bc4f-243d-f558-cab3dc31b472@citrix.com>
 <de3ffdd5-a3ba-d89a-5ebc-6f17006ae75b@bitdefender.com>
 <CAFLBxZbjif+AeMPrc1CkbyjEiSGHJEW3tGNmMqZtCvp+3pOGeg@mail.gmail.com>
 <00b52489-51e5-6bc8-ccc2-7b44d2dec107@bitdefender.com>
 <359f9be1-b425-7569-d507-97beee8ec69d@bitdefender.com>
 <ea415dac-d9f3-eaa4-a8b2-c8a85a7b1809@bitdefender.com>
 <64b1a75f-a95c-1a72-e4aa-39c2e005f730@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=z22v=hh=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1f8iKm-0002aR-18
 for xen-devel@lists.xenproject.org; Wed, 18 Apr 2018 08:20:56 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 98C3F304C086
 for <xen-devel@lists.xenproject.org>; Wed, 18 Apr 2018 12:36:57 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id B79717FC3F
 for <xen-devel@lists.xenproject.org>; Wed, 18 Apr 2018 11:20:52 +0300 (EEST)
In-Reply-To: <64b1a75f-a95c-1a72-e4aa-39c2e005f730@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, George Dunlap <dunlapg@umich.edu>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMTcvMjAxOCAwNDo1MyBQTSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAwNC8xNy8y
MDE4IDExOjUwIEFNLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4+ICB2b2lkIHAybV9pbml0X2Fs
dHAybV9lcHQoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGkpCj4+ICB7Cj4+ICAgICAg
c3RydWN0IHAybV9kb21haW4gKnAybSA9IGQtPmFyY2guYWx0cDJtX3AybVtpXTsKPj4gKyAgICBz
dHJ1Y3QgcDJtX2RvbWFpbiAqaG9zdHAybSA9IHAybV9nZXRfaG9zdHAybShkKTsKPj4gICAgICBz
dHJ1Y3QgZXB0X2RhdGEgKmVwdDsKPj4gIAo+PiArICAgIHAybS0+bWF4X21hcHBlZF9wZm4gPSBo
b3N0cDJtLT5tYXhfbWFwcGVkX3BmbjsKPj4gKyAgICBwMm0tPmRlZmF1bHRfYWNjZXNzID0gaG9z
dHAybS0+ZGVmYXVsdF9hY2Nlc3M7Cj4+ICsgICAgcDJtLT5kb21haW4gPSBob3N0cDJtLT5kb21h
aW47Cj4+ICsgICAgcDJtLT5sb2dkaXJ0eV9yYW5nZXMgPSBob3N0cDJtLT5sb2dkaXJ0eV9yYW5n
ZXM7Cj4+ICsgICAgcDJtLT5nbG9iYWxfbG9nZGlydHkgPSBob3N0cDJtLT5nbG9iYWxfbG9nZGly
dHk7Cj4gCj4gVGhpcyB3b3VsZCBjZXJ0YWlubHkgYmUgb25lIGFwcHJvYWNoLiAgQnV0IHRoZW4g
d2UnZCBuZWVkIHRvIGtlZXAgYSBsb3QKPiBtb3JlIG9mIHRoZXNlIHRoaW5ncyBpbiBzeW5jIC0t
IGZvciBpbnN0YW5jZSwgd2UnZCBoYXZlIHRvIGhhdmUgc2ltaWxhcgo+IGNvZGUgdG8gZW5hYmxl
IGFuZCBkaXNhYmxlIGdsb2JhbF9sb2dkaXJ0eSBvbiBhbGwgYWN0aXZlIGFsdHAybSBlbnRyaWVz
Lgo+Cj4gWy4uLl0KPiAKPiBUaGUgb3RoZXIgdGhpbmcgdGhhdCBzZWVtcyB0byBiZSBtaXNzaW5n
IGZyb20gc3luY2hyb25pemF0aW9uIGlzIHRoYXQgaW4KPiBwMm0tZXB0LmM6ZXB0X2VuYWJsZV9w
bWwoKSBzZXRzIHRoZSBwMm0tPmVwdC5hZCBiaXQgKHdoaWNoIGVuZHMgdXAgYmVpbmcKPiBwYXJ0
IG9mIHRoZSBlcHRwKS4gIFRoZSBjb2RlIHNlZW1zIHRvIGluZGljYXRlIHRoYXQgdGhpcyBpcyBy
ZXF1aXJlZCBmb3IKPiBQTUwgKGhhcmR3YXJlLWFzc2lzdGVkIGxvZ2RpcnR5KSwgYnV0IEkgZG9u
J3Qgc2VlIGFueXdoZXJlIHRoaXMgaXMgc2V0Cj4gb3IgY29waWVkIGZyb20gdGhlIGhvc3QgcDJt
Lgo+IAo+IEl0IG1pZ2h0IGJlIG5pY2UgdG8gaGF2ZSBhIG1vcmUgc3RydWN0dXJlZCB3YXkgb2Yg
a2VlcGluZyBhbGwgdGhlc2UKPiBjaGFuZ2VzIGluIHN5bmMsIHJhdGhlciB0aGFuIHJlbHlpbmcg
b24gdGhpcyBvcGVuLWNvZGluZyBldmVyeXdoZXJlLgoKRm9yIGxvZ2RpcnR5X3JhbmdlcyBhbmQg
Z2xvYmFsX2xvZ2RpcnR5LCBJIHByb3Bvc2UgdGhhdCB3ZSBwdXQgdGhlbSBib3RoCmluIGEgZHlu
YW1pY2FsbHkgYWxsb2NhdGVkIHN0cnVjdCwgYW5kIGhhdmUgYWxsIHAybXMgc2hhcmUgYSBwb2lu
dGVyIHRvCnRoZW0uIFRoYXQgd2F5LCBhbGwgdGhhdCdzIHJlcXVpcmVkIGlzIGZvciB0aGUgcG9p
bnRlciB0byBiZSBzZXQgdXAgaW4KcDJtX2luaXRfYWx0cDJtX2VwdCgpIGFuZCB0aGUgYWN0dWFs
IGRhdGEgd2lsbCBiZSBhdXRvbWF0aWNhbGx5IHNoYXJlZApiZXR3ZWVuIHAybXMuIElmIEkndmUg
cmVhZCB0aGUgY29kZSBjb3JyZWN0bHksIHRoZSBob3N0cDJtIGlzIHRoZSBsYXN0CnRvIGJlIGRl
c3Ryb3llZCBhbmQgdGhlIGZpcnN0IHRvIGJlIGluaXRpYWxpemVkLCBzbyBpdCBzaG91bGQgd29y
ayB3ZWxsCmFzIGxvbmcgYXMgYWxsIHAybXMgc3luY2hyb25pemUgYWNjZXNzIHRvIGxvZ2RpcnR5
X3JhbmdlcyBhbmQKZ2xvYmFsX2xvZ2RpcnR5ICh3aGljaCBJIGFzc3VtZSB0aGV5IGFscmVhZHkg
ZG8pLgoKZXB0LmFkIHByb2JhYmx5IG5lZWRzIHRvIGJlIHByb3BhZ2F0ZWQgb24gZWFjaCBjaGFu
Z2UgYW5kIGNvcGllZCBmcm9tCnRoZSBob3N0cDJtIG9uIGFsdHAybSBpbml0LgoKClRoYW5rcywK
UmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
