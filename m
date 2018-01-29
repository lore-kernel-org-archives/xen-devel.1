From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 1/2] x86/acpi: add retrieval function for
	rsdp address
Date: Mon, 29 Jan 2018 04:01:45 +0100
Message-ID: <CAJZ5v0gN-w6MJFOuTsircR5kBHz_U38NB7wErREYL=w_tj-hQQ__7273.26959972761$1517194850$gmane$org@mail.gmail.com>
References: <20180125143639.9969-1-jgross@suse.com>
 <20180125143639.9969-2-jgross@suse.com>
 <CAHp75VdgdQXH-d9+Fo1DwGdfV1pB0jADMmwAK1BU7oN6dgQs8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lgq3=ey=gmail.com=rjwysocki@srs-us1.protection.inumbo.net>)
 id 1efzhb-0004ye-Is
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2018 03:01:47 +0000
Received: by mail-ot0-x242.google.com with SMTP id x15so5232978ote.1
 for <xen-devel@lists.xenproject.org>; Sun, 28 Jan 2018 19:01:46 -0800 (PST)
In-Reply-To: <CAHp75VdgdQXH-d9+Fo1DwGdfV1pB0jADMmwAK1BU7oN6dgQs8Q@mail.gmail.com>
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

T24gRnJpLCBKYW4gMjYsIDIwMTggYXQgNzowOCBQTSwgQW5keSBTaGV2Y2hlbmtvCjxhbmR5LnNo
ZXZjaGVua29AZ21haWwuY29tPiB3cm90ZToKPiBPbiBUaHUsIEphbiAyNSwgMjAxOCBhdCA0OjM2
IFBNLCBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBBZGQgYSBmdW5j
dGlvbiB0byBnZXQgdGhlIGFkZHJlc3Mgb2YgdGhlIFJTRFAgdGFibGUuIFBlciBkZWZhdWx0IHVz
ZSBhCj4+IF9fd2VhayBhbm5vdGF0ZWQgZnVuY3Rpb24gYmVpbmcgYSBub3AuCj4KPiBUaGUgcHJv
YmxlbSB3aXRoIHdlYWsgZnVuY3Rpb25zIHRoYXQgd2UgY2FuJ3QgaGF2ZSBtb3JlIHRoYW4gb25l
Cj4gaW1wbGVtZW50YXRpb24gcGVyIGtlcm5lbCB3aGlsZSB3ZSB3b3VsZCBsaWtlIHRvIGJ1aWx0
IHNldmVyYWwgY29kZQo+IHBhdGhzLgo+Cj4gSSBoYXZlIHN0dW1ibGVkIG9uIHRoZSBzaW1pbGFy
IHN0dWZmIGFuZCByZWFsaXplIHRoYXQuCj4KPiBQZXJoYXBzLCBvbmUgb2YgdGhlIHNvbHV0aW9u
IGlzIHRvIGhhdmUgYW4gYWRkaXRpb25hbCBzdHJ1Y3QgdW5kZXIKPiB4ODZfaW5pdCB0byBhbHRl
cm5hdGUgQUNQSSByZWxhdGVkIHN0dWZmLgoKSSdtIG5vdCBzdXJlIGlmIHRoYXQgcmVhbGx5IGlz
IGEgcHJvYmxlbSBpbiB0aGlzIHBhcnRpY3VsYXIgY2FzZS4KCldoeSB3b3VsZCB5b3Ugd2FudCB0
byB1c2UgZGlmZmVyZW50IFJTRFAgcmV0cmlldmFsIGZ1bmN0aW9ucyBmb3Igb25lIGFyY2g/CgpU
aGFua3MsClJhZmFlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
