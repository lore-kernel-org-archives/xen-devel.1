From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v4 9/9] osstest: add FreeBSD Xen build job
Date: Wed, 18 Jul 2018 17:16:50 +0100
Message-ID: <23375.26610.375795.469542@mariner.uk.xensource.com>
References: <20180717160347.60140-1-roger.pau@citrix.com>
 <20180717160347.60140-10-roger.pau@citrix.com>
 <23375.22850.689507.77514@mariner.uk.xensource.com>
 <23375.23085.795016.699173@mariner.uk.xensource.com>
 <20180718160319.r6nwgo6ohlzjbob6@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ndva=kc=citrix.com=prvs=7304e4abf=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ffp8I-0006j5-LE
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 16:16:54 +0000
In-Reply-To: <20180718160319.r6nwgo6ohlzjbob6@mac.bytemobile.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Um9nZXIgUGF1IE1vbm7DqSB3cml0ZXMgKCJSZTogW1BBVENIIHY0IDkvOV0gb3NzdGVzdDogYWRk
IEZyZWVCU0QgWGVuIGJ1aWxkIGpvYiIpOgo+IE9uIFdlZCwgSnVsIDE4LCAyMDE4IGF0IDA0OjE4
OjA1UE0gKzAxMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gVGhlIHJlYXNvbiB5b3Ugd2FudCB0
aGUgb3NzdGVzdCBicmFuY2ggdG8gYmUgY292ZXJlZCBpcyB0aGF0IGl0IGlzIGFuCj4gPiBpbnB1
dCB0byB0aGlzIGpvYi4gIFRoZXJlIGlzIG5vIHByb3RlY3Rpb24gYWdhaW5zdCBhbiB1bi1jb3Zl
cmVkIGlucHV0Cj4gPiBicmFuY2hlcyBpbnRyb2R1Y2luZyBhIHJlZ3Jlc3Npb24uCj4gCj4gSSdt
IGF0dGFjaGluZyBhIHBhdGNoIGJlbG93IHRoYXQgYWRkcyBhIEZyZWVCU0QgWGVuIGJ1aWxkIGpv
YiB0byB0aGUKPiBvc3N0ZXN0IGZsaWdodHMuIEkndmUgYWxzbyBwdXNoZWQgdGhlIHVwZGF0ZWQg
YnJhbmNoIHRvIG15IGdpdCByZXBvOgoKVGhhbmtzLiAgVGhhdCBMR1RNLgoKPiA+IERvIHlvdSBr
bm93IHdoYXQgcHJvcG9ydGlvbiBvZiB0aGVzZSBhcmUgYWN0dWFsbHkgdXNlZCBieSB0aGUgRnJl
ZUJTRAo+ID4gWGVuIGJ1aWxkID8gIEFsbCB0aGF0IGFyZSBuZWVkIHRoaXMgam9iIGFkZGluZyB0
byB0aGVpciBvd24gZmxpZ2h0cy4KPiAKPiBtaW5pb3MsIG92bWYgYW5kIHFlbXUgaXMgbm90IHVz
ZWQuIEkgcGxhbiB0byBhZGQgc3VwcG9ydCBmb3Igb3ZtZiwgYnV0Cj4gdGhlIHJlc3QgKHNwZWNp
YWxseSBxZW11LXRyYWQpIHdpbGwgbGlrZWx5IHJlbWFpbiB1bnVzZWQuCgpPSywgZ29vZC4KCkZl
ZWwgZnJlZSB0byBhZGQgbXkgYWNrcyBldmVyeXdoZXJlIHRoZXkncmUgbWlzc2luZyBhbmQgdXBk
YXRlIHlvdXIKYnJhbmNoLgoKSSdtIGFmcmFpZCBJJ20gZ29pbmcgdG8gcXVldWUgdGhpcyBiZWhp
bmQgYSBzZXJpZXMgSSBhbSB3b3JraW5nIG9uIHRvCmFkZHJlc3MgY29udGludWVkIHBvb3IgdGhy
b3VnaHB1dCBkdWUgdG8gc2hvcnRhZ2Ugb2Ygd29ya2luZyBhcm1oZgpob3N0cy4KClRoYW5rcywK
SWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
