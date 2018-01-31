From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/2] x86/acpi: add retrieval function for
	rsdp address
Date: Wed, 31 Jan 2018 17:41:27 +0200
Message-ID: <CAHp75VcuUTgVzT0ZTWfQDZOhdjVg8wp5UZC8UY0-eOvy0JVqNw__44977.9305527501$1517413246$gmane$org@mail.gmail.com>
References: <20180125143639.9969-1-jgross@suse.com>
 <20180125143639.9969-2-jgross@suse.com>
 <CAHp75VdgdQXH-d9+Fo1DwGdfV1pB0jADMmwAK1BU7oN6dgQs8Q@mail.gmail.com>
 <CAJZ5v0gN-w6MJFOuTsircR5kBHz_U38NB7wErREYL=w_tj-hQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wbgo=e2=gmail.com=andy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1eguVt-00061W-PZ
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2018 15:41:29 +0000
Received: by mail-qk0-x232.google.com with SMTP id d21so15254597qkj.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2018 07:41:28 -0800 (PST)
In-Reply-To: <CAJZ5v0gN-w6MJFOuTsircR5kBHz_U38NB7wErREYL=w_tj-hQQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stable <stable@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Len Brown <lenb@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjksIDIwMTggYXQgNTowMSBBTSwgUmFmYWVsIEouIFd5c29ja2kgPHJhZmFl
bEBrZXJuZWwub3JnPiB3cm90ZToKPiBPbiBGcmksIEphbiAyNiwgMjAxOCBhdCA3OjA4IFBNLCBB
bmR5IFNoZXZjaGVua28KPiA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4gd3JvdGU6Cgo+PiBJ
IGhhdmUgc3R1bWJsZWQgb24gdGhlIHNpbWlsYXIgc3R1ZmYgYW5kIHJlYWxpemUgdGhhdC4KPj4K
Pj4gUGVyaGFwcywgb25lIG9mIHRoZSBzb2x1dGlvbiBpcyB0byBoYXZlIGFuIGFkZGl0aW9uYWwg
c3RydWN0IHVuZGVyCj4+IHg4Nl9pbml0IHRvIGFsdGVybmF0ZSBBQ1BJIHJlbGF0ZWQgc3R1ZmYu
Cj4KPiBJJ20gbm90IHN1cmUgaWYgdGhhdCByZWFsbHkgaXMgYSBwcm9ibGVtIGluIHRoaXMgcGFy
dGljdWxhciBjYXNlLgo+Cj4gV2h5IHdvdWxkIHlvdSB3YW50IHRvIHVzZSBkaWZmZXJlbnQgUlNE
UCByZXRyaWV2YWwgZnVuY3Rpb25zIGZvciBvbmUgYXJjaD8KCkkgd2FzIG5vdCBjbGVhci4gSSdt
IHRhbGtpbmcgYWJvdXQgYXBwcm9hY2ggc3RydWN0IHg4Nl9pbml0IHZzLiBfX3dlYWsgZnVuY3Rp
b24uCkluIG15IGNhc2UgaXQgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCBSRFNQLCBidXQgd2l0aCBB
Q1BJIHN0dWJzLgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
