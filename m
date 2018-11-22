From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] common: make sure symbols-dummy.o gets
 rebuilt when needed
Date: Thu, 22 Nov 2018 15:30:49 +0000
Message-ID: <20181122153049.gu6jbtkm7muqvzz4@zion.uk.xensource.com>
References: <5BF6894D02000078001FECE2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NKve=OB=citrix.com=prvs=857cca76a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gPqwU-0006Vc-Rh
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 15:30:58 +0000
Content-Disposition: inline
In-Reply-To: <5BF6894D02000078001FECE2@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjIsIDIwMTggYXQgMDM6NDc6NDFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIHBlci1hcmNoIHRvcCBsZXZlbCBtYWtlIGZpbGVzIGRvbid0IHJlY29yZCBhbnkg
ZGVwZW5kZW5jaWVzIGZvciB0aGUKPiBmaWxlLCBzbyBpdHMgbWVyZSBleGlzdGVuY2UgaXMgZW5v
dWdoIGZvciBtYWtlIHRvIGNvbnNpZGVyIGl0IHVwLXRvLQo+IGRhdGUuIEFzIG9mIGFiM2U1ZjVm
ZjkgKCJ4c3BsaWNlLCBzeW1ib2xzOiBJbXBsZW1lbnQgZmFzdCBzeW1ib2wgbmFtZXMKPiAtPiB2
aXJ0dWFsIGFkZHJlc3NlcyBsb29rdXAiKSB0aGUgZmlsZSwgaG93ZXZlciwgZGVwZW5kcyBvbiB0
aGUKPiBGQVNUX1NZTUJPTF9MT09LVVAgY29uZmlnIG9wdGlvbiwgd2hpY2ggbWF5IGNoYW5nZSBi
ZXR3ZWVuIGluY3JlbWVudGFsCj4gcmUtYnVpbGRzLgo+IAo+IFVzZSB0aGUgJChleHRyYS15KSBt
YWNoaW5lcnkgdG8gZ2V0IHRoZSBmaWxlIGJ1aWx0IHdpdGhvdXQgYW4gZXh0cmEKPiByZWN1cnNp
b24gc3RlcCBpbnRvIGNvbW1vbi8sIGJ1dCBpbnN0ZWFkIHJpZ2h0IHdoZW4gdGhlIG90aGVyIHRo
aW5ncyBpbgo+IHRoYXQgZGlyZWN0b3J5IGdldCBidWlsdC4KCkFGQUlDVCBleHRyYS15IG1hY2hp
bmVyeSB3YXMgYnJva2VuIGJlZm9yZSB0aGlzIHBhdGNoLiBJdCBtaWdodCBiZSB3b3J0aApjYWxs
aW5nIHRoYXQgb3V0IGhlcmUuCgo+IAo+IFRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBhbHNvIG1h
a2UgdGhlIGdlbmRlcCBpbnZvY2F0aW9uIGNvdmVyIGJvdGgKPiAkKG9iai1iaW4teSkgYW5kICQo
ZXh0cmEteSksIGV2ZW4gaWYgdGhpcyBpcyBub3QgZGlyZWN0bHkgcmVsYXRlZCBoZXJlLgo+IEkg
c2hvdWxkIGhhdmUgaW5jbHVkZWQgdGhlbSByaWdodCBhd2F5IGluIDhiNmVmOWMxNTIgKCJjb21w
YXQ6IGVuZm9yY2UKPiBkaXN0aW5ndWlzaGFibGUgZmlsZSBuYW1lcyBpbiBzeW1ib2wgdGFibGUi
KS4KPiAKPiBSZXBvcnRlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gLS0tIGEveGVu
L2FyY2gvYXJtL01ha2VmaWxlCj4gKysrIGIveGVuL2FyY2gvYXJtL01ha2VmaWxlCj4gQEAgLTEw
MCw5ICsxMDAsNiBAQCBwcmVsaW5rLm86ICQoQUxMX09CSlMpCj4gIAkkKExEKSAkKExERkxBR1Mp
IC1yIC1vICRAICReCj4gIGVuZGlmCj4gIAo+IC0kKEJBU0VESVIpL2NvbW1vbi9zeW1ib2xzLWR1
bW15Lm86Cj4gLQkkKE1BS0UpIC1mICQoQkFTRURJUikvUnVsZXMubWsgLUMgJChCQVNFRElSKS9j
b21tb24gc3ltYm9scy1kdW1teS5vCj4gLQo+ICAkKFRBUkdFVCktc3ltczogcHJlbGluay5vIHhl
bi5sZHMgJChCQVNFRElSKS9jb21tb24vc3ltYm9scy1kdW1teS5vCgpBcyBkaXNjdXNzZWQgb24g
SVJDIGRpcmVjdCBkZXBlbmRlbmNpZXMgb24gc3ltYm9scy1kdW1teS5vIHNob3VsZCBiZQpkZWxl
dGVkLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
