From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 6/6] xen/domain: Added debug safety in
 the domain_create() failure path
Date: Thu, 08 Mar 2018 02:04:58 -0700
Message-ID: <5AA10ACA02000078001AFB44@prv-mh.provo.novell.com>
References: <1519827268-18199-7-git-send-email-andrew.cooper3@citrix.com>
 <1520449937-14449-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1520449937-14449-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAzLjE4IGF0IDIwOjEyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2NvbW1vbi9kb21haW4uYwo+ICsrKyBiL3hlbi9jb21tb24vZG9tYWlu
LmMKPiBAQCAtMzk5LDYgKzM5OSw5IEBAIHN0cnVjdCBkb21haW4gKmRvbWFpbl9jcmVhdGUoZG9t
aWRfdCBkb21pZCwgdW5zaWduZWQgaW50IGRvbWNyX2ZsYWdzLAo+ICAgICAgcmV0dXJuIGQ7Cj4g
IAo+ICAgZmFpbDoKPiArICAgIEFTU0VSVChlcnIgPCAwKTsgICAgICAvKiBTYW5pdHkgY2hlY2sg
cGF0aHMgbGVhZGluZyBoZXJlLiAqLwo+ICsgICAgZXJyID0gZXJyID86IC1FSU5WQUw7IC8qIFJl
bGVhc2UgYnVpbGQgc2FmZXR5LiAqLwoKRnVuZGFtZW50YWxseSBJJ20gZmluZSB3aXRoIHRoaXMs
IGJ1dCBjb3VsZCB5b3UgdXNlIGEgbXVjaCBsZXNzCmZyZXF1ZW50bHkgdXNlZCAoYW5kIGhlbmNl
IGVhc2llciB0byBpZGVudGlmeSkgZXJyb3IgY29kZSBoZXJlPwpMaWtlIEVJTFNFUSwgRUNISUxE
LCBvciBFTk9URU1QVFkgKGFuZCBJJ20gb3BlbiB0byB0aGUgdXNlIG9mCm90aGVyIG9ic2N1cmUg
b25lcyk/IFdlIGRvbid0IGtub3cgd2hhdCB0aGUgY2F1c2Ugb2YgdGhlIGVycm9yCndhcywgc28g
d2hhdCBleGFjdCBlcnJvciBjb2RlIHRvIHJlcG9ydCBpcyBwcmV0dHkgbWVhbmluZ2xlc3MgdG8K
dGhlIGNhbGxlciBhbnl3YXkuCgpXaXRoIHRoYXQKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
