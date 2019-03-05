From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] [RESEND] [v3] xen: remove pre-xen3 fallback
 handlers
Date: Tue, 5 Mar 2019 12:28:01 +0100
Message-ID: <2df3454e-930c-13a6-547b-fd5728e16ac0__22074.5545857184$1551785337$gmane$org@suse.com>
References: <20190304205300.2582076-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rV4c=RI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h18Ev-0006jl-7d
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 11:28:05 +0000
In-Reply-To: <20190304205300.2582076-1-arnd@arndb.de>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arnd Bergmann <arnd@arndb.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, Jan Beulich <JBeulich@suse.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDMvMjAxOSAyMTo1MiwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBUaGUgbGVnYWN5IGh5
cGVyY2FsbCBoYW5kbGVycyB3ZXJlIG9yaWdpbmFsbHkgYWRkZWQgd2l0aAo+IGEgY29tbWVudCBl
eHBsYWluaW5nIHRoYXQgImNvcHlpbmcgdGhlIGFyZ3VtZW50IHN0cnVjdHVyZXMgaW4KPiBIWVBF
UlZJU09SX2V2ZW50X2NoYW5uZWxfb3AoKSBhbmQgSFlQRVJWSVNPUl9waHlzZGV2X29wKCkgaW50
byB0aGUgbG9jYWwKPiB2YXJpYWJsZSBpcyBzdWZmaWNpZW50bHkgc2FmZSIgYW5kIG9ubHkgbWFk
ZSBzdXJlIHRvIG5vdCB3cml0ZQo+IHBhc3QgdGhlIGVuZCBvZiB0aGUgYXJndW1lbnQgc3RydWN0
dXJlLCB0aGUgY2hlY2tzIGluIGxpbnV4L3N0cmluZy5oCj4gZGlzYWdyZWUgd2l0aCB0aGF0LCB3
aGVuIGxpbmstdGltZSBvcHRpbWl6YXRpb25zIGFyZSB1c2VkOgo+IAo+IEluIGZ1bmN0aW9uICdt
ZW1jcHknLAo+ICAgICBpbmxpbmVkIGZyb20gJ3BpcnFfcXVlcnlfdW5tYXNrJyBhdCBkcml2ZXJz
L3hlbi9mYWxsYmFjay5jOjUzOjIsCj4gICAgIGlubGluZWQgZnJvbSAnX19zdGFydHVwX3BpcnEn
IGF0IGRyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jOjUyOToyLAo+ICAgICBpbmxpbmVk
IGZyb20gJ3Jlc3RvcmVfcGlycXMnIGF0IGRyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5j
OjE0Mzk6MywKPiAgICAgaW5saW5lZCBmcm9tICd4ZW5faXJxX3Jlc3VtZScgYXQgZHJpdmVycy94
ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmM6MTU4MToyOgo+IGluY2x1ZGUvbGludXgvc3RyaW5nLmg6
MzUwOjM6IGVycm9yOiBjYWxsIHRvICdfX3JlYWRfb3ZlcmZsb3cyJyBkZWNsYXJlZCB3aXRoIGF0
dHJpYnV0ZSBlcnJvcjogZGV0ZWN0ZWQgcmVhZCBiZXlvbmQgc2l6ZSBvZiBvYmplY3QgcGFzc2Vk
IGFzIDJuZCBwYXJhbWV0ZXIKPiAgICBfX3JlYWRfb3ZlcmZsb3cyKCk7Cj4gICAgXgo+IAo+IEZ1
cnRoZXIgcmVzZWFyY2ggdHVybmVkIG91dCB0aGF0IG9ubHkgWGVuIDMuMC4yIG9yIGVhcmxpZXIg
cmVxdWlyZWQgdGhlCj4gZmFsbGJhY2sgYXQgYWxsLCB3aGlsZSBhbGwgdmVyc2lvbnMgaW4gdXNl
IHRvZGF5IGRvbid0IG5lZWQgaXQuCj4gQXMgZmFyIGFzIEkgY2FuIHRlbGwsIGl0IGlzIG5vdCBl
dmVuIHBvc3NpYmxlIHRvIHJ1biBhIG1haW5saW5lIGtlcm5lbAo+IG9uIHRob3NlIG9sZCBYZW4g
cmVsZWFzZXMsIGF0IHRoZSB0aW1lIHdoZW4gdGhleSB3ZXJlIGluIHVzZSwgb25seQo+IGEgcGF0
Y2hlZCBrZXJuZWwgd2FzIHN1cHBvcnRlZCBhbnl3YXkuCj4gCj4gRml4ZXM6IGNmNDdhODNmYjA2
ZSAoInhlbi9oeXBlcmNhbGw6IGZpeCBoeXBlcmNhbGwgZmFsbGJhY2sgY29kZSBmb3IgdmVyeSBv
bGQgaHlwZXJ2aXNvcnMiKQo+IFJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9z
dHJvdnNreUBvcmFjbGUuY29tPgo+IENjOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KClB1c2hlZCB0
byB4ZW4vdGlwLmdpdCBmb3ItbGludXMtNS4xYQoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
