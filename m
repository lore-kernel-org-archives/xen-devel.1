From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v4 00/20] x86: emulator enhancements
Date: Fri, 2 Mar 2018 11:21:01 +0200
Message-ID: <43d0151b-e96a-4892-3890-27eb1a67ae4d@bitdefender.com>
References: <5A96B3B902000078001ACB6D@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ucut=fy=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1ergsK-0001R7-8P
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 09:21:12 +0000
Received: from smtp01.buh.bitdefender.com (smtp.bitdefender.biz [10.17.80.75])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 824A57FC41
 for <xen-devel@lists.xenproject.org>; Fri,  2 Mar 2018 11:21:03 +0200 (EET)
In-Reply-To: <5A96B3B902000078001ACB6D@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjgvMjAxOCAwMjo1MCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gMDE6IGV4dGVuZCB2
YnJvYWRjYXN0c3tzLGR9IHRvIEFWWDIKPiAwMjogc3VwcG9ydCBtb3N0IHJlbWFpbmluZyBBVlgy
IGluc25zCj4gMDM6IHN1cHBvcnQgQVZYMiBnYXRoZXIgaW5zbnMKPiAwNDogc3VwcG9ydCBYT1Ag
aW5zbnMKPiAwNTogc3VwcG9ydCAzRE5vdyEgaW5zbnMKPiAwNjogcGxhY2UgdGVzdCBibG9icyBp
biBleGVjdXRhYmxlIHNlY3Rpb24KPiAwNzogbW92ZSBhbmQgcmVuYW1lIFhTVEFURV8qCj4gMDg6
IGFic3RyYWN0IG91dCBYQ1JuIGFjY2Vzc2VzCj4gMDk6IGFkanVzdF9ibmQoKSBzaG91bGQgY2hl
Y2sgWENSMAo+IDEwOiBtYWtlIGFsbCBGUFUgZW11bGF0aW9uIHVzZSB0aGUgc3R1Ygo+IDExOiBl
bGltaW5hdGUgY3VzdG9tICNNRi8jWE0gaGFuZGxpbmcKPiAxMjogc3VwcG9ydCBTV0FQR1MKPiAx
MzogdGVsbCBjbXB4Y2hnIGhvb2sgd2hldGhlciBMT0NLIGlzIGluIGVmZmVjdAo+IDE0OiBjb252
ZXJ0IHBhZ2UgdGFibGUgZW11bGF0aW9uIGNvZGUgZnJvbSBwYWRkcl90IHRvIGludHB0ZV90Cj4g
MTU6IGNvcnJlY3RseSBoYW5kbGUgQ01QWENIRyogY29tcGFyaXNvbiBmYWlsdXJlcwo+IDE2OiBh
ZGQgcmVhZC1tb2RpZnktd3JpdGUgaG9vawo+IDE3OiB4ODYvSFZNOiBkbyBhY3R1YWwgQ01QWENI
RyBpbiBodm1lbXVsX2NtcHhjaGcoKQo+IDE4OiB4ODYvSFZNOiBtYWtlIHVzZSBvZiBuZXcgcmVh
ZC1tb2RpZnktd3JpdGUgZW11bGF0b3IgaG9vawo+IDE5OiB4ODYvc2hhZG93OiBmdWxseSBtb3Zl
IHVubWFwLWRlc3QgaW50byBjb21tb24gY29kZQo+IDIwOiB4ODYvc2hhZG93OiBmb2xkIHNoX3g4
Nl9lbXVsYXRlX3t3cml0ZSxjbXB4Y2hnfSgpIGludG8gdGhlaXIgb25seSBjYWxsZXJzCj4gCj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKRldJVywgSSd2
ZSB0ZXN0LWRyaXZlbiB0aGlzIHNlcmllcyB3aXRoIG91ciBpbnRyb3NwZWN0aW9uIGFnZW50IGZv
ciB0aGUKbGFzdCBjb3VwbGUgb2YgZGF5cywgYW5kIGl0IGRvZXMgc29sdmUgdGhlIGVtdWxhdGlv
biByYWNlIGNvbmRpdGlvbgpwcm9ibGVtIHdlJ3ZlIGRpc2N1c3NlZCBwcmV2aW91c2x5LgoKClRo
YW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
