From: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH] xen/acpi: off by one in read_acpi_id()
Date: Wed, 28 Mar 2018 13:08:51 +0100
Message-ID: <b8a2f028-8bbe-ae14-41ff-26c99850cba8@oracle.com>
References: <20180328114747.GB29050@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zybv=gs=oracle.com=joao.m.martins@srs-us1.protection.inumbo.net>)
 id 1f1AFr-0001qH-9I
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 12:32:39 +0000
In-Reply-To: <20180328114747.GB29050@mwanda>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, kernel-janitors@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMjgvMjAxOCAxMjo0NyBQTSwgRGFuIENhcnBlbnRlciB3cm90ZToKPiBJZiBhY3BpX2lk
IGlzID09IG5yX2FjcGlfYml0cywgdGhlbiB3ZSBhY2Nlc3Mgb25lIGVsZW1lbnQgYmV5b25kIHRo
ZSBlbmQKPiBvZiB0aGUgYWNwaV9wc2RbXSBhcnJheSBvciB3ZSBzZXQgb25lIGJpdCBiZXlvbmQg
dGhlIGVuZCBvZiB0aGUgYml0IG1hcAo+IHdoZW4gd2UgZG8gX19zZXRfYml0KGFjcGlfaWQsIGFj
cGlfaWRfY3N0X3ByZXNlbnQpOwo+IAouLi4gb3IgZXZlbiBhY3BpX2lkX3ByZXNlbnQgKHdoaWNo
IGNvbWVzIHJpZ2h0IGFmdGVyIHRoZSBjb25kaXRpb24geW91J3JlIGZpeGluZykuCgo+IEZpeGVz
OiA1OWE1NjgwMjkxODEgKCJ4ZW4vYWNwaS1wcm9jZXNzb3I6IEMgYW5kIFAtc3RhdGUgZHJpdmVy
IHRoYXQgdXBsb2FkcyBzYWlkIGRhdGEgdG8gaHlwZXJ2aXNvci4iKQo+IFNpZ25lZC1vZmYtYnk6
IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPiAKRldJVywKClJldmll
d2VkLWJ5OiBKb2FvIE1hcnRpbnMgPGpvYW8ubS5tYXJ0aW5zQG9yYWNsZS5jb20+Cgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3hlbi94ZW4tYWNwaS1wcm9jZXNzb3IuYyBiL2RyaXZlcnMveGVuL3hl
bi1hY3BpLXByb2Nlc3Nvci5jCj4gaW5kZXggYzgwMTk1ZThmYmQxLi5kMjNjOWMxNTAxOTkgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy94ZW4veGVuLWFjcGktcHJvY2Vzc29yLmMKPiArKysgYi9kcml2
ZXJzL3hlbi94ZW4tYWNwaS1wcm9jZXNzb3IuYwo+IEBAIC0zNjQsNyArMzY0LDcgQEAgcmVhZF9h
Y3BpX2lkKGFjcGlfaGFuZGxlIGhhbmRsZSwgdTMyIGx2bCwgdm9pZCAqY29udGV4dCwgdm9pZCAq
KnJ2KQo+ICAJfQo+ICAJLyogVGhlcmUgYXJlIG1vcmUgQUNQSSBQcm9jZXNzb3Igb2JqZWN0cyB0
aGFuIGluIHgyQVBJQyBvciBNQURULgo+ICAJICogVGhpcyBjYW4gaGFwcGVuIHdpdGggaW5jb3Jy
ZWN0IEFDUEkgU1NEVCBkZWNsZXJhdGlvbnMuICovCj4gLQlpZiAoYWNwaV9pZCA+IG5yX2FjcGlf
Yml0cykgewo+ICsJaWYgKGFjcGlfaWQgPj0gbnJfYWNwaV9iaXRzKSB7Cj4gIAkJcHJfZGVidWco
IldlIG9ubHkgaGF2ZSAldSwgdHJ5aW5nIHRvIHNldCAldVxuIiwKPiAgCQkJIG5yX2FjcGlfYml0
cywgYWNwaV9pZCk7Cj4gIAkJcmV0dXJuIEFFX09LOwo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
