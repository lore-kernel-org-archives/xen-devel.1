From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] xen/cmdline: Fix buggy strncmp(s, LITERAL,
 ss - s) construct
Date: Mon, 7 Jan 2019 17:28:55 +0000
Message-ID: <bd3f5d10-0d0f-df07-c3ae-b83a74d8809d@citrix.com>
References: <1546622255-9324-1-git-send-email-andrew.cooper3@citrix.com>
 <5C3314F0020000780020AAC3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C3314F0020000780020AAC3@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDEvMjAxOSAwODo1OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEBAIC0yNzEsNiArMjk3
LDI3IEBAIGludCBwYXJzZV9ib29sZWFuKGNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0IGNoYXIgKnMs
IGNvbnN0IGNoYXIgKmUpCj4+ICAgICAgcmV0dXJuIC0xOwo+PiAgfQo+PiAgCj4+ICtpbnQgY21k
bGluZV9zdHJjbXAoY29uc3QgY2hhciAqZnJhZywgY29uc3QgY2hhciAqbmFtZSkKPiBTbyB5b3Un
dmUgZGVjaWRlZCB0byByZXRhaW4gdGhlIHN0cmNtcCgpLWxpa2UgcmV0dXJuIHR5cGUgYW5kIHZh
bHVlLAo+IGRlc3BpdGUgdGhlbSBiZWluZyBvZiBubyBpbnRlcmVzdCB0byBhbnkgY2FsbGVyLCBh
bmQgaXQgYmVpbmcKPiB2YW5pc2hpbmdseSB1bmxpa2VseSBmb3IgYSBjYWxsZXIgdG8gYXBwZWFy
IHdoaWNoIHdvdWxkIGNhcmUuIEZpbmUKPiBmb3Igbm93LCBidXQgSSdkIHN0aWxsIGxpa2UgdG8g
dW5kZXJzdGFuZCB3aHkuCgpZb3UgYWxyZWFkeSBhc2tlZCB0aGlzLCBhbmQgZ2l2ZSBubyBvYmpl
Y3Rpb24gdG8gbXkgYW5zd2VyLCBJIHByZXN1bWVkCnlvdSB3ZXJlIHNhdGlzZmllZCB3aXRoIHRo
ZSBjb25jcmV0ZSB1c2VjYXNlIEkgZ2F2ZSwgY2l0aW5nIGEgcGF0Y2gKbmVlZGluZyB0aGlzIGJl
aGF2aW91ciB3aGljaCBoYXMgYWxyZWFkeSBiZWVuIHBvc3RlZCB0byB0aGUgbGlzdC4KCjxiZmYz
YzMzZC1hMjQ0LTM2MmEtNTI5Yy0zMmY5MWI1ZjM5NjVAY2l0cml4LmNvbT4KCn5BbmRyZXcKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
