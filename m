From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH 2/2] x86: use invpcid to do global flushing
Date: Mon, 12 Mar 2018 06:59:41 -0600
Message-ID: <5AA679BD0200007800129C56@prv-mh.provo.novell.com>
References: <20180305095032.30062-1-wei.liu2@citrix.com>
 <20180305095032.30062-3-wei.liu2@citrix.com>
 <5AA2B67302000078001B0567@suse.com>
 <4fb72f31-683d-1de3-db90-4788a379b0bd@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=8lwx=gc=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1evN3P-0004lv-E5
 for xen-devel@lists.xenproject.org; Mon, 12 Mar 2018 12:59:51 +0000
In-Reply-To: <4fb72f31-683d-1de3-db90-4788a379b0bd@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: andrew.cooper3@citrix.com, wei.liu2@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4gMDMvMDkvMTggNzowNSBQTSA+Pj4K
Pk9uIDA5LzAzLzE4IDE2OjI5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDUuMDMuMTgg
YXQgMTA6NTAsIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3cm90ZToKPj4+IEBAIC0xMjAsMTEgKzEy
MSwyNCBAQCB1bnNpZ25lZCBpbnQgZmx1c2hfYXJlYV9sb2NhbChjb25zdCB2b2lkICp2YSwgdW5z
aWduZWQgaW50IGZsYWdzKQo+Pj4gICAgICAgICAgZWxzZQo+Pj4gICAgICAgICAgewo+Pj4gICAg
ICAgICAgICAgIHUzMiB0ID0gcHJlX2ZsdXNoKCk7Cj4+PiAtICAgICAgICAgICAgdW5zaWduZWQg
bG9uZyBjcjQgPSByZWFkX2NyNCgpOwo+Pj4gIAo+Pj4gLSAgICAgICAgICAgIHdyaXRlX2NyNChj
cjQgJiB+WDg2X0NSNF9QR0UpOwo+Pj4gLSAgICAgICAgICAgIGJhcnJpZXIoKTsKPj4+IC0gICAg
ICAgICAgICB3cml0ZV9jcjQoY3I0KTsKPj4+ICsgICAgICAgICAgICBpZiAoICFjcHVfaGFzX2lu
dnBjaWQgKQo+Pj4gKyAgICAgICAgICAgIHsKPj4+ICsgICAgICAgICAgICAgICAgdW5zaWduZWQg
bG9uZyBjcjQgPSByZWFkX2NyNCgpOwo+Pj4gKwo+Pj4gKyAgICAgICAgICAgICAgICB3cml0ZV9j
cjQoY3I0ICYgflg4Nl9DUjRfUEdFKTsKPj4+ICsgICAgICAgICAgICAgICAgYmFycmllcigpOwo+
Pj4gKyAgICAgICAgICAgICAgICB3cml0ZV9jcjQoY3I0KTsKPj4+ICsgICAgICAgICAgICB9Cj4+
PiArICAgICAgICAgICAgZWxzZQo+Pj4gKyAgICAgICAgICAgIHsKPj4+ICsgICAgICAgICAgICAg
ICAgLyoKPj4+ICsgICAgICAgICAgICAgICAgICogVXNpbmcgaW52cGNpZCB0byBmbHVzaCBhbGwg
bWFwcGluZ3Mgd29ya3MKPj4+ICsgICAgICAgICAgICAgICAgICogcmVnYXJkbGVzcyBvZiB3aGV0
aGVyIFBDSUQgaXMgZW5hYmxlZCBvciBub3QuCj4+PiArICAgICAgICAgICAgICAgICAqIEl0IGlz
IGZhc3RlciB0aGFuIHJlYWQtbW9kaWZ5LXdyaXRlIENSNC4KPj4+ICsgICAgICAgICAgICAgICAg
ICovCj4+PiArICAgICAgICAgICAgICAgIGludnBjaWRfZmx1c2hfYWxsKCk7Cj4+PiArICAgICAg
ICAgICAgfQo+PiAKPj4gQXMganVzdCB2YWxpZGx5IGluZGljYXRlZCBieSBKw7xyZ2VuLCB0aGlz
IGlzIHdoZXJlIG15IGNvbW1lbnQgSQo+PiBnYXZlIHRvIG9uZSBvZiBoaXMgcGF0Y2hlcyBhY3R1
YWxseSBiZWxvbmdzOiBUaGlzIGlzIGNvcnJlY3QgZm9yCj4+IEZMVVNIX1RMQl9HTE9CQUwsIGJ1
dCBnb2VzIHRvbyBmYXIgZm9yIEZMVVNIX1RMQi4KPgo+QW5kIGFnYWluIGl0IHdhcyBzbyBldmVu
IGJlZm9yZSB0aGlzIHBhdGNoLgoKTm90IGV4YWN0bHkgLSAiYmVmb3JlIHRoaXMgcGF0Y2giIHNo
b3VsZCBpbmNsdWRlIHRoZSBzdGF0ZSB0aGluZ3Mgd2VyZSBpbiBiZWZvcmUKMzItYml0IGNvZGUg
Z290IHJlbW92ZWQuIEFuZCB0aGF0J3Mgd2hlcmUgd2UgaGFkIGEgcHJvcGVyIHNlcGFyYXRpb24g
YmV0d2VlbgpmbHVzaGVzIGluY2x1ZGluZyBhbmQgZXhjbHVkaW5nIGdsb2JhbCBlbnRyaWVzLiBB
bmQgbm93IHRoYXQgd2UgcmVnYWluIHRoYXQKYWJpbGl0eSwgd2Ugc2hvdWxkIGxldmVyYWdlIGl0
LgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
