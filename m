From: Sergej Proskurin <proskurin@sec.in.tum.de>
Subject: Re: [PATCH v4 01/39] arm/p2m: Introduce
 p2m_(switch|restore)_vttbr_and_(g|s)et_flags
Date: Wed, 10 Jan 2018 13:45:46 +0100
Message-ID: <8af6a7f5-bc18-3beb-5242-bf6dfd362bef@sec.in.tum.de>
References: <20170830183258.14612-1-proskurin@sec.in.tum.de>
 <20170830183258.14612-2-proskurin@sec.in.tum.de>
 <815b6fec-0dbb-477c-8475-195003dc25a5@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=xplx=ef=sec.in.tum.de=proskurin@srs-us1.protection.inumbo.net>)
 id 1eZFlZ-0002UX-AR
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 12:46:01 +0000
In-Reply-To: <815b6fec-0dbb-477c-8475-195003dc25a5@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSnVsaWVuLAoKcGxlYXNlIGV4Y3VzZSBtZSBmb3IgdGhlIGxvbmcgZGVsYXkuCgpPbiAxMC8w
OS8yMDE3IDA2OjI1IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgU2VyZ2VqLAo+Cj4gT24g
MzAvMDgvMTcgMTk6MzIsIFNlcmdlaiBQcm9za3VyaW4gd3JvdGU6Cj4+IFRoaXMgY29tbWl0IGlu
dHJvZHVjZXMgbWFjcm9zIGZvciBzd2l0Y2hpbmcgYW5kIHJlc3RvcmluZyB0aGUgdnR0YnIKPj4g
Y29uc2lkZXJpbmcgdGhlIGN1cnJlbnRseSBzZXQgaXJxIGZsYWdzLiBXZSBkZWZpbmUgdGhlc2Ug
bWFjcm9zLCBhcyB0aGUKPj4gZm9sbG93aW5nIGNvbW1pdHMgd2lsbCB1c2UgdGhlIGFzc29jaWF0
ZWQgZnVuY3Rpb25hbGl0eSBtdWx0aXBsZSB0aW1lcwo+PiB0aHJvdWdob3V0IGRpZmZlcmVudCBm
aWxlcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogU2VyZ2VqIFByb3NrdXJpbiA8cHJvc2t1cmluQHNl
Yy5pbi50dW0uZGU+Cj4+IC0tLQo+PiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPgo+PiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
Pj4gLS0tCj4+IHY0OiBTYXZlIHRoZSBjb250ZW50IG9mIFZUVEJSX0VMMiBpbnNpZGUgb2YgdGhl
IGludHJvZHVjZWQgbWFjcm8KPj4gwqDCoMKgwqAgInAybV9zd2l0Y2hfdnR0YnJfYW5kX2dldF9m
bGFncyIuCj4+Cj4+IMKgwqDCoMKgIE1vdmUgdGhlIGludHJvZHVjZWQgbWFjcm9zIGludG8gLi94
ZW4vaW5jbHVkZS9hc20tYXJtL3AybS5oLCBhcwo+PiB0aGV5IHdpbGwKPj4gwqDCoMKgwqAgYmUg
dXNlZCBieSBkaWZmZXJlbnQgZmlsZXMgaW4gdGhlIGZ1dHVyZSBjb21taXRzLgo+Cj4gSSBkb24n
dCBsaWtlIHRoZSBpZGVhIG9mIG1vdmluZyBzdWNoIG1hY3JvcyBpbiBwMm0uaCBiZWNhdXNlIGl0
IGV4cG9zZQo+IHRoZSB1bmRlcmx5aW5nIGltcGxlbWVudGF0aW9uIG9mIFAyTS4KPgo+IEEgYmV0
dGVyIHNvbHV0aW9uIHdvdWxkIGJlIGludHJvZHVjZSBhIGhlbHBlciB0byB0cmFuc2xhdGUgZnJv
bSBhCj4gZ3Vlc3QgVkEgdG8gZ3Vlc3QgUEEgaW4gcDJtLmMuIFRoaXMgaGVscGVyIHdpbGwgc3dp
dGNoIHRvIHRoZSBob3N0IFAyTQo+IGlmIG5lY2Vzc2FyeS4KCkkgYWdyZWUsIHRoYW5rIHlvdS4g
VGhpcyB3b3VsZCBlbGltaW5hdGUgdGhlIHVubmVjZXNzYXJ5IG1hY3JvCmludm9jYXRpb25zIGlu
IG1lbV9hY2Nlc3MuYy4gSSB3aWxsIGluY2x1ZGUgc3VjaCB3cmFwcGVyIGluIHAybS5jIGluIHRo
ZQpuZXh0IHZlcnNpb24gb2YgdGhlIGFsdHAybSBwYXRjaCBzZXJpZXMuCgpEbyB5b3UgdGhpbmsg
aXQgd291bGQgbWFrZSBzZW5zZSB0byBzdWJtaXQgdGhlIHVwcGVyIG1hY3JvcyBmb3Igc2F2aW5n
CmFuZCByZXN0b3JpbmcgdGhlIFZUVEJSIGFuZCBmbGFncyBhcyBhIHN0YW5kYWxvbmUgcGF0Y2gg
aW4gZm9ybSBvZiBhCmNvc21ldGljIGZpeD8gVGhpcyB3b3VsZCBzaW1wbGlmeSB0aGUgZnVuY3Rp
b24gcDJtX2ZvcmNlX3RsYl9mbHVzaF9zeW5jCmluIHAybS5jLgoKVGhhbmtzLAp+U2VyZ2VqCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
