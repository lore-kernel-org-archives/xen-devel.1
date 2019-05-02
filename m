From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/vm_event: add gdtr_base to the vm_event
 structure
Date: Thu, 02 May 2019 07:32:06 -0600
Message-ID: <5CCAF156020000780022B438@prv1-mh.provo.novell.com>
References: <20190501235731.1486-1-tamas@tklengyel.com>
 <59f57a48-b1da-7362-4024-c890cf357bf0@bitdefender.com>
 <5CCAB0FC020000780022B12F@prv1-mh.provo.novell.com>
 <CABfawh=Kmsj=y1XcV8fiqbCZ6_bDp2-E+OoQHr_+_NCAy4OeSw@mail.gmail.com>
 <e526694c-2ab0-e740-0ef6-fa643f6c890f@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMBoz-00059C-BD
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 13:32:21 +0000
In-Reply-To: <e526694c-2ab0-e740-0ef6-fa643f6c890f@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, Tamas K Lengyel <tamas@tklengyel.com>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA1LjE5IGF0IDE1OjIzLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gTXkgcG9pbnQgaXMsIGF0IHRoZSBtb21lbnQgaXQncyBmaW5lIHRvIHNraXAgaWR0ciBp
ZiBpdCdzIG5vdCByZXF1aXJlZCAKPiBieSBKYW4sIGJ1dCBpZiB3ZSBkbyBhZGQgZWl0aGVyIHRo
ZW4gbGV0J3MgcGxlYXNlIGFkZCBib3RoIF9iYXNlIGFuZCBfbGltaXQuCgpObywgaXQncyBub3Qg
YSByZXF1aXJlbWVudCBJIG1lYW4gdG8gcHV0IHVwIChhbmQgSSdtIG5vdCBpbiB0aGUKcG9zaXRp
b24gdG8gZWl0aGVyLCBhcyBJJ20gbm90IHRoZSBtYWludGFpbmVyIG9mIHRoZSBpbnRlcmZhY2Up
LgpJdCBqdXN0IHNlZW1zIGluY29uc2lzdGVudCB0byBtZSB0byBoYXZlIG9uZSBidXQgbm90IHRo
ZSBvdGhlci4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
