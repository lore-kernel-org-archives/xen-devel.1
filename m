From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] CONFIG_XEN_PV breaks
 xen_create_contiguous_region on ARM
Date: Tue, 16 Oct 2018 08:51:32 -0400
Message-ID: <8deec21f-cb8a-a481-7f49-e9a8c1c7425a@oracle.com>
References: <alpine.DEB.2.10.1810161627250.5150@sstabellini-ThinkPad-X260>
 <209b46f5-54db-72be-5d08-798550bc7d02@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=edok=m4=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gCOpO-0001no-6R
 for xen-devel@lists.xenproject.org; Tue, 16 Oct 2018 12:52:02 +0000
In-Reply-To: <209b46f5-54db-72be-5d08-798550bc7d02@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, jgross@suse.com, vkuznets@redhat.com
Cc: xen-devel@lists.xenproject.org, Nathan.Studer@dornerworks.com, Jeff.Kubascik@dornerworks.com, Jarvis.Roach@dornerworks.com
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMTYvMTggNjo1NiBBTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+Cj4gT24gMTAv
MTYvMjAxOCAwOTozOCBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+PiB4ZW5fY3JlYXRl
X2NvbnRpZ3VvdXNfcmVnaW9uIGhhcyBub3cgb25seSBhbiBpbXBsZW1lbnRhdGlvbiBpZgo+PiBD
T05GSUdfWEVOX1BWIGlzIGRlZmluZWQuIEhvd2V2ZXIsIG9uIEFSTSB3ZSBuZXZlciBzZXQgQ09O
RklHX1hFTl9QViBidXQKPj4gd2UgZG8gaGF2ZSBhbiBpbXBsZW1lbnRhdGlvbiBvZiB4ZW5fY3Jl
YXRlX2NvbnRpZ3VvdXNfcmVnaW9uIHdoaWNoIGlzCj4+IHJlcXVpcmVkIGZvciBzd2lvdGxiLXhl
biB0byB3b3JrIGNvcnJlY3RseSAoYWx0aG91Z2ggaXQganVzdCBzZXRzCj4+ICpkbWFfaGFuZGxl
KS4gPgo+PiBUaGlzIGZpeGVzIGEgYnVnIGludHJvZHVjZWQgYnkgMTY2MjQzOTA4MTZjNGM0MGRm
M2Q3NzdiMzQ2NjVkM2ZkMDFlNjkzZC4KPgo+IExpbnV4IGlzIHVzaW5nIHRoZSB0YWcgIkZpeGVz
OiBzaGExICgiY29tbWl0IHRpdGxlIikiIHNvIGl0IGNhbiBiZQo+IHBpY2tlZCB1cCBmb3IgYmFj
a3BvcnRpbmcuCgoKU29CIHdvdWxkIGFsc28gYmUgZ29vZCB0byBoYXZlIDstKQoKUmV2aWV3ZWQt
Ynk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cgo+Cj4gQWNr
ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4KPiBDaGVlcnMsCj4+
Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3hlbi94ZW4tb3BzLmggYi9pbmNsdWRlL3hlbi94ZW4t
b3BzLmgKPj4gaW5kZXggZmQxOGM5Ny4uOTM5YTk2MiAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS94
ZW4veGVuLW9wcy5oCj4+ICsrKyBiL2luY2x1ZGUveGVuL3hlbi1vcHMuaAo+PiBAQCAtNDEsNyAr
NDEsNyBAQCBzdGF0aWMgaW5saW5lIHVpbnQzMl90IHhlbl92Y3B1X25yKGludCBjcHUpCj4+IMKg
IMKgIGV4dGVybiB1bnNpZ25lZCBsb25nICp4ZW5fY29udGlndW91c19iaXRtYXA7Cj4+IMKgIC0j
aWZkZWYgQ09ORklHX1hFTl9QVgo+PiArI2lmZGVmIENPTkZJR19YRU5fUFYgfHwgQ09ORklHX0FS
TSB8fCBDT05GSUdfQVJNNjQKPj4gwqAgaW50IHhlbl9jcmVhdGVfY29udGlndW91c19yZWdpb24o
cGh5c19hZGRyX3QgcHN0YXJ0LCB1bnNpZ25lZCBpbnQKPj4gb3JkZXIsCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGFkZHJlc3NfYml0cywKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfYWRkcl90ICpkbWFfaGFuZGxlKTsK
Pj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4g
WGVuLWRldmVsIG1haWxpbmcgbGlzdAo+PiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
Pj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bAo+Pgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
