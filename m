From: George Dunlap <George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH v2 2/3] x86/mm: clean up SHARED_M2P{,
	_ENTRY} uses
Date: Thu, 8 Feb 2018 12:31:02 +0000
Message-ID: <CAFLBxZbhQnkqy_36zRaXp+1EodrSz0iZuqx-_MYnK+uwVeTNeA@mail.gmail.com>
References: <5A2FFB8D0200007800196DDF@prv-mh.provo.novell.com>
 <5A3A3D7F0200007800198CC0@prv-mh.provo.novell.com>
 <5A3A3E680200007800198CD6@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ilwf=fc=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1ejlM1-0008VC-81
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2018 12:31:05 +0000
Received: by mail-qt0-x229.google.com with SMTP id s39so5915339qth.7
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2018 04:31:03 -0800 (PST)
In-Reply-To: <5A3A3E680200007800198CD6@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBEZWMgMjAsIDIwMTcgYXQgOTo0MSBBTSwgSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPiBTdG9wIG9wZW4tY29kaW5nIFNIQVJFRF9NMlAoKSBhbmQgZHJvcCBh
IHBvaW50bGVzcyB1c2Ugb2YgaXQgZnJvbQo+IHBhZ2luZ19tZm5faXNfZGlydHkoKSAoIVZBTElE
X00yUCgpIGlzIGEgc3VwZXJzZXQgb2YgU0hBUkVEX00yUCgpKSBhbmQKPiBhbm90aGVyIG9uZSBm
cm9tIGZyZWVfcGFnZV90eXBlKCkgKHByaW9yIGFzc2VydGlvbnMgcmVuZGVyIHRoaXMKPiByZWR1
bmRhbnQpLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+IEFja2VkLWJ5OiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KClJldmlld2VkLWJ5OiBHZW9y
Z2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
