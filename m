From: Sander Eikelenboom <linux@eikelenboom.it>
Subject: Re: Guest soft lockups with "xen: make xen_qlock_wait()
 nestable"
Date: Thu, 8 Nov 2018 09:14:07 +0100
Message-ID: <9e2d3c8a-07b8-dcf8-fb52-0071b63b92d2@eikelenboom.it>
References: <3a55659d-4d7e-ea03-0c46-cd115ff1d8f9@eikelenboom.it>
 <c007d98d-1744-f40c-a801-8c1956605d29@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fbf+=nt=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1gKfRa-0001bR-IM
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 08:13:38 +0000
In-Reply-To: <c007d98d-1744-f40c-a801-8c1956605d29@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMTEvMTggMDg6MDgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMDcvMTEvMjAxOCAx
MDozMCwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+PiBIaSBKdWVyZ2VuIC8gQm9yaXMsCj4+
Cj4+IExhc3Qgd2VlayBpIHRlc3RlZCBMaW51eCBrZXJuZWwgNC4xOS4wIHN0YWJsZSB3aXRoIHRo
ZSBYZW4gImZvci1saW51cy00LjIwIiBicmFuY2ggcHVsbGVkIG9uIHRvcC4KPj4gVW5mb3J0dW5h
dGVseSBpIHdhcyBzZWVpbmcgZ3Vlc3RzIGxvY2t1cCBhZnRlciBzb21lIHRpbWUsIHNlZSBiZWxv
dyBmb3IgdGhlIGxvZ2dpbmcgZnJvbSBvbmUgb2YgdGhlIGd1ZXN0Cj4+IHdoaWNoIGkgd2FzIGFi
bGUgdG8gY2FwdHVyZS4KPj4gUmV2ZXJ0aW5nICJ4ZW46IG1ha2UgeGVuX3Fsb2NrX3dhaXQoKSBu
ZXN0YWJsZSIgNzI1MGY2ZDM1NjgxZGZjNDQ3NDlkOTA1OThhMmQ1MWExMThjZTJiOCwKPj4gbWFk
ZSB0aGUgbG9ja3VwcyBkaXNhcHBlYXIuCj4+Cj4+IFRoZXNlIGd1ZXN0cyBhcmUgc3RyZXNzZWQg
cXVpdGUgaGFyZCBpbiBib3RoIENQVSBhbmQgbmV0d29ya2luZywgCj4+IHNvIHRoZXkgYXJlIHBy
b2JhYmx5IG1vcmUgc3VzY2VwdGlibGUgdG8gbG9ja2luZyBpc3N1ZXMuCj4+Cj4+IFN5c3RlbSBp
cyBhIEFNRCBwaGVub20geDYsIHJ1bm5pbmcgWGVuLXVuc3RhYmxlLgo+Pgo+PiBBbnkgaWRlYXMg
Pwo+IAo+IEp1c3QgY2hlY2tlZCB0aGUgaHlwZXJ2aXNvciBhZ2FpbjogaXQgc2VlbXMgYSBwZW5k
aW5nIGludGVycnVwdCBmb3IgYQo+IEhWTS9QVkggdmNwdSB3b24ndCBsZXQgU0NIRURPUF9wb2xs
IHJldHVybiBpbiBjYXNlIGludGVycnVwdHMgYXJlCj4gZGlzYWJsZWQuCj4gCj4gSSBuZWVkIHRv
IHJld29yayB0aGUgcGF0Y2ggZm9yIHRoYXQgc2NlbmFyaW8uIFVudGlsIHRoZW4gSSdsbCByZXZl
cnQKPiBpdC4KClRoYW5rcyBmb3IgbG9va2luZyBpbnRvIGl0LgoKLS0KU2FuZGVyCgo+IAo+IEp1
ZXJnZW4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
