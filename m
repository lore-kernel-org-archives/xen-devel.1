From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: Fix VGA logdirty related display freezes with altp2m
Date: Wed, 24 Oct 2018 11:52:00 -0600
Message-ID: <CABfawh=3GjNrL-n43+C8A4GiKcbnrdY-=urQC3JK_zahSiEvcQ@mail.gmail.com>
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
 <CABfawh=L-ZkxYnS1FR+4BDAs+89pZ5kO0MZ0XJbkPecTfY8mmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8rm9=ne=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gFNKi-0002XG-Am
 for xen-devel@lists.xenproject.org; Wed, 24 Oct 2018 17:52:40 +0000
Received: by mail-wr1-x430.google.com with SMTP id w5-v6so6559089wrt.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Oct 2018 10:52:38 -0700 (PDT)
In-Reply-To: <CABfawh=L-ZkxYnS1FR+4BDAs+89pZ5kO0MZ0XJbkPecTfY8mmA@mail.gmail.com>
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

T24gV2VkLCBPY3QgMjQsIDIwMTggYXQgMTE6MzEgQU0gVGFtYXMgSyBMZW5neWVsCjx0YW1hcy5r
Lmxlbmd5ZWxAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDI0LCAyMDE4IGF0IDEx
OjIwIEFNIFJhenZhbiBDb2pvY2FydQo+IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPiB3cm90
ZToKPiA+Cj4gPiBPbiAxMC8yNC8xOCA4OjA5IFBNLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4g
PiA+IE9uIFR1ZSwgT2N0IDIzLCAyMDE4IGF0IDY6MzcgQU0gUmF6dmFuIENvam9jYXJ1Cj4gPiA+
IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPiA+ID4+Cj4gPiA+PiBUYW1hcywg
Y291bGQgeW91IHBsZWFzZSBnaXZlIHRoaXMgYSBzcGluPwo+ID4gPj4KPiA+ID4+IGh0dHBzOi8v
Z2l0aHViLmNvbS9yYXp2YW4tY29qb2NhcnUveGVuL3RyZWUvYWx0cDJtLWxvZ2RpcnR5LXRha2Uy
Cj4gPiA+Pgo+ID4gPj4gSXQgX3Nob3VsZF8gc29sdmUgdGhlIGNyYXNoZXMuCj4gPiA+Cj4gPiA+
IEluZGVlZCwgSSBubyBsb25nZXIgc2VlIHRoZSBjcmFzaC4gSG93ZXZlciwgdGhlcmUgbWlnaHQg
YmUgc29tZQo+ID4gPiBsb2NraW5nIGlzc3VlIHByZXNlbnQgYmVjYXVzZSB0aGUgd2hvbGUgc3lz
dGVtIGZyZWV6ZXMgdXAgc2hvcnRseQo+ID4gPiBhZnRlciBzdGFydGluZyBEUkFLVlVGIG9uIGEg
ZG9tYWluIC0gd2l0aGluIGEgY291cGxlIHNlY29uZHMuIEkgbWVhbgo+ID4gPiBYZW4gaXRzZWxm
IGxvY2tzIHVwOiBubyByZXNwb25zZSBvbiB0aGUgc2VyaWFsLCBkb20wIHNjcmVlbiBmcm96ZW4s
Cj4gPiA+IGV0Yy4KPiA+Cj4gPiBEbyB5b3UgaGF2ZSBhbnkgdHlwZSBvZiBsb2cgLyBiYWNrdHJh
Y2UgLyB3YXkgSSBjb3VsZCByZXByb2R1Y2UgaXQKPiA+IHdpdGhvdXQgRHJha3Z1Zj8gQWxsIHRo
ZSB3YXlzIEkndmUgdGVzdGVkIGl0IHdlcmUgZmluZSAoaW5jbHVkaW5nCj4gPiB4ZW4tYWNjZXNz
KS4KPgo+IEkgZG9uJ3QgaGF2ZSBhIHN0YW5kYWxvbmUgdGVzdCB0aGF0IHByb2R1Y2VzIHRoYXQg
ZXJyb3IuIFdpdGggRFJBS1ZVRgo+IGl0IGlzIGVhc2lseSByZXByb2R1Y2libGUgdGhvdWdoLiBJ
ZiB5b3UgaGF2ZSBhIFdpbmRvd3MgZ3Vlc3QKPiBpbnN0YWxsZWQsIHNldHRpbmcgdXAgRFJBS1ZV
RiBzaG91bGQgcmVhbGx5IG5vdCBiZSBtdWNoIHRyb3VibGUuIFdpdGgKPiB4ZW4tYWNjZXNzIGl0
IGluZGVlZCBkb2Vzbid0IGxvY2sgdXAgYnV0IHNpbmNlIHRoZSBndWVzdCBpcyBwcmV0dHkKPiBt
dWNoIHVucmVzcG9uc2l2ZSBkdXJpbmcgdGhhdCB0ZXN0IEkgY2FuJ3QgdmVyaWZ5IHdoZXRoZXIg
dGhlIFZHQQo+IGlzc3VlIGlzIG5vdyByZXNvbHZlZCBvciBub3QuIEFsc28gdGhlIHhlbi1hY2Nl
c3MgdGVzdHMgYXJlIGZhaXJseQo+IGxpbWl0ZWQgYW5kIGRvbid0IHVzZSBhbGwgYXNwZWN0cyBv
ZiBhbHRwMm0uCj4KCldoYXQgSSBzZWUgZnJvbSB0aGUgRFJBS1ZVRiBsb2cgaXMgdGhhdCB0aGUg
bGFzdCB0aGluZyBpdCBwcmludHMgaXMKc2VuZGluZyBhIHZtX2V2ZW50IHJlc3BvbnNlIHRoYXQg
Ym90aCBlbmFibGVzIHNpbmdsZXN0ZXBwaW5nIGFuZApzd2l0Y2hlcyBhbHRwMm0gdmlldy4gVGhp
cyBsb29rcyB0byBiZSBjb25zaXN0ZW50LiBJdCBkaWRuJ3QgbWF0dGVyIGlmCnRoZSBndWVzdCBo
YWQgMSBvciAyIHZDUFVzLCB0aGUgZnJlZXplIG9jY3VycyBqdXN0IHRoZSBzYW1lLiBJdCdzCmRl
ZmluaXRlbHkgcmFjZXkgYmVjYXVzZSBpdCBkb2Vzbid0IGhhcHBlbiByaWdodCBhd2F5LCB0aGUg
c3lzdGVtCndvcmtzIGFzIGV4cGVjdGVkIGZvciBhIGNvdXBsZSBzZWNvbmRzLgoKVGFtYXMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
