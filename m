From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 03/47] x86emul: test for correct EVEX
 Disp8 scaling
Date: Mon, 19 Nov 2018 18:35:58 +0000
Message-ID: <84c2cb6d-84de-eb76-d88e-fa097814ee5d@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BF289D802000078001FD3DF@prv1-mh.provo.novell.com>
 <5BF28D0402000078001FD405@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gnyi=n6=citrix.com=prvs=8544ffb4f=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gOoRe-0001hd-Hi
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 18:38:50 +0000
In-Reply-To: <5BF28D0402000078001FD405@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTEvMjAxOCAxMDoxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQmVzaWRlcyB0aGUgYWxy
ZWFkeSBleGlzdGluZyB0ZXN0cyAod2hpY2ggYXJlIGdvaW5nIHRvIGJlIGV4dGVuZGVkIG9uY2UK
PiByZXNwZWN0aXZlIElTQSBleHRlbnNpb24gc3VwcG9ydCBpcyBjb21wbGV0ZSksIGxldCdzIGFs
c28gZW5zdXJlIGZvcgo+IGV2ZXJ5IGluZGl2aWR1YWwgaW5zbiB0aGF0IHRoZWlyIERpc3A4IHNj
YWxpbmcgKGFuZCBtZW1vcnkgYWNjZXNzIHdpZHRoKQo+IGFyZSBjb3JyZWN0Lgo+Cj4gU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
