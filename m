From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v6 03/11] libxl_qmp: Change
 qmp_qemu_check_version to compare version
Date: Thu, 22 Nov 2018 12:24:29 +0000
Message-ID: <20181122122429.GE2448@perard.uk.xensource.com>
References: <20181112164930.25893-1-anthony.perard@citrix.com>
 <20181112164930.25893-4-anthony.perard@citrix.com>
 <23529.46821.437745.367327@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A1FS=OB=citrix.com=prvs=8577a9259=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gPo29-0001UC-TC
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 12:24:37 +0000
Content-Disposition: inline
In-Reply-To: <23529.46821.437745.367327@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMTIsIDIwMTggYXQgMDU6MjI6NDVQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHY2IDAzLzExXSBsaWJ4bF9xbXA6
IENoYW5nZSBxbXBfcWVtdV9jaGVja192ZXJzaW9uIHRvIGNvbXBhcmUgdmVyc2lvbiIpOgo+ID4g
VGhpcyBwYXRjaCBtYWtlcyB0aGUgZnVuY3Rpb24gc2ltcGxlciB0byByZWFkLiBJdCBhbHNvIGFk
ZCB0aGUgYWJpbGl0eQo+ID4gZm9yIGEgY2FsbGVyIHRvIHRlbGwgaWYgUUVNVSBpcyBuZXdlciBv
ciBoYXZlIHRoZSBleGFjdCB2ZXJzaW9uLgo+IAo+IEFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4KCkkgd2lsbCBhZGQgdGhlIGZvbGxvd2luZyB0byB0aGUg
ZG9jdW1lbnQgdG8gY2xhcmlmeSB3aGVuIGEgY2FsbGJhY2sgY2FuCmJlIGNhbGxlZCAobm90IHN5
bmNocm9ub3VzbHkpLgoKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaApAQCAtMzg4
LDUgKzM4OCw2IEBAIHN0cnVjdCBsaWJ4bF9fZXZfY2hpbGQgewogICogbGlieGxfX2V2X3FtcF9z
ZW5kOiBJZGxlL0Nvbm5lY3RlZCAtPiBBY3RpdmUgKG9uIGVycm9yOiBJZGxlKQogICogICAgU2Vu
ZHMgYSBjb21tYW5kIHRvIFFFTVUuCiAgKiAgICBjYWxsYmFjayB3aWxsIGJlIGNhbGxlZCB3aGVu
IGEgcmVzcG9uc2UgaXMgcmVjZWl2ZWQgb3Igd2hlbiBhbgogICogICAgZXJyb3IgYXMgb2NjdXJl
ZC4KKyAqICAgIGNhbGxiYWNrIGlzbid0IGNhbGxlZCBzeW5jaHJvbm91c2x5LgogICoKCgotLSAK
QW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
