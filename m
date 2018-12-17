From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen/pciback: Check dev_data before using it
Date: Mon, 17 Dec 2018 10:59:27 -0500
Message-ID: <5466379b-5781-8fa3-3fd7-765375912938__5438.10290187157$1545062298$gmane$org@oracle.com>
References: <20181214125545.28753-1-ross.lagerwall@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h5pW=O2=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gYvIz-0002L9-JD
 for xen-devel@lists.xenproject.org; Mon, 17 Dec 2018 15:59:41 +0000
In-Reply-To: <20181214125545.28753-1-ross.lagerwall@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, stable <stable@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTQvMTggNzo1NSBBTSwgUm9zcyBMYWdlcndhbGwgd3JvdGU6Cj4gSWYgcGNpc3R1Yl9p
bml0X2RldmljZSBmYWlscywgdGhlIHJlbGVhc2UgZnVuY3Rpb24gd2lsbCBiZSBjYWxsZWQgd2l0
aAo+IGRldl9kYXRhIHNldCB0byBOVUxMLiAgQ2hlY2sgaXQgYmVmb3JlIHVzaW5nIGl0IHRvIGF2
b2lkIGEgTlVMTCBwb2ludGVyCj4gZGVyZWZlcmVuY2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb3Nz
IExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KCkkgdGhpbmsgdGhpcyBzaG91
bGQgZ28gdG8gc3RhYmxlIHRyZWVzIHRvbyAoY29weWluZyB0aGVtKQoKQXBwbGllZCB0byBmb3It
bGludXMtNC4yMQoKLWJvcmlzCgoKPiAtLS0KPiAgZHJpdmVycy94ZW4veGVuLXBjaWJhY2svcGNp
X3N0dWIuYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2lfc3R1
Yi5jIGIvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svcGNpX3N0dWIuYwo+IGluZGV4IDU5NjYxZGIx
NDRlNS4uMDk3NDEwYTdjZGI3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMveGVuL3hlbi1wY2liYWNr
L3BjaV9zdHViLmMKPiArKysgYi9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5jCj4g
QEAgLTEwNiw3ICsxMDYsOCBAQCBzdGF0aWMgdm9pZCBwY2lzdHViX2RldmljZV9yZWxlYXNlKHN0
cnVjdCBrcmVmICprcmVmKQo+ICAJICogaXMgY2FsbGVkIGZyb20gInVuYmluZCIgd2hpY2ggdGFr
ZXMgYSBkZXZpY2VfbG9jayBtdXRleC4KPiAgCSAqLwo+ICAJX19wY2lfcmVzZXRfZnVuY3Rpb25f
bG9ja2VkKGRldik7Cj4gLQlpZiAocGNpX2xvYWRfYW5kX2ZyZWVfc2F2ZWRfc3RhdGUoZGV2LCAm
ZGV2X2RhdGEtPnBjaV9zYXZlZF9zdGF0ZSkpCj4gKwlpZiAoZGV2X2RhdGEgJiYKPiArCSAgICBw
Y2lfbG9hZF9hbmRfZnJlZV9zYXZlZF9zdGF0ZShkZXYsICZkZXZfZGF0YS0+cGNpX3NhdmVkX3N0
YXRlKSkKPiAgCQlkZXZfaW5mbygmZGV2LT5kZXYsICJDb3VsZCBub3QgcmVsb2FkIFBDSSBzdGF0
ZVxuIik7Cj4gIAllbHNlCj4gIAkJcGNpX3Jlc3RvcmVfc3RhdGUoZGV2KTsKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
