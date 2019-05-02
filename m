From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/vm_event: add gdtr_base to the vm_event
 structure
Date: Thu, 02 May 2019 07:30:25 -0600
Message-ID: <5CCAF0F1020000780022B416@prv1-mh.provo.novell.com>
References: <20190501235731.1486-1-tamas@tklengyel.com>
 <59f57a48-b1da-7362-4024-c890cf357bf0@bitdefender.com>
 <5CCAB0FC020000780022B12F@prv1-mh.provo.novell.com>
 <CABfawh=Kmsj=y1XcV8fiqbCZ6_bDp2-E+OoQHr_+_NCAy4OeSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMBnA-000512-68
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 13:30:28 +0000
In-Reply-To: <CABfawh=Kmsj=y1XcV8fiqbCZ6_bDp2-E+OoQHr_+_NCAy4OeSw@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA1LjE5IGF0IDE1OjA5LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
VGhhdCBzYWlkIEkgZG9uJ3QgaGF2ZSBhIHVzZSBmb3IgaWR0IGFuZCBnZHRyX2xpbWl0IHRoYXQg
d2FycmFudHMKPiBoYXZpbmcgdG8gcmVjZWl2ZSBpdCB2aWEgdGhlIHZtX2V2ZW50IHN0cnVjdHVy
ZQoKU28gd2hhdCB1c2UgaWYgdGhlIEdEVCBiYXNlIHdpdGhvdXQgdGhlIGxpbWl0PyBBcmUgeW91
IHNpbGVudGx5CmFzc3VtaW5nIGFsbCBwcmVzZW50bHkgbG9hZGVkIHNlbGVjdG9ycyBhcmUgKHN0
aWxsKSB3aXRoaW4gbGltaXRzPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
