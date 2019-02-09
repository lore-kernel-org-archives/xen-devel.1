From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Linux 5.0 regression: BUG: unable to handle kernel
 paging request at ffff888023e26778
Date: Sat, 9 Feb 2019 19:44:08 +0000
Message-ID: <8500478e-d45b-034c-b57e-bd1d18d00966__41850.168960967$1549741551$gmane$org@citrix.com>
References: <39ae9195-cf8f-01fe-df83-38a9a4c52e48@eikelenboom.it>
 <CAHk-=winXFRv0KUa332spZx0yaDKMAbdKSeAcBATtacACLgm0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sD+B=QQ=citrix.com=prvs=9365327fb=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gsYYH-0004UK-RW
 for xen-devel@lists.xenproject.org; Sat, 09 Feb 2019 19:44:37 +0000
In-Reply-To: <CAHk-=winXFRv0KUa332spZx0yaDKMAbdKSeAcBATtacACLgm0A@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, Sander Eikelenboom <linux@eikelenboom.it>
Cc: Juergen Gross <jgross@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Joel Fernandes (Google)" <joel@joelfernandes.org>, "Kirill A. Shutemov" <kirill@shutemov.name>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDIvMjAxOSAxODo1NCwgTGludXMgVG9ydmFsZHMgd3JvdGU6Cj4gT24gU2F0LCBGZWIg
OSwgMjAxOSBhdCAxMjoyNCBBTSBTYW5kZXIgRWlrZWxlbmJvb20gPGxpbnV4QGVpa2VsZW5ib29t
Lml0PiB3cm90ZToKPj4gSSBoYXZlbid0IGdvdCBhIHJlcHJvZHVjZXIgc28gaSBtaWdodCBiZSBo
YXJkIHRvIGhpdCBpdCBhZ2FpbiwKPj4gc3lzdGVtIGlzIEFNRCBhbmQgdGhpcyBpcyBmcm9tIHRo
ZSBob3N0IGtlcm5lbCBydW5uaW5nIHVuZGVyCj4+IHRoZSBYZW4gaHlwZXJ2aXNvciBtaWdodCBp
dCBtYXR0ZXIuCj4gSSB0aGluayB0aGlzIGlzIGEgWGVuIGJ1Zy4KPgo+IEluIHBhcnRpY3VsYXIs
IHRoZXJlJ3MgYSBmZXcgcG9pc29uIHZhbHVlcyBpbiB0aGVyZSB0aGF0IGxvb2sgbGlrZQo+IHpl
bi4gTGlrZSB0aGlzOgo+Cj4gICAgUjEwOiBkZWFkYmVlZmRlYWRmMDBkCj4KPiBsb29rcyBsaWtl
IGEgc3BlY2lhbCBwb2lzb24gdmFsdWUgdGhhdCBpcyBmcm9tIFhlbiBpdHNlbGYuCgpYZW4ncyBo
eXBlcmNhbGwgQUJJIHN0YXRlcyB0aGF0IHBhcmFtZXRlcnMgaW4gcmVnaXN0ZXJzIG1heSBiZSBj
aGFuZ2VkCmFzIHBhcnQgb2YgdGhlIGh5cGVyY2FsbC7CoCBUaGlzIGlzIHVzZWQgcmVzdGFydCBo
eXBlcmNhbGxzIG1pZHdheQp0aHJvdWdoIHRoZWlyIHByb2Nlc3NpbmcgaWYgd2UgaGFkIHRvIGRl
bGl2ZXIgYW4gaW50ZXJydXB0IHRvIHRoZSB2Y3B1LgoKQXMgYSByZXN1bHQsIGRlYnVnIGJ1aWxk
cyBvZiBYZW4gZGVsaWJlcmF0ZWx5IHBvaXNvbiBhbGwgaHlwZXJjYWxsCnBhcmFtZXRlcnMsIHRv
IGhlbHAgY2F0Y2ggZ3Vlc3QgY29kZSB3aGljaCBkb2Vzbid0IGZvbGxvdyB0aGUgcnVsZXMuCgp+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
