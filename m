From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] [v2] xen: hypercall: fix out-of-bounds
	memcpy
Date: Fri, 9 Feb 2018 13:57:44 +0100
Message-ID: <CAK8P3a36O-NbrKkt-DEEZE2A2JQ5Gu9GZ98j0BjoFET4kgTaWw__26957.1121353239$1518181009$gmane$org@mail.gmail.com>
References: <20180205150340.328921-1-arnd@arndb.de>
 <67d8f0f1-0846-876d-d36a-c8a9f9366243@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jy2v=fd=gmail.com=arndbergmann@srs-us1.protection.inumbo.net>)
 id 1ek8FP-0006an-Jq
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 12:57:47 +0000
Received: by mail-ot0-x243.google.com with SMTP id a2so7655096otf.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2018 04:57:46 -0800 (PST)
In-Reply-To: <67d8f0f1-0846-876d-d36a-c8a9f9366243@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Kees Cook <keescook@chromium.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Laight <David.Laight@aculab.com>, David Woodhouse <dwmw@amazon.co.uk>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Dan Williams <dan.j.williams@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgNSwgMjAxOCBhdCA0OjE0IFBNLCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPiBPbiAwNS8wMi8xOCAxNTowMywgQXJuZCBCZXJnbWFu
biB3cm90ZToKPgo+IFNuaXBwaW5nIGRlbGV0ZWQgY29kZSB0byBtYWtlIHRoaW5ncyBjbGVhcmVy
Ogo+Cj4+ICsgICAgIGlmIChjbWQgPiBBUlJBWV9TSVpFKHBoeXNkZXZvcF9sZW4pKQo+PiArICAg
ICAgICAgICAgIHJldHVybiAtRU5PU1lTOwo+Pgo+PiArICAgICBsZW4gPSBwaHlzZGV2b3BfbGVu
W2NtZF07Cj4+ICsgICAgIG1lbWNweSgmb3AudSwgYXJnLCBsZW4pOwo+Cj4gWW91J2xsIHdhbnQg
YW4gYXJyYXlfbm9zcGVjKCkgb3Igd2hhdGV2ZXIgaXRzIGNhbGxlZCB0aGVzZSBkYXlzLiAgVGhp
cwo+IGNvZGUgaXMgU1AxLWxlYWt5LgoKTWF5YmUgdGhlIGJlc3Qgc29sdXRpb24gd291bGQgYmUg
dG8gcmVtb3ZlIHRoZSBmaWxlIGNvbXBsZXRlbHkuIEZyb20KbG9va2luZyBhdCB0aGUgWGVuIGdp
dCBoaXN0b3J5LCB3ZSBvbmx5IG5lZWQgdGhpcyB0byBydW4gb24gWGVuIDMuMC4yCm9yIGVhcmxp
ZXIsIHRob3NlIGVhcmx5IFhlbiByZWxlYXNlcyAoYWNjb3JkaW5nIHRvIFdpa2lwZWRpYSkgbmV2
ZXIKZXZlbiBzdXBwb3J0ZWQgcnVubmluZyBtb2Rlcm4ga2VybmVsIHZlcnNpb25zIGFueXdheSwg
c28gdGhlIGNvZGUKYXBwZWFycyB0byBiZSBjb21wbGV0ZWx5IHBvaW50bGVzcyBoZXJlLgoKSG93
ZXZlciwgYXNpZGUgZnJvbSB0aGlzIGRyaXZlciwgSSB3b25kZXIgaWYgd2Ugc2hvdWxkIGJlIHdv
cnJpZWQgYWJvdXQKU3BlY3RyZSB0eXBlIDEgYXR0YWNrcyBvbiBzaW1pbGFyIGNvZGUsIHdoZW4g
Z2NjLTggdHVybnMgYSBzd2l0Y2gvY2FzZQpzdGF0ZW1lbnQgaW50byBhbiBhcnJheSBsb29rdXAg
YmVoaW5kIG91ciBiYWNrLCBlLmcuIGluIGFuIGlvY3RsIGhhbmRsZXIuCkhhcyBhbnlib2R5IGdv
dCB0aGlzIG9uIHRoZWlyIHJhZGFyPwoKICAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
