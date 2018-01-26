From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/2] x86/acpi: add retrieval function for
	rsdp address
Date: Fri, 26 Jan 2018 20:08:24 +0200
Message-ID: <CAHp75VdgdQXH-d9+Fo1DwGdfV1pB0jADMmwAK1BU7oN6dgQs8Q__29133.1519176767$1516990043$gmane$org@mail.gmail.com>
References: <20180125143639.9969-1-jgross@suse.com>
 <20180125143639.9969-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=b1x3=ev=gmail.com=andy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1ef8QN-0007En-1Y
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2018 18:08:27 +0000
Received: by mail-qt0-x244.google.com with SMTP id d8so3452998qtm.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2018 10:08:25 -0800 (PST)
In-Reply-To: <20180125143639.9969-2-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Len Brown <lenb@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMjUsIDIwMTggYXQgNDozNiBQTSwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPiB3cm90ZToKPiBBZGQgYSBmdW5jdGlvbiB0byBnZXQgdGhlIGFkZHJlc3Mgb2YgdGhl
IFJTRFAgdGFibGUuIFBlciBkZWZhdWx0IHVzZSBhCj4gX193ZWFrIGFubm90YXRlZCBmdW5jdGlv
biBiZWluZyBhIG5vcC4KClRoZSBwcm9ibGVtIHdpdGggd2VhayBmdW5jdGlvbnMgdGhhdCB3ZSBj
YW4ndCBoYXZlIG1vcmUgdGhhbiBvbmUKaW1wbGVtZW50YXRpb24gcGVyIGtlcm5lbCB3aGlsZSB3
ZSB3b3VsZCBsaWtlIHRvIGJ1aWx0IHNldmVyYWwgY29kZQpwYXRocy4KCkkgaGF2ZSBzdHVtYmxl
ZCBvbiB0aGUgc2ltaWxhciBzdHVmZiBhbmQgcmVhbGl6ZSB0aGF0LgoKUGVyaGFwcywgb25lIG9m
IHRoZSBzb2x1dGlvbiBpcyB0byBoYXZlIGFuIGFkZGl0aW9uYWwgc3RydWN0IHVuZGVyCng4Nl9p
bml0IHRvIGFsdGVybmF0ZSBBQ1BJIHJlbGF0ZWQgc3R1ZmYuCgotLSAKV2l0aCBCZXN0IFJlZ2Fy
ZHMsCkFuZHkgU2hldmNoZW5rbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
