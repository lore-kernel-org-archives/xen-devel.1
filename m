From: Julien Grall <Julien.Grall@arm.com>
Subject: Re: [PATCH v2 6/7] xen/arm: tlbflush: Rework TLB helpers
Date: Thu, 9 May 2019 20:43:14 +0000
Message-ID: <fc4f79d2-5d48-c57b-53de-0fa020b46fb7@arm.com>
References: <20190508161603.21964-1-julien.grall@arm.com>
 <20190508161603.21964-7-julien.grall@arm.com>
 <alpine.DEB.2.21.1905091319520.25766@sstabellini-ThinkPad-T480s>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kt3J=TJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hOpt6-0003rJ-As
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 20:43:32 +0000
In-Reply-To: <alpine.DEB.2.21.1905091319520.25766@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Content-ID: <9213AAF23D087A40B29CD3D78736DCF4@eurprd08.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd <nd@arm.com>, Andrii Anisov <Andrii_Anisov@epam.com>, "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCk9uIDA5LzA1LzIwMTkgMjE6MzIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24g
V2VkLCA4IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEkgYWdyZWUgd2l0aCB3aGF0
IHlvdSBhcmUgdHJ5aW5nIHRvIGFjaGlldmUgd2l0aCB0aGlzIHBhdGNoIGFuZCBJIGxpa2UNCj4g
dGhlIGlkZWEgb2YgcmVkdWNpbmcgY29kZSBkdXBsaWNhdGlvbi4gQXMgSSBsb29rIGF0IHRoZSBj
b2RlLCBJIHdhcw0KPiBob3BpbmcgdG8gZmluZCBhIHdheSB0byBhdm9pZCBpbnRyb2R1Y2luZyBt
YWNyb3MgYW5kIHVzZSBzdGF0aWMgaW5saW5lDQo+IGZ1bmN0aW9ucyBpbnN0ZWFkLCBidXQgaXQg
ZG9lc24ndCBsb29rIGxpa2UgaXQgaXMgcG9zc2libGUgZm9yIGFybTMyLg0KPiBUaGVyZSBpcyBu
byB3YXkgdG8gcGFzcyBUTEJJQUxMSVMgYXMgYSBwYXJhbWV0ZXIgdG8gYSBmdW5jdGlvbiBmb3IN
Cj4gaW5zdGFuY2UuIEl0IG1pZ2h0IGJlIHBvc3NpYmxlIGZvciBhcm02NCBhcyB0aGV5IGFyZSBq
dXN0IHN0cmluZ3MsIGJ1dCBhdA0KPiB0aGF0IHBvaW50IGl0IG1pZ2h0IGJlIGJldHRlciB0byBr
ZWVwIHRoZSBjb2RlIHNpbWlsYXIgYmV0d2VlbiBhcm0zMiBhbmQNCj4gYXJtNjQgaGF2aW5nIGJv
dGggb2YgdGhlbSBhcyBtYWNyb3MsIGluc3RlYWQgb2YgaGF2aW5nIG9uZSBhcyBtYWNybyBhbmQN
Cj4gdGhlIG90aGVyIGFzIHN0YXRpYyBpbmxpbmUuDQo+IA0KPiBEbyB5b3UgYWdyZWUgd2l0aCBt
ZT8gQ2FuIHlvdSBzZWUgYW55IG90aGVyIHdheXMgdG8gdHVybiBUTEJfSEVMUEVSIGludG8NCj4g
YSBzdGF0aWMgaW5saW5lPw0KDQpJIHJlYWxseSBjYW4ndCBzZWUgaG93IHlvdSBjYW4gZXZlbiB0
dXJuIHRoZSBhcm02NCB2ZXJzaW9uIGFzIGEgc3RhdGljIA0KaW5saW5lLi4uIEV2ZW4gaWYgVExC
SUFMTElTIGlzIGEgc3RyaW5nLCB3ZSBhcmUgdXNpbmcgaXQgdG8gZ2VuZXJhdGUgdGhlIA0KYXNz
ZW1ibHkuIFdpdGhvdXQgdGhlIGhlbHAgb2YgdGhlIHByZS1wcm9jZXNzb3IsIHlvdSB3b3VsZCBo
YXZlIHRvIGxvb2sgDQphdCB0aGUgc3RyaW5nIGFuZCBnZW5lcmF0ZSB0aGUgYXNzb2NpYXRlZCBv
cGVyYXRpb24uDQoNClNvIHRoZXJlIGFyZSBubyB3YXkgeW91IGNhbiBkbyB0aGUgc2FtZSB3aXRo
IHN0YXRpYyBpbmxpbmUgdW5sZXNzIHlvdSANCmR1cGxpY2F0ZSBhbGwgdGhlIGhlbHBlcnMuIEJ1
dCB0aGlzIHdvdWxkIGRlZmVhdCB0aGUgcHVycG9zZSBvZiB0aGlzIHBhdGNoLg0KDQpDaGVlcnMs
DQoNCi0tIA0KSnVsaWVuIEdyYWxsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
