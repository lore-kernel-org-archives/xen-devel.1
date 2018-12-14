From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH for-4.12 v2 2/2] xen/arm: Stop relocating Xen
Date: Fri, 14 Dec 2018 18:13:25 +0200
Message-ID: <a3f012fa-0fcd-dd1a-e29a-dedc5d9993a6@gmail.com>
References: <20181214114455.5841-1-julien.grall@arm.com>
 <20181214114455.5841-3-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181214114455.5841-3-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xen.org
Cc: Matthew Daley <mattd@bugfuzz.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMTQuMTIuMTggMTM6NDQsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBBdCB0aGUgbW9tZW50LCBY
ZW4gaXMgcmVsb2NhdGVkIHRvd2FyZHMgdGhlIGVuZCBvZiB0aGUgbWVtb3J5LiBXaGlsZQo+IHRo
aXMgaGFzIHRoZSBhZHZhbnRhZ2UgdG8gZnJlZSBzcGFjZSBpbiBsb3cgbWVtb3J5LCB0aGUgY29k
ZSBpcyBub3QKPiBjb21wbGlhbnQgd2l0aCB0aGUgYnJlYWstYmVmb3JlLW1ha2UgYmVjYXVzZSBp
dCByZXF1aXJlcyB0byBzd2l0Y2gKPiBiZXR3ZWVuIHR3byBzZXRzIG9mIHBhZ2UtdGFibGUuIFRo
aXMgaXMgbm90IGVudGlyZWx5IHRyaXZpYWwgdG8gZml4IGFzCj4gaXQgd291bGQgcmVxdWlyZSB1
cyB0byBnbyB0aHJvdWdoIGFuIGlkZW50aXR5IG1hcHBpbmcgYW5kIGRpc2FibGluZyBNTVUuCj4g
Cj4gRnVydGhlcm1vcmUsIGl0IGxvb2tzIGxpa2UgdGhhdCBzb21lIHBsYXRmb3JtIChzdWNoIGFz
IHRoZSBIaWtleTk2MCkKPiBtYXkgbm90IGJlIGFibGUgdG8gYnJpbmctdXAgc2Vjb25kYXJ5IENQ
VXMgaWYgdGhlIGVudHJ5IGlzIHRvbyBoaWdoLgo+IAo+IEkgZG9uJ3QgYmVsaWV2ZSB0aGUgbG93
IG1lbW9yeSBpcyBhbiBpc3N1ZSBiZWNhdXNlIFhlbiBpcyBxdWl0ZSB0aW55Cj4gKDwgMk1CKS4g
U28gdGhlIGJlc3Qgc29sdXRpb24gaXMgdG8gc3RvcCByZWxvY2F0aW5nIFhlbi4gVGhpcyBoYXMg
dGhlCj4gYWR2YW50YWdlIHRvIHNpbXBsaWZ5IHRoZSBjb2RlIGFuZCBzaG91bGQgc3BlZWQtdXAg
dGhlIGJvb3QgYXMgcmVsb2NhdGlvbgo+IGlzIG5vdCBuZWNlc3NhcnkgYW55bW9yZS4KPiAKPiBO
b3RlIHRoYXQgdGhlIGJyZWFrLWJlZm9yZS1tYWtlIGlzc3VlIGlzIG5vdCBmaXhlZCBieSB0aGlz
IHBhdGNoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+Cj4gUmVwb3J0ZWQtYnk6IE1hdHRoZXcgRGFsZXkgPG1hdHRkQGJ1Z2Z1enouY29tPgo+
IFRlc3RlZC1ieTogTWF0dGhldyBEYWxleSA8bWF0dGRAYnVnZnV6ei5jb20+CgpUZXN0ZWQtYnk6
IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+ClJldmlld2VkLWJ5OiBBbmRy
aWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0gClNpbmNlcmVseSwKQW5kcmlp
IEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
