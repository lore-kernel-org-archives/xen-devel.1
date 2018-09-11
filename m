From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/EISA: Don't probe EISA bus for Xen PV
 guests
Date: Tue, 11 Sep 2018 16:30:11 -0400
Message-ID: <340bfde6-6cf8-ce15-2327-7484abd351e0__28896.013290114$1536697656$gmane$org@oracle.com>
References: <20180911195538.23289-1-boris.ostrovsky@oracle.com>
 <alpine.DEB.2.21.1809112218580.1427@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y368=lz=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fzpHH-0002Sz-HF
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 20:28:51 +0000
In-Reply-To: <alpine.DEB.2.21.1809112218580.1427@nanos.tec.linutronix.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: jgross@suse.com, x86@kernel.org, linux-kernel@vger.kernel.org, stable <stable@vger.kernel.org>, mingo@redhat.com, hpa@zytor.com, andy@strugglers.net, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gOS8xMS8xOCA0OjIwIFBNLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4gT24gVHVlLCAxMSBT
ZXAgMjAxOCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+Cj4+IEZvciB1bnByaXZpbGVnZWQgWGVu
IFBWIGd1ZXN0cyB0aGlzIGlzIG5vcm1hbCBtZW1vcnkgYW5kIGlvcmVtYXAgd2lsbAo+PiBub3Qg
YmUgYWJsZSB0byBwcm9wZXJseSBtYXAgaXQuCj4+Cj4+IFdoaWxlIGF0IGl0LCBzaW5jZSBpb3Jl
bWFwIG1heSByZXR1cm4gTlVMTCwgYWRkIGEgdGVzdCBmb3IgcG9pbnRlcidzCj4+IHZhbGlkaXR5
Lgo+IEkgYXNzdW1lIHRoaXMgZ29lcyBiYWNrIHRvIHZlcnkgZGVhZCBrZXJuZWxzLCBzbyB0aGF0
IHNob3VsZCBnbyB3aXRoIGEgQ2MKPiBzdGFibGUsIHJpZ2h0Pwo+CgoKWWVzLCBJIGZvcmdvdCB0
byBhZGQgdGhvc2UgKGFuZCBub3cgSSBkaWQpLCB0aGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0
LgoKSXQgaGFzIHRvIGdvIGF0IGxlYXN0IGFsbCB0aGUgd2F5IGJhY2sgdG8gNC4xMyBzaW5jZSBi
ZWZvcmUKZjdlYWY2ZTAwZmQ1OCAoIng4Ni9ib290OiBNb3ZlIEVJU0Egc2V0dXAgdG8gYSBzZXBh
cmF0ZSBmaWxlIiksIGp1c3QgYnkKbHVjaywgZWFybHlfaW9yZW1hcCgpIHdvcmtlZCBmb3IgdGhl
IGd1ZXN0cy4KCgotYm9yaXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
