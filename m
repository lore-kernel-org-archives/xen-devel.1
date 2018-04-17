From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: Weird altp2m behaviour when switching early to a
 new view
Date: Tue, 17 Apr 2018 11:07:58 -0600
Message-ID: <CABfawhkuECCJALGX77xewMWT-T27jrrURBifYkUrjT_D-2tKMw@mail.gmail.com>
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
 <4a526aeb-b830-8f49-3845-2da635b4785d@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n2gu=hg=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1f8U5z-00089O-81
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 17:08:43 +0000
Received: by mail-wr0-f180.google.com with SMTP id h3so24915645wrh.5
 for <xen-devel@lists.xenproject.org>; Tue, 17 Apr 2018 10:08:41 -0700 (PDT)
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com.
 [209.85.128.179])
 by smtp.gmail.com with ESMTPSA id n8sm6974916edb.5.2018.04.17.10.08.39
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Apr 2018 10:08:39 -0700 (PDT)
Received: by mail-wr0-f179.google.com with SMTP id o15so6549790wro.11
 for <xen-devel@lists.xenproject.org>; Tue, 17 Apr 2018 10:08:39 -0700 (PDT)
In-Reply-To: <4a526aeb-b830-8f49-3845-2da635b4785d@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <dunlapg@umich.edu>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMTcsIDIwMTggYXQgOToxMyBBTSwgUmF6dmFuIENvam9jYXJ1CjxyY29qb2Nh
cnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPiBPbiAwNC8xNy8yMDE4IDA1OjU4IFBNLCBHZW9y
Z2UgRHVubGFwIHdyb3RlOgo+Pj4+IEl0IG1pZ2h0IGJlIG5pY2UgdG8gaGF2ZSBhIG1vcmUgc3Ry
dWN0dXJlZCB3YXkgb2Yga2VlcGluZyBhbGwgdGhlc2UKPj4+PiBjaGFuZ2VzIGluIHN5bmMsIHJh
dGhlciB0aGFuIHJlbHlpbmcgb24gdGhpcyBvcGVuLWNvZGluZyBldmVyeXdoZXJlLgo+Pj4KPj4+
IFZlcnkgdHJ1ZS4gSXQgaGFzIGFsc28gb2NjdXJlZCB0byBtZSB0aGF0IHNvbWUgb2YgdGhlc2Ug
aXNzdWVzIHdvdWxkIGJlCj4+PiBhdCBsZWFzdCBwYXJ0aWFsbHkgbWl0aWdhdGVkIGlmIGFsdHAy
bSB3YXMgYWx3YXlzIG9uLCBidXQgb2YgY291cnNlIEkKPj4+IGNhbiBhbHNvIHNlZSB3aHkgdGhh
dCB3b3VsZCBiZSBmcm93bmVkIHVwb24gYXQgdGhpcyB0aW1lLgo+Pgo+PiBIb3cgd291bGQgaGF2
aW5nIGl0IGVuYWJsZWQgYWxsIHRoZSB0aW1lIGhhdmUgaGVscGVkIGluIHRoaXMgc2l0dWF0aW9u
Pwo+Cj4gV2VsbCwgdGhlIGRlZmF1bHQgcDJtIHdvdWxkIGp1c3QgYmUKPiBkLT5hcmNoLmFsdHAy
bV9wMm1bMF0sIGFsbCBhbHRwMm1fYWN0aXZlKGQpIGNoZWNrcyB3b3VsZCBiZSBnb25lLCB0aGUK
PiBhY3RpdmUgcDJtIGZvciBhIGdpdmVuIFZDUFUgd291bGQgYWx3YXlzIGJlIHAybV9nZXRfYWx0
cDJtKHYpLCBhbmQgc28KPiBvbi4gSWYgSSB1bmRlcnN0YW5kIHRoZSBkZXNpZ24gY29ycmVjdGx5
LCB0aGF0IGlzLiA6KQoKSSB3b3VsZCBhbHNvIGxpa2UgdGhpcyBzZXR1cCwgaXQgd291bGQgc2lt
cGxpZnkgdGhpbmdzIGEgbG90LgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
