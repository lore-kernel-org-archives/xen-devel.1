From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/2] x86/acpi: add retrieval function for
	rsdp address
Date: Thu, 1 Feb 2018 17:45:02 +0200
Message-ID: <CAHp75Ved4nO7ktQ=1O5oRx4mNyWcA6YN9fATgMGW1OR0UxCd4g__12388.0484178246$1517499851$gmane$org@mail.gmail.com>
References: <20180125143639.9969-1-jgross@suse.com>
 <20180125143639.9969-2-jgross@suse.com>
 <CAHp75VdgdQXH-d9+Fo1DwGdfV1pB0jADMmwAK1BU7oN6dgQs8Q@mail.gmail.com>
 <a33e605a-73d7-83b7-4472-14f66b6738be@suse.com>
 <CAHp75VdUO2Rq7geYD9xxY3nnzGAhO46+w+rQx44=MgJ6obRcEA@mail.gmail.com>
 <CAJZ5v0gr7Jd-1dOD_DTRQDCX7ON68O1KJ9ioAJAnwBYm2cEdZg@mail.gmail.com>
 <CAHp75Vf7SRNGeU_To9WNmzECxaKjDbYeFspnJiwCGAhAwOTRyA@mail.gmail.com>
 <CAJZ5v0g3Ti4W8Z-ePVCO0RFs3qviJxhrh1___i6oiZKRsYzBng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fn/t=e3=gmail.com=andy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1ehH2v-0001ea-2L
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2018 15:45:05 +0000
Received: by mail-qk0-x22d.google.com with SMTP id l29so19924350qkj.8
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2018 07:45:03 -0800 (PST)
In-Reply-To: <CAJZ5v0g3Ti4W8Z-ePVCO0RFs3qviJxhrh1___i6oiZKRsYzBng@mail.gmail.com>
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

T24gVGh1LCBGZWIgMSwgMjAxOCBhdCA5OjU3IEFNLCBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVs
QGtlcm5lbC5vcmc+IHdyb3RlOgo+IE9uIFdlZCwgSmFuIDMxLCAyMDE4IGF0IDQ6NDMgUE0sIEFu
ZHkgU2hldmNoZW5rbwo+IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPiB3cm90ZToKPj4gT24g
TW9uLCBKYW4gMjksIDIwMTggYXQgNTowMiBBTSwgUmFmYWVsIEouIFd5c29ja2kgPHJhZmFlbEBr
ZXJuZWwub3JnPiB3cm90ZToKPj4+IE9uIFN1biwgSmFuIDI4LCAyMDE4IGF0IDQ6MDQgUE0sIEFu
ZHkgU2hldmNoZW5rbwo+Pj4gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+IHdyb3RlOgoKPj4g
SW5zdGVhZCBvZiBkZWNsYXJpbmcgZnVuY3Rpb24gYXMgX193ZWFrLCBlc3RhYmxpc2ggYSBuZXcg
c3RydWN0IGZvcgo+PiBBQ1BJIHJlbGF0ZWQgc3R1YnMgYW5kIGluY29ycG9yYXRlIGl0IGludG8g
eDg2X2luaXQuCj4+Cj4+IFRoYXQgaXMgbXkgcHJvcG9zYWwuIEkgdGhpbmsgSSB3b3VsZCBnbyB0
aGlzIHdheSBpbiBteSBjYXNlIHdoZXJlIEkKPj4gbmVlZCB0byB0cmVhdCBkaWZmZXJlbnRseSBB
Q1BJIEhXIHJlZHVjZWQgaW5pdGlhbGl6YXRpb24gb2YgbGVnYWN5Cj4+IGRldmljZXMuCj4KPiBJ
T1cgeW91J2QgbGlrZSB0byBoYXZlIGEgc2V0IG9mIEFDUEkgaW5pdCBjYWxsYmFja3MgdGhhdCBj
b3VsZCBiZQo+IGRlZmluZWQgYnkgYW4gYXJjaCwgcmlnaHQ/CgpDb3JyZWN0IQoKQW5kIHNpbmNl
IHRoZXJlIGlzIGFub3RoZXIgcG90ZW50aWFsIHVzZXIgKFhlbikgZm9yIHRoaXMgYXBwcm9hY2gg
SQpjb25zaWRlciBpdCBhIGdvb2QgY2hhbmNlIHRvIGJlIGNob3Nlbi4KVGhvdWdoIEkgaGF2ZSBu
byBpZGVhIGlmIFhlbiBjYW4gZG8gdGhpbmdzIGRpZmZlcmVudGx5LgoKLS0gCldpdGggQmVzdCBS
ZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
