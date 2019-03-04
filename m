From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] xen/ACPI: Switch to bitmap_zalloc()
Date: Mon, 4 Mar 2019 14:18:38 +0100
Message-ID: <05d315bd-16ed-13d3-f76e-c8f0467a98ea@suse.com>
References: <20190304093127.57578-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5FLX=RH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h0nUP-0000zX-So
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2019 13:18:41 +0000
In-Reply-To: <20190304093127.57578-1-andriy.shevchenko@linux.intel.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDMvMjAxOSAxMDozMSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IFN3aXRjaCB0byBi
aXRtYXBfemFsbG9jKCkgdG8gc2hvdyBjbGVhcmx5IHdoYXQgd2UgYXJlIGFsbG9jYXRpbmcuCj4g
QmVzaWRlcyB0aGF0IGl0IHJldHVybnMgcG9pbnRlciBvZiBiaXRtYXAgdHlwZSBpbnN0ZWFkIG9m
IG9wYXF1ZSB2b2lkICouCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRy
aXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
