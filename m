From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] xen: use hvc console for dom0
Date: Tue, 27 Feb 2018 11:14:23 +0000
Message-ID: <b57092b4-e740-e1f8-3885-a817bb7d4e70__23594.2197767601$1519729989$gmane$org@arm.com>
References: <20180226110822.13787-1-jgross@suse.com>
 <0d8bdda5-faef-41da-344a-644b5c3d6006@epam.com>
 <58e94cc9-9b09-d6b7-3122-fb4c83e97926@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=r2zm=fv=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eqdDI-000870-Rq
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 11:14:28 +0000
In-Reply-To: <58e94cc9-9b09-d6b7-3122-fb4c83e97926@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Andrii Anisov <andrii_anisov@epam.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: boris.ostrovsky@oracle.com, Stefano Stabellini <sstabellini@kernel.org>, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyNi8wMi8xOCAxMjozMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAyNi8wMi8x
OCAxMzowNiwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPj4gSGVsbG8gSnVlcmdlbiwKPj4KPj4KPj4g
T24gMjYuMDIuMTggMTM6MDgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+PiBUb2RheSB0aGUgaHZj
IGNvbnNvbGUgaXMgYWRkZWQgYXMgYSBwcmVmZXJyZWQgY29uc29sZSBmb3IgcHYgZG9tVXMKPj4+
IG9ubHkuIEFzIHRoaXMgcmVxdWlyZXMgYSBib290IHBhcmFtZXRlciBmb3IgZ2V0dGluZyBkb20w
IG1lc3NhZ2VzIHBlcgo+Pj4gZGVmYXVsdCBhZGQgaXQgZm9yIGRvbTAsIHRvby4KPj4+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+PiAtLS0KPj4+
ICDCoCBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMgfCA0ICsrKy0KPj4+ICDCoCAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5f
cHYuYwo+PiBJcyB0aGlzIHNvbWV0aGluZyB4ODYgc3BlY2lmaWM/IENvdWxkIGl0IGJlIGEgZ2Vu
ZXJpYyBhcHByb2FjaD8KPiAKPiBJbiBjYXNlIEFSTSB3YW50cyBzb21ldGhpbmcgc2ltaWxhciBJ
IGd1ZXNzIHRoZSB0ZXN0IGZvcgo+IHhlbl9pbml0aWFsX2RvbWFpbigpIHNob3VsZCBiZSBkcm9w
cGVkIGluIHhlbl9lYXJseV9pbml0KCkuCkkgYW0gcHJldHR5IHN1cmUgd2UgZGlzY3Vzc2VkIHRv
IHJlbW92ZSAheGVuX2luaXRpYWxfZG9tYWluKCkgZm9yIEFybSBpbiAKdGhlIHBhc3QuIEJ1dCBJ
IGRvbid0IHJlbWVtYmVyIHdoeSB0aGUgcGF0Y2ggd2FzIG5vdCBzZW50IHRvIHJlbW92ZSBpdC4K
CkFueXdheSwgSSBndWVzcyB0aGlzIHNob3VsZCBiZSBmaW5lIHRvIGhhdmUgaHZjIGFzIGEgcHJl
ZmVycmVkIGNvbnNvbGUgCmZvciB0aGUgaW5pdGlhbCBkb21haW4gYXMgd2VsbC4KCkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
