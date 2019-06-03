From: Greg KH <greg@kroah.com>
Subject: Re: [stable] xen/pciback: Don't disable PCI_COMMAND on
 PCI device reset.
Date: Mon, 3 Jun 2019 10:00:36 +0200
Message-ID: <20190603080036.GF7814__1055.19226506061$1559548918$gmane$org@kroah.com>
References: <1559229415.24330.2.camel@codethink.co.uk>
 <0e6ebb5c-ff43-6d65-bcba-6ac5e60aa472@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FX4o=UC=kroah.com=greg@srs-us1.protection.inumbo.net>)
 id 1hXhtj-0002Ky-RZ
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 08:00:52 +0000
Content-Disposition: inline
In-Reply-To: <0e6ebb5c-ff43-6d65-bcba-6ac5e60aa472@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Prarit Bhargava <prarit@redhat.com>, Juergen Gross <jgross@suse.com>, Ben Hutchings <ben.hutchings@codethink.co.uk>, stable <stable@vger.kernel.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgMDc6MDI6MzRQTSAtMDcwMCwgS29ucmFkIFJ6ZXN6dXRl
ayBXaWxrIHdyb3RlOgo+IE9uIDUvMzAvMTkgODoxNiBBTSwgQmVuIEh1dGNoaW5ncyB3cm90ZToK
PiA+IEknbSBsb29raW5nIGF0IENWRS0yMDE1LTg1NTMgd2hpY2ggaXMgZml4ZWQgYnk6Cj4gPiAK
PiA+IGNvbW1pdCA3NjgxZjMxZWM5Y2RhY2FiNGZkMTA1NzBiZTkyNGYyY2VmNjY2OWJhCj4gPiBB
dXRob3I6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiA+
IERhdGU6wqDCoMKgV2VkIEZlYiAxMyAxODoyMTozMSAyMDE5IC0wNTAwCj4gPiAKPiA+ICDCoMKg
wqDCoHhlbi9wY2liYWNrOiBEb24ndCBkaXNhYmxlIFBDSV9DT01NQU5EIG9uIFBDSSBkZXZpY2Ug
cmVzZXQuCj4gPiAKPiA+IEknbSBhd2FyZSB0aGF0IHRoaXMgY2hhbmdlIGlzIGluY29tcGF0aWJs
ZSB3aXRoIHFlbXUgPCAyLjUsIGJ1dCB0aGF0J3MKPiA+IG5vdyBxdWl0ZSBvbGQuICBEbyB5b3Ug
dGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8gYXBwbHkgdGhpcyBjaGFuZ2UgdG8KPiA+IHNvbWUgc3Rh
YmxlIGJyYW5jaGVzPwo+ID4gCj4gPiBCZW4uCj4gPiAKPiAKPiBIZXkgQmVuLAo+IAo+IDxzaHJ1
Z3M+IE15IG9waW5pb24gaXMgdG8gZHJvcCBpdCwgYnV0IGlmIEp1ZXJnZW4gdGhpbmtzIGl0IG1h
a2VzIHNlbnNlIHRvCj4gYmFja3BvcnQgSSBhbSBub3QgZ29pbmcgdG8gYXJndWUuCgpPaywgSSd2
ZSBxdWV1ZWQgdGhpcyB1cCBub3csIHRoYW5rcy4KCmdyZWcgay1oCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
