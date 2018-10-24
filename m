From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: Fix VGA logdirty related display freezes with altp2m
Date: Wed, 24 Oct 2018 11:09:41 -0600
Message-ID: <CABfawhmAqMi_q8ZM_na24Ss_DwXyu2Ysy2NgKsvbdZnEoJs11w@mail.gmail.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8rm9=ne=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gFMfl-0007cp-AK
 for xen-devel@lists.xenproject.org; Wed, 24 Oct 2018 17:10:21 +0000
Received: by mail-wm1-x333.google.com with SMTP id b14-v6so3588917wmj.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Oct 2018 10:10:19 -0700 (PDT)
In-Reply-To: <5cfc59fc-186d-0d09-6fca-841a47fe2c19@bitdefender.com>
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

T24gVHVlLCBPY3QgMjMsIDIwMTggYXQgNjozNyBBTSBSYXp2YW4gQ29qb2NhcnUKPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4gVGFtYXMsIGNvdWxkIHlvdSBwbGVhc2UgZ2l2
ZSB0aGlzIGEgc3Bpbj8KPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXp2YW4tY29qb2NhcnUveGVu
L3RyZWUvYWx0cDJtLWxvZ2RpcnR5LXRha2UyCj4KPiBJdCBfc2hvdWxkXyBzb2x2ZSB0aGUgY3Jh
c2hlcy4KCkluZGVlZCwgSSBubyBsb25nZXIgc2VlIHRoZSBjcmFzaC4gSG93ZXZlciwgdGhlcmUg
bWlnaHQgYmUgc29tZQpsb2NraW5nIGlzc3VlIHByZXNlbnQgYmVjYXVzZSB0aGUgd2hvbGUgc3lz
dGVtIGZyZWV6ZXMgdXAgc2hvcnRseQphZnRlciBzdGFydGluZyBEUkFLVlVGIG9uIGEgZG9tYWlu
IC0gd2l0aGluIGEgY291cGxlIHNlY29uZHMuIEkgbWVhbgpYZW4gaXRzZWxmIGxvY2tzIHVwOiBu
byByZXNwb25zZSBvbiB0aGUgc2VyaWFsLCBkb20wIHNjcmVlbiBmcm96ZW4sCmV0Yy4KClRhbWFz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
