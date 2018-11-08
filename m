From: Sander Eikelenboom <linux@eikelenboom.it>
Subject: Re: Guest soft lockups with "xen: make xen_qlock_wait()
 nestable"
Date: Thu, 8 Nov 2018 12:56:04 +0100
Message-ID: <75840811-5624-9fc2-63fe-e4d729acd080@eikelenboom.it>
References: <3a55659d-4d7e-ea03-0c46-cd115ff1d8f9@eikelenboom.it>
 <c007d98d-1744-f40c-a801-8c1956605d29@suse.com>
 <9e2d3c8a-07b8-dcf8-fb52-0071b63b92d2@eikelenboom.it>
 <4a3e30f5-917e-ea54-0ff9-8135ee3bd4a4@suse.com>
 <5a0a87ee-c029-b503-fce0-54dc55793685@eikelenboom.it>
 <25d57755-d2db-3c7e-d72c-7f2ad612ae91@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fbf+=nt=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1gKiuN-0003Q6-MZ
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 11:55:35 +0000
In-Reply-To: <25d57755-d2db-3c7e-d72c-7f2ad612ae91@suse.com>
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

T24gMDgvMTEvMTggMTE6MTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMDgvMTEvMjAxOCAx
MDo1NywgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+PiBPbiAwOC8xMS8xOCAwOToxOCwgSnVl
cmdlbiBHcm9zcyB3cm90ZToKPj4+IE9uIDA4LzExLzIwMTggMDk6MTQsIFNhbmRlciBFaWtlbGVu
Ym9vbSB3cm90ZToKPj4+PiBPbiAwOC8xMS8xOCAwODowOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToK
Pj4+Pj4gT24gMDcvMTEvMjAxOCAxMDozMCwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+Pj4+
Pj4gSGkgSnVlcmdlbiAvIEJvcmlzLAo+Pj4+Pj4KPj4+Pj4+IExhc3Qgd2VlayBpIHRlc3RlZCBM
aW51eCBrZXJuZWwgNC4xOS4wIHN0YWJsZSB3aXRoIHRoZSBYZW4gImZvci1saW51cy00LjIwIiBi
cmFuY2ggcHVsbGVkIG9uIHRvcC4KPj4+Pj4+IFVuZm9ydHVuYXRlbHkgaSB3YXMgc2VlaW5nIGd1
ZXN0cyBsb2NrdXAgYWZ0ZXIgc29tZSB0aW1lLCBzZWUgYmVsb3cgZm9yIHRoZSBsb2dnaW5nIGZy
b20gb25lIG9mIHRoZSBndWVzdAo+Pj4+Pj4gd2hpY2ggaSB3YXMgYWJsZSB0byBjYXB0dXJlLgo+
Pj4+Pj4gUmV2ZXJ0aW5nICJ4ZW46IG1ha2UgeGVuX3Fsb2NrX3dhaXQoKSBuZXN0YWJsZSIgNzI1
MGY2ZDM1NjgxZGZjNDQ3NDlkOTA1OThhMmQ1MWExMThjZTJiOCwKPj4+Pj4+IG1hZGUgdGhlIGxv
Y2t1cHMgZGlzYXBwZWFyLgo+Pj4+Pj4KPj4+Pj4+IFRoZXNlIGd1ZXN0cyBhcmUgc3RyZXNzZWQg
cXVpdGUgaGFyZCBpbiBib3RoIENQVSBhbmQgbmV0d29ya2luZywgCj4+Pj4+PiBzbyB0aGV5IGFy
ZSBwcm9iYWJseSBtb3JlIHN1c2NlcHRpYmxlIHRvIGxvY2tpbmcgaXNzdWVzLgo+Pj4+Pj4KPj4+
Pj4+IFN5c3RlbSBpcyBhIEFNRCBwaGVub20geDYsIHJ1bm5pbmcgWGVuLXVuc3RhYmxlLgo+Pj4+
Pj4KPj4+Pj4+IEFueSBpZGVhcyA/Cj4+Pj4+Cj4+Pj4+IEp1c3QgY2hlY2tlZCB0aGUgaHlwZXJ2
aXNvciBhZ2FpbjogaXQgc2VlbXMgYSBwZW5kaW5nIGludGVycnVwdCBmb3IgYQo+Pj4+PiBIVk0v
UFZIIHZjcHUgd29uJ3QgbGV0IFNDSEVET1BfcG9sbCByZXR1cm4gaW4gY2FzZSBpbnRlcnJ1cHRz
IGFyZQo+Pj4+PiBkaXNhYmxlZC4KPj4+Pj4KPj4+Pj4gSSBuZWVkIHRvIHJld29yayB0aGUgcGF0
Y2ggZm9yIHRoYXQgc2NlbmFyaW8uIFVudGlsIHRoZW4gSSdsbCByZXZlcnQKPj4+Pj4gaXQuCj4+
Pj4KPj4+PiBUaGFua3MgZm9yIGxvb2tpbmcgaW50byBpdC4KPj4+Cj4+PiBDb3VsZCB5b3UgdHJ5
IHRoZSBhdHRhY2hlZCBwYXRjaCAob24gdG9wIG9mIDcyNTBmNmQzNTY4MWRmKT8KPj4KPj4gVGhh
dCBibG93cyB1cCB3aGlsZSBib290aW5nIHRoZSBndWVzdDoKPiAKPiBPaCwgc29ycnkuIE9mIGNv
dXJzZSBpdCBkb2VzLiBEZXJlZmVyZW5jaW5nIGEgcGVyY3B1IHZhcmlhYmxlCj4gZGlyZWN0bHkg
Y2FuJ3Qgd29yay4gSG93IHNpbGx5IG9mIG1lLgo+IAo+IFRoZSBhdHRhY2hlZCB2YXJpYW50IHNo
b3VsZCByZXBhaXIgdGhhdC4gVGVzdGVkIHRvIG5vdCBicmVhayBib290aW5nLgoKVGhpcyBvbmUg
Ym9vdHMuIFdpbGwgcmVwb3J0IGJhY2sgd2hlbiBlaXRoZXIgSSBmaW5kIGlzc3VlcyBvcgp3aGVu
IEknbSBjb21mb3J0YWJsZSBlbm91Z2ggdG8gZ2l2ZSBhICJUZXN0ZWQtYnkiIGluIGEgZmV3IGRh
eXMuCgpUaGFua3MgYWdhaW4uCgotLQpTYW5kZXIKCgo+IAo+IEp1ZXJnZW4KPiAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
