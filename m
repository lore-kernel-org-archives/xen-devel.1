From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 1/2] x86/acpi: add retrieval function for
	rsdp address
Date: Mon, 29 Jan 2018 04:02:36 +0100
Message-ID: <CAJZ5v0gr7Jd-1dOD_DTRQDCX7ON68O1KJ9ioAJAnwBYm2cEdZg__41080.9338478886$1517194905$gmane$org@mail.gmail.com>
References: <20180125143639.9969-1-jgross@suse.com>
 <20180125143639.9969-2-jgross@suse.com>
 <CAHp75VdgdQXH-d9+Fo1DwGdfV1pB0jADMmwAK1BU7oN6dgQs8Q@mail.gmail.com>
 <a33e605a-73d7-83b7-4472-14f66b6738be@suse.com>
 <CAHp75VdUO2Rq7geYD9xxY3nnzGAhO46+w+rQx44=MgJ6obRcEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lgq3=ey=gmail.com=rjwysocki@srs-us1.protection.inumbo.net>)
 id 1efziQ-00052q-Cd
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2018 03:02:38 +0000
Received: by mail-ot0-x242.google.com with SMTP id t35so5216563otd.13
 for <xen-devel@lists.xenproject.org>; Sun, 28 Jan 2018 19:02:36 -0800 (PST)
In-Reply-To: <CAHp75VdUO2Rq7geYD9xxY3nnzGAhO46+w+rQx44=MgJ6obRcEA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stable <stable@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Len Brown <lenb@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gMjgsIDIwMTggYXQgNDowNCBQTSwgQW5keSBTaGV2Y2hlbmtvCjxhbmR5LnNo
ZXZjaGVua29AZ21haWwuY29tPiB3cm90ZToKPiBPbiBGcmksIEphbiAyNiwgMjAxOCBhdCA4OjIx
IFBNLCBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAyNi8wMS8x
OCAxOTowOCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+Pj4gT24gVGh1LCBKYW4gMjUsIDIwMTgg
YXQgNDozNiBQTSwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+PiBB
ZGQgYSBmdW5jdGlvbiB0byBnZXQgdGhlIGFkZHJlc3Mgb2YgdGhlIFJTRFAgdGFibGUuIFBlciBk
ZWZhdWx0IHVzZSBhCj4+Pj4gX193ZWFrIGFubm90YXRlZCBmdW5jdGlvbiBiZWluZyBhIG5vcC4K
Pj4+Cj4+PiBUaGUgcHJvYmxlbSB3aXRoIHdlYWsgZnVuY3Rpb25zIHRoYXQgd2UgY2FuJ3QgaGF2
ZSBtb3JlIHRoYW4gb25lCj4+PiBpbXBsZW1lbnRhdGlvbiBwZXIga2VybmVsIHdoaWxlIHdlIHdv
dWxkIGxpa2UgdG8gYnVpbHQgc2V2ZXJhbCBjb2RlCj4+PiBwYXRocy4KPj4+Cj4+PiBJIGhhdmUg
c3R1bWJsZWQgb24gdGhlIHNpbWlsYXIgc3R1ZmYgYW5kIHJlYWxpemUgdGhhdC4KPj4+Cj4+PiBQ
ZXJoYXBzLCBvbmUgb2YgdGhlIHNvbHV0aW9uIGlzIHRvIGhhdmUgYW4gYWRkaXRpb25hbCBzdHJ1
Y3QgdW5kZXIKPj4+IHg4Nl9pbml0IHRvIGFsdGVybmF0ZSBBQ1BJIHJlbGF0ZWQgc3R1ZmYuCj4+
Cj4+IEkgdGhpbmsgd2UgY2FuIGdvIHRoYXQgcm91dGUgd2hlbiBhbm90aGVyIHVzZXIgb2YgdGhh
dCBpbnRlcmZhY2UgaXMKPj4gYXBwZWFyaW5nLgo+Cj4gV2h5IG5vdCB0byBlc3RhYmxpc2ggdGhl
IHN0cnVjdD8gQXQgbGVhc3QgdGhpcyByb3V0ZSBJIHdvdWxkIGxpa2UgdG8KPiBnbyB3aXRoIFsx
XS4KPgo+IFsxXTogaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTgvMS8xNy84MzQKCk1heWJlIEkn
bSBhIGJpdCBzbG93IHRvZGF5LCBidXQgY2FyZSB0byBleHBsYWluIHdoYXQgZXhhY3RseSB5b3Ug
bWVhbj8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
