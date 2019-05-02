From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/vmx: correctly gather gs_shadow
 value for current vCPU
Date: Thu, 2 May 2019 11:45:44 +0100
Message-ID: <3b239422-9639-2691-19fe-2a7a00f7a52f@citrix.com>
References: <20190501235203.1179-1-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Flb6=TC=citrix.com=prvs=018be947d=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hM9E1-0004qZ-5F
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 10:46:01 +0000
In-Reply-To: <20190501235203.1179-1-tamas@tklengyel.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDUvMjAxOSAwMDo1MiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5j
Cj4gaW5kZXggMjgzZWI3YjM0ZC4uNTE1NGVjYzJhOCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94
ODYvaHZtL3ZteC92bXguYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCj4gQEAg
LTc3OSwxMiArNzc5LDE3IEBAIHN0YXRpYyB2b2lkIHZteF9sb2FkX2NwdV9zdGF0ZShzdHJ1Y3Qg
dmNwdSAqdiwgc3RydWN0IGh2bV9od19jcHUgKmRhdGEpCj4gIAo+ICBzdGF0aWMgdm9pZCB2bXhf
c2F2ZV92bWNzX2N0eHQoc3RydWN0IHZjcHUgKnYsIHN0cnVjdCBodm1faHdfY3B1ICpjdHh0KQo+
ICB7Cj4gKyAgICBpZiAoIHYgPT0gY3VycmVudCApCj4gKyAgICAgICAgdm14X3NhdmVfZ3Vlc3Rf
bXNycyh2KTsKPiArCj4gICAgICB2bXhfc2F2ZV9jcHVfc3RhdGUodiwgY3R4dCk7Cj4gICAgICB2
bXhfdm1jc19zYXZlKHYsIGN0eHQpOwo+ICB9Cj4gIAo+ICBzdGF0aWMgaW50IHZteF9sb2FkX3Zt
Y3NfY3R4dChzdHJ1Y3QgdmNwdSAqdiwgc3RydWN0IGh2bV9od19jcHUgKmN0eHQpCj4gIHsKPiAr
ICAgIEFTU0VSVCh2ICE9IGN1cnJlbnQpOwoKSSdkIGxlYXZlIGEgY29tbWVudCBhbG9uZyB0aGUg
bGluZXMgb2YgLyogTm90IGN1cnJlbnRseSBzYWZlIHRvIHVzZSBpbgpjdXJyZW50IGNvbnRleHQu
ICovCgpDYW4gYmUgZml4ZWQgdXAgb24gY29tbWl0LgoKVGhpcyB2ZXJzaW9uIGlzIG11Y2ggY2xl
YW5lciwgYXJjaGl0ZWN0dXJhbGx5IHNwZWFraW5nLCBzbyBSZXZpZXdlZC1ieToKQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkknbGwgZHJvcCB0aGUgcHJldmlvdXMg
dmVyc2lvbiBvdXQgb2YgeDg2LW5leHQuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
