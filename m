From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: About Porting Virtio to the XEN
Date: Thu, 21 Feb 2019 11:58:21 +0000
Message-ID: <20190221115821.sicxk2x4kw5met54@zion.uk.xensource.com>
References: <9ee0e867-41c7-6474-bddf-220f2526c5bf@ecarx.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y0vM=Q4=citrix.com=prvs=948a3d738=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gwmzm-0004rT-Kf
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 11:58:30 +0000
Content-Disposition: inline
In-Reply-To: <9ee0e867-41c7-6474-bddf-220f2526c5bf@ecarx.com.cn>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: chengyan <yancheng@ecarx.com.cn>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMjEsIDIwMTkgYXQgMDY6MTM6MzJQTSArMDgwMCwgY2hlbmd5YW4gd3JvdGU6
Cj4gRGVhciBFeHBlcnQ6Cj4gCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IEkgd2FudCB0byBwb3J0aW5nIHRoZSBWaXJ0aW8gdG8gdGhlIFhFTiB2aWEgcmVmZXJlbmNlIHRv
Cj4gdGhlIGJlbG93IGxpbmtzLgo+IAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBodHRwczovL3dpa2kueGVuLm9yZy93aWtpL1ZpcnRpb19Pbl9YZW4uCgpUaGF0IHBhZ2Ug
aXMgdmVyeSBkYXRlZC4KPiAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqDCoCBJ
ZiBJIGhhdmUgcG9ydGVkIHRoZSBWaXJ0aW8gYXMgdGhlIGZvbGxvd2luZyBndWlkZXMKPiAsd2hl
dGhlciBpdCBtYXkgcmVhY2ggbXkgcmVxdWlyZW1lbnQsd2hpY2ggaXMgaW4gdGhlIEhWTSBndWVz
dD8KCldoYXQgYXJlIHlvdXIgcmVxdWlyZW1lbnRzPwoKU2VlaW5nIHRoYXQgeW91ciBjb21wYW55
IHNlZW1zIHRvIHdvcmsgb24gYXV0b21vdGl2ZSBwcm9qZWN0cywgSSBrbm93Ckp1bGllbiBmcm9t
IEFybSBoYXMgZG9uZSBzb21lIHdvcmsgZm9yIFhlbiBvbiBBcm0sIGlmIHlvdSBjYW4gYmUgbW9y
ZQpzcGVjaWZpYywgbWF5YmUgSnVsaWVuIGNhbiBnaXZlIHlvdSBhbiBhbnN3ZXI/CgpXZWkuCgo+
IAo+IAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE15IGV4cGVjdGVkIHJlc3Vs
dCBpcyB0aGF0IHZpc2l0IEkvTyB2aWEgdGhlIHZpcnRpby4gV291bGQKPiB5b3UgcGxlYXNlIGdp
dmUgbWUgYW5zd2VycyA/Cj4gCj4gVGhhbmtzLgo+IAo+IAo+IAoKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
PiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
