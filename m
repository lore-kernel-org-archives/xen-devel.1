From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: [PATCH v1] Fix p2m_set_suppress_ve
Date: Wed, 3 Apr 2019 11:12:08 -0600
Message-ID: <CABfawhk_xOw4NYHJds5HGxa4k2ADH6zgfyPjqgxmSyyuSM6GTQ@mail.gmail.com>
References: <20190403142620.1224-1-aisaila@bitdefender.com>
 <5CA4C9F9020000780022450F@prv1-mh.provo.novell.com>
 <aa35ec83-77d2-ffc3-c82a-96c666f97227@bitdefender.com>
 <5CA4D1880200007800224564@prv1-mh.provo.novell.com>
 <9d608c8e-3fd8-8d26-c68d-13b2e7540fc8@bitdefender.com>
 <5CA4D9A102000078002245AB@prv1-mh.provo.novell.com>
 <CABfawhk9b8HcuC+EGQcEfZ1QqdPFOC4=Sx96EsEdFRSZUTLXdQ@mail.gmail.com>
 <554186de-0981-8c3b-a1b4-e2d5bec80701@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=S+kA=SF=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hBjRQ-00028W-6P
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 17:12:48 +0000
Received: by mail-wm1-x344.google.com with SMTP id w15so9265994wmc.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2019 10:12:46 -0700 (PDT)
In-Reply-To: <554186de-0981-8c3b-a1b4-e2d5bec80701@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBcHIgMywgMjAxOSBhdCAxMTowOCBBTSBSYXp2YW4gQ29qb2NhcnUKPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4gT24gNC8zLzE5IDc6MTYgUE0sIFRhbWFzIEsg
TGVuZ3llbCB3cm90ZToKPiA+IEl0IGlzIHJpZ2h0IHRvIGZ1bGx5IHBvcHVsYXRlIGEgc2xvdCB3
aGVuIGZvciBleGFtcGxlIHdlIHdhbnQKPiA+IGRpZmZlcmVudCBtZW1fYWNjZXNzIHBlcm1pc3Np
b25zIGluIGRpZmZlcmVudCBhbHRwMm0gdmlld3MuIFdlIGNhbid0Cj4gPiB3YWl0IGZvciB0aGUg
ZG9tYWluIHRvIG9uLWRlbWFuZCBwb3B1bGF0ZSB0aGUgYWx0cDJtIHZpZXcgYmVjYXVzZSB3ZQo+
ID4gZG9uJ3Qga25vdyB3aGVuIChhbmQgaWYpIHRoYXQgd2lsbCBhY3R1YWxseSBoYXBwZW4uIFNv
Cj4gPiBwMm1fc2V0X2FsdHAybV9tZW1fYWNjZXNzIGFscmVhZHkgY29waWVzIHRoZSBlbnRyeSBv
dmVyIGZyb20gdGhlCj4gPiBob3N0cDJtIHRvIHRoZSBhbHRwMm0gYW5kIHRoZW4gYXBwbGllcyB0
aGUgcmVxdWVzdGVkIG1lbV9hY2Nlc3MKPiA+IHNldHRpbmcuIFRoaXMgaXMgZG9uZSBldmVuIGlm
IHRoZSBtZW1fYWNjZXNzIHNldHRpbmcgaXMgdGhlIHNhbWUgYXMgaXQKPiA+IHdhcyBpbiB0aGUg
aG9zdHAybS4KPiA+Cj4gPiBEb2luZyB0aGUgc2FtZSBiZWhhdmlvciBmb3IgcDJtX3NldF9zdXBw
cmVzc192ZSBJIHRoaW5rIGlzIGNvbnNpc3RlbnQsCj4gPiBhbGJlaXQgeW91IGNvdWxkIGVhc2ls
eSBvdmVyY29tZSB0aGUgaXNzdWUgYnkgZmlyc3Qgc2ltcGx5IHNldHRpbmcgYQo+ID4gbWVtX2Fj
Y2VzcyBwZXJtaXNzaW9uIG9uIHRoZSBnZm4gdG8gdHJpZ2dlciB0aGUgYWZvcmVtZW50aW9uZWQg
Y29weSB0bwo+ID4gdGhlIGFsdHAybSBiZWZvcmUgeW91IHRyeSB0byBzZXQgdGhlIHZlIHNldHRp
bmdzLgo+Cj4gVGhhdCdzIHdoYXQgd2UncmUgZG9pbmcgbm93LCBidXQgaXQgd2Fzbid0IGF0IGFs
bCBpbnR1aXRpdmUgdG8gZmlndXJlIGl0Cj4gb3V0LiBJJ2QgZXhwZWN0IHRoYXQgc2V0dGluZyB0
aGUgU1ZFIGJpdCBzaW1wbHkgd29ya3Mgd2l0aG91dAo+IG1hbmV1dmVyaW5nIHNvbWV0aGluZyBl
bHNlIGluIHBsYWNlIGZpcnN0LgoKWWVhcCwgbWFrZXMgc2Vuc2UgdG8gbWUgOikKClRhbWFzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
