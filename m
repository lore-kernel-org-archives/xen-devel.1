From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/3] x86emul: consolidate CR4 handling
Date: Mon, 3 Dec 2018 19:37:07 +0000
Message-ID: <602cf33d-9139-75e2-db63-581d5049d999@citrix.com>
References: <5BDC7E5802000078001F75BA@prv1-mh.provo.novell.com>
 <5BE1981502000078001F89C7@prv1-mh.provo.novell.com>
 <5BE19AFD02000078001F8A10@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rgki=om=citrix.com=prvs=868a16509=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gTu2k-00053R-OS
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 19:38:10 +0000
In-Reply-To: <5BE19AFD02000078001F8A10@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTEvMjAxOCAxMzo0NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gTm93IHRoYXQgdGhlcmUn
cyBhbiBhbG1vc3QgdW5jb25kaXRpb25hbCBDUjQgcmVhZCByaWdodCBhdCB0aGUgYmVnaW5uaW5n
Cj4gb2YgeDg2X2VtdWxhdGUoKSwgY2VudHJhbGl6ZSBpdHMgcmVhZGluZyB0aGVyZSBhbmQgdXNl
IHJlc3VsdCBhbmQgdmFsdWUKPiBldmVyeXdoZXJlIGVsc2Ugd2l0aG91dCBmdXJ0aGVyIGludm9r
aW5nIHRoZSBob29rLgo+Cj4gU3Vic2VxdWVudGx5IHdlIG1heSB3YW50IHRvIGNvbnNpZGVyIGhh
dmluZyB0aGUgY2FsbGVycyBwcm92aWRlCj4gd2hpY2hldmVyIHZhbHVlIHRoZXkgZGVlbSBhcHBy
b3ByaWF0ZSBpbiB0aGVpciBjb250ZXh0cywgdG8gYXZvaWQKPiBpbnZva2luZyB0aGUgaG9vayBh
bHRvZ2V0aGVyIGZvciB0aGlzIHB1cnBvc2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CgpJJ20gYWZyYWlkIHRoYXQgSSBhbSBzdGlsbCB1bmNvbnZp
bmNlZCB0aGF0IGNyNF9yYyBpcyBhIGNsZXZlciBtb3ZlLgoKSXQgd291bGQgYmUgZmFyIG1vcmUg
c2ltcGxlIHRvIHJlcXVpcmUgY2FsbGVycyB0byBwcm92aWRlIGl0IGluCng4Nl9lbXVsYXRlX2N0
eHQuCgo+IEBAIC00MDAwLDEzICs0MDAwLDEwIEBAIHg4Nl9lbXVsYXRlKAo+ICAgICAgICAgIGlm
ICggKF9yZWdzLmVmbGFncyAmIFg4Nl9FRkxBR1NfVk0pICYmCj4gICAgICAgICAgICAgICBNQVNL
X0VYVFIoX3JlZ3MuZWZsYWdzLCBYODZfRUZMQUdTX0lPUEwpICE9IDMgKQo+ICAgICAgICAgIHsK
PiAtICAgICAgICAgICAgY3I0ID0gMDsKPiAtICAgICAgICAgICAgaWYgKCBvcF9ieXRlcyA9PSAy
ICYmIG9wcy0+cmVhZF9jciApCj4gLSAgICAgICAgICAgIHsKPiAtICAgICAgICAgICAgICAgIHJj
ID0gb3BzLT5yZWFkX2NyKDQsICZjcjQsIGN0eHQpOwo+IC0gICAgICAgICAgICAgICAgaWYgKCBy
YyAhPSBYODZFTVVMX09LQVkgKQo+IC0gICAgICAgICAgICAgICAgICAgIGdvdG8gZG9uZTsKPiAt
ICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICBpZiAoIG9wX2J5dGVzID09IDIgKQo+ICsgICAg
ICAgICAgICAgICAgY2hlY2tfY3I0KCk7Cj4gKyAgICAgICAgICAgIGVsc2UKPiArICAgICAgICAg
ICAgICAgIGNyNCA9IDA7CgpUaGlzIGNsb2JiZXJzIGNyNCwgd2hpY2ggaXMgYSBsYXRlbnQgYnVn
IGlmIGFueSBvZiB0aGUgcmV0aXJlIGxvZ2ljCndhbnRzIHRvIHN0YXJ0IHVzaW5nIHRoZSB2YWx1
ZS4KClRoaXMgY29kZSBpcyBvbmx5IGxpa2UgdGhpcyBiZWNhdXNlIHlvdSd2ZSBvdmVybG9hZGVk
IHRoZSB2YWx1ZSBpbiBDUjQKdG8gaW5jbHVkZSBhbiBpbXBsaWNpdCAib3BzaXplID09IDE2Iiwg
YW5kIHJlc3VsdHMgaW4gZXhjZWVkaW5nbHkKY29tcGxpY2F0ZWQgbG9naWMgdG8gZm9sbG93LgoK
fkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
