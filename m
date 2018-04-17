From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: Weird altp2m behaviour when switching early to a
 new view
Date: Tue, 17 Apr 2018 18:13:18 +0300
Message-ID: <4a526aeb-b830-8f49-3845-2da635b4785d@bitdefender.com>
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
 <8fb5e427-a0e6-79bd-3bae-5fcb6aba4613@bitdefender.com>
 <10c25f67-23aa-575e-a655-da57d308e16a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5zw6=hg=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1f8SIM-00081I-7C
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 15:13:22 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id CEA48310C607
 for <xen-devel@lists.xenproject.org>; Tue, 17 Apr 2018 19:29:24 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 274C57FC40
 for <xen-devel@lists.xenproject.org>; Tue, 17 Apr 2018 18:13:20 +0300 (EEST)
In-Reply-To: <10c25f67-23aa-575e-a655-da57d308e16a@citrix.com>
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

T24gMDQvMTcvMjAxOCAwNTo1OCBQTSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4+IEl0IG1pZ2h0
IGJlIG5pY2UgdG8gaGF2ZSBhIG1vcmUgc3RydWN0dXJlZCB3YXkgb2Yga2VlcGluZyBhbGwgdGhl
c2UKPj4+IGNoYW5nZXMgaW4gc3luYywgcmF0aGVyIHRoYW4gcmVseWluZyBvbiB0aGlzIG9wZW4t
Y29kaW5nIGV2ZXJ5d2hlcmUuCj4+Cj4+IFZlcnkgdHJ1ZS4gSXQgaGFzIGFsc28gb2NjdXJlZCB0
byBtZSB0aGF0IHNvbWUgb2YgdGhlc2UgaXNzdWVzIHdvdWxkIGJlCj4+IGF0IGxlYXN0IHBhcnRp
YWxseSBtaXRpZ2F0ZWQgaWYgYWx0cDJtIHdhcyBhbHdheXMgb24sIGJ1dCBvZiBjb3Vyc2UgSQo+
PiBjYW4gYWxzbyBzZWUgd2h5IHRoYXQgd291bGQgYmUgZnJvd25lZCB1cG9uIGF0IHRoaXMgdGlt
ZS4KPiAKPiBIb3cgd291bGQgaGF2aW5nIGl0IGVuYWJsZWQgYWxsIHRoZSB0aW1lIGhhdmUgaGVs
cGVkIGluIHRoaXMgc2l0dWF0aW9uPwoKV2VsbCwgdGhlIGRlZmF1bHQgcDJtIHdvdWxkIGp1c3Qg
YmUKZC0+YXJjaC5hbHRwMm1fcDJtWzBdLCBhbGwgYWx0cDJtX2FjdGl2ZShkKSBjaGVja3Mgd291
bGQgYmUgZ29uZSwgdGhlCmFjdGl2ZSBwMm0gZm9yIGEgZ2l2ZW4gVkNQVSB3b3VsZCBhbHdheXMg
YmUgcDJtX2dldF9hbHRwMm0odiksIGFuZCBzbwpvbi4gSWYgSSB1bmRlcnN0YW5kIHRoZSBkZXNp
Z24gY29ycmVjdGx5LCB0aGF0IGlzLiA6KQoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
