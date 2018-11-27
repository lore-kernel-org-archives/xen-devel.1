From: PanBian <bianpan2016@163.com>
Subject: Re: [PATCH] pvcalls-front: fixes incorrect error
 handling
Date: Tue, 27 Nov 2018 08:58:23 +0800
Message-ID: <20181127005823.GB125510__30836.4405333579$1543280250$gmane$org@bp>
References: <1542852432-30019-1-git-send-email-bianpan2016@163.com>
 <1f765e81-ed89-d110-74b1-cc8029a4555f@oracle.com>
Reply-To: PanBian <bianpan2016@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/xni=og=163.com=bianpan2016@srs-us1.protection.inumbo.net>)
 id 1gRRht-0007b6-9X
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 00:58:29 +0000
Content-Disposition: inline
In-Reply-To: <1f765e81-ed89-d110-74b1-cc8029a4555f@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMjYsIDIwMTggYXQgMDM6MzE6MzlQTSAtMDUwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IE9uIDExLzIxLzE4IDk6MDcgUE0sIFBhbiBCaWFuIHdyb3RlOgo+ID4ga2ZyZWUo
KSBpcyBpbmNvcnJlY3RseSB1c2VkIHRvIHJlbGVhc2UgdGhlIHBhZ2VzIGFsbG9jYXRlZCBieQo+
ID4gX19nZXRfZnJlZV9wYWdlKCkgYW5kIF9fZ2V0X2ZyZWVfcGFnZXMoKS4gVXNlIHRoZSBtYXRj
aGluZyBkZWFsbG9jYXRvcnMKPiA+IGkuZS4sIGZyZWVfcGFnZSgpIGFuZCBmcmVlX3BhZ2VzKCks
IHJlc3BlY3RpdmVseS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQYW4gQmlhbiA8YmlhbnBhbjIw
MTZAMTYzLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYyB8IDQg
KystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYyBiL2RyaXZl
cnMveGVuL3B2Y2FsbHMtZnJvbnQuYwo+ID4gaW5kZXggMmYxMWNhNy4uNzcyMjRkOCAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYwo+ID4gKysrIGIvZHJpdmVycy94
ZW4vcHZjYWxscy1mcm9udC5jCj4gPiBAQCAtMzg1LDggKzM4NSw4IEBAIHN0YXRpYyBpbnQgY3Jl
YXRlX2FjdGl2ZShzdHJ1Y3Qgc29ja19tYXBwaW5nICptYXAsIGludCAqZXZ0Y2huKQo+ID4gIG91
dF9lcnJvcjoKPiA+ICAJaWYgKCpldnRjaG4gPj0gMCkKPiA+ICAJCXhlbmJ1c19mcmVlX2V2dGNo
bihwdmNhbGxzX2Zyb250X2RldiwgKmV2dGNobik7Cj4gPiAtCWtmcmVlKG1hcC0+YWN0aXZlLmRh
dGEuaW4pOwo+ID4gLQlrZnJlZShtYXAtPmFjdGl2ZS5yaW5nKTsKPiA+ICsJZnJlZV9wYWdlcygo
dW5zaWduZWQgbG9uZyltYXAtPmFjdGl2ZS5kYXRhLmluLCBQVkNBTExTX1JJTkdfT1JERVIpOwo+
IAo+IElzIG1hcC0+YWN0aXZlLmRhdGEuaW4gZ3VhcmFudGVlZCB0byBiZSBOVUxMIHdoZW4gZW50
ZXJpbmcgdGhpcyByb3V0aW5lPwoKSSBhbSBub3Qgc3VyZSB5ZXQuIFNvcnJ5IGZvciB0aGF0LiBJ
IG9ic2VydmVkIHRoZSBtaXNtYXRjaGVzIGJldHdlZW4KX19nZXRfZnJlZV9wYWdlIGFuZCBrZnJl
ZSwgYW5kIHN1Ym1pdHRlZCB0aGUgcGF0Y2guCgpCdXQgSSB0aGluayB5b3VyIGNvbnNpZGVyYXRp
b24gaXMgcmVhc29uYWJsZS4gQSBiZXR0ZXIgc29sdXRpb24gaXMgdG8KZGlyZWN0bHkgZnJlZSBi
eXRlcywgYSBsb2NhbCB2YXJpYWJsZSB0aGF0IGhvbGRzIF9fZ2V0X2ZyZWVfcGFnZXMgcmV0dXJu
CnZhbHVlLiBJZiB5b3UgYWdyZWUsIEkgd2lsbCByZXdyaXRlIHRoZSBwYXRjaC4KClRoYW5rcywK
UGFuCgo+IAo+IC1ib3Jpcwo+IAo+ID4gKwlmcmVlX3BhZ2UoKHVuc2lnbmVkIGxvbmcpbWFwLT5h
Y3RpdmUucmluZyk7Cj4gPiAgCXJldHVybiByZXQ7Cj4gPiAgfQo+ID4gIAo+IAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
