From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Fix VGA logdirty related display freezes with altp2m
Date: Tue, 23 Oct 2018 15:37:30 +0300
Message-ID: <5cfc59fc-186d-0d09-6fca-841a47fe2c19@bitdefender.com>
References: <1539857272-4660-1-git-send-email-rcojocaru@bitdefender.com>
 <CABfawhmTCUqUV264hEjQWABohR42ezHPWBhL0GVT4cKuiDjyGg@mail.gmail.com>
 <d13f501e-4d43-2897-c995-badc276c7c68@bitdefender.com>
 <CABfawhk6gjBb_Ei3Z=QZwH7pnmX=gUQ30+q_hU7V9CSBB0=jwA@mail.gmail.com>
 <9b09e025-8622-c035-4b79-09b6772ab4df@bitdefender.com>
 <05efdf4c-b4ce-b136-d25e-83acdf3c4b1e@citrix.com>
 <CABfawh=Q7vOmutRSR84=x9Fkgg1Xrdd+cm6CSza7udUDt19g+A@mail.gmail.com>
 <20fb3eff-d438-59e9-3dea-9f36be40d039@bitdefender.com>
 <CABfawhn+NJ7Og91ko5yqHtzy-st_Fw3CeV-61GBULGoxQkFLog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=czqh=nd=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gEvwO-0004Oy-Te
 for xen-devel@lists.xenproject.org; Tue, 23 Oct 2018 12:37:44 +0000
In-Reply-To: <CABfawhn+NJ7Og91ko5yqHtzy-st_Fw3CeV-61GBULGoxQkFLog@mail.gmail.com>
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

VGFtYXMsIGNvdWxkIHlvdSBwbGVhc2UgZ2l2ZSB0aGlzIGEgc3Bpbj8KCmh0dHBzOi8vZ2l0aHVi
LmNvbS9yYXp2YW4tY29qb2NhcnUveGVuL3RyZWUvYWx0cDJtLWxvZ2RpcnR5LXRha2UyCgpJdCBf
c2hvdWxkXyBzb2x2ZSB0aGUgY3Jhc2hlcy4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
