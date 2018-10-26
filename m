From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 3/5] tools/dm_restrict: Unshare mount and
 IPC namespaces on Linux
Date: Fri, 26 Oct 2018 17:18:25 +0100
Message-ID: <a8eabfac-4c12-8169-dcc9-94c84601117a@citrix.com>
References: <20181005165701.28030-1-george.dunlap@citrix.com>
 <20181005165701.28030-3-george.dunlap@citrix.com>
 <23507.7688.971275.583113@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rdbn=ng=citrix.com=prvs=830c459d6=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gG4ol-0007da-Sm
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 16:18:35 +0000
In-Reply-To: <23507.7688.971275.583113@mariner.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMjYvMjAxOCAwMzowMCBQTSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gVGhhbmtzLCBqdXN0
IHRpbnkgY29tbWVudHMgb24gdGhpcy4KPiAKPiBHZW9yZ2UgRHVubGFwIHdyaXRlcyAoIltQQVRD
SCAzLzVdIHRvb2xzL2RtX3Jlc3RyaWN0OiBVbnNoYXJlIG1vdW50IGFuZCBJUEMgbmFtZXNwYWNl
cyBvbiBMaW51eCIpOgo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfZG0uYyBiL3Rv
b2xzL2xpYnhsL2xpYnhsX2RtLmMKPj4gaW5kZXggMzg1NjQzYjUyYy4uNzAyZWE3NTE0OSAxMDA2
NDQKPj4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfZG0uYwo+PiArKysgYi90b29scy9saWJ4bC9s
aWJ4bF9kbS5jCj4+IEBAIC0yMzkzLDYgKzIzOTMsMTIgQEAgcmV0cnlfdHJhbnNhY3Rpb246Cj4+
ICAgICAgICAgIGdvdG8gb3V0X2Nsb3NlOwo+PiAgICAgIGlmICghcmMpIHsgLyogaW5uZXIgY2hp
bGQgKi8KPj4gICAgICAgICAgc2V0c2lkKCk7Cj4+ICsgICAgICAgIGlmIChsaWJ4bF9kZWZib29s
X3ZhbChiX2luZm8tPmRtX3Jlc3RyaWN0KSkKPj4gKyAgICAgICAgewo+IAo+IFN0eWxlOiBtaXNw
bGFjZWQgey4KPiAKPj4gKyAgICAgICAgICAgIGlmIChyYyAhPSAwKQo+PiArICAgICAgICAgICAg
ICAgIF9leGl0KC0xKTsKPiAKPiBJIHdvbid0IGluc2lzdCBvbiBhIGNoYW5nZSBoZXJlLCBzaW5j
ZSBDT0RJTkdfU1RZTEUgaXMgbm90IGV4cGxpY2l0LAo+IGJ1dCB5b3UgbWF5IHdhbnQgdG8gdGFr
ZSBub3RlIG9mIHRoZXNlIHN0YXRpc3RpY3M6Cj4gCj4gJCBnaXQtZ3JlcCAnaWYgKHJjKScgdG9v
bHMvbGlieGwgfCB3YyAtbAo+IDUyMAo+ICQgZ2l0LWdyZXAgJ2lmIChyYyAhPSAwKScgdG9vbHMv
bGlieGwgfCB3YyAtbAo+IDIzCj4gCj4+ICtpbnQgbGlieGxfX2xvY2FsX2RtX3ByZWV4ZWNfcmVz
dHJpY3QobGlieGxfX2djICpnYykKPj4gK3sKPj4gKyAgICBpbnQgcjsKPj4gKwo+PiArICAgIC8q
IFVuc2hhcmUgbW91bnQgYW5kIElQQyBuYW1lc3BhY2VzLiAgVGhlc2UgYXJlIHVudXNlZCBieSBR
RU1VLiAqLwo+PiArICAgIHIgPSB1bnNoYXJlKENMT05FX05FV05TIHwgQ0xPTkVfTkVXSVBDKTsK
Pj4gKyAgICBpZiAociA8IDApIHsKPj4gKyAgICAgICAgTE9HRShFUlJPUiwgImxpYnhsOiBNb3Vu
dCBhbmQgSVBDIG5hbWVzcGFjZSB1bmZhaWxlZCIpOwo+IAo+IEkgdGhpbmsgSSB3b3VsZCBzbGln
aHRseSBwcmVmZXIKPiAgICsgICAgaWYgKHIpIHsKPiAKPiB1bnNoYXJlIGlzIHN1cHBvc2VkIHRv
IHJldHVybiAtMSBvciAwIHNvIHRoaXMgc2hvdWxkIG1ha2Ugbm8KPiBkaWZmZXJlbmNlLiAgSWYg
aXQgZG9lcyBzb21ldGhpbmcgZWxzZSB3ZSBzaG91bGQgbm90IGNhcnJ5IG9uLiAgSXQncwo+IHVu
bGlrZWx5IGVub3VnaCB0aGF0IEkgZG9uJ3QgbWluZCBpdCBwcmludGluZyBhIGdhcmJhZ2UgZXJy
bm8gdmFsdWUgaW4KPiB0aGF0IGNhc2UuCgpBbGwgdGhyZWUgZG9uZS4KCj4gQWNrZWQtYnk6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKVGhhbmtzLAogLUdlb3JnZQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
