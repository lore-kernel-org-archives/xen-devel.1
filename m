From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] libxc: don't fail domain creation when
 unpacking initrd fails
Date: Tue, 23 Jan 2018 15:20:24 +0000
Message-ID: <20180123152024.dgn5jjxrqxtcwtz3@citrix.com>
References: <5A2551C10200007800194608@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=4kka=es=citrix.com=prvs=55463bd4c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ee0NE-0006Te-18
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 15:20:32 +0000
Content-Disposition: inline
In-Reply-To: <5A2551C10200007800194608@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBEZWMgMDQsIDIwMTcgYXQgMDU6NDY6NDFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQXQgbGVhc3QgTGludXgga2VybmVscyBoYXZlIGJlZW4gYWJsZSB0byB3b3JrIHdpdGgg
Z3ppcC1lZCBpbml0cmQgZm9yCj4gcXVpdGUgc29tZSB0aW1lOyBpbml0cmQgY29tcHJlc3NlZCB3
aXRoIG90aGVyIG1ldGhvZHMgYXJlbid0IGV2ZW4gYmVpbmcKPiBhdHRlbXB0ZWQgdG8gdW5wYWNr
LiBGdXJ0aGVybW9yZSB0aGUgdW56aXAtaW5nIHJvdXRpbmUgdXNlZCBoZXJlIGlzbid0Cj4gY2Fw
YWJsZSBvZiBkZWFsaW5nIHdpdGggdmFyaW91cyBmb3JtcyBvZiBjb25jYXRlbmF0ZWQgZmlsZXMs
IGVhY2ggb2YKPiB3aGljaCB3YXMgZ3ppcC1lZCBzZXBhcmF0ZWx5IChpdCBpcyB0aGlzIHBhcnRp
Y3VsYXIgY2FzZSB3aGljaCBoYXMgYmVlbgo+IHRoZSBzb3VyY2Ugb2Ygb2JzZXJ2ZWQgVk0gY3Jl
YXRpb24gZmFpbHVyZXMpLgo+IAo+IEhlbmNlLCBpZiB1bnBhY2tpbmcgZmFpbHMsIHNpbXBseSBo
YW5kIHRoZSB0aGUgY29tcHJlc3NlZCBibG9iIHRvIHRoZQo+IGd1ZXN0IGFzIGlzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClRoZSBjb2RlIGxv
b2tzIE9LIHRvIG1lLiBJdCByZXF1aXJlcyByZWJhc2UgdGhvdWdoLgoKV2VpLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
