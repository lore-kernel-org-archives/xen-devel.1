From: Petr Tesarik <ptesarik@suse.cz>
Subject: Re: where can I find the 'address translation' code in
 Xen?
Date: Mon, 30 Apr 2018 08:44:16 +0200
Message-ID: <20180430084416.0a482950@ezekiel.suse.cz>
References: <CAFX_q-EPQuiEV4SBSFnCagEhx8pgTBWe6K-1FUP0sfMaLA5Kmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=lxs7=ht=suse.cz=ptesarik@srs-us1.protection.inumbo.net>)
 id 1fD2Xu-0004zN-18
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 06:44:22 +0000
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2BBB3AEBA
 for <xen-devel@lists.xenproject.org>; Mon, 30 Apr 2018 06:44:19 +0000 (UTC)
In-Reply-To: <CAFX_q-EPQuiEV4SBSFnCagEhx8pgTBWe6K-1FUP0sfMaLA5Kmw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgTWluanVuLAoKT24gU3VuLCAyOSBBcHIgMjAxOCAxOToxMTozMCArMDkwMApNaW5qdW4gSG9u
ZyA8bmlja2V5c2dvQGdtYWlsLmNvbT4gd3JvdGU6Cgo+Wy4uLl0KPiBNeSBxdWVzdGlvbiBpcywK
PiAKPiAxLiBJcyBpdCBzdXJlIHRoYXQgdGhlIGZ1bmN0aW9uIHdpbGwgYmUgY2FsbGVkIGV2ZW4g
dGhvdWdoIHRoZSBIVyBhbHJlYWR5Cj4gdHJhbnNsYXRlcyB0aGUgYWRkcmVzcyBhbmQgcG9wdWxh
dGVzIHRoZSBUTEIgZW50cnk/CgpJIHRoaW5rIHlvdSBtaXNzIHRoZSBwb2ludC4gVGhlIGhhcmR3
YXJlIHBhZ2UgdGFibGVzIGZvciBQViBkb21haW5zCmFscmVhZHkgY29udGFpbiBtYWNoaW5lIGFk
ZHJlc3Nlcy4gSW4gb3RoZXIgd29yZHMsIHZpcnR1YWwgYWRkcmVzc2VzCmdldCB0cmFuc2xhdGVk
IGRpcmVjdGx5IHRvIG1hY2hpbmUgYWRkcmVzc2VzIGJ5IHRoZSBoYXJkd2FyZSBwYWdlIHRhYmxl
CndhbGtlci4KCj4gMi4gSSdtIGp1c3QgYXNraW5nLCBpcyB0aGVyZSBhbnkgY29kZSBpbiBYZW4g
dGhhdCBpcyByZWxhdGVkIHRvIHRoZQo+IGJlaGF2aW9yIG9mIHRoZSAnaGFyZHdhcmUgd2Fsa2Vy
Jz8KCk5vdCBzdXJlIHdoYXQgeW91IG1lYW4uIE1heWJlIHRoaXMgcXVlc3Rpb24gaXMgbm8gbG9u
Z2VyIHBlcnRpbmVudApnaXZlbiB0aGUgZXhwbGFuYXRpb24gYWJvdmU/CgpIVEgsClBldHIgVAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
