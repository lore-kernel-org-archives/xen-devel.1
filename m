From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] [v3] xen: remove pre-xen3 fallback handlers
Date: Thu, 15 Mar 2018 02:24:27 -0600
Message-ID: <5AAA3BCB02000078001B1F1B__44905.5859157399$1521102207$gmane$org@prv-mh.provo.novell.com>
References: <20180313210652.3484599-1-arnd@arndb.de>
 <7c25f7f5-1b54-695e-be5f-6d06d4e89bfa@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ovtz=gf=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewOBe-0002WQ-Du
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 08:24:34 +0000
In-Reply-To: <7c25f7f5-1b54-695e-be5f-6d06d4e89bfa@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Andrew Cooper <andrew.cooper3@citrix.com>, x86@kernel.org, linux-kernel@vger.kernel.org, David Laight <David.Laight@aculab.com>, Dan Carpenter <dan.carpenter@oracle.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE4IGF0IDIzOjQ3LCA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdy
b3RlOgo+IE9uIDAzLzEzLzIwMTggMDU6MDYgUE0sIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4+IFRo
ZSBsZWdhY3kgaHlwZXJjYWxsIGhhbmRsZXJzIHdlcmUgb3JpZ2luYWxseSBhZGRlZCB3aXRoCj4+
IGEgY29tbWVudCBleHBsYWluaW5nIHRoYXQgImNvcHlpbmcgdGhlIGFyZ3VtZW50IHN0cnVjdHVy
ZXMgaW4KPj4gSFlQRVJWSVNPUl9ldmVudF9jaGFubmVsX29wKCkgYW5kIEhZUEVSVklTT1JfcGh5
c2Rldl9vcCgpIGludG8gdGhlIGxvY2FsCj4+IHZhcmlhYmxlIGlzIHN1ZmZpY2llbnRseSBzYWZl
IiBhbmQgb25seSBtYWRlIHN1cmUgdG8gbm90IHdyaXRlCj4+IHBhc3QgdGhlIGVuZCBvZiB0aGUg
YXJndW1lbnQgc3RydWN0dXJlLCB0aGUgY2hlY2tzIGluIGxpbnV4L3N0cmluZy5oCj4+IGRpc2Fn
cmVlIHdpdGggdGhhdCwgd2hlbiBsaW5rLXRpbWUgb3B0aW1pemF0aW9ucyBhcmUgdXNlZDoKPj4K
Pj4gSW4gZnVuY3Rpb24gJ21lbWNweScsCj4+ICAgICBpbmxpbmVkIGZyb20gJ3BpcnFfcXVlcnlf
dW5tYXNrJyBhdCBkcml2ZXJzL3hlbi9mYWxsYmFjay5jOjUzOjIsCj4+ICAgICBpbmxpbmVkIGZy
b20gJ19fc3RhcnR1cF9waXJxJyBhdCBkcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYzo1
Mjk6MiwKPj4gICAgIGlubGluZWQgZnJvbSAncmVzdG9yZV9waXJxcycgYXQgZHJpdmVycy94ZW4v
ZXZlbnRzL2V2ZW50c19iYXNlLmM6MTQzOTozLAo+PiAgICAgaW5saW5lZCBmcm9tICd4ZW5faXJx
X3Jlc3VtZScgYXQgZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmM6MTU4MToyOgo+PiBp
bmNsdWRlL2xpbnV4L3N0cmluZy5oOjM1MDozOiBlcnJvcjogY2FsbCB0byAnX19yZWFkX292ZXJm
bG93MicgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUgZXJyb3I6IGRldGVjdGVkIHJlYWQgYmV5b25k
IHNpemUgb2Ygb2JqZWN0IHBhc3NlZCBhcyAybmQgcGFyYW1ldGVyCj4+ICAgIF9fcmVhZF9vdmVy
ZmxvdzIoKTsKPj4gICAgXgo+Pgo+PiBGdXJ0aGVyIHJlc2VhcmNoIHR1cm5lZCBvdXQgdGhhdCBv
bmx5IFhlbiAzLjAuMiBvciBlYXJsaWVyIHJlcXVpcmVkIHRoZQo+PiBmYWxsYmFjayBhdCBhbGws
IHdoaWxlIGFsbCB2ZXJzaW9ucyBpbiB1c2UgdG9kYXkgZG9uJ3QgbmVlZCBpdC4KPj4gQXMgZmFy
IGFzIEkgY2FuIHRlbGwsIGl0IGlzIG5vdCBldmVuIHBvc3NpYmxlIHRvIHJ1biBhIG1haW5saW5l
IGtlcm5lbAo+PiBvbiB0aG9zZSBvbGQgWGVuIHJlbGVhc2VzLCBhdCB0aGUgdGltZSB3aGVuIHRo
ZXkgd2VyZSBpbiB1c2UsIG9ubHkKPj4gYSBwYXRjaGVkIGtlcm5lbCB3YXMgc3VwcG9ydGVkIGFu
eXdheS4KPj4KPj4gRml4ZXM6IGNmNDdhODNmYjA2ZSAoInhlbi9oeXBlcmNhbGw6IGZpeCBoeXBl
cmNhbGwgZmFsbGJhY2sgY29kZSBmb3IgdmVyeSBvbGQgaHlwZXJ2aXNvcnMiKQo+PiBTaWduZWQt
b2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+PiAtLS0KPj4gW3YyXSB1c2Ug
YSB0YWJsZSBsb29rdXAgaW5zdGVhZCBvZiBhIHN3aXRjaC9jYXNlIHN0YXRlbWVudCwgYWZ0ZXIK
Pj4gbXVsdGlwbGUgc3VnZ2VzdGlvbnMuCj4+IFt2M10gcmVtb3ZlIHRoYXQgZmlsZSBjb21wbGV0
ZWx5Cj4gCj4gKCtKYW4gd2hvIGFkZGVkIHRoaXMgZmlsZSBvcmlnaW5hbGx5KQoKV2VsbCwgaWYg
ZXZlcnlvbmUgdGhpbmtzIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5IHRvIHRob3NlIHZlcnkgb2xk
Cmh5cGVydmlzb3JzIGlzIG5vdCByZWxldmFudCBhbnltb3JlLCB0aGVuIEknbSBub3QgZ29pbmcg
dG8gb2JqZWN0LgpJdCdzIHJlYWxseSBhIG1hdHRlciBvZiB0aGUgY29uc3VtaW5nIGRpc3Ryb3Mg
dG8ga25vdyBob3cgZmFyIGJhY2sKdGhleSB3YW50L25lZWQgdG8gZ3VhcmFudGVlIGNvbXBhdGli
aWxpdHkuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
