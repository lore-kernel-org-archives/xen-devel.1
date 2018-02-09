From: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH] [v2] xen: hypercall: fix out-of-bounds
	memcpy
Date: Fri, 9 Feb 2018 14:13:14 +0000
Message-ID: <42258ad55dac4191813d258e43a44e0e__35683.2436322749$1518185508$gmane$org@AcuMS.aculab.com>
References: <20180205150340.328921-1-arnd@arndb.de>
 <67d8f0f1-0846-876d-d36a-c8a9f9366243@citrix.com>
 <CAK8P3a36O-NbrKkt-DEEZE2A2JQ5Gu9GZ98j0BjoFET4kgTaWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=qlzx=fd=aculab.com=david.laight@srs-us1.protection.inumbo.net>)
 id 1ek9Pl-0005zK-82
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 14:12:33 +0000
In-Reply-To: <CAK8P3a36O-NbrKkt-DEEZE2A2JQ5Gu9GZ98j0BjoFET4kgTaWw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Arnd Bergmann' <arnd@arndb.de>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Kees Cook <keescook@chromium.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Dan Williams <dan.j.williams@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQXJuZCBCZXJnbWFubg0KPiBTZW50OiAwOSBGZWJydWFyeSAyMDE4IDEyOjU4DQouLi4N
Cj4gSG93ZXZlciwgYXNpZGUgZnJvbSB0aGlzIGRyaXZlciwgSSB3b25kZXIgaWYgd2Ugc2hvdWxk
IGJlIHdvcnJpZWQgYWJvdXQNCj4gU3BlY3RyZSB0eXBlIDEgYXR0YWNrcyBvbiBzaW1pbGFyIGNv
ZGUsIHdoZW4gZ2NjLTggdHVybnMgYSBzd2l0Y2gvY2FzZQ0KPiBzdGF0ZW1lbnQgaW50byBhbiBh
cnJheSBsb29rdXAgYmVoaW5kIG91ciBiYWNrLCBlLmcuIGluIGFuIGlvY3RsIGhhbmRsZXIuDQo+
IEhhcyBhbnlib2R5IGdvdCB0aGlzIG9uIHRoZWlyIHJhZGFyPw0KDQpUaGUgY2Fub25pY2FsIGNv
ZGUgZm9yIGEgc3dpdGNoIHN0YXRlbWVudCBpcyB0byBqdW1wIGluZGlyZWN0IG9uIGFuIGFycmF5
DQpvZiBjb2RlIHBvaW50ZXJzLg0KaW9jdGwgaGFuZGxlcnMgcHJvYmFibHkgdXNlIGEgc2VyaWVz
IG9mIGNvbXBhcmVzIGJlY2F1c2UgdGhlIHZhbHVlcyBhcmUNCnNwYXJzZS4NCg0KQWxzbyByZW1l
bWJlciB0aGF0IGdjYy04IHdpbGwgY29udmVydCBkZW5zZSBzd2l0Y2ggc3RhdGVtZW50cyB0aGF0
IGp1c3QNCmxvYWQgYSB2YWx1ZSBpbnRvIGEgZGF0YSBhcnJheSBsb29rdXAuDQoNCkkgZ3Vlc3Mg
Ym90aCB0aG9zZSBqdW1wIHRhYmxlcyBhcmUgcG90ZW50aWFsIGF0dGFjayB2ZWN0b3JzLg0KTm90
IHF1aXRlIHN1cmUgaG93IHRoZXkgbWlnaHQgYmUgdXNlZCB0byBsZWFrIGluZm8gdGhvdWdoLg0K
DQoJRGF2aWQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
