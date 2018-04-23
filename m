From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH-for-4.11] xpti: fix bug in double fault
 handling
Date: Mon, 23 Apr 2018 14:22:49 +0200
Message-ID: <2f5c0a24-0973-ff01-dec9-08dc446c4e42@suse.com>
References: <20180423113702.11000-1-jgross@suse.com>
 <5ADDCD7802000078001BD8E4@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hhva=hm=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fAaUe-00049p-Tg
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 12:22:52 +0000
In-Reply-To: <5ADDCD7802000078001BD8E4@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDQvMTggMTQ6MTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIzLjA0LjE4IGF0
IDEzOjM3LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gV2hlbiBlbnRlcmluZyB0aGUgaHlw
ZXJ2aXNvciB2aWEgdGhlIGRvdWJsZSBmYXVsdCBoYW5kbGVyIHJlc2V0dGluZwo+PiB4ZW5fY3Iz
IHdhcyBtaXNzaW5nLiBUaGlzIGxlZCB0byBzd2l0Y2hpbmcgdG8gcHZfY3IzIHdoZW4gcmV0dXJu
aW5nCj4+IGZyb20gdGhlIG5leHQgZm9sbG93aW5nIGludGVycnVwdCwgZS5nLiBhZnRlciByZS1l
bmFibGluZyBpbnRlcnJ1cHRzCj4+IGluIG1hY2hpbmVfcmVzdGFydCgpLgo+IAo+IFBvaW50aW5n
IGF0IGJhZCBiZWhhdmlvciB0byBqdXN0aWZ5IGEgY2hhbmdlIGlzIG5vdCB2ZXJ5IGhlbHBmdWws
IEkgdGhpbmsuCj4gQW5kcmV3J3MgYXJndW1lbnQgb2YgZXhjZXB0aW9uIGhhbmRsaW5nIHdhbnRp
bmcgdG8gY29udGludWUgdG8gd29yawo+IGV2ZW4gYWZ0ZXIgYSAjREYgaXMgYSBiZXR0ZXIgb25l
IGltby4KCk9rYXkuCgo+IAo+PiAtLS0gYS90b29scy9maXJtd2FyZS94ZW4tZGlyL3NoaW0uY29u
ZmlnCj4+ICsrKyBiL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvc2hpbS5jb25maWcKPj4gQEAgLTEs
NiArMSw2IEBACj4+ICAjCj4+ICAjIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5P
VCBFRElULgo+PiAtIyBYZW4veDg2IDQuMTEtdW5zdGFibGUgQ29uZmlndXJhdGlvbgo+PiArIyBY
ZW4veDg2IDQuMTEtcmMgQ29uZmlndXJhdGlvbgo+PiAgIwo+PiAgQ09ORklHX1g4Nl82ND15Cj4+
ICBDT05GSUdfWDg2PXkKPiAKPiBTdHJheSBjaGFuZ2U/CgpPaCwgdGhhdCBvbmUgYWdhaW4uIFNv
cnJ5LiBNYXliZSB3ZSBzaG91bGQgcmVhbGx5IHRha2UgbXkgcmVsYXRlZApwYXRjaCB0byBhdm9p
ZCBpc3N1ZXMgbGlrZSB0aGlzIG9uZS4KCj4gCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQv
ZW50cnkuUwo+PiArKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L2VudHJ5LlMKPj4gQEAgLTc3Miw2
ICs3NzIsNyBAQCBFTlRSWShkb3VibGVfZmF1bHQpCj4+ICAgICAgICAgIGpucyAgIC5MZGJsZl9j
cjNfbG9hZAo+PiAgICAgICAgICBuZWcgICAlcmJ4Cj4+ICAuTGRibGZfY3IzX2xvYWQ6Cj4+ICsg
ICAgICAgIG1vdnEgJDAsIFNUQUNLX0NQVUlORk9fRklFTEQoeGVuX2NyMykoJXIxNCkKPj4gICAg
ICAgICAgbW92ICAgJXJieCwgJWNyMwo+PiAgLkxkYmxmX2NyM19va2F5Ogo+IAo+IEp1c3QgbGlr
ZSBmb3IgdGhlIG90aGVyIGNvZGUgcGF0aHMgdGhpcyB3cml0ZSBzaG91bGQgYmUgYWZ0ZXIgdGhl
IENSMyBsb2FkLAo+IG9yIGVsc2UgTk1JIG9yICNNQyBvY2N1cnJpbmcgYmV0d2VlbiB0aGUgdHdv
IHdvdWxkIGZhaWwgdG8gdXBkYXRlIENSMy4KCkFhaCwgcmlnaHQuCgpXaWxsIHNlbmQgVjIgc29v
bi4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
