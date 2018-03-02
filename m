From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: use hvc console for dom0
Date: Fri, 2 Mar 2018 15:21:30 +0100
Message-ID: <73110605-e3b9-92d2-cc78-56ff8d13b9ea__37257.3080742315$1520000422$gmane$org@suse.com>
References: <20180226110822.13787-1-jgross@suse.com>
 <0d8bdda5-faef-41da-344a-644b5c3d6006@epam.com>
 <58e94cc9-9b09-d6b7-3122-fb4c83e97926@suse.com>
 <b57092b4-e740-e1f8-3885-a817bb7d4e70@arm.com>
 <alpine.DEB.2.10.1802271159070.4239@sstabellini-ThinkPad-X260>
 <19afb9f9-a845-e627-8f78-d1fdb349c6bd@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=wrb9=fy=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1erlZ4-0000Ht-GV
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 14:21:38 +0000
In-Reply-To: <19afb9f9-a845-e627-8f78-d1fdb349c6bd@arm.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrii Anisov <andrii_anisov@epam.com>, linux-kernel@vger.kernel.org, jbeulich@suse.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDIvMTggMjE6MDksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPiAKPiBPbiAyNy8w
Mi8yMDE4IDIwOjAzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+IE9uIFR1ZSwgMjcgRmVi
IDIwMTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IE9uIDI2LzAyLzE4IDEy
OjMyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+IE9uIDI2LzAyLzE4IDEzOjA2LCBBbmRyaWkg
QW5pc292IHdyb3RlOgo+Pj4+PiBIZWxsbyBKdWVyZ2VuLAo+Pj4+Pgo+Pj4+Pgo+Pj4+PiBPbiAy
Ni4wMi4xOCAxMzowOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4+IFRvZGF5IHRoZSBodmMg
Y29uc29sZSBpcyBhZGRlZCBhcyBhIHByZWZlcnJlZCBjb25zb2xlIGZvciBwdiBkb21Vcwo+Pj4+
Pj4gb25seS4gQXMgdGhpcyByZXF1aXJlcyBhIGJvb3QgcGFyYW1ldGVyIGZvciBnZXR0aW5nIGRv
bTAgbWVzc2FnZXMgcGVyCj4+Pj4+PiBkZWZhdWx0IGFkZCBpdCBmb3IgZG9tMCwgdG9vLgo+Pj4+
Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
Pj4+Pj4+IC0tLQo+Pj4+Pj4gwqAgwqAgYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jIHwgNCAr
KystCj4+Pj4+PiDCoCDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5f
cHYuYwo+Pj4+Pj4gYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKPj4+Pj4gSXMgdGhpcyBz
b21ldGhpbmcgeDg2IHNwZWNpZmljPyBDb3VsZCBpdCBiZSBhIGdlbmVyaWMgYXBwcm9hY2g/Cj4+
Pj4KPj4+PiBJbiBjYXNlIEFSTSB3YW50cyBzb21ldGhpbmcgc2ltaWxhciBJIGd1ZXNzIHRoZSB0
ZXN0IGZvcgo+Pj4+IHhlbl9pbml0aWFsX2RvbWFpbigpIHNob3VsZCBiZSBkcm9wcGVkIGluIHhl
bl9lYXJseV9pbml0KCkuCj4+PiBJIGFtIHByZXR0eSBzdXJlIHdlIGRpc2N1c3NlZCB0byByZW1v
dmUgIXhlbl9pbml0aWFsX2RvbWFpbigpIGZvciBBcm0KPj4+IGluIHRoZQo+Pj4gcGFzdC4gQnV0
IEkgZG9uJ3QgcmVtZW1iZXIgd2h5IHRoZSBwYXRjaCB3YXMgbm90IHNlbnQgdG8gcmVtb3ZlIGl0
Lgo+Pj4KPj4+IEFueXdheSwgSSBndWVzcyB0aGlzIHNob3VsZCBiZSBmaW5lIHRvIGhhdmUgaHZj
IGFzIGEgcHJlZmVycmVkCj4+PiBjb25zb2xlIGZvciB0aGUKPj4+IGluaXRpYWwgZG9tYWluIGFz
IHdlbGwuCj4+Cj4+IFVzdWFsbHksIERvbTAgaGFzIGFjY2VzcyB0byBzZXZlcmFsIHBoeXNpY2Fs
IFVBUlRzIGFuZC9vciBWR0EsIG1ha2luZwo+PiB0aGlzIHBhdGNoIGxlc3Mgb2J2aW91c2x5IGRl
c2lyYWJsZS4gSSB0aGluayB0aGF0IGZvciBEb20wIHRoZSBiZXN0Cj4+IGJlaGF2aW9yIHdvdWxk
IGJlIHRvIGFkZCAiaHZjMCIgYXMgZmlyc3QgY29uc29sZSByYXRoZXIgdGhhbiBsYXN0Cj4+IGNv
bnNvbGUsIHNvIHRoYXQgaWYgdGhlIHVzZXIgc3BlY2lmaWVkIHNvbWV0aGluZyBlbHNlLCB0aGlz
IGNhbGwgd29uJ3QKPj4gaW50ZXJmZXJlIHdpdGggaXQuCj4gCj4gV2VsbCwgdGhhdCdzIGV4YWN0
bHkgdGhlIGdvYWwgb2YgYWRkX3ByZWZlcnJlZF9jb25zb2xlLiBJdCB3aWxsIHVzZSBodmMwCj4g
dW5sZXNzIHNwZWNpZmllZCBvdGhlcndpc2UgYnkgdGhlIHVzZXIgb24gdGhlIGNvbW1hbmQgbGlu
ZS4KCkkgc3VnZ2VzdCBzb21lb25lIHdobyBjYW4gdGVzdCBpdCBzaG91bGQgcG9zdCBhIHBhdGNo
IGZvciBBUk0uCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
