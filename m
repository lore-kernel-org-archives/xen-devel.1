From: Juergen Gross <jgross@suse.com>
Subject: Re: Guest soft lockups with "xen: make xen_qlock_wait()
 nestable"
Date: Thu, 8 Nov 2018 08:08:14 +0100
Message-ID: <c007d98d-1744-f40c-a801-8c1956605d29@suse.com>
References: <3a55659d-4d7e-ea03-0c46-cd115ff1d8f9@eikelenboom.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wlbw=nt=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gKeQM-0003qg-UO
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 07:08:18 +0000
In-Reply-To: <3a55659d-4d7e-ea03-0c46-cd115ff1d8f9@eikelenboom.it>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sander Eikelenboom <linux@eikelenboom.it>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTEvMjAxOCAxMDozMCwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+IEhpIEp1ZXJn
ZW4gLyBCb3JpcywKPiAKPiBMYXN0IHdlZWsgaSB0ZXN0ZWQgTGludXgga2VybmVsIDQuMTkuMCBz
dGFibGUgd2l0aCB0aGUgWGVuICJmb3ItbGludXMtNC4yMCIgYnJhbmNoIHB1bGxlZCBvbiB0b3Au
Cj4gVW5mb3J0dW5hdGVseSBpIHdhcyBzZWVpbmcgZ3Vlc3RzIGxvY2t1cCBhZnRlciBzb21lIHRp
bWUsIHNlZSBiZWxvdyBmb3IgdGhlIGxvZ2dpbmcgZnJvbSBvbmUgb2YgdGhlIGd1ZXN0Cj4gd2hp
Y2ggaSB3YXMgYWJsZSB0byBjYXB0dXJlLgo+IFJldmVydGluZyAieGVuOiBtYWtlIHhlbl9xbG9j
a193YWl0KCkgbmVzdGFibGUiIDcyNTBmNmQzNTY4MWRmYzQ0NzQ5ZDkwNTk4YTJkNTFhMTE4Y2Uy
YjgsCj4gbWFkZSB0aGUgbG9ja3VwcyBkaXNhcHBlYXIuCj4gCj4gVGhlc2UgZ3Vlc3RzIGFyZSBz
dHJlc3NlZCBxdWl0ZSBoYXJkIGluIGJvdGggQ1BVIGFuZCBuZXR3b3JraW5nLCAKPiBzbyB0aGV5
IGFyZSBwcm9iYWJseSBtb3JlIHN1c2NlcHRpYmxlIHRvIGxvY2tpbmcgaXNzdWVzLgo+IAo+IFN5
c3RlbSBpcyBhIEFNRCBwaGVub20geDYsIHJ1bm5pbmcgWGVuLXVuc3RhYmxlLgo+IAo+IEFueSBp
ZGVhcyA/CgpKdXN0IGNoZWNrZWQgdGhlIGh5cGVydmlzb3IgYWdhaW46IGl0IHNlZW1zIGEgcGVu
ZGluZyBpbnRlcnJ1cHQgZm9yIGEKSFZNL1BWSCB2Y3B1IHdvbid0IGxldCBTQ0hFRE9QX3BvbGwg
cmV0dXJuIGluIGNhc2UgaW50ZXJydXB0cyBhcmUKZGlzYWJsZWQuCgpJIG5lZWQgdG8gcmV3b3Jr
IHRoZSBwYXRjaCBmb3IgdGhhdCBzY2VuYXJpby4gVW50aWwgdGhlbiBJJ2xsIHJldmVydAppdC4K
CgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
