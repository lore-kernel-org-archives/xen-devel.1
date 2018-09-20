From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v2] x86/altp2m: Allow setting the #VE info
 page for an arbitrary VCPU
Date: Thu, 20 Sep 2018 17:55:32 +0300
Message-ID: <e2d290dd-0b8f-5a04-e5c3-1bcd244492ae@bitdefender.com>
References: <20180904045922.31609-1-apop@bitdefender.com>
 <CAFLBxZaCUSBeBiesRhUKnpNRvthPQxMBEj598QBVR8yX+F9OSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tdcx=mc=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g30My-0000x9-JR
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 14:55:52 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id C2953305FFA8
 for <xen-devel@lists.xenproject.org>; Thu, 20 Sep 2018 17:55:50 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id B17517FC04
 for <xen-devel@lists.xenproject.org>; Thu, 20 Sep 2018 17:55:50 +0300 (EEST)
In-Reply-To: <CAFLBxZaCUSBeBiesRhUKnpNRvthPQxMBEj598QBVR8yX+F9OSw@mail.gmail.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>, Adrian Pop <apop@bitdefender.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gOS8yMC8xOCA1OjQyIFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IEkgZG8gaGF2ZSBhIHF1
ZXN0aW9uIGFib3V0IHlvdXIgcHJvcG9zZWQgdXNlIGNhc2UuICBZb3UncmUgcnVubmluZwo+IHRo
aXMgaW4gJ21peGVkJyBtb2RlLCByaWdodCwgYW5kIHVzaW5nIHRoZSBhbHRwMm0gdG8gaGlkZSBh
IHNlY3VyZSBiaXQKPiBvZiBjb2RlIGZyb20gdGhlIG9wZXJhdGluZyBzeXN0ZW0/ICBXaGF0J3Mg
dG8gc3RvcCBhIHJvZ3VlIG9wZXJhdGluZwo+IHN5c3RlbSB0aGF0IGRvZXNuJ3Qgd2FudCB0byBi
ZSBpbnRyb3NwZWN0ZWQgZnJvbSBjYWxsaW5nCj4gSFZNT1BfYWx0cDJtX3ZjcHVfZW5hYmxlX25v
dGlmeSB3aXRoIElOVkFMSURfR0ZOIHRvIGRpc2FibGUgdGhpcz8KCk5vdGhpbmcsIGJ1dCB3ZSdy
ZSBub3QgcnVubmluZyB0aGlzIGluIG1peGVkIG1vZGUuIDopCldlJ3JlIGFmdGVyICdleHRlcm5h
bCcsIGZvciB0aGUgdmVyeSBzYW1lIHJlYXNvbnMgeW91J3ZlIG1lbnRpb25lZC4KCkV2ZXJ5dGhp
bmcgaW1wb3J0YW50IGlzIGRvbmUgaW4gZG9tMC1vbmx5LiBJZiB0aGVyZSdzIHNvbWV0aGluZyB0
byBiZQpkb25lIHRoYXQgdGhlIGluLWd1ZXN0IGFnZW50IHdvdWxkIGxpa2UsIGl0IGhhcyB0byBh
c2sgdGhlIGludHJvc3BlY3Rpb24KYWdlbnQgaW4gZG9tMCB2aWEgVk1DQUxMIGV2ZW50cy4KCgpU
aGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
