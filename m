From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH] x86/vm_event: add gdtr_base to the vm_event
 structure
Date: Thu, 2 May 2019 07:53:33 -0600
Message-ID: <CABfawhkpSz6mOr+1jhQtw=08ZZWvne1agJkbsXdNYbGRrs33OQ@mail.gmail.com>
References: <20190501235731.1486-1-tamas@tklengyel.com>
 <59f57a48-b1da-7362-4024-c890cf357bf0@bitdefender.com>
 <5CCAB0FC020000780022B12F@prv1-mh.provo.novell.com>
 <CABfawh=Kmsj=y1XcV8fiqbCZ6_bDp2-E+OoQHr_+_NCAy4OeSw@mail.gmail.com>
 <5CCAF0F1020000780022B416@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bVeI=TC=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hMCA7-0007Z6-Tv
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 13:54:11 +0000
Received: by mail-wm1-f41.google.com with SMTP id w15so2764777wmc.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2019 06:54:10 -0700 (PDT)
In-Reply-To: <5CCAF0F1020000780022B416@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCA3OjMwIEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiA+Pj4gT24gMDIuMDUuMTkgYXQgMTU6MDksIDx0YW1hc0B0a2xlbmd5
ZWwuY29tPiB3cm90ZToKPiA+IFRoYXQgc2FpZCBJIGRvbid0IGhhdmUgYSB1c2UgZm9yIGlkdCBh
bmQgZ2R0cl9saW1pdCB0aGF0IHdhcnJhbnRzCj4gPiBoYXZpbmcgdG8gcmVjZWl2ZSBpdCB2aWEg
dGhlIHZtX2V2ZW50IHN0cnVjdHVyZQo+Cj4gU28gd2hhdCB1c2UgaWYgdGhlIEdEVCBiYXNlIHdp
dGhvdXQgdGhlIGxpbWl0PyBBcmUgeW91IHNpbGVudGx5Cj4gYXNzdW1pbmcgYWxsIHByZXNlbnRs
eSBsb2FkZWQgc2VsZWN0b3JzIGFyZSAoc3RpbGwpIHdpdGhpbiBsaW1pdHM/CgpPbiAzMi1iaXQg
V2luZG93cyB0aGUgS1BDUidzIGFkZHJlc3MgaXMgY2FjaGVkIGF0IGdkdHJfYmFzZSArIDB4MzAK
d2hpbGUgaW4gcmluZzMuIEluIHJpbmcwIHdlIGNhbiBqdXN0IHVzZSBmc19iYXNlIGZvciB0aGF0
LiBBdCB0aGUKbW9tZW50IEkgc3RpbGwganVzdCBjYWNoZSB0aGUgS1BDUiBsb2NhdGlvbiBvbiBl
dmVyeSBNT1YtVE8tQ1IzIGJ1dAp0aGF0IGJlY2FtZSBhbiBpc3N1ZSB3aXRoIHJlY2VudCB2ZXJz
aW9ucyBvZiBXaW5kb3dzMTAgaW1wbGVtZW50aW5nCk1lbHRkb3duIG1pdGlnYXRpb25zIGJlY2F1
c2UgaXQgbGVhZHMgdG8gZXh0cmVtZSBwZXJmb3JtYW5jZQpkZWdyYWRhdGlvbiBpbiB0aGUgZ3Vl
c3QgKG9wZW5pbmcgYW4gYXBwIHRha2VzIH4yMHMpLiBTbyBub3cgSSBqdXN0CnRyeSB0byBmaW5k
IHRoZSBLUENSIGJhc2VkIG9uIHRoZSByZWdpc3RlcnMgcmVwb3J0ZWQgaW4gZWFjaCB2bV9ldmVu
dC4KV2UgdXNlIHRoZSBLUENSIHRvIHF1aWNrbHkgZmluZCB0aHJlYWQvcHJvY2VzcyBiYXNlIGFk
ZHJlc3NlcyB0bwpnYXRoZXIgaW5mbyByZWxldmFudCB0byBpbnRyb3NwZWN0aW9uLgoKVGFtYXMK
ClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
