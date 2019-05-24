From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 27/50] x86emul: support AVX512{F,
 ER} reciprocal insns
Date: Fri, 24 May 2019 00:43:54 -0600
Message-ID: <5CE792AA0200007800231E09@prv1-mh.provo.novell.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B84A8020000780021F23F@prv1-mh.provo.novell.com>
 <bf91ae8b-33f8-ee85-ff39-44e8ccc29f60@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8EJT=TY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hU3vq-0007Gn-Pd
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 06:43:58 +0000
In-Reply-To: <bf91ae8b-33f8-ee85-ff39-44e8ccc29f60@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjA1LjE5IGF0IDE4OjE1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDMvMjAxOSAxMDo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEFsc28gaW5j
bHVkZSB0aGUgb25seSBvdGhlciBBVlg1MTJFUiBpbnNuIHBhaXIsIFZFWFAyUHtELFN9Lgo+Pgo+
PiBOb3RlIHRoYXQgZGVzcGl0ZSB0aGUgcmVwbGFjZW1lbnQgb2YgdGhlIFNIQSBpbnNucycgdGFi
bGUgc2xvdHMgdGhlcmUncwo+PiBubyBuZWVkIHRvIHNwZWNpYWwgY2FzZSB0aGVpciBkZWNvZGlu
ZzogVGhlaXIgaW5zbi1zcGVjaWZpYyBjb2RlIGFscmVhZHkKPj4gc2V0cyBvcF9ieXRlcyAoYXMg
d2FzIHJlcXVpcmVkIGR1ZSB0byBzaW1kX290aGVyKSwgYW5kIFR3b09wIGlzIG9mIG5vCj4+IHJl
bGV2YW5jZSBmb3IgbGVnYWN5IGVuY29kZWQgU0lNRCBpbnNucy4KPj4KPj4gVGhlIHJhaXNpbmcg
b2YgI1VEIHdoZW4gRVZFWC5MJ0wgaXMgMyBmb3IgQVZYNTEyRVIgc2NhbGFyIGluc25zIGlzIGRv
bmUKPj4gdG8gYmUgb24gdGhlIHNhZmUgc2lkZS4gVGhlIFNETSBkb2VzIG5vdCBjbGFyaWZ5IGJl
aGF2aW9yIHRoZXJlLCBhbmQKPj4gaXQncyBldmVuIG1vcmUgYW1iaWd1b3VzIGhlcmUgKHdpdGhv
dXQgQVZYNTEyVkwgaW4gdGhlIHBpY3R1cmUpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpUaGFua3MsIGFsc28gZm9yIHRoZSBvdGhlcnMuCgo+
IFNlZWluZyBhcyBJIGhhdmUgc29tZSBFUiBoYXJkd2FyZSwgaXMgdGhlcmUgYW4gZWFzeSB3YXkg
dG8gZ2V0Cj4gR0NDL2JpbnV0aWxzIHRvIGVtaXQgYSB3ZWlyZCBMJ0wgZmllbGQsIG9yIHdpbGwg
dGhpcyBpbnZvbHZlIHNvbWUgbWFudWFsCj4gb3Bjb2RlIGdlbmVyYXRpb24gdG8gdGVzdD8KCmdj
YyBkb2VzIG5vdCBwcm92aWRlIGFueSBjb250cm9sIGF0IGFsbCwgYWZhaWN0LiBiaW51dGlscyBh
bGxvd3MgIndlaXJkIgpWRVguTCBvciBFVkVYLkwnTCBvbmx5IGZvciBpbnNucyBpdCBiZWxpZXZl
cyBpZ25vcmUgdGhhdCBmaWVsZC4gU28geWVzLApJJ20gYWZyYWlkIHRoaXMgd2lsbCBpbnZvbHZl
IHVzaW5nIC5ieXRlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
