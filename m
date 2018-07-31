From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH] x86/altp2m: Allow setting the #VE info page
 for an arbitrary VCPU
Date: Tue, 31 Jul 2018 20:56:06 +0300
Message-ID: <9578e556-b8e2-f46f-e162-8d4c2a3ce88d@bitdefender.com>
References: <20180725114915.26614-1-apop@bitdefender.com>
 <5B604D9C02000078001D96A6@prv1-mh.provo.novell.com>
 <CABfawhkaCVRrrBJ46U--b3odRztXcQ+_+VBebADAB-aF1uYJXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2fiq=kp=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1fkYsY-0003i2-6J
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 17:56:14 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 34D0C301AB36
 for <xen-devel@lists.xenproject.org>; Tue, 31 Jul 2018 22:12:28 +0300 (EEST)
Received: from smtp01.buh.bitdefender.com (smtp.bitdefender.biz [10.17.80.75])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id C1F117FBD1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Jul 2018 20:56:10 +0300 (EEST)
In-Reply-To: <CABfawhkaCVRrrBJ46U--b3odRztXcQ+_+VBebADAB-aF1uYJXg@mail.gmail.com>
Content-Language: en-GB-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Adrian Pop <apop@bitdefender.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMzEvMjAxOCAwODoxOSBQTSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFR1ZSwg
SnVsIDMxLCAyMDE4IGF0IDU6NTMgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3
cm90ZToKPj4gSSdkIGxpa2UgeW91IHRvIG91dGxpbmUgaW4gdGhlIGRlc2NyaXB0aW9uIGhvdyB5
b3UgbWVhbiBhbiBleHRlcm5hbAo+PiBhZ2VudCB0byBjb29yZGluYXRlIHRoZSB1c2Ugb2YgdGhp
cyBHRk4gd2l0aCB0aGUgZ3Vlc3QgKGFuZCBpbgo+PiBwYXJ0aWN1bGFyIHdpdGhvdXQgaW4tZ3Vl
c3QgYWdlbnQpLgo+IAo+IFVzaW5nICNWRSB3aXRob3V0IGFuIGluLWd1ZXN0IGFnZW50IGlzbid0
IHJlYWxseSBwb3NzaWJsZSBzbyB0aGlzIGlzCj4gcmVhbGx5IGp1c3QgYWJvdXQgZGVzaWduYXRp
bmcgdGhlIHBhZ2UgZnJvbSBkb20wIGluc3RlYWQgb2YgZG9pbmcgaXQKPiB3aXRoIHRoZSBpbi1n
dWVzdCBhZ2VudC4gU29tZXRoaW5nIGhhcyB0byBiZSBwcmVzZW50IGluIHRoZSBndWVzdCB0bwo+
IGhhbmRsZSB0aGUgbmV3IGludGVycnVwdHMgY29taW5nIGZyb20gI1ZFIGFmdGVyIGFsbC4gSSBj
b3VsZCBpbWFnZSBhCj4gbnVtYmVyIG9mIHdheXMgdG8gY29vcmRpbmF0ZSB0aGF0IGRvbTAgYWdl
bnQgbm93IHNldHRpbmcgdGhpcyBwYWdlCj4gd2l0aCB0aGUgZ3Vlc3QsIG15IGltbWVkaWF0ZSBn
dWVzcyBpcyB0aGF0IGl0IHdvdWxkIGJlIGRvbmUgdGhyb3VnaAo+IHRoZSB2bV9ldmVudCBndWVz
dCByZXF1ZXN0IGNoYW5uZWwuIEJ1dCBpdCBjb3VsZCBhbHNvIGJlIGRvbmUgdGhyb3VnaAo+IHhl
bnN0b3JlIG9yIGV2ZW4gc3NoLgoKVGhhdCdzIGV4YWN0bHkgd2hhdCBoYXBwZW5zIC0gdGhleSBj
b29yZGluYXRlIHZpYSB0aGUgZ3Vlc3QtcmVxdWVzdAp2bV9ldmVudC4gVGhlcmUncyBhICNWRSBk
cml2ZXIgaW4gdGhlIGd1ZXN0LgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
