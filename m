From: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 08/30] hw/i386: use the
 BYTE-based definitions
Date: Mon, 5 Mar 2018 14:00:36 +0100
Message-ID: <20180305140036.2f8c705a@redhat.com>
References: <20180215042900.16078-1-f4bug@amsat.org>
 <20180215042900.16078-9-f4bug@amsat.org>
 <20180305132915.4dacc461@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=eynj=f3=redhat.com=imammedo@srs-us1.protection.inumbo.net>)
 id 1espjb-0006CN-31
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 13:00:55 +0000
In-Reply-To: <20180305132915.4dacc461@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, "open
 list:X86" <xen-devel@lists.xenproject.org>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCA1IE1hciAyMDE4IDEzOjI5OjE1ICswMTAwCklnb3IgTWFtbWVkb3YgPGltYW1tZWRv
QHJlZGhhdC5jb20+IHdyb3RlOgoKPiBPbiBUaHUsIDE1IEZlYiAyMDE4IDAxOjI4OjM4IC0wMzAw
Cj4gUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4gd3JvdGU6Cj4gCj4g
PiBJdCBlYXNlIGNvZGUgcmV2aWV3LCB1bml0IGlzIGV4cGxpY2l0Lgo+ID4gCj4gPiBTaWduZWQt
b2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPgo+ID4gLS0t
ICAKPiBbLi4uXQo+IAo+ID4gZGlmZiAtLWdpdCBhL2h3L2kzODYvYWNwaS1idWlsZC5jIGIvaHcv
aTM4Ni9hY3BpLWJ1aWxkLmMKPiA+IGluZGV4IGRlYjQ0MGYyODYuLjljY2M2MTkyYjUgMTAwNjQ0
Cj4gPiAtLS0gYS9ody9pMzg2L2FjcGktYnVpbGQuYwo+ID4gKysrIGIvaHcvaTM4Ni9hY3BpLWJ1
aWxkLmMKPiA+IEBAIC0yMzIwLDggKzIzMjAsOCBAQCBidWlsZF90cG0yKEdBcnJheSAqdGFibGVf
ZGF0YSwgQklPU0xpbmtlciAqbGlua2VyLCBHQXJyYXkgKnRjcGFsb2cpCj4gPiAgICAgICAgICAg
ICAgICAgICAodm9pZCAqKXRwbTJfcHRyLCAiVFBNMiIsIHNpemVvZigqdHBtMl9wdHIpLCA0LCBO
VUxMLCBOVUxMKTsKPiA+ICB9Cj4gPiAgCj4gPiAtI2RlZmluZSBIT0xFXzY0MEtfU1RBUlQgICg2
NDAgKiAxMDI0KQo+ID4gLSNkZWZpbmUgSE9MRV82NDBLX0VORCAgICgxMDI0ICogMTAyNCkKPiA+
ICsjZGVmaW5lIEhPTEVfNjQwS19TVEFSVCAgKDY0MCAqIEtfQllURSkKPiA+ICsjZGVmaW5lIEhP
TEVfNjQwS19FTkQgICAoMTAyNCAqIEtfQllURSkgIAo+IG5pdDoKPiBjb3VsZCBiZSAxICogTV9C
WVRFCj4gCj4gWy4uLl0KPiAKPiBSZXZpZXdlZC1ieTogSWdvciBNYW1tZWRvdiA8aW1hbW1lZG9A
cmVkaGF0LmNvbT4KdGFraW5nIGl0IGJhY2sKCldoaWxlIGJ1aWxkaW5nIGl0LCBJIGdldDoKCklu
IGZpbGUgaW5jbHVkZWQgZnJvbSBxZW11L2h3L2FjcGkvaWNoOS5jOjM4OjA6CnFlbXUvaW5jbHVk
ZS9ody9pMzg2L2ljaDkuaDoyNToyODogZXJyb3I6IOKAmEtfQllUReKAmSB1bmRlY2xhcmVkIGhl
cmUgKG5vdCBpbiBhIGZ1bmN0aW9uKQogI2RlZmluZSBJQ0g5X0NDX1NJWkUgKDE2ICogS19CWVRF
KSAvKiBDaGlwc2V0IGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXJzICovCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBeCnFlbXUvaW5jbHVkZS9ody9pMzg2L2ljaDkuaDo1NjoyNTogbm90ZTogaW4g
ZXhwYW5zaW9uIG9mIG1hY3JvIOKAmElDSDlfQ0NfU0laReKAmQogICAgIHVpbnQ4X3QgY2hpcF9j
b25maWdbSUNIOV9DQ19TSVpFXTsKICAgICAgICAgICAgICAgICAgICAgICAgIF4KbWFrZTogKioq
IFtody9hY3BpL2ljaDkub10gRXJyb3IgMQoKIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
