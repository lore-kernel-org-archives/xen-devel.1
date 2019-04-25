From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] x86/mem_sharing: replace use of
 page_lock/unlock with our own lock
Date: Thu, 25 Apr 2019 19:58:05 +0100
Message-ID: <ced3d7b5-e683-f17c-b068-2d372f59c498@citrix.com>
References: <20190425153252.14795-1-tamas@tklengyel.com>
 <20190425153252.14795-2-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PBl1=S3=citrix.com=prvs=0115b8627=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hJjZQ-0002YN-Op
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 18:58:08 +0000
In-Reply-To: <20190425153252.14795-2-tamas@tklengyel.com>
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDQvMjAxOSAxNjozMiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IGRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS9hc20teDg2L21tLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKPiBp
bmRleCA2ZmFhNTYzMTY3Li41OTRkZTYxNDhmIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2Fz
bS14ODYvbW0uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAo+IEBAIC0xMzMsNyAr
MTMzLDEwIEBAIHN0cnVjdCBwYWdlX2luZm8KPiAgICAgICAgICAgKiBvZiBzaGFyaW5nIHNoYXJl
IHRoZSB2ZXJzaW9uIHRoZXkgZXhwZWN0IHRvLgo+ICAgICAgICAgICAqIFRoaXMgbGlzdCBpcyBh
bGxvY2F0ZWQgYW5kIGZyZWVkIHdoZW4gYSBwYWdlIGlzIHNoYXJlZC91bnNoYXJlZC4KPiAgICAg
ICAgICAgKi8KPiAtICAgICAgICBzdHJ1Y3QgcGFnZV9zaGFyaW5nX2luZm8gKnNoYXJpbmc7Cj4g
KyAgICAgICAgc3RydWN0IHsKPiArICAgICAgICAgICAgc3RydWN0IHBhZ2Vfc2hhcmluZ19pbmZv
ICppbmZvOwo+ICsgICAgICAgICAgICByd2xvY2tfdCBsb2NrOwo+ICsgICAgICAgIH0gc2hhcmlu
ZzsKPiAgICAgIH07Cj4gIAo+ICAgICAgLyogUmVmZXJlbmNlIGNvdW50IGFuZCB2YXJpb3VzIFBH
Q194eHggZmxhZ3MgYW5kIGZpZWxkcy4gKi8KCkknbSBhZnJhaWQgdGhpcyBpcyBhIG5vLWdvLCBi
dXQgZm9yIHNvbWUgcmVhc29ucyB3aGljaCBhcmUgcmF0aGVyIG1vcmUKc3VidGxlIHRoYXQgdGhl
eSBhcHBlYXIgaGVyZS4KClRoZXJlIGlzIG9uZSBzdHJ1Y3QgcGFnZV9pbmZvIHBlciA0ayBmcmFt
ZSwgYW5kIHlvdSd2ZSBhZGRlZCBhbiBleHRyYSAxNgpieXRlcywgdGFraW5nIGl0IGZyb20gMzIg
Ynl0ZXMgdG8gNDggYnl0ZXMuCgpPdGhlciB0aGFuIG1ha2luZyBpdCBhIG5vbi1wb3dlci1vZi0y
IChuZXQgZGlmZnN0YXQgZ3Jvdy9zaHJpbms6IDI1Ni8yNwp1cC9kb3duOiA3NzUwLy01Njk2ICgy
MDU0KSBkdWUgdG8gbGVzcyBlZmZpY2llbnQgYXJpdGhtZXRpY1sxXSksIHRoZQpmcmFtdGFibGUg
aGFzIGEgZml4ZWQgdmlydHVhbCBzaXplICgxMjhHIGJ5IGRlZmF1bHQpLCBzbyB5b3UndmUgZW5k
ZWQgdXAKZHJvcHBpbmcgWGVuJ3MgbWVtb3J5IGxpbWl0ICgxNlRCIGJ5IGRlZmF1bHQpIGJ5IDEv
My4KCn5BbmRyZXcKClsxXSBUaGUgZHJvcCBpcyBhbG1vc3QgYWxsIGluIHBkeF9ncm91cF92YWxp
ZCBkYXRhc3RydWN0dXJlLCB3aGljaCBpcyBhCmZ1bmN0aW9uIG9mIHRoZSBtYXggc3VwcG9ydGVk
IG1lbW9yeSBsaW1pdC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
