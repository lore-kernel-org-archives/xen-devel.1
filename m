From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 1/2] x86/acpi: add retrieval function for
	rsdp address
Date: Fri, 2 Feb 2018 13:02:04 +0100
Message-ID: <CAJZ5v0jSUK7adqNuHRp4VYR2Nb2+Av0dqs-kL1AsEgWk3062eg__25173.3139776208$1517572872$gmane$org@mail.gmail.com>
References: <20180125143639.9969-1-jgross@suse.com>
 <20180125143639.9969-2-jgross@suse.com>
 <CAHp75VdgdQXH-d9+Fo1DwGdfV1pB0jADMmwAK1BU7oN6dgQs8Q@mail.gmail.com>
 <a33e605a-73d7-83b7-4472-14f66b6738be@suse.com>
 <CAHp75VdUO2Rq7geYD9xxY3nnzGAhO46+w+rQx44=MgJ6obRcEA@mail.gmail.com>
 <CAJZ5v0gr7Jd-1dOD_DTRQDCX7ON68O1KJ9ioAJAnwBYm2cEdZg@mail.gmail.com>
 <CAHp75Vf7SRNGeU_To9WNmzECxaKjDbYeFspnJiwCGAhAwOTRyA@mail.gmail.com>
 <CAJZ5v0g3Ti4W8Z-ePVCO0RFs3qviJxhrh1___i6oiZKRsYzBng@mail.gmail.com>
 <CAHp75Ved4nO7ktQ=1O5oRx4mNyWcA6YN9fATgMGW1OR0UxCd4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vifl=e4=gmail.com=rjwysocki@srs-us1.protection.inumbo.net>)
 id 1eha2h-0006Cd-Ht
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2018 12:02:07 +0000
Received: by mail-ot0-x242.google.com with SMTP id x4so20035668otg.7
 for <xen-devel@lists.xenproject.org>; Fri, 02 Feb 2018 04:02:05 -0800 (PST)
In-Reply-To: <CAHp75Ved4nO7ktQ=1O5oRx4mNyWcA6YN9fATgMGW1OR0UxCd4g@mail.gmail.com>
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

T24gVGh1LCBGZWIgMSwgMjAxOCBhdCA0OjQ1IFBNLCBBbmR5IFNoZXZjaGVua28KPGFuZHkuc2hl
dmNoZW5rb0BnbWFpbC5jb20+IHdyb3RlOgo+IE9uIFRodSwgRmViIDEsIDIwMTggYXQgOTo1NyBB
TSwgUmFmYWVsIEouIFd5c29ja2kgPHJhZmFlbEBrZXJuZWwub3JnPiB3cm90ZToKPj4gT24gV2Vk
LCBKYW4gMzEsIDIwMTggYXQgNDo0MyBQTSwgQW5keSBTaGV2Y2hlbmtvCj4+IDxhbmR5LnNoZXZj
aGVua29AZ21haWwuY29tPiB3cm90ZToKPj4+IE9uIE1vbiwgSmFuIDI5LCAyMDE4IGF0IDU6MDIg
QU0sIFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWxAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pj4gT24g
U3VuLCBKYW4gMjgsIDIwMTggYXQgNDowNCBQTSwgQW5keSBTaGV2Y2hlbmtvCj4+Pj4gPGFuZHku
c2hldmNoZW5rb0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4+PiBJbnN0ZWFkIG9mIGRlY2xhcmluZyBm
dW5jdGlvbiBhcyBfX3dlYWssIGVzdGFibGlzaCBhIG5ldyBzdHJ1Y3QgZm9yCj4+PiBBQ1BJIHJl
bGF0ZWQgc3R1YnMgYW5kIGluY29ycG9yYXRlIGl0IGludG8geDg2X2luaXQuCj4+Pgo+Pj4gVGhh
dCBpcyBteSBwcm9wb3NhbC4gSSB0aGluayBJIHdvdWxkIGdvIHRoaXMgd2F5IGluIG15IGNhc2Ug
d2hlcmUgSQo+Pj4gbmVlZCB0byB0cmVhdCBkaWZmZXJlbnRseSBBQ1BJIEhXIHJlZHVjZWQgaW5p
dGlhbGl6YXRpb24gb2YgbGVnYWN5Cj4+PiBkZXZpY2VzLgo+Pgo+PiBJT1cgeW91J2QgbGlrZSB0
byBoYXZlIGEgc2V0IG9mIEFDUEkgaW5pdCBjYWxsYmFja3MgdGhhdCBjb3VsZCBiZQo+PiBkZWZp
bmVkIGJ5IGFuIGFyY2gsIHJpZ2h0Pwo+Cj4gQ29ycmVjdCEKCk9LCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
