From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 1/2] x86/acpi: add retrieval function for
	rsdp address
Date: Thu, 1 Feb 2018 08:57:49 +0100
Message-ID: <CAJZ5v0g3Ti4W8Z-ePVCO0RFs3qviJxhrh1___i6oiZKRsYzBng__34159.5746846453$1517471822$gmane$org@mail.gmail.com>
References: <20180125143639.9969-1-jgross@suse.com>
 <20180125143639.9969-2-jgross@suse.com>
 <CAHp75VdgdQXH-d9+Fo1DwGdfV1pB0jADMmwAK1BU7oN6dgQs8Q@mail.gmail.com>
 <a33e605a-73d7-83b7-4472-14f66b6738be@suse.com>
 <CAHp75VdUO2Rq7geYD9xxY3nnzGAhO46+w+rQx44=MgJ6obRcEA@mail.gmail.com>
 <CAJZ5v0gr7Jd-1dOD_DTRQDCX7ON68O1KJ9ioAJAnwBYm2cEdZg@mail.gmail.com>
 <CAHp75Vf7SRNGeU_To9WNmzECxaKjDbYeFspnJiwCGAhAwOTRyA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=dyzw=e3=gmail.com=rjwysocki@srs-us1.protection.inumbo.net>)
 id 1eh9kl-0005w5-Py
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2018 07:57:51 +0000
Received: by mail-ot0-x242.google.com with SMTP id l5so9927301otj.11
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2018 23:57:50 -0800 (PST)
In-Reply-To: <CAHp75Vf7SRNGeU_To9WNmzECxaKjDbYeFspnJiwCGAhAwOTRyA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, "Rafael J. Wysocki" <rafael@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stable <stable@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Len Brown <lenb@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMzEsIDIwMTggYXQgNDo0MyBQTSwgQW5keSBTaGV2Y2hlbmtvCjxhbmR5LnNo
ZXZjaGVua29AZ21haWwuY29tPiB3cm90ZToKPiBPbiBNb24sIEphbiAyOSwgMjAxOCBhdCA1OjAy
IEFNLCBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiBPbiBT
dW4sIEphbiAyOCwgMjAxOCBhdCA0OjA0IFBNLCBBbmR5IFNoZXZjaGVua28KPj4gPGFuZHkuc2hl
dmNoZW5rb0BnbWFpbC5jb20+IHdyb3RlOgo+Pj4gT24gRnJpLCBKYW4gMjYsIDIwMTggYXQgODoy
MSBQTSwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+PiBPbiAyNi8w
MS8xOCAxOTowOCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+Pj4+PiBPbiBUaHUsIEphbiAyNSwg
MjAxOCBhdCA0OjM2IFBNLCBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+
Cj4+Pj4+IFRoZSBwcm9ibGVtIHdpdGggd2VhayBmdW5jdGlvbnMgdGhhdCB3ZSBjYW4ndCBoYXZl
IG1vcmUgdGhhbiBvbmUKPj4+Pj4gaW1wbGVtZW50YXRpb24gcGVyIGtlcm5lbCB3aGlsZSB3ZSB3
b3VsZCBsaWtlIHRvIGJ1aWx0IHNldmVyYWwgY29kZQo+Pj4+PiBwYXRocy4KPj4+Pj4KPj4+Pj4g
SSBoYXZlIHN0dW1ibGVkIG9uIHRoZSBzaW1pbGFyIHN0dWZmIGFuZCByZWFsaXplIHRoYXQuCj4+
Pj4+Cj4+Pj4+IFBlcmhhcHMsIG9uZSBvZiB0aGUgc29sdXRpb24gaXMgdG8gaGF2ZSBhbiBhZGRp
dGlvbmFsIHN0cnVjdCB1bmRlcgo+Pj4+PiB4ODZfaW5pdCB0byBhbHRlcm5hdGUgQUNQSSByZWxh
dGVkIHN0dWZmLgo+Pj4+Cj4+Pj4gSSB0aGluayB3ZSBjYW4gZ28gdGhhdCByb3V0ZSB3aGVuIGFu
b3RoZXIgdXNlciBvZiB0aGF0IGludGVyZmFjZSBpcwo+Pj4+IGFwcGVhcmluZy4KPj4+Cj4+PiBX
aHkgbm90IHRvIGVzdGFibGlzaCB0aGUgc3RydWN0PyBBdCBsZWFzdCB0aGlzIHJvdXRlIEkgd291
bGQgbGlrZSB0bwo+Pj4gZ28gd2l0aCBbMV0uCj4+Pgo+Pj4gWzFdOiBodHRwczovL2xrbWwub3Jn
L2xrbWwvMjAxOC8xLzE3LzgzNAo+Pgo+PiBNYXliZSBJJ20gYSBiaXQgc2xvdyB0b2RheSwgYnV0
IGNhcmUgdG8gZXhwbGFpbiB3aGF0IGV4YWN0bHkgeW91IG1lYW4/Cj4KPiBJbnN0ZWFkIG9mIGRl
Y2xhcmluZyBmdW5jdGlvbiBhcyBfX3dlYWssIGVzdGFibGlzaCBhIG5ldyBzdHJ1Y3QgZm9yCj4g
QUNQSSByZWxhdGVkIHN0dWJzIGFuZCBpbmNvcnBvcmF0ZSBpdCBpbnRvIHg4Nl9pbml0Lgo+Cj4g
VGhhdCBpcyBteSBwcm9wb3NhbC4gSSB0aGluayBJIHdvdWxkIGdvIHRoaXMgd2F5IGluIG15IGNh
c2Ugd2hlcmUgSQo+IG5lZWQgdG8gdHJlYXQgZGlmZmVyZW50bHkgQUNQSSBIVyByZWR1Y2VkIGlu
aXRpYWxpemF0aW9uIG9mIGxlZ2FjeQo+IGRldmljZXMuCgpJT1cgeW91J2QgbGlrZSB0byBoYXZl
IGEgc2V0IG9mIEFDUEkgaW5pdCBjYWxsYmFja3MgdGhhdCBjb3VsZCBiZQpkZWZpbmVkIGJ5IGFu
IGFyY2gsIHJpZ2h0PwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
