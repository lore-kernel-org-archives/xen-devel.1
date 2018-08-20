From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 5/5] x86: use PDEP for PTE flags
 insertion when available
Date: Mon, 20 Aug 2018 01:25:58 -0600
Message-ID: <5B7A6D0602000078001DFC8B@prv1-mh.provo.novell.com>
References: <5AA7E79302000078001B0FAB@prv1-mh.provo.novell.com>
 <5AA7D98302000000000F73C0@prv1-mh.provo.novell.com>
 <5AA7D98302000078001CDC8C@prv1-mh.provo.novell.com>
 <5AA7D98302000000000F8008@prv1-mh.provo.novell.com>
 <5AA7D98302000078001DD5F0@prv1-mh.provo.novell.com>
 <5B76740802000078001DF345@prv1-mh.provo.novell.com>
 <5B76781702000078001DF38D@prv1-mh.provo.novell.com>
 <B9ED55E9-8146-4202-84CD-6DE928E75D45@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jmcq=ld=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1freZg-0004rr-EW
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 07:26:04 +0000
In-Reply-To: <B9ED55E9-8146-4202-84CD-6DE928E75D45@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Brian Woods <brian.woods@amd.com>, Rich Persaud <persaur@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjA4LjE4IGF0IDAzOjA4LCA8cGVyc2F1ckBnbWFpbC5jb20+IHdyb3RlOgo+IE9u
IEF1ZyAxNywgMjAxOCwgYXQgMDM6MjQsIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4g
d3JvdGU6Cj4+IAo+PiBUaGlzIHJlcGxhY2VzIDUgaW5zdHJ1Y3Rpb25zIGJ5IGEgc2luZ2xlIG9u
ZSwgZnVydGhlciByZWR1Y2luZyBjb2RlIHNpemUsCj4+IGNhY2hlLCBhbmQgVExCIGZvb3Rwcmlu
dCAoaW4gcGFydGljdWxhciBvbiBzeXN0ZW1zIHN1cHBvcnRpbmcgQk1JMikuCj4gCj4gVGhpcyBs
aW5rIGNsYWltcyB0aGF0IEJNSTIgbWF5IGJlIGxlc3MgcGVyZm9ybWFudC9jb25zaXN0ZW50IG9u
IEFNRCBSeXplbiAKPiB0aGFuIEludGVsOgo+IGh0dHBzOi8vd3d3LnJlZGRpdC5jb20vci9BbWQv
Y29tbWVudHMvNjBpNmVyL3J5emVuX2FuZF9ibWkyX3N0cmFuZ2VfYmVoYXZpb3IgCj4gX2FuZF9o
aWdoX2xhdGVuY2llcy8KCkhtbSwgaW50ZXJlc3RpbmcuIEJyaWFuIC0gYW55IHdvcmQgYXMgdG8g
d2hldGhlciB3ZSdkIGJldHRlciBhdm9pZAp1c2luZyBQREVQL1BFWFQgZm9yIG5vdyBvbiBBTUQ/
Cgo+IFdvdWxkIHRoaXMgcGF0Y2ggc2VyaWVzIGhhdmUgYW55IGJlbmVmaXQgdG8gTDAgaHlwZXJ2
aXNvcnMvcm9vdGtpdHMgKGUuZy4gCj4gQnJvbWl1bSwgQmFyZWZsYW5rIG9yIHNpbWlsYXIgaHlw
ZXJ2aXNvcnMpIHdoaWNoIGNvdWxkIGJlIG1vbml0b3JpbmcgTDEgWGVuPyAgCj4gT3IgWGVuIGFz
IEwwIGh5cGVydmlzb3IgYW5kIEh5cGVyLVYgYXMgTDEgaHlwZXJ2aXNvcj8KClRoZSBpbnNucyBh
cmVuJ3QgdXNlZCBvbiBhbnkgc2VjcmV0cywgc28gSSBkb24ndCBzZWUgdGhlIGNvbm5lY3Rpb24u
CkJ1dCB0aGVuIGFnYWluIEknbSBub3QgYW4gZXhwZXJ0IGhlcmUgYXQgYWxsLgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
