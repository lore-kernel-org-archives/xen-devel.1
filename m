From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH v2] x86/altp2m: Allow setting the #VE info
 page for an arbitrary VCPU
Date: Thu, 20 Sep 2018 16:28:50 +0100
Message-ID: <CAFLBxZbuGqN93K9dCF5m+gEASqbDaPLLVLHxWeLFPk_2GX8BSA@mail.gmail.com>
References: <20180904045922.31609-1-apop@bitdefender.com>
 <CAFLBxZaCUSBeBiesRhUKnpNRvthPQxMBEj598QBVR8yX+F9OSw@mail.gmail.com>
 <e2d290dd-0b8f-5a04-e5c3-1bcd244492ae@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=atzj=mc=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1g30t5-0003bL-FW
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 15:29:03 +0000
Received: by mail-qt0-x22e.google.com with SMTP id t5-v6so8892423qtn.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Sep 2018 08:29:01 -0700 (PDT)
In-Reply-To: <e2d290dd-0b8f-5a04-e5c3-1bcd244492ae@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Adrian Pop <apop@bitdefender.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBTZXAgMjAsIDIwMTggYXQgMzo1NSBQTSBSYXp2YW4gQ29qb2NhcnUKPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4gT24gOS8yMC8xOCA1OjQyIFBNLCBHZW9yZ2Ug
RHVubGFwIHdyb3RlOgo+ID4gSSBkbyBoYXZlIGEgcXVlc3Rpb24gYWJvdXQgeW91ciBwcm9wb3Nl
ZCB1c2UgY2FzZS4gIFlvdSdyZSBydW5uaW5nCj4gPiB0aGlzIGluICdtaXhlZCcgbW9kZSwgcmln
aHQsIGFuZCB1c2luZyB0aGUgYWx0cDJtIHRvIGhpZGUgYSBzZWN1cmUgYml0Cj4gPiBvZiBjb2Rl
IGZyb20gdGhlIG9wZXJhdGluZyBzeXN0ZW0/ICBXaGF0J3MgdG8gc3RvcCBhIHJvZ3VlIG9wZXJh
dGluZwo+ID4gc3lzdGVtIHRoYXQgZG9lc24ndCB3YW50IHRvIGJlIGludHJvc3BlY3RlZCBmcm9t
IGNhbGxpbmcKPiA+IEhWTU9QX2FsdHAybV92Y3B1X2VuYWJsZV9ub3RpZnkgd2l0aCBJTlZBTElE
X0dGTiB0byBkaXNhYmxlIHRoaXM/Cj4KPiBOb3RoaW5nLCBidXQgd2UncmUgbm90IHJ1bm5pbmcg
dGhpcyBpbiBtaXhlZCBtb2RlLiA6KQo+IFdlJ3JlIGFmdGVyICdleHRlcm5hbCcsIGZvciB0aGUg
dmVyeSBzYW1lIHJlYXNvbnMgeW91J3ZlIG1lbnRpb25lZC4KPgo+IEV2ZXJ5dGhpbmcgaW1wb3J0
YW50IGlzIGRvbmUgaW4gZG9tMC1vbmx5LiBJZiB0aGVyZSdzIHNvbWV0aGluZyB0byBiZQo+IGRv
bmUgdGhhdCB0aGUgaW4tZ3Vlc3QgYWdlbnQgd291bGQgbGlrZSwgaXQgaGFzIHRvIGFzayB0aGUg
aW50cm9zcGVjdGlvbgo+IGFnZW50IGluIGRvbTAgdmlhIFZNQ0FMTCBldmVudHMuCgpPSywgZ290
IGl0LCB0aGFua3MuCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
