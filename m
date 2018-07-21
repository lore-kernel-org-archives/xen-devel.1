From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 1/2] x86/entry/64: Do not clear %rbx under
 Xen
Date: Sat, 21 Jul 2018 16:30:04 -0700
Message-ID: <CALCETrXsNxYP7-w-OoiNdJWspTKCsr0i01e6NiwFk1O5jL6grA__19369.6377137259$1532215758$gmane$org@mail.gmail.com>
References: <20180721194909.23903-1-m.v.b@runbox.com>
 <CALCETrX435cC7Hi2aTLVrBecZEEeJ3_TgQnTwbObNrt9MKvFzg@mail.gmail.com>
 <b9ad156c-45e9-da80-9cf0-eabbe5a1bbf2@runbox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=j5gm=kf=kernel.org=luto@srs-us1.protection.inumbo.net>)
 id 1fh1KW-0005Mr-5R
 for xen-devel@lists.xenproject.org; Sat, 21 Jul 2018 23:30:28 +0000
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 60D0D20881
 for <xen-devel@lists.xenproject.org>; Sat, 21 Jul 2018 23:30:26 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id e7-v6so14412756wrs.9
 for <xen-devel@lists.xenproject.org>; Sat, 21 Jul 2018 16:30:26 -0700 (PDT)
In-Reply-To: <b9ad156c-45e9-da80-9cf0-eabbe5a1bbf2@runbox.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "M. Vefa Bicakci" <m.v.b@runbox.com>
Cc: Juergen Gross <jgross@suse.com>, Andi Kleen <ak@linux.intel.com>, X86 ML <x86@kernel.org>, Dan Williams <dan.j.williams@intel.com>, LKML <linux-kernel@vger.kernel.org>, Dominik Brodowski <linux@dominikbrodowski.net>, Ingo Molnar <mingo@redhat.com>, stable <stable@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBKdWwgMjEsIDIwMTggYXQgNDoxOSBQTSwgTS4gVmVmYSBCaWNha2NpIDxtLnYuYkBy
dW5ib3guY29tPiB3cm90ZToKPiBPbiAwNy8yMS8yMDE4IDA1OjQ1IFBNLCBBbmR5IEx1dG9taXJz
a2kgd3JvdGU6Cj4+Cj4+IE9uIFNhdCwgSnVsIDIxLCAyMDE4IGF0IDEyOjQ5IFBNLCBNLiBWZWZh
IEJpY2FrY2kgPG0udi5iQHJ1bmJveC5jb20+Cj4+IHdyb3RlOgo+Pj4KPj4+IENvbW1pdCAzYWM2
ZDhjNzg3YjggKCJ4ODYvZW50cnkvNjQ6IENsZWFyIHJlZ2lzdGVycyBmb3IKPj4+IGV4Y2VwdGlv
bnMvaW50ZXJydXB0cywgdG8gcmVkdWNlIHNwZWN1bGF0aW9uIGF0dGFjayBzdXJmYWNlIikKPj4+
IHVuaW50ZW5kZWRseQo+Pj4gYnJva2UgWGVuIFBWIHZpcnR1YWwgbWFjaGluZXMgYnkgY2xlYXJp
bmcgdGhlICVyYnggcmVnaXN0ZXIgYXQgdGhlIGVuZCBvZgo+Pj4geGVuX2ZhaWxzYWZlX2NhbGxi
YWNrIGJlZm9yZSB0aGUgbGF0dGVyIGp1bXBzIHRvIGVycm9yX2V4aXQuCj4+PiBlcnJvcl9leGl0
IGV4cGVjdHMgdGhlICVyYnggcmVnaXN0ZXIgdG8gYmUgYSBmbGFnIGluZGljYXRpbmcgd2hldGhl
cgo+Pj4gdGhlcmUgc2hvdWxkIGJlIGEgcmV0dXJuIHRvIGtlcm5lbCBtb2RlLgo+Pj4KPj4+IFRo
aXMgY29tbWl0IG1ha2VzIHN1cmUgdGhhdCB0aGUgJXJieCByZWdpc3RlciBpcyBub3QgY2xlYXJl
ZCBieQo+Pj4gdGhlIFBVU0hfQU5EX0NMRUFSX1JFR1MgbWFjcm8sIHdoZW4gdGhlIG1hY3JvIGlu
IHF1ZXN0aW9uIGlzIGluc3RhbnRpYXRlZAo+Pj4gYnkgeGVuX2ZhaWxzYWZlX2NhbGxiYWNrLCB0
byBhdm9pZCB0aGUgaXNzdWUuCj4+Cj4+Cj4+IFNlZW1zIGxpa2UgYSBnZW51aW5lIHByb2JsZW0s
IGJ1dDoKPj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9lbnRyeS9lbnRyeV82NC5TIGIvYXJj
aC94ODYvZW50cnkvZW50cnlfNjQuUwo+Pj4gaW5kZXggYzc0NDlmMzc3YTc3Li45NmU4ZmYzNDEy
OWUgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3g4Ni9lbnRyeS9lbnRyeV82NC5TCj4+PiArKysgYi9h
cmNoL3g4Ni9lbnRyeS9lbnRyeV82NC5TCj4+PiBAQCAtMTEyOSw3ICsxMTI5LDcgQEAgRU5UUlko
eGVuX2ZhaWxzYWZlX2NhbGxiYWNrKQo+Pj4gICAgICAgICAgYWRkcSAgICAkMHgzMCwgJXJzcAo+
Pj4gICAgICAgICAgVU5XSU5EX0hJTlRfSVJFVF9SRUdTCj4+PiAgICAgICAgICBwdXNocSAgICQt
MSAvKiBvcmlnX2F4ID0gLTEgPT4gbm90IGEgc3lzdGVtIGNhbGwgKi8KPj4+IC0gICAgICAgUFVT
SF9BTkRfQ0xFQVJfUkVHUwo+Pj4gKyAgICAgICBQVVNIX0FORF9DTEVBUl9SRUdTIGNsZWFyX3Ji
eD0wCj4+PiAgICAgICAgICBFTkNPREVfRlJBTUVfUE9JTlRFUgo+Pj4gICAgICAgICAgam1wICAg
ICBlcnJvcl9leGl0Cj4+Cj4+Cj4+IFRoZSBvbGQgY29kZSBmaXJzdCBzZXQgUkJYIHRvIHplcm8g
dGhlbiwgaWYgZnJhbWUgcG9pbnRlcnMgYXJlIG9uLAo+PiBzZXRzIGl0IHRvIHNvbWUgc3BlY2lh
bCBub24temVybyB2YWx1ZSwgdGhlbiBjcm9zc2VzIGl0cyBmaW5nZXJzIGFuZAo+PiBob3BlcyBm
b3IgdGhlIGJlc3QuICBZb3VyIHBhdGNoZWQgY29kZSBqdXN0IHNraXBzIHRoZSB6ZXJvaW5nIHBh
cnQsIHNvCj4+IFJCWCBlaXRoZXIgY29udGFpbnMgdGhlIEVOQ09ERV9GUkFNRV9QT0lOVEVSIHJl
c3VsdCBvciBpcwo+PiB1bmluaXRpYWxpemVkLgo+Pgo+PiBIb3cgYWJvdXQgYWN0dWFsbHkgaW5p
dGlhbGl6aW5nIHJieCB0byBzb21ldGhpbmcgc2Vuc2libGUgbGlrZSwgc2F5LCAxPwo+Cj4KPiBI
ZWxsbyBBbmR5LAo+Cj4gVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3ISBBcHBhcmVudGx5LCBJIGhh
dmUgbm90IGRvbmUgbXkgaG9tZXdvcmsgZnVsbHkuCj4gSSB3aWxsIHRlc3QgeW91ciBzdWdnZXN0
aW9uIGFuZCByZXBvcnQgYmFjaywgbW9zdCBsaWtlbHkgaW4gYSBmZXcgaG91cnMuCj4KPiBJIGhh
dmUgYmVlbiB0ZXN0aW5nIHdpdGggdGhlIG5leHQvbGludXgtbmV4dCB0cmVlJ3MgbWFzdGVyIGJy
YW5jaAo+IChkYXRlZCAyMDE4MDcyMCksIGFuZCBJIG5vdGljZWQgdGhhdCBFTkNPREVfRlJBTUVf
UE9JTlRFUiBjaGFuZ2VzIHRoZQo+IGZyYW1lIHBvaW50ZXIgKGkuZS4sIFJCUCkgcmVnaXN0ZXIs
IGFzIG9wcG9zZWQgdG8gdGhlIFJCWCByZWdpc3RlciwKPiB3aGljaCB0aGUgcGF0Y2ggYWltcyB0
byBhdm9pZCBjaGFuZ2luZyBiZWZvcmUganVtcGluZyB0byBlcnJvcl9leGl0Lgo+IEl0IGlzIHBv
c3NpYmxlIHRoYXQgSSBhbSBtaXNzaW5nIHNvbWV0aGluZyB0aG91Z2ggLS0gSSBhbSBub3Qgc3Vy
ZSBhYm91dAo+IHRoZSBjb25uZWN0aW9uIGJldHdlZW4gdGhlIFJCUCBhbmQgUkJYIHJlZ2lzdGVy
cy4KClNvcnJ5LCBicmFpbiBmYXJ0IG9uIG15IHBhcnQuCgo+Cj4gVGhlIGNoYW5nZSBpbnRyb2R1
Y2VkIGJ5IGNvbW1pdCAzYWM2ZDhjNzg3YjggaXMgaW4gdGhlIGV4Y2VycHQgYmVsb3cuIFdvdWxk
Cj4gaXQKPiBiZSB2YWxpZCB0byBzdGF0ZSB0aGF0IHRoZSBvcmlnaW5hbCBjb2RlIGhhZCB0aGUg
c2FtZSBpc3N1ZSB0aGF0IHlvdQo+IHJlZmVycmVkCj4gdG8gKGkuZS4sIGxlYXZpbmcgdGhlIFJC
WCByZWdpc3RlciB1bmluaXRpYWxpemVkKT8KClByZXN1bWFibHkuCgpJIHdvdWxkIHByb3Bvc2Ug
YSByYXRoZXIgZGlmZmVyZW50IGZpeDoKCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L2x1dG8vbGludXguZ2l0L2NvbW1pdC8/aD14ODYvcHRpJmlkPWJiM2Q3
NmI1MGMzYmM3OGI2N2Q3OWNmOTBkMzI4ZjM4YTQzNWM3OTMKCkFueSBjaGFuY2UgeW91IGNvdWxk
IHRlc3QgdGhhdCBhbmQgc2VlIGlmIGl0IGZpeGVzIHlvdXIgcHJvYmxlbT8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
