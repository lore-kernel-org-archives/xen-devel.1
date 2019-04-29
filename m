From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [OSSTEST PATCH 00/21] Abandon jobs which are
 unreasonably delaying their flight
Date: Mon, 29 Apr 2019 15:46:48 +0100
Message-ID: <23751.3672.258243.563470@mariner.uk.xensource.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
 <fa02ed11-5bb4-d324-b9a5-a019c2b696d8@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MPM5=S7=citrix.com=prvs=015b46b47=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hL7Ya-0002U5-EP
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 14:47:00 +0000
In-Reply-To: <fa02ed11-5bb4-d324-b9a5-a019c2b696d8@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, "committers@xenproject.org" <committers@xenproject.org>, Lars Kurth <lars.kurth@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbT1NTVEVTVCBQQVRDSCAwMC8yMV0gQWJhbmRvbiBq
b2JzIHdoaWNoIGFyZSB1bnJlYXNvbmFibHkgZGVsYXlpbmcgdGhlaXIgZmxpZ2h0Iik6Cj4gQXMg
d2UgZGlzY3Vzc2VkIG9uIElSQywgSSB1bmRlcnN0YW5kIHRoaXMgd2lsbCBoYXZlIGFuIGltcGFj
dCBvbiBBcm0zMiAKPiB0ZXN0aW5nLiBEbyB5b3UgaGF2ZSBhbiBlc3RpbWF0ZSBob3cgbGlrZWx5
IHRoZSB0ZXN0cyB3aWxsIGJlIHNraXBwZWQ/CgpNYW55LCBtYXliZSBtb3N0LiAgVmVyeSBsaWtl
bHkgdGhlIHNtb2tlIHRlc3RzIHdpbGwgY29udGludWUgdG8gcnVuLgoKPiBJIGFtIHdvbmRlcmlu
ZyB3aGV0aGVyIHdlIHNob3VsZCBkaXNjdXNzIHRvIHJlZHVjZSB0aGUgbnVtYmVyIG9mIAo+IHRl
c3RpbmdzIGRvbmUgb24gQXJtMzIuIFdlIGRpZCB0aGF0IGluIHRoZSBwYXN0IG9uIEFybTY0IHdo
ZW4gd2Ugd2VyZSAKPiBzdHJ1Z2dsZSB3aXRoIGJyb2tlbiBsYXh0b24wL2xheHRvbjEuCgpUaGF0
IGlzIGEgc2Vuc2libGUgc3VnZ2VzdGlvbiBidXQgYmVmb3JlIHdlIGRvIHRoYXQga2luZCBvZiBt
YW51YWwKcmViYWxhbmNpbmcgSSB3b3VsZCBsaWtlIHRvIHRyeSBtb3ZpbmcgYXQgbGVhc3QgdGhl
IGtlcm5lbCBidWlsZHMsIHNvCnRoZXkgcnVuIGFzIGFtZDY0IGNyb3NzIGJ1aWxkcy4gIEkgdGhp
bmsgdGhhdCB3aWxsIGZyZWUgdXAgYSBsb3Qgb2YKY2FwYWNpdHkuCgpJbiB0aGUgbWVhbnRpbWUs
IGFyZSB5b3UgaGFwcHkgd2l0aCBtZSBwdXNoaW5nIHRoaXMgc2VyaWVzIHRvIG9zc3Rlc3QKcHJl
dGVzdCBhdCBzb21lIHBvaW50IHdoZW4gY29udmVuaWVudCA/CgpSZWdhcmRzLApJYW4uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
