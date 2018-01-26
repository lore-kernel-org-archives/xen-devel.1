From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/2] x86/acpi: add retrieval function for
	rsdp address
Date: Fri, 26 Jan 2018 19:21:13 +0100
Message-ID: <a33e605a-73d7-83b7-4472-14f66b6738be__32674.5156351992$1517081216$gmane$org@suse.com>
References: <20180125143639.9969-1-jgross@suse.com>
 <20180125143639.9969-2-jgross@suse.com>
 <CAHp75VdgdQXH-d9+Fo1DwGdfV1pB0jADMmwAK1BU7oN6dgQs8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=zhvb=ew=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1efW8k-0000fr-4l
 for xen-devel@lists.xenproject.org; Sat, 27 Jan 2018 19:27:50 +0000
In-Reply-To: <CAHp75VdgdQXH-d9+Fo1DwGdfV1pB0jADMmwAK1BU7oN6dgQs8Q@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Len Brown <lenb@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDEvMTggMTk6MDgsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPiBPbiBUaHUsIEphbiAy
NSwgMjAxOCBhdCA0OjM2IFBNLCBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3Rl
Ogo+PiBBZGQgYSBmdW5jdGlvbiB0byBnZXQgdGhlIGFkZHJlc3Mgb2YgdGhlIFJTRFAgdGFibGUu
IFBlciBkZWZhdWx0IHVzZSBhCj4+IF9fd2VhayBhbm5vdGF0ZWQgZnVuY3Rpb24gYmVpbmcgYSBu
b3AuCj4gCj4gVGhlIHByb2JsZW0gd2l0aCB3ZWFrIGZ1bmN0aW9ucyB0aGF0IHdlIGNhbid0IGhh
dmUgbW9yZSB0aGFuIG9uZQo+IGltcGxlbWVudGF0aW9uIHBlciBrZXJuZWwgd2hpbGUgd2Ugd291
bGQgbGlrZSB0byBidWlsdCBzZXZlcmFsIGNvZGUKPiBwYXRocy4KPiAKPiBJIGhhdmUgc3R1bWJs
ZWQgb24gdGhlIHNpbWlsYXIgc3R1ZmYgYW5kIHJlYWxpemUgdGhhdC4KPiAKPiBQZXJoYXBzLCBv
bmUgb2YgdGhlIHNvbHV0aW9uIGlzIHRvIGhhdmUgYW4gYWRkaXRpb25hbCBzdHJ1Y3QgdW5kZXIK
PiB4ODZfaW5pdCB0byBhbHRlcm5hdGUgQUNQSSByZWxhdGVkIHN0dWZmLgoKSSB0aGluayB3ZSBj
YW4gZ28gdGhhdCByb3V0ZSB3aGVuIGFub3RoZXIgdXNlciBvZiB0aGF0IGludGVyZmFjZSBpcwph
cHBlYXJpbmcuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
