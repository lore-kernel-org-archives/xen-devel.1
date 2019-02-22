From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/shadow: don't use
 map_domain_page_global() on paths that may not fail
Date: Fri, 22 Feb 2019 05:45:00 -0700
Message-ID: <5C6FEECC020000780021922F@prv1-mh.provo.novell.com>
References: <5C6D6F11020000780021883E@prv1-mh.provo.novell.com>
 <20190222123307.GE258@deinos.phlegethon.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gxAEI-0003Ey-BO
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 12:47:02 +0000
In-Reply-To: <20190222123307.GE258@deinos.phlegethon.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tim Deegan <tim@xen.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAyLjE5IGF0IDEzOjMzLCA8dGltQHhlbi5vcmc+IHdyb3RlOgo+IEF0IDA4OjE1
IC0wNzAwIG9uIDIwIEZlYiAoMTU1MDY1MDUyOSksIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBUaGUg
YXNzdW1wdGlvbiAoYWNjb3JkaW5nIHRvIG9uZSBjb21tZW50KSBhbmQgaG9wZSAoYWNjb3JkaW5n
IHRvCj4+IGFub3RoZXIpIHRoYXQgbWFwX2RvbWFpbl9wYWdlX2dsb2JhbCgpIGNhbid0IGZhaWwg
YXJlIGJvdGggd3Jvbmcgb24KPj4gbGFyZ2UgZW5vdWdoIHN5c3RlbXMuIERvIGF3YXkgd2l0aCB0
aGUgZ3Vlc3RfdnRhYmxlIGZpZWxkIGFsdG9nZXRoZXIsCj4+IGFuZCBlc3RhYmxpc2ggLyB0ZWFy
IGRvd24gdGhlIGRlc2lyZWQgbWFwcGluZyBhcyBuZWNlc3NhcnkuCj4+IAo+PiBUaGUgYWx0ZXJu
YXRpdmVzLCBkaXNjYXJkZWQgYXMgYmVpbmcgdW5kZXNpcmFibGUsIHdvdWxkIGhhdmUgYmVlbiB0
bwo+PiBlaXRoZXIgY3Jhc2ggdGhlIGd1ZXN0IGluIHNoX3VwZGF0ZV9jcjMoKSB3aGVuIHRoZSBt
YXBwaW5nIGZhaWxzLCBvciB0bwo+PiBidWJibGUgdXAgYW4gZXJyb3IgaW5kaWNhdG9yLCB3aGlj
aCB1cHBlciBsYXllcnMgd291bGQgaGF2ZSBhIGhhcmQgdGltZQo+PiB0byBkZWFsIHdpdGggKG90
aGVyIHRoYW4gYWdhaW4gYnkgY3Jhc2hpbmcgdGhlIGd1ZXN0KS4KPj4gCj4+IFNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBJIGZvbGxvdyB5b3VyIGFy
Z3VtZW50LCBzbyBBY2tlZC1ieTogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CgpUaGFua3MuCgo+
IEkgd291bGQgZXhwZWN0IHRoaXMgdG8gaGF2ZSBhIG1lYXN1cmFibGUgY29zdCBvbiBwYWdlIGZh
dWx0IHRpbWVzIChvbgo+IGNvbmZpZ3VyYXRpb25zIHdoZXJlIGdsb2JhbCBtYXAgaXNuJ3QganVz
dCBhIGRpcmVjdG1hcCkuICBJdCB3b3VsZCBiZQo+IGdvb2QgdG8ga25vdyBpZiB0aGF0J3MgdGhl
IGNhc2UuCgpJIGhhdmUgYWJzb2x1dGVseSBubyBkb3VidCB0aGF0IHRoaXMgd2lsbCBjb3N0IHBl
cmZvcm1hbmNlIG9uIGh1Z2UKc3lzdGVtcyAoYW5kIGRlYnVnIGJ1aWxkcykuIFRoYXQncyBiYXNp
Y2FsbHkgd2h5IEkndmUgZXhwbGljaXRseSBsaXN0ZWQKdGhlIChkaXNjYXJkZWQpIG9wdGlvbnMg
dGhhdCB3b3VsZCBoYXZlIGhhZCBsZXNzIG92ZXJoZWFkLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
