From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] xen: make xen_qlock_wait() nestable
Date: Wed, 10 Oct 2018 15:38:11 +0200
Message-ID: <35f0d72b-c4b9-3557-6348-25a8646c6995__539.713426451449$1539178627$gmane$org@suse.com>
References: <20181001071641.19282-1-jgross@suse.com>
 <20181001071641.19282-3-jgross@suse.com>
 <47686a61dfc06aa5afb05a893b9a56e6eb46763d.camel@infradead.org>
 <alpine.DEB.2.21.1810101426080.10278@nanos.tec.linutronix.de>
 <eb9250d00cf9095913a7ecc3a2c575b9ed40fd6f.camel@infradead.org>
 <alpine.DEB.2.21.1810101445530.10278@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mkav=mw=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gAEgp-0002OE-NK
 for xen-devel@lists.xenproject.org; Wed, 10 Oct 2018 13:38:15 +0000
In-Reply-To: <alpine.DEB.2.21.1810101445530.10278@nanos.tec.linutronix.de>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
Cc: Waiman.Long@hp.com, peterz@infradead.org, x86@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMTAvMjAxOCAxNDo0NywgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+IE9uIFdlZCwgMTAg
T2N0IDIwMTgsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPj4gT24gV2VkLCAyMDE4LTEwLTEwIGF0
IDE0OjMwICswMjAwLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4+PiBPbiBXZWQsIDEwIE9jdCAy
MDE4LCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cj4+Pgo+Pj4+IE9uIE1vbiwgMjAxOC0xMC0wMSBh
dCAwOToxNiArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4gLSAgICAgICAvKiBJZiBp
cnEgcGVuZGluZyBhbHJlYWR5IGNsZWFyIGl0IGFuZCByZXR1cm4uICovCj4+Pj4+ICsgICAgICAg
LyogR3VhcmQgYWdhaW5zdCByZWVudHJ5LiAqLwo+Pj4+PiArICAgICAgIGxvY2FsX2lycV9zYXZl
KGZsYWdzKTsKPj4+Pj4gKwo+Pj4+PiArICAgICAgIC8qIElmIGlycSBwZW5kaW5nIGFscmVhZHkg
Y2xlYXIgaXQuICovCj4+Pj4+ICAgICAgICAgaWYgKHhlbl90ZXN0X2lycV9wZW5kaW5nKGlycSkp
IHsKPj4+Pj4gICAgICAgICAgICAgICAgIHhlbl9jbGVhcl9pcnFfcGVuZGluZyhpcnEpOwo+Pj4+
PiAtICAgICAgICAgICAgICAgcmV0dXJuOwo+Pj4+PiArICAgICAgIH0gZWxzZSBpZiAoUkVBRF9P
TkNFKCpieXRlKSA9PSB2YWwpIHsKPj4+Pj4gKyAgICAgICAgICAgICAgIC8qIEJsb2NrIHVudGls
IGlycSBiZWNvbWVzIHBlbmRpbmcgKG9yIGEgc3B1cmlvdXMgd2FrZXVwKSAqLwo+Pj4+PiArICAg
ICAgICAgICAgICAgeGVuX3BvbGxfaXJxKGlycSk7Cj4+Pj4+ICAgICAgICAgfQo+Pj4+Cj4+Pj4K
Pj4+PiBEb2VzIHRoaXMgc3RpbGwgYWxsb3cgb3RoZXIgSVJRcyB0byB3YWtlIGl0IGZyb20geGVu
X3BvbGxfaXJxKCk/Cj4+Pj4KPj4+PiBJbiB0aGUgY2FzZSB3aGVyZSBwcm9jZXNzLWNvbnRleHQg
Y29kZSBpcyBzcGlubmluZyBmb3IgYSBsb2NrIHdpdGhvdXQKPj4+PiBkaXNhYmxpbmcgaW50ZXJy
dXB0cywgd2UgKnNob3VsZCogYWxsb3cgaW50ZXJydXB0cyB0byBvY2N1ciBzdGlsbC4uLgo+Pj4+
IGRvZXMgdGhpcz8KPj4+Cj4+PiBZZXMuIExvb2sgYXQgaXQgbGlrZSBpZGxlIEhMVCBvciBXRkku
IFlvdSBoYXZlIHRvIGRpc2FibGUgaW50ZXJydXB0IGJlZm9yZQo+Pj4gY2hlY2tpbmcgdGhlIGNv
bmRpdGlvbiBhbmQgdGhlbiB0aGUgaGFyZHdhcmUgb3IgaW4gdGhpcyBjYXNlIHRoZSBoeXBlcnZp
c29yCj4+PiBoYXMgdG8gYnJpbmcgeW91IGJhY2sgd2hlbiBhbiBpbnRlcnJ1cHQgaXMgcmFpc2Vk
Lgo+Pj4KPj4+IElmIHRoYXQgd291bGQgbm90IHdvcmsgdGhlbiB0aGUgY2hlY2sgd291bGQgYmUg
cmFjeSwgYmVjYXVzZSB0aGUgaW50ZXJydXB0Cj4+PiBjb3VsZCBoaXQgYW5kIGJlIGhhbmRsZWQg
YWZ0ZXIgdGhlIGNoZWNrIGFuZCBiZWZvcmUgZ29pbmcgaW50bwo+Pj4gSExUL1dGSS9oeXBlcmNh
bGwgYW5kIHRoZW4gdGhlIHRoaW5nIGlzIG91dCB1bnRpbCB0aGUgbmV4dCBpbnRlcnJ1cHQgY29t
ZXMKPj4+IGFsb25nLCB3aGljaCBtaWdodCBiZSBuZXZlci4KPj4KPj4gUmlnaHQsIGJ1dCBpbiB0
aGlzIGNhc2Ugd2UncmUgY2FsbGluZyBpbnRvIHRoZSBoeXBlcnZpc29yIHRvIHBvbGwgZm9yCj4+
IG9uZSAqc3BlY2lmaWMqIElSUS4gRXZlcnl0aGluZyB5b3Ugc2F5IGlzIHRydWUgZm9yIHRoYXQg
c3BlY2lmaWMgSVJRLgo+Pgo+PiBNeSBxdWVzdGlvbiBpcyB3aGF0IGhhcHBlbnMgdG8gKm90aGVy
KiBJUlFzLiBXZSB3YW50IHRoZW0sIGJ1dCBhcmUgdGhleQo+PiBtYXNrZWQ/IEknbSBzdGFyaW5n
IGF0IHRoZSBYZW4gZG9fcG9sbCgpIGNvZGUgYW5kIGhhdmVuJ3QgcXVpdGUgd29ya2VkCj4+IHRo
YXQgb3V0Li4uCj4gCj4gQWgsIHNvcnJ5LiBUaGF0IG9mIGNvdXJzZSBoYXMgdG8gY29tZSBiYWNr
IGxpa2UgSExUL1dGSSBmb3IgYW55IGludGVycnVwdCwKPiBidXQgSSBoYXZlIG5vIGlkZWEgd2hh
dCB0aGUgWGVuIEhWIGlzIGRvaW5nIHRoZXJlLgoKVGhlIFhlbiBIViBpcyBkb2luZyBpdCByaWdo
dC4gSXQgaXMgYmxvY2tpbmcgdGhlIHZjcHUgaW4gZG9fcG9sbCgpIGFuZAphbnkgaW50ZXJydXB0
IHdpbGwgdW5ibG9jayBpdC4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
