From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: Fix VGA logdirty related display freezes with altp2m
Date: Wed, 24 Oct 2018 11:31:39 -0600
Message-ID: <CABfawh=L-ZkxYnS1FR+4BDAs+89pZ5kO0MZ0XJbkPecTfY8mmA@mail.gmail.com>
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
 <944e2971-19e9-0011-cacb-4e815ca172e2@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8rm9=ne=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gFN12-0000yi-Mr
 for xen-devel@lists.xenproject.org; Wed, 24 Oct 2018 17:32:20 +0000
Received: by mail-wm1-x32b.google.com with SMTP id f1-v6so101434wmg.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Oct 2018 10:32:19 -0700 (PDT)
In-Reply-To: <944e2971-19e9-0011-cacb-4e815ca172e2@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBPY3QgMjQsIDIwMTggYXQgMTE6MjAgQU0gUmF6dmFuIENvam9jYXJ1CjxyY29qb2Nh
cnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPgo+IE9uIDEwLzI0LzE4IDg6MDkgUE0sIFRhbWFz
IEsgTGVuZ3llbCB3cm90ZToKPiA+IE9uIFR1ZSwgT2N0IDIzLCAyMDE4IGF0IDY6MzcgQU0gUmF6
dmFuIENvam9jYXJ1Cj4gPiA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4gPj4K
PiA+PiBUYW1hcywgY291bGQgeW91IHBsZWFzZSBnaXZlIHRoaXMgYSBzcGluPwo+ID4+Cj4gPj4g
aHR0cHM6Ly9naXRodWIuY29tL3JhenZhbi1jb2pvY2FydS94ZW4vdHJlZS9hbHRwMm0tbG9nZGly
dHktdGFrZTIKPiA+Pgo+ID4+IEl0IF9zaG91bGRfIHNvbHZlIHRoZSBjcmFzaGVzLgo+ID4KPiA+
IEluZGVlZCwgSSBubyBsb25nZXIgc2VlIHRoZSBjcmFzaC4gSG93ZXZlciwgdGhlcmUgbWlnaHQg
YmUgc29tZQo+ID4gbG9ja2luZyBpc3N1ZSBwcmVzZW50IGJlY2F1c2UgdGhlIHdob2xlIHN5c3Rl
bSBmcmVlemVzIHVwIHNob3J0bHkKPiA+IGFmdGVyIHN0YXJ0aW5nIERSQUtWVUYgb24gYSBkb21h
aW4gLSB3aXRoaW4gYSBjb3VwbGUgc2Vjb25kcy4gSSBtZWFuCj4gPiBYZW4gaXRzZWxmIGxvY2tz
IHVwOiBubyByZXNwb25zZSBvbiB0aGUgc2VyaWFsLCBkb20wIHNjcmVlbiBmcm96ZW4sCj4gPiBl
dGMuCj4KPiBEbyB5b3UgaGF2ZSBhbnkgdHlwZSBvZiBsb2cgLyBiYWNrdHJhY2UgLyB3YXkgSSBj
b3VsZCByZXByb2R1Y2UgaXQKPiB3aXRob3V0IERyYWt2dWY/IEFsbCB0aGUgd2F5cyBJJ3ZlIHRl
c3RlZCBpdCB3ZXJlIGZpbmUgKGluY2x1ZGluZwo+IHhlbi1hY2Nlc3MpLgoKSSBkb24ndCBoYXZl
IGEgc3RhbmRhbG9uZSB0ZXN0IHRoYXQgcHJvZHVjZXMgdGhhdCBlcnJvci4gV2l0aCBEUkFLVlVG
Cml0IGlzIGVhc2lseSByZXByb2R1Y2libGUgdGhvdWdoLiBJZiB5b3UgaGF2ZSBhIFdpbmRvd3Mg
Z3Vlc3QKaW5zdGFsbGVkLCBzZXR0aW5nIHVwIERSQUtWVUYgc2hvdWxkIHJlYWxseSBub3QgYmUg
bXVjaCB0cm91YmxlLiBXaXRoCnhlbi1hY2Nlc3MgaXQgaW5kZWVkIGRvZXNuJ3QgbG9jayB1cCBi
dXQgc2luY2UgdGhlIGd1ZXN0IGlzIHByZXR0eQptdWNoIHVucmVzcG9uc2l2ZSBkdXJpbmcgdGhh
dCB0ZXN0IEkgY2FuJ3QgdmVyaWZ5IHdoZXRoZXIgdGhlIFZHQQppc3N1ZSBpcyBub3cgcmVzb2x2
ZWQgb3Igbm90LiBBbHNvIHRoZSB4ZW4tYWNjZXNzIHRlc3RzIGFyZSBmYWlybHkKbGltaXRlZCBh
bmQgZG9uJ3QgdXNlIGFsbCBhc3BlY3RzIG9mIGFsdHAybS4KClRhbWFzCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
