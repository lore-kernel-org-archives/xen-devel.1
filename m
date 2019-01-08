From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 2/3] machine: Eliminate
 unnecessary stringify() usage
Date: Tue, 8 Jan 2019 15:36:51 +0100
Message-ID: <11e0ba89-3cb2-1563-8f66-ae68ef2d1b63@redhat.com>
References: <20190107193020.21744-1-ehabkost@redhat.com>
 <20190107193020.21744-3-ehabkost@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3yON=PQ=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1ggsUx-0004Oa-Vc
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 14:36:56 +0000
Received: by mail-wr1-f68.google.com with SMTP id j2so4307176wrw.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jan 2019 06:36:54 -0800 (PST)
In-Reply-To: <20190107193020.21744-3-ehabkost@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>, Richard Henderson <rth@twiddle.net>, Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>, xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>
List-Id: xen-devel@lists.xenproject.org

T24gMS83LzE5IDg6MzAgUE0sIEVkdWFyZG8gSGFia29zdCB3cm90ZToKPiBzdHJpbmdpZnkoKSBp
cyB1c2VmdWwgd2hlbiB3ZSBuZWVkIHRvIHVzZSBtYWNyb3MgaW4gY29tcGF0X3Byb3BzCj4gKGxp
a2Ugd2hlbiB3ZSBzZXQgdmlydGlvLWJhbG9vbi1wY2kuY2xhc3M9UENJX0NMQVNTX01FTU9SWV9S
QU0gYXQKPiBwY19pNDQwZnhfMV8wX21hY2hpbmVfb3B0aW9ucygpKSwgYnV0IGl0IGlzIHBvaW50
bGVzcyB3aGVuIHdlIGFyZQo+IGFscmVhZHkgcHJvdmlkaW5nIGEgbnVtYmVyIGxpdGVyYWwuCj4g
Cj4gUmVwbGFjZSBzdHJpbmdpZnkoKSB3aXRoIHN0cmluZyBsaXRlcmFscyB3aGVuIGFwcHJvcHJp
YXRlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEVkdWFyZG8gSGFia29zdCA8ZWhhYmtvc3RAcmVkaGF0
LmNvbT4KPiAtLS0KPiAgaHcvY29yZS9tYWNoaW5lLmMgfCAgOCArKy0tCj4gIGh3L2kzODYvcGMu
YyAgICAgIHwgOTQgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiAgaHcvaTM4Ni9wY19waWl4LmMgfCAzMCArKysrKysrLS0tLS0tLS0KPiAgaHcvcHBjL3Nw
YXByLmMgICAgfCAgMiArLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKyksIDY3
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9ody9jb3JlL21hY2hpbmUuYyBiL2h3L2Nv
cmUvbWFjaGluZS5jCj4gaW5kZXggZjg1NjNlZmI4Ni4uNGI0ZDZjMjNkZSAxMDA2NDQKPiAtLS0g
YS9ody9jb3JlL21hY2hpbmUuYwo+ICsrKyBiL2h3L2NvcmUvbWFjaGluZS5jCj4gQEAgLTEzNSwx
MSArMTM1LDExIEBAIEdsb2JhbFByb3BlcnR5IGh3X2NvbXBhdF8yXzhbXSA9IHsKPiAgICAgIHsK
PiAgICAgICAgICAuZHJpdmVyICAgPSAiZndfY2ZnX21lbSIsCj4gICAgICAgICAgLnByb3BlcnR5
ID0gIngtZmlsZS1zbG90cyIsCj4gLSAgICAgICAgLnZhbHVlICAgID0gc3RyaW5naWZ5KDB4MTAp
LAo+ICsgICAgICAgIC52YWx1ZSAgICA9ICIweDEwIiwKWy4uLl0KCkxvdmVseS4KClJldmlld2Vk
LWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
