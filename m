From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: Event monitoring support for PV guests
Date: Mon, 3 Sep 2018 08:42:00 +0300
Message-ID: <e4527670-2632-6bdf-503b-33942d59dc02@bitdefender.com>
References: <CAMf-k8EWH=R-O3fC0ywEwVxfQkujyHAsS_CuvLMJJv6_Nw18sQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j1gd=lr=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1fwhcr-0005pw-3t
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 05:42:13 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id DBA30301AB31
 for <xen-devel@lists.xenproject.org>; Mon,  3 Sep 2018 08:42:10 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id D53577FC2A
 for <xen-devel@lists.xenproject.org>; Mon,  3 Sep 2018 08:42:10 +0300 (EEST)
In-Reply-To: <CAMf-k8EWH=R-O3fC0ywEwVxfQkujyHAsS_CuvLMJJv6_Nw18sQ@mail.gmail.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Spencer Michaels <sxmichaels@gmail.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gOS8yLzE4IDEwOjEwIFBNLCBTcGVuY2VyIE1pY2hhZWxzIHdyb3RlOgo+IEkgaGF2ZSBmb3Vu
ZCwgaG93ZXZlciwgdGhhdCBxdWl0ZSBhIGZldyBtYWpvciBkZWJ1Z2dpbmcgZmVhdHVyZXMgLS0t
Cj4gY2hpZWZseSwKPiBicmVha3BvaW50cyBhbmQgc2luZ2xlLXN0ZXAgbW9kZSAtLS0gZG8gbm90
IGFwcGVhciB0byBiZSBzdXBwb3J0ZWQgZm9yIFBWCj4gZ3Vlc3RzLiBMb29raW5nIHRocm91Z2gg
dGhlIHNvdXJjZSBvZiBYZW4gaXRzZWxmIHNlZW1zIHRvIGNvbmZpcm0gdGhpcwo+IFsxXS4gSXQK
PiBsb29rcyBsaWtlIHRoZSByb290IGNhdXNlIG9mIHRoaXMgaXMgYSBsYWNrIG9mIGV2ZW50IG1v
bml0b3Jpbmcgc3VwcG9ydAo+IGZvciBQVgo+IGd1ZXN0cywgaG93ZXZlciwgSSBoYXZlIG5vdCBi
ZWVuIGFibGUgdG8gZmluZCBtdWNoIGluZm9ybWF0aW9uIG9ubGluZSBhYm91dAo+IHdoZXRoZXIg
b3Igbm90IHRoZXJlIGFyZSBvdGhlciB3YXlzIHRvIGRvIHdoYXQgSSB3YW50LgoKSXQgaXMgdGhl
b3JldGljYWxseSBwb3NzaWJsZSB0byBhZGQgdm1fZXZlbnQgc3VwcG9ydCBmb3IgUFYgZG9tYWlu
cwoobG9vayB1cCBBcmF2aW5kaCBQdXRoaXlhcGFyYW1iaWwncyBzZXJpZXMsIGZvciBleGFtcGxl
KS4KCkknbSBub3Qgc3VyZSBob3cgZWFzeSBpdCBpcy4KCkkgYXNzdW1lIHlvdSd2ZSBhbHJlYWR5
IHNlZW46CgpodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9EZWJ1Z2dpbmdfWGVuCmh0
dHA6Ly93d3ctYXJjaGl2ZS54ZW5wcm9qZWN0Lm9yZy9maWxlcy94ZW5zdW1taXRfaW50ZWwwOS94
ZW4tZGVidWdnaW5nLnBkZgoKClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
