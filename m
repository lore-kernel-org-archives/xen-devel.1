From: Julien Grall <Julien.Grall@arm.com>
Subject: Re: [RFC 01/16] xen/arm: Re-enable interrupt later in
 the trap path
Date: Wed, 28 Nov 2018 22:00:19 +0000
Message-ID: <cfdf9c30-f3e1-4023-e044-959871d2f654@arm.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-2-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=83fl=oh=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gS7ss-0004b5-IO
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 22:00:38 +0000
In-Reply-To: <1543440731-21947-2-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
Content-ID: <2F8D56047D89C847B201B47E5FCD72AA@eurprd08.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd <nd@arm.com>, Andrii Anisov <andrii_anisov@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

DQoNCk9uIDI4LzExLzIwMTggMjE6MzEsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6DQo+IEZyb206IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+DQo+IA0KPiBUaGlzIG1ha2VzIGZ1bmN0
aW9uIGVudGVyX2h5cGVydmlzb3JfaGVhZCgpIGJlaW5nIGV4ZWN1dGVkIHdpdGgNCj4gaXJxcyBs
b2NrZWQuIFRoaXMgYWxzbyBnaXZlIGEgZmluZSBzaWRlIGVmZmVjdCAtIGl0IGFzc3VyZXMgdGhh
dA0KPiBMUnMgYXJlIGNsZWFyZWQgcHJpb3IgdG8gYW55IElSUXMgcHJvY2Vzc2luZywgd2hpY2gg
bGVhZHMgdG8gYQ0KPiBiZXR0ZXIgKGZhc3RlcikgSVJRcyBwcm9jZXNzaW5nLg0KDQpBZ2Fpbiwg
dGhpcyBuZWVkIHNvbWUgcmF0aW9uYWxlIHdoeSBpcyBpdCBmYXN0ZXIuIEFuZCBob3cgdGhpcyBp
cyBnb2luZyANCnRvIGltcGFjdCB0aGUgb3RoZXIgdkdJQy4uLg0KDQpDaGVlcnMsDQoNCi0tIA0K
SnVsaWVuIEdyYWxsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
