From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v5 1/3] xen: Sync up with the canonical
 protocol definitions in Xen
Date: Tue, 12 Jun 2018 15:46:10 +0200
Message-ID: <9c579567-ebe2-f465-5443-b3a3e71d34a5__13521.2926347323$1528811101$gmane$org@suse.com>
References: <20180612074856.28451-1-andr2000@gmail.com>
 <20180612074856.28451-2-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=w5bd=i6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fSjcl-00019y-6s
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 13:46:15 +0000
In-Reply-To: <20180612074856.28451-2-andr2000@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com, lyan@suse.com, boris.ostrovsky@oracle.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, andrii_chepurnyi@epam.com
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMDYvMTggMDk6NDgsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+IEZyb206
IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNv
bT4KPiAKPiBUaGlzIGlzIHRoZSBzeW5jIHVwIHdpdGggdGhlIGNhbm9uaWNhbCBkZWZpbml0aW9u
cyBvZiB0aGUgaW5wdXQsCj4gc291bmQgYW5kIGRpc3BsYXkgcHJvdG9jb2xzIGluIFhlbi4KPiAK
PiBDaGFuZ2VzIHRvIGtiZGlmOgo+IDEuIEFkZCBtaXNzaW5nIHN0cmluZyBjb25zdGFudHMgZm9y
IHtmZWF0dXJlfHJlcXVlc3R9LXJhdy1wb2ludGVyCj4gICAgdG8gYWxpZ24gd2l0aCB0aGUgcmVz
dCBvZiB0aGUgaW50ZXJmYWNlIGZpbGUuCj4gCj4gMi4gQWRkIG5ldyBYZW5TdG9yZSBmZWF0dXJl
IGZpZWxkcywgc28gaXQgaXMgcG9zc2libGUgdG8gaW5kaXZpZHVhbGx5Cj4gICAgY29udHJvbCBz
ZXQgb2YgZXhwb3NlZCB2aXJ0dWFsIGRldmljZXMgZm9yIGVhY2ggZ3Vlc3QgT1M6Cj4gICAgICAt
IHNldCBmZWF0dXJlLWRpc2FibGUta2V5Ym9hcmQgdG8gMSBpZiBubyBrZXlib2FyZCBkZXZpY2Ug
bmVlZHMKPiAgICAgICAgdG8gYmUgY3JlYXRlZAo+ICAgICAgLSBzZXQgZmVhdHVyZS1kaXNhYmxl
LXBvaW50ZXIgdG8gMSBpZiBubyBwb2ludGVyIGRldmljZSBuZWVkcwo+ICAgICAgICB0byBiZSBj
cmVhdGVkCj4gCj4gMy4gTW92ZSBtdWx0aS10b3VjaCBkZXZpY2UgcGFyYW1ldGVycyB0byBiYWNr
ZW5kIG5vZGVzOiB0aGVzZSBhcmUKPiAgICAgZGVzY3JpYmVkIGFzIGEgcGFydCBvZiBmcm9udGVu
ZCdzIFhlbkJ1cyBjb25maWd1cmF0aW9uIG5vZGVzCj4gICAgIHdoaWxlIHRoZXkgYmVsb25nIHRv
IGJhY2tlbmQncyBjb25maWd1cmF0aW9uLiBGaXggdGhpcyBieSBtb3ZpbmcKPiAgICAgdGhlIHBh
cmFtZXRlcnMgdG8gdGhlIHByb3BlciBzZWN0aW9uLgo+IAo+IFVuaXF1ZS1pZCBmaWVsZDoKPiAx
LiBBZGQgdW5pcXVlLWlkIFhlbkJ1cyBlbnRyeSBmb3IgdmlydHVhbCBpbnB1dCBhbmQgZGlzcGxh
eS4KPiAKPiAyLiBDaGFuZ2UgdHlwZSBvZiB1bmlxdWUtaWQgZmllbGQgdG8gc3RyaW5nIGZvciBz
bmRpZiB0byBhbGlnbiB3aXRoCj4gZGlzcGxheSBhbmQgaW5wdXQgcHJvdG9jb2xzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNo
ZW5rb0BlcGFtLmNvbT4KPiBDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0Bv
cmFjbGUuY29tPgoKUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
CkknbSBmaW5lIHdpdGggdGhpcyBwYXRjaCBiZWluZyBhZGRlZCB2aWEgdGhlIGlucHV0IHRyZWUg
d2l0aCB0aGUgb3RoZXIKcGF0Y2hlcy4gSW4gY2FzZSBJIHNob3VsZCB0YWtlIGl0IHZpYSB0aGUg
WGVuIHRyZWUsIHBsZWFzZSBzZW5kIG1lIGEKbm90ZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
