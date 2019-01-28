From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v4 09/11] x86/vioapic: block
 speculative out-of-bound accesses
Date: Mon, 28 Jan 2019 04:12:17 -0700
Message-ID: <5C4EE3910200007800211A78@prv1-mh.provo.novell.com>
References: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
 <1548244655-32180-9-git-send-email-nmanthey@amazon.de>
 <5C4B3A7E0200007800211397@prv1-mh.provo.novell.com>
 <edf43e60-ce9c-ec36-4c48-9e240d2d2158@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ayfn=QE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1go4q1-0007UZ-9Q
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 11:12:25 +0000
In-Reply-To: <edf43e60-ce9c-ec36-4c48-9e240d2d2158@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjAxLjE5IGF0IDEyOjAzLCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBP
biAxLzI1LzE5IDE3OjM0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjMuMDEuMTkgYXQg
MTI6NTcsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+Pj4gQEAgLTIxMiw3ICsyMTcsMTIg
QEAgc3RhdGljIHZvaWQgdmlvYXBpY193cml0ZV9yZWRpcmVudCgKPj4+ICAgICAgc3RydWN0IGh2
bV9pcnEgKmh2bV9pcnEgPSBodm1fZG9tYWluX2lycShkKTsKPj4+ICAgICAgdW5pb24gdmlvYXBp
Y19yZWRpcl9lbnRyeSAqcGVudCwgZW50Owo+Pj4gICAgICBpbnQgdW5tYXNrZWQgPSAwOwo+Pj4g
LSAgICB1bnNpZ25lZCBpbnQgZ3NpID0gdmlvYXBpYy0+YmFzZV9nc2kgKyBpZHg7Cj4+PiArICAg
IHVuc2lnbmVkIGludCBnc2k7Cj4+PiArCj4+PiArICAgIC8qIE1ha2Ugc3VyZSBubyBvdXQtb2Yt
Ym91bmQgdmFsdWUgZm9yIGlkeCBjYW4gYmUgdXNlZCAqLwo+Pj4gKyAgICBpZHggPSBhcnJheV9p
bmRleF9ub3NwZWMoaWR4LCB2aW9hcGljLT5ucl9waW5zKTsKPj4+ICsKPj4+ICsgICAgZ3NpID0g
dmlvYXBpYy0+YmFzZV9nc2kgKyBpZHg7Cj4+IEkgZGlzbGlrZSB0aGUgZGlzY29ubmVjdCBmcm9t
IHRoZSByZXNwZWN0aXZlIGJvdW5kcyBjaGVjazogVGhlcmUncwo+PiBvbmx5IG9uZSBjYWxsZXIs
IHNvIHRoZSBjb25zdHJ1Y3QgY291bGQgYmUgbW92ZWQgdGhlcmUsIG9yCj4+IG90aGVyd2lzZSBJ
J2QgbGlrZSB0byBzZWUgYW4gQVNTRVJUKCkgYWRkZWQgZG9jdW1lbnRpbmcgdGhhdCB0aGUKPj4g
Ym91bmRzIGNoZWNrIGlzIGV4cGVjdGVkIHRvIGhhdmUgaGFwcGVuZWQgaW4gdGhlIGNhbGxlci4K
PiBJIGFncmVlIHRoYXQgdGhlIGlkeCB2YWx1ZSBpcyB1c2VkIGFzIGFuIGFycmF5IGluZGV4IGlu
IHRoaXMgZnVuY3Rpb24KPiBvbmx5IG9uY2UuIEhvd2V2ZXIsIHRoZSBnc2kgdmFsdWUgYWxzbyB1
c2VzIHRoZSB2YWx1ZSBvZiBpZHgsIGFuZCBhcwo+IHRoYXQgaXMgcGFzc2VkIHRvIG90aGVyIGZ1
bmN0aW9ucywgSSB3YW50IHRvIGJvdW5kIHRoZSBnc2kgdmFyaWFibGUgYXMKPiB3ZWxsLiBUaGVy
ZWZvcmUsIEkgY2hvc2UgdG8gaGF2ZSBhIHNlcGFyYXRlIGFzc2lnbm1lbnQgZm9yIHRoZSBpZHgg
dmFyaWFibGUuCgpJIGRvbid0IG1pbmQgdGhlIHNlcGFyYXRlIGFzc2lnbm1lbnQsIGFuZCBJIGRp
ZG4ndCBjb21wbGFpbgphYm91dCBpZHggYmVpbmcgdXNlZCBqdXN0IG9uY2UuIFdoYXQgSSBzYWlk
IGlzIHRoYXQgdGhlcmUncwpvbmx5IG9uZSBjYWxsZXIgb2YgdGhlIGZ1bmN0aW9uLiBJZiB0aGUg
Ym91bmRzIGNoZWNraW5nIHdhcwpkb25lIHRoZXJlLCAiZ3NpIiBoZXJlIHdvdWxkIGJlIGVxdWFs
bHkgImJvdW5kZWQiIGFmYWljdC4KQW5kIEkgZGlkIHN1Z2dlc3QgYW4gYWx0ZXJuYXRpdmUgaW4g
Y2FzZSB5b3UgZGlzbGlrZSB0aGUKbW92aW5nIG9mIHRoZSBjb25zdHJ1Y3QgeW91IGFkZC4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
