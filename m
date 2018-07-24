From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2] xen/pv: Call get_cpu_address_sizes to
 set x86_virt/phys_bits
Date: Tue, 24 Jul 2018 10:08:19 -0400
Message-ID: <3ac07f7d-19f3-923f-57c4-a12c605ff6ad__14357.0716762499$1532443034$gmane$org@oracle.com>
References: <20180721194909.23903-2-m.v.b@runbox.com>
 <20180724124547.32562-1-m.v.b@runbox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vzwn=ki=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fhySA-0004bh-D2
 for xen-devel@lists.xenproject.org; Tue, 24 Jul 2018 14:38:18 +0000
In-Reply-To: <20180724124547.32562-1-m.v.b@runbox.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "M. Vefa Bicakci" <m.v.b@runbox.com>, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org, stable@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMjQvMjAxOCAwODo0NSBBTSwgTS4gVmVmYSBCaWNha2NpIHdyb3RlOgo+IENvbW1pdCBk
OTRhMTU1YzU5YzkgKCJ4ODYvY3B1OiBQcmV2ZW50IGNwdWluZm9feDg2Ojp4ODZfcGh5c19iaXRz
Cj4gYWRqdXN0bWVudCBjb3JydXB0aW9uIikgaGFzIG1vdmVkIHRoZSBxdWVyeSBhbmQgY2FsY3Vs
YXRpb24gb2YgdGhlCj4geDg2X3ZpcnRfYml0cyBhbmQgeDg2X3BoeXNfYml0cyBmaWVsZHMgb2Yg
dGhlIGNwdWluZm9feDg2IHN0cnVjdAo+IGZyb20gdGhlIGdldF9jcHVfY2FwIGZ1bmN0aW9uIHRv
IGEgbmV3IGZ1bmN0aW9uIG5hbWVkCj4gZ2V0X2NwdV9hZGRyZXNzX3NpemVzLgo+Cj4gT25lIG9m
IHRoZSBjYWxsIHNpdGVzIHJlbGF0ZWQgdG8gWGVuIFBWIFZNcyB3YXMgdW5mb3J0dW5hdGVseSBt
aXNzZWQKPiBpbiB0aGUgYWZvcmVtZW50aW9uZWQgY29tbWl0LiBUaGlzIHByZXZlbnRzIHN1Y2Nl
c3NmdWwgYm9vdC11cCBvZgo+IGtlcm5lbCB2ZXJzaW9ucyA0LjE3IGFuZCB1cCBpbiBYZW4gUFYg
Vk1zIGlmIENPTkZJR19ERUJVR19WSVJUVUFMCj4gaXMgZW5hYmxlZCwgZHVlIHRvIHRoZSBmb2xs
b3dpbmcgY29kZSBwYXRoOgo+Cj4gICBlbmxpZ2h0ZW5fcHYuYzo6eGVuX3N0YXJ0X2tlcm5lbAo+
ICAgICBtbXVfcHYuYzo6eGVuX3Jlc2VydmVfc3BlY2lhbF9wYWdlcwo+ICAgICAgIHBhZ2UuaDo6
X19wYQo+ICAgICAgICAgcGh5c2FkZHIuYzo6X19waHlzX2FkZHIKPiAgICAgICAgICAgcGh5c2Fk
ZHIuaDo6cGh5c19hZGRyX3ZhbGlkCj4KPiBwaHlzX2FkZHJfdmFsaWQgdXNlcyBib290X2NwdV9k
YXRhLng4Nl9waHlzX2JpdHMgdG8gdmFsaWRhdGUgcGh5c2ljYWwKPiBhZGRyZXNzZXMuIGJvb3Rf
Y3B1X2RhdGEueDg2X3BoeXNfYml0cyBpcyBubyBsb25nZXIgcG9wdWxhdGVkIGJlZm9yZQo+IHRo
ZSBjYWxsIHRvIHhlbl9yZXNlcnZlX3NwZWNpYWxfcGFnZXMgZHVlIHRvIHRoZSBhZm9yZW1lbnRp
b25lZCBjb21taXQKPiB0aG91Z2gsIHNvIHRoZSB2YWxpZGF0aW9uIHBlcmZvcm1lZCBieSBwaHlz
X2FkZHJfdmFsaWQgZmFpbHMsIHdoaWNoCj4gY2F1c2VzIF9fcGh5c19hZGRyIHRvIHRyaWdnZXIg
YSBCVUcsIHByZXZlbnRpbmcgYm9vdC11cC4KPgo+IFNpZ25lZC1vZmYtYnk6IE0uIFZlZmEgQmlj
YWtjaSA8bS52LmJAcnVuYm94LmNvbT4KPiBDYzogIktpcmlsbCBBLiBTaHV0ZW1vdiIgPGtpcmls
bC5zaHV0ZW1vdkBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IEFuZHkgTHV0b21pcnNraSA8bHV0b0Br
ZXJuZWwub3JnPgo+IENjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT4KPiBDYzogIkgu
IFBldGVyIEFudmluIiA8aHBhQHp5dG9yLmNvbT4KPiBDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4
QGxpbnV0cm9uaXguZGU+Cj4gQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9y
YWNsZS5jb20+Cj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBDYzogeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gQ2M6IHg4NkBrZXJuZWwub3JnCj4gQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcgIyBmb3IgdjQuMTcgYW5kIHVwCj4gRml4ZXM6IGQ5NGExNTVj
NTljOSAoIng4Ni9jcHU6IFByZXZlbnQgY3B1aW5mb194ODY6Ong4Nl9waHlzX2JpdHMgYWRqdXN0
bWVudCBjb3JydXB0aW9uIikKClJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9z
dHJvdnNreUBvcmFjbGUuY29tPgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
