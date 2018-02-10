From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 2/2] xen: xenbus: WARN_ON
 XS_TRANSACTION_{START, END} misuse
Date: Sat, 10 Feb 2018 11:57:35 -0500
Message-ID: <8a0fd059-7acf-3279-10f9-649c19522e2a__27926.4377699748$1518281802$gmane$org@oracle.com>
References: <20180207222236.7434-1-simon@invisiblethingslab.com>
 <20180207222236.7434-2-simon@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=p1hp=fe=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ekYTD-0001m2-Mm
 for xen-devel@lists.xenproject.org; Sat, 10 Feb 2018 16:57:47 +0000
In-Reply-To: <20180207222236.7434-2-simon@invisiblethingslab.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Simon Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMi8wNy8yMDE4IDA1OjIyIFBNLCBTaW1vbiBHYWlzZXIgd3JvdGU6Cj4gQXMgdGhlIHBy
ZXZpb3VzIGNvbW1pdCBzaG93cyBpdCdzIHF1aXRlIGVhc3kgdG8gY29uZnVzZSB0aGUgdHJhbnNh
Y3Rpb24KPiByZWZlcmVuY2UgY291bnRpbmcgYnkgZW5kaW5nIGEgdHJhbnNhY3Rpb24gdHdpY2Uu
IFNvIGF0IGxlYXN0IHRyeSB0bwo+IGRldGVjdCBhbmQgcmVwb3J0IGl0Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFNpbW9uIEdhaXNlciA8c2ltb25AaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KPiAtLS0K
PiAgIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfeHMuYyB8IDkgKysrKysrKysrCj4gICAxIGZp
bGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVu
L3hlbmJ1cy94ZW5idXNfeHMuYyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfeHMuYwo+IGlu
ZGV4IDNlNTk1OTBjNzI1NC4uYWVkOTU0YjA5YjliIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMveGVu
L3hlbmJ1cy94ZW5idXNfeHMuYwo+ICsrKyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfeHMu
Ywo+IEBAIC0xMzcsMTEgKzEzNywyMCBAQCBzdGF0aWMgdWludDMyX3QgeHNfcmVxdWVzdF9lbnRl
cihzdHJ1Y3QgeGJfcmVxX2RhdGEgKnJlcSkKPiAgIAo+ICAgdm9pZCB4c19yZXF1ZXN0X2V4aXQo
c3RydWN0IHhiX3JlcV9kYXRhICpyZXEpCj4gICB7Cj4gKwl1bnNpZ25lZCBpbnQgdXNlcnNfb2xk
Owo+ICsKPiAgIAlzcGluX2xvY2soJnhzX3N0YXRlX2xvY2spOwo+ICsJdXNlcnNfb2xkID0geHNf
c3RhdGVfdXNlcnM7Cj4gICAJeHNfc3RhdGVfdXNlcnMtLTsKPiAgIAlpZiAoKHJlcS0+dHlwZSA9
PSBYU19UUkFOU0FDVElPTl9TVEFSVCAmJiByZXEtPm1zZy50eXBlID09IFhTX0VSUk9SKSB8fAo+
ICAgCSAgICByZXEtPnR5cGUgPT0gWFNfVFJBTlNBQ1RJT05fRU5EKQo+ICAgCQl4c19zdGF0ZV91
c2Vycy0tOwo+ICsJaWYgKFdBUk5fT04oeHNfc3RhdGVfdXNlcnMgPiB1c2Vyc19vbGQpKQoKCldB
Uk5fT05fT05DRSgpPwoKLWJvcmlzCgoKPiArCQkvKgo+ICsJCSAqIFNvbWVvbmUgbWlzdXNlZCBY
U19UUkFOU0FDVElPTl97U1RBUlQsRU5EfS4gUmVzZXQgdGhlCj4gKwkJICogcmVmZXJlbmNlIGNv
dW50ZXIgc28gd2UgbWlnaHQgc3Vydml2ZS4KPiArCQkgKi8KPiArCQl4c19zdGF0ZV91c2VycyA9
IDA7Cj4gICAJc3Bpbl91bmxvY2soJnhzX3N0YXRlX2xvY2spOwo+ICAgCj4gICAJaWYgKHhzX3N1
c3BlbmRfYWN0aXZlICYmICF4c19zdGF0ZV91c2VycykKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
