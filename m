From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v3 13/31] libxl_qmp: Separate QMP message
 generation from qmp_send_prepare
Date: Wed, 27 Jun 2018 15:45:33 +0100
Message-ID: <23347.41741.113014.754238@mariner.uk.xensource.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
 <20180601143720.24637-14-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7qrb=jn=citrix.com=prvs=709d59aa7=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fYBhY-0007wB-Gx
 for xen-devel@lists.xenproject.org; Wed, 27 Jun 2018 14:45:44 +0000
In-Reply-To: <20180601143720.24637-14-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYzIDEzLzMxXSBsaWJ4bF9xbXA6IFNlcGFy
YXRlIFFNUCBtZXNzYWdlIGdlbmVyYXRpb24gZnJvbSBxbXBfc2VuZF9wcmVwYXJlIik6Cj4gVGhp
cyBuZXcgZnVuY3Rpb24gcW1wX3ByZXBhcmVfcW1wX2NtZCgpIGNhbiBiZSByZXVzZSBsYXRlciB3
aGVuCj4gaW50cm9kdWNpbmcgYSBkaWZmZXJlbnQgd2F5IHRvIGNvbW11bmljYXRlIHdpdGggYSBR
TVAgc2VydmVyLAo+IGxpYnhsX19ldl9xbXAuCj4gCj4gQWxzbywgYWRkIHRoZSBRTVAgZW5kIG9m
IGNvbW1hbmQgJ1xyXG4nIGludG8gdGhlIGdlbmVyYXRlZCBzdHJpbmcuCgpXb3VsZCBpdCBiZSB0
ZXJyaWJseSBpbmNvbnZlbmllbnQgaWYgdGhpcyBmdW5jdGlvbgoKPiArc3RhdGljIGNoYXIgKnFt
cF9wcmVwYXJlX3FtcF9jbWQobGlieGxfX2djICpnYywKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3QgY2hhciAqY21kLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb25zdCBsaWJ4bF9fanNvbl9vYmplY3QgKmFyZ3MsCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGludCBpZCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc2l6ZV90ICpsZW5fcikKLi4uCj4gKyAgICByZXQgPSBsaWJ4bF9fbWFsbG9jKE5PR0Ms
IGxlbiArIDMpOwoKYWN0dWFsbHkgdXNlZCBpdHMgaW5jb21pbmcgZ2MgPyAgUGVyaGFwcyBpdCBu
ZWVkcyBhIDJuZCBnYyBhcmd1bWVudCA/CgpJIHRoaW5rIGZvciBmdXR1cmUgd2Ugc2hvdWxkIGJl
IHVzaW5nIHNvbWUgYXBwcm9wcmlhdGUgYW8gZ2MsIG9yCnNvbWV0aGluZywgZm9yIHRoZXNlIGJ1
ZmZlcnMuICBCdXQsIGFueXdheSwgdGhhdCBpcyBhIGZ1dHVyZQppbXByb3ZlbWVudCwgYW5kIG5v
dCBhIGJsb2NrZXIgZm9yIHRoaXMgcGF0Y2guCgpTbzoKCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8
aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
