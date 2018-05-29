From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [OSSTEST PATCH] Osstest/Debian: bootloader: Fix
 grub parsing for XSM and multiboot1
Date: Tue, 29 May 2018 12:20:10 +0100
Message-ID: <23309.14186.618890.915475@mariner.uk.xensource.com>
References: <1527592504-23197-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g64s=iq=citrix.com=prvs=6804eb919=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fNcfm-0001dZ-Hk
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 11:20:14 +0000
In-Reply-To: <1527592504-23197-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SWFuIEphY2tzb24gd3JpdGVzICgiW09TU1RFU1QgUEFUQ0hdIE9zc3Rlc3QvRGViaWFuOiBib290
bG9hZGVyOiBGaXggZ3J1YiBwYXJzaW5nIGZvciBYU00gYW5kIG11bHRpYm9vdDEiKToKPiBiY2Ez
ZWRiNGFjMGQ2NzAwOThiNzYxOGNiYWNjZjc1NzdhY2EyNjdhCj4gICAiT3NzdGVzdC9EZWJpYW46
IGJvb3Rsb2FkZXI6IFVuZGVyc3RhbmQgbXVsdGlib290MiBzeW50YXgiCj4gd2FzIHN1cHBvc2Vk
IHRvIGNoYW5nZSBgbXVsdGlib290JyBhbmQgYG1vZHVsZScgaW4gdGhlIGdydWIyIG1lbnUKPiBw
YXJzZXIgdG8gYG11bHRpYm9vdDI/JyBhbmQgYG1vZHVsZTI/Jy4gIEJ1dCB0aGUgZW50cnkgZm9y
IG1hdGNoaW5nCj4gWFNNIHBvbGljeSBmaWxlIGxpbmVzIHdhcyBtaXNzaW5nIHRoZSA/LCB3aGlj
aCBicm9rZSBhbGwgbXVsdGlib290MQo+IFhTTSB0ZXN0cy4gIEZpeCB0aGlzLgo+IAo+IFJlcG9y
dGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpUaGlzIHdhcyBhIHN1ZmZp
Y2llbnRseSBvYnZpb3VzIGZpeCwgYW5kIHRoZSBkYW1hZ2Ugd2l0aG91dCB0aGlzIHBhdGNoCnN1
ZmZpY2llbnRseSBiYWQsIHRoYXQgSSBoYXZlIGZvcmNlIHB1c2hlZCBpdC4KClNvIHRoZSB4ZW4t
dW5zdGFibGUtc21va2UgdGVzdHMgc2hvdWxkIHN0YXJ0IHdvcmtpbmcgc29vbi4KClRoZXJlIHdp
bGwgc3RpbGwgYmUgc29tZSBmbGlnaHRzIGN1cnJlbnRseSBpbiBwcm9ncmVzcyB3aGljaCB3aWxs
IGJlCmFmZmVjdGVkIGJ5IHRoaXMgYnVnLCBzaW5jZSBhIHJ1bm5pbmcgcHJvZHVjdGlvbiBmbGln
aHQgZG9lc24ndCBwaWNrCnVwIG5ldyBvc3N0ZXN0IGNvZGUuCgpJYW4uCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
