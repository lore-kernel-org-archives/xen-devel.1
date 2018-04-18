From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: Weird altp2m behaviour when switching early to a
 new view
Date: Wed, 18 Apr 2018 13:49:53 +0300
Message-ID: <79c1a193-3c69-fd6a-08b1-0ca26344f409@bitdefender.com>
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
 <169a55af-ae07-5b5a-6d34-dc7fb486300f@bitdefender.com>
 <0795350f-d2d1-afe8-3a5c-03d5734f4b2a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=z22v=hh=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1f8kf1-0008Dq-AK
 for xen-devel@lists.xenproject.org; Wed, 18 Apr 2018 10:49:59 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id E49D2310C61A
 for <xen-devel@lists.xenproject.org>; Wed, 18 Apr 2018 15:06:01 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 114BF7FC3F
 for <xen-devel@lists.xenproject.org>; Wed, 18 Apr 2018 13:49:57 +0300 (EEST)
In-Reply-To: <0795350f-d2d1-afe8-3a5c-03d5734f4b2a@citrix.com>
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

T24gMDQvMTgvMjAxOCAwMTo0NSBQTSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAwNC8xOC8y
MDE4IDA5OjIwIEFNLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4+IE9uIDA0LzE3LzIwMTggMDQ6
NTMgUE0sIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+PiBPbiAwNC8xNy8yMDE4IDExOjUwIEFNLCBS
YXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4+Pj4gIHZvaWQgcDJtX2luaXRfYWx0cDJtX2VwdChzdHJ1
Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgaSkKPj4+PiAgewo+Pj4+ICAgICAgc3RydWN0IHAy
bV9kb21haW4gKnAybSA9IGQtPmFyY2guYWx0cDJtX3AybVtpXTsKPj4+PiArICAgIHN0cnVjdCBw
Mm1fZG9tYWluICpob3N0cDJtID0gcDJtX2dldF9ob3N0cDJtKGQpOwo+Pj4+ICAgICAgc3RydWN0
IGVwdF9kYXRhICplcHQ7Cj4+Pj4gIAo+Pj4+ICsgICAgcDJtLT5tYXhfbWFwcGVkX3BmbiA9IGhv
c3RwMm0tPm1heF9tYXBwZWRfcGZuOwo+Pj4+ICsgICAgcDJtLT5kZWZhdWx0X2FjY2VzcyA9IGhv
c3RwMm0tPmRlZmF1bHRfYWNjZXNzOwo+Pj4+ICsgICAgcDJtLT5kb21haW4gPSBob3N0cDJtLT5k
b21haW47Cj4+Pj4gKyAgICBwMm0tPmxvZ2RpcnR5X3JhbmdlcyA9IGhvc3RwMm0tPmxvZ2RpcnR5
X3JhbmdlczsKPj4+PiArICAgIHAybS0+Z2xvYmFsX2xvZ2RpcnR5ID0gaG9zdHAybS0+Z2xvYmFs
X2xvZ2RpcnR5Owo+Pj4KPj4+IFRoaXMgd291bGQgY2VydGFpbmx5IGJlIG9uZSBhcHByb2FjaC4g
IEJ1dCB0aGVuIHdlJ2QgbmVlZCB0byBrZWVwIGEgbG90Cj4+PiBtb3JlIG9mIHRoZXNlIHRoaW5n
cyBpbiBzeW5jIC0tIGZvciBpbnN0YW5jZSwgd2UnZCBoYXZlIHRvIGhhdmUgc2ltaWxhcgo+Pj4g
Y29kZSB0byBlbmFibGUgYW5kIGRpc2FibGUgZ2xvYmFsX2xvZ2RpcnR5IG9uIGFsbCBhY3RpdmUg
YWx0cDJtIGVudHJpZXMuCj4+Pgo+Pj4gWy4uLl0KPj4+Cj4+PiBUaGUgb3RoZXIgdGhpbmcgdGhh
dCBzZWVtcyB0byBiZSBtaXNzaW5nIGZyb20gc3luY2hyb25pemF0aW9uIGlzIHRoYXQgaW4KPj4+
IHAybS1lcHQuYzplcHRfZW5hYmxlX3BtbCgpIHNldHMgdGhlIHAybS0+ZXB0LmFkIGJpdCAod2hp
Y2ggZW5kcyB1cCBiZWluZwo+Pj4gcGFydCBvZiB0aGUgZXB0cCkuICBUaGUgY29kZSBzZWVtcyB0
byBpbmRpY2F0ZSB0aGF0IHRoaXMgaXMgcmVxdWlyZWQgZm9yCj4+PiBQTUwgKGhhcmR3YXJlLWFz
c2lzdGVkIGxvZ2RpcnR5KSwgYnV0IEkgZG9uJ3Qgc2VlIGFueXdoZXJlIHRoaXMgaXMgc2V0Cj4+
PiBvciBjb3BpZWQgZnJvbSB0aGUgaG9zdCBwMm0uCj4+Pgo+Pj4gSXQgbWlnaHQgYmUgbmljZSB0
byBoYXZlIGEgbW9yZSBzdHJ1Y3R1cmVkIHdheSBvZiBrZWVwaW5nIGFsbCB0aGVzZQo+Pj4gY2hh
bmdlcyBpbiBzeW5jLCByYXRoZXIgdGhhbiByZWx5aW5nIG9uIHRoaXMgb3Blbi1jb2RpbmcgZXZl
cnl3aGVyZS4KPj4KPj4gRm9yIGxvZ2RpcnR5X3JhbmdlcyBhbmQgZ2xvYmFsX2xvZ2RpcnR5LCBJ
IHByb3Bvc2UgdGhhdCB3ZSBwdXQgdGhlbSBib3RoCj4+IGluIGEgZHluYW1pY2FsbHkgYWxsb2Nh
dGVkIHN0cnVjdCwgYW5kIGhhdmUgYWxsIHAybXMgc2hhcmUgYSBwb2ludGVyIHRvCj4+IHRoZW0u
IFRoYXQgd2F5LCBhbGwgdGhhdCdzIHJlcXVpcmVkIGlzIGZvciB0aGUgcG9pbnRlciB0byBiZSBz
ZXQgdXAgaW4KPj4gcDJtX2luaXRfYWx0cDJtX2VwdCgpIGFuZCB0aGUgYWN0dWFsIGRhdGEgd2ls
bCBiZSBhdXRvbWF0aWNhbGx5IHNoYXJlZAo+PiBiZXR3ZWVuIHAybXMuIElmIEkndmUgcmVhZCB0
aGUgY29kZSBjb3JyZWN0bHksIHRoZSBob3N0cDJtIGlzIHRoZSBsYXN0Cj4+IHRvIGJlIGRlc3Ry
b3llZCBhbmQgdGhlIGZpcnN0IHRvIGJlIGluaXRpYWxpemVkLCBzbyBpdCBzaG91bGQgd29yayB3
ZWxsCj4+IGFzIGxvbmcgYXMgYWxsIHAybXMgc3luY2hyb25pemUgYWNjZXNzIHRvIGxvZ2RpcnR5
X3JhbmdlcyBhbmQKPj4gZ2xvYmFsX2xvZ2RpcnR5ICh3aGljaCBJIGFzc3VtZSB0aGV5IGFscmVh
ZHkgZG8pLgo+IAo+IFRoYXQncyBhbiBpbnRlcmVzdGluZyBpZGVhOyBvbmUgcG90ZW50aWFsIGRp
c2FkdmFudGFnZSBpcyB0aGF0IGl0IHdvdWxkCj4gbWFrZSBsb2NraW5nIGV2ZW4gbW9yZSBjb21w
bGV4IHRoYW4gaXQgYWxyZWFkeSBpcy4gIEVuYWJsaW5nIC8gZGlzYWJsaW5nCj4gbG9nZGlydHkg
aXNuJ3QgYSBob3QgcGF0aCwgc28gbG9vcGluZyB0aHJvdWdoIHRoZSBhbHRwMm1zIHNob3VsZG4n
dCBoYXZlCj4gbXVjaCBvZiBhIHBlcmZvcm1hbmNlIGltcGFjdDsgKnJlYWRpbmcqIGlzIG11Y2gg
bW9yZSBjb21tb24sIHNvIGhhdmluZwo+IHRvIGdyYWIgYW4gZXh0cmEgc2V0IG9mIGxvY2tzIGlz
IG1vcmUgbGlrZWx5IHRvIGhhdmUgYSBwZXJmb3JtYW5jZQo+IGltcGFjdC4gIEFuZCBpdCdzIG5v
dCBjbGVhciB0byBtZSB0aGF0IHRoZSBjb21wbGV4aXR5IG9mIGtlZXBpbmcgc2V2ZXJhbAo+IGNv
cGllcyBpbiBzeW5jIGlzIHRoYXQgbXVjaCBoaWdoZXIgdGhhbiB0aGUgY29tcGxleGl0eSBvZiBh
ZGRpbmcgWWV0Cj4gQW5vdGhlciBNTSBMb2NrLgo+IAo+IFRob3NlIGFyZSBqdXN0IGluaXRpYWwg
cmVhY3Rpb25zIHRob3VnaCAtLSBmZWVsIGZyZWUgdG8gZXhwbG9yZSB0aGUKPiBzb2x1dGlvbiBz
cGFjZSBhbmQvb3IgYXJndWUgb3RoZXJ3aXNlLiA6LSkKCk5vLCB5b3UncmUgcmlnaHQsIHRoZXJl
J3Mgbm8gcG9pbnQgaW4gY29tcGxpY2F0aW5nIHRoaW5ncywgSSdsbCBqdXN0Cmxvb3Agb3ZlciB0
aGUgcDJtcy4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
