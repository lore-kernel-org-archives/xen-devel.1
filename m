From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: Fix VGA logdirty related display freezes with altp2m
Date: Wed, 24 Oct 2018 20:20:43 +0300
Message-ID: <944e2971-19e9-0011-cacb-4e815ca172e2@bitdefender.com>
References: <1539857272-4660-1-git-send-email-rcojocaru@bitdefender.com>
 <CABfawhmTCUqUV264hEjQWABohR42ezHPWBhL0GVT4cKuiDjyGg@mail.gmail.com>
 <d13f501e-4d43-2897-c995-badc276c7c68@bitdefender.com>
 <CABfawhk6gjBb_Ei3Z=QZwH7pnmX=gUQ30+q_hU7V9CSBB0=jwA@mail.gmail.com>
 <9b09e025-8622-c035-4b79-09b6772ab4df@bitdefender.com>
 <05efdf4c-b4ce-b136-d25e-83acdf3c4b1e@citrix.com>
 <CABfawh=Q7vOmutRSR84=x9Fkgg1Xrdd+cm6CSza7udUDt19g+A@mail.gmail.com>
 <20fb3eff-d438-59e9-3dea-9f36be40d039@bitdefender.com>
 <CABfawhn+NJ7Og91ko5yqHtzy-st_Fw3CeV-61GBULGoxQkFLog@mail.gmail.com>
 <5cfc59fc-186d-0d09-6fca-841a47fe2c19@bitdefender.com>
 <CABfawhmAqMi_q8ZM_na24Ss_DwXyu2Ysy2NgKsvbdZnEoJs11w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gv7k=ne=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gFMpu-00007N-56
 for xen-devel@lists.xenproject.org; Wed, 24 Oct 2018 17:20:50 +0000
In-Reply-To: <CABfawhmAqMi_q8ZM_na24Ss_DwXyu2Ysy2NgKsvbdZnEoJs11w@mail.gmail.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMjQvMTggODowOSBQTSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFR1ZSwgT2N0
IDIzLCAyMDE4IGF0IDY6MzcgQU0gUmF6dmFuIENvam9jYXJ1Cj4gPHJjb2pvY2FydUBiaXRkZWZl
bmRlci5jb20+IHdyb3RlOgo+Pgo+PiBUYW1hcywgY291bGQgeW91IHBsZWFzZSBnaXZlIHRoaXMg
YSBzcGluPwo+Pgo+PiBodHRwczovL2dpdGh1Yi5jb20vcmF6dmFuLWNvam9jYXJ1L3hlbi90cmVl
L2FsdHAybS1sb2dkaXJ0eS10YWtlMgo+Pgo+PiBJdCBfc2hvdWxkXyBzb2x2ZSB0aGUgY3Jhc2hl
cy4KPiAKPiBJbmRlZWQsIEkgbm8gbG9uZ2VyIHNlZSB0aGUgY3Jhc2guIEhvd2V2ZXIsIHRoZXJl
IG1pZ2h0IGJlIHNvbWUKPiBsb2NraW5nIGlzc3VlIHByZXNlbnQgYmVjYXVzZSB0aGUgd2hvbGUg
c3lzdGVtIGZyZWV6ZXMgdXAgc2hvcnRseQo+IGFmdGVyIHN0YXJ0aW5nIERSQUtWVUYgb24gYSBk
b21haW4gLSB3aXRoaW4gYSBjb3VwbGUgc2Vjb25kcy4gSSBtZWFuCj4gWGVuIGl0c2VsZiBsb2Nr
cyB1cDogbm8gcmVzcG9uc2Ugb24gdGhlIHNlcmlhbCwgZG9tMCBzY3JlZW4gZnJvemVuLAo+IGV0
Yy4KCkRvIHlvdSBoYXZlIGFueSB0eXBlIG9mIGxvZyAvIGJhY2t0cmFjZSAvIHdheSBJIGNvdWxk
IHJlcHJvZHVjZSBpdAp3aXRob3V0IERyYWt2dWY/IEFsbCB0aGUgd2F5cyBJJ3ZlIHRlc3RlZCBp
dCB3ZXJlIGZpbmUgKGluY2x1ZGluZwp4ZW4tYWNjZXNzKS4KCgpUaGFua3MsClJhenZhbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
