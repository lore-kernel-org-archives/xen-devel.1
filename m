From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH v2 0/2] Introduce runstate area registration
 with phys address
Date: Wed, 8 May 2019 16:54:25 +0300
Message-ID: <0bd113db-7851-df02-90d1-2a79bd4bedaf@gmail.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <fa126315-31af-854e-817a-8640b431c82b@arm.com>
 <CAC1WxdiMzAq5hRC-mhRQuFDs7z_Hj5w7VAy52ec87SJQOGmp3w@mail.gmail.com>
 <a28f95a1-d9da-2caf-f4b4-013100176b02@arm.com>
 <090ce8cc-f329-fe54-4894-b7f12e3cd5a6@gmail.com>
 <3d5ccdcb-d777-e75b-f4bd-38d2d470a754@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O+xT=TI=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hON1i-0003tc-7X
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 13:54:30 +0000
Received: by mail-lf1-x143.google.com with SMTP id y10so7939856lfl.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2019 06:54:28 -0700 (PDT)
In-Reply-To: <3d5ccdcb-d777-e75b-f4bd-38d2d470a754@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKT24gMDguMDUuMTkgMTY6MzksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBU
aGF0J3MgYSB0cmFuc2xhdGlvbiBmYXVsdCBsZXZlbCAwIG9uIGEgc3RhZ2UtMSBwYWdlLXRhYmxl
IHdhbGsuIFRvIGNvbmZpcm0geW91IGhhdmUga3B0aSBkaXNhYmxlZCwgcmlnaHQ/ClllcywgS1BU
SSBpcyBkaXNhYmxlZC4gVGhhdCdzIHdoeSBJJ20gY3VyaW91cyB3aGF0J3Mgd3Jvbmcgd2l0aCB0
aGF0LgoKPiBEb2VzIGl0IGFsd2F5cyBmYWlsLCBvciBvbmx5IHRpbWUgdG8gdGltZT8KSXQgaGFw
cGVucyBvbiBib290LiBBbmQgdGhvc2UgcHJpbnRzIGFyZSBwZXJtYW5lbnQgYW5kIG1ha2VzIGJv
b3QgdGltZSBlbm9ybW91cy4gSSBvbmNlIHdhaXRlZCB0aWxsIHVzZXIgcHJvbXB0IChoYWxmIGFu
IGhvdXIgb3Igc28pLCB0aGV5IGNhbG1lZCBvbiB2aXNpYmxlIGlkbGUsIGJ1dCBwcmludGVkIGZy
b20gdGltZSB0byB0aW1lIChtYXliZSBvbiB1c2Vyc3BhY2UgYWN0aXZpdGllcykuCgo+IENvdWxk
IHlvdSBkdW1wIHRoZSBndWVzdCByZWdpc3RlciB3aGVuIHRoaXMgaGFwcGVuPwpDb3VsZCB5b3Ug
cGxlYXNlIHJlbWVtYmVyIGhvdyB0byBkbyB0aGF0PwoKPiBFdmVuIHdpdGgga3B0aSBkaXNhYmxl
ZCwgeW91IGFyZSBzdGlsbCBwb3RlbnRpYWxseSBmYWNpbmcgaXNzdWUgdXNpbmcgdmlydHVhbCBh
ZGRyZXNzIChhbHRob3VnaCB0aGV5IG1heSBiZSBtb3JlIGRpZmZpY3VsdCB0byB0cmlnZ2VyKS4g
SW5kZWVkLCB5b3UgYXJlIHJlbHlpbmcgb24gdGhlIGd1ZXN0IE9TIHRvIHVubWFwIHRoZSByZWdp
b25zIG9yIHRvdWNoIHRoZSBwYWdlLXRhYmxlcyBlbnRyaWVzIHVzZWQgZm9yIHRoZSB3YWxrLgoK
PiBVbmZvcnR1bmF0ZWx5IHdlIGNhbid0IHByZXZlbnQgYSBndWVzdCBwbGF5aW5nIHdpdGggaXRz
IHBhZ2UtdGFibGUuIFNvIGF0IGJlc3Qgd2UgY2FuIG9ubHkgd29ya2Fyb3VuZCBpdC4KQW5kIHRo
YXQncyB3aHkgd2UgdHVybmVkIHRvIGd1ZXN0IHBoeXMgYWRkcmVzcyB1c2VkIGZvciBydW5zdGF0
ZSBhcmVhLgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
