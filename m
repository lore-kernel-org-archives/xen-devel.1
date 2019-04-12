From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] x86/mem_sharing: reorder when pages are
 unlocked and released
Date: Fri, 12 Apr 2019 05:55:31 -0600
Message-ID: <5CB07CB30200007800226E07@prv1-mh.provo.novell.com>
References: <20190412042930.2867-1-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UMhk=SO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hEumM-0008MU-OU
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 11:55:34 +0000
In-Reply-To: <20190412042930.2867-1-tamas@tklengyel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjA0LjE5IGF0IDA2OjI5LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
UGF0Y2ggMDUwMmUwYWRhZTIgIng4NjogY29ycmVjdCBpbnN0YW5jZXMgb2YgUEdDX2FsbG9jYXRl
ZCBjbGVhcmluZyIgaW50cm9kdWNlZAo+IGdyYWJiaW5nIGV4dHJhIHJlZmVyZW5jZXMgZm9yIHBh
Z2VzIHRoYXQgZHJvcCByZWZlcmVuY2VzIHRpZWQgdG8gUEdDX2FsbG9jYXRlZC4KPiBIb3dldmVy
LCB0aGUgd2F5IHRoZXNlIGV4dHJhIHJlZmVyZW5jZXMgd2VyZSBncmFiYmVkIHdlcmUgaW5jb3Jy
ZWN0LCByZXN1bHRpbmcKPiBpbiBib3RoIHNoYXJlX3BhZ2VzIGFuZCB1bnNoYXJlX3BhZ2VzIGZh
aWxpbmcuCgpJJ20gc29ycnkgZm9yIHRoaXMuCgo+IEBAIC05ODQsNyArOTc2LDcgQEAgc3RhdGlj
IGludCBzaGFyZV9wYWdlcyhzdHJ1Y3QgZG9tYWluICpzZCwgZ2ZuX3Qgc2dmbiwgc2hyX2hhbmRs
ZV90IHNoLAo+ICAgICAgICAgICAqIERvbid0IGNoYW5nZSB0aGUgdHlwZSBvZiBybWFwIGZvciB0
aGUgY2xpZW50IHBhZ2UuICovCj4gICAgICAgICAgcm1hcF9kZWwoZ2ZuLCBjcGFnZSwgMCk7Cj4g
ICAgICAgICAgcm1hcF9hZGQoZ2ZuLCBzcGFnZSk7Cj4gLSAgICAgICAgcHV0X3BhZ2VfYW5kX3R5
cGUoY3BhZ2UpOwo+ICsgICAgICAgIHB1dF9jb3VudCsrOwoKU2luY2UgdGhpcyBzaXRzIGluIGEg
d2hpbGUoKSwgLi4uCgo+IEBAIC0xMDAyLDcgKzk5NCw5IEBAIHN0YXRpYyBpbnQgc2hhcmVfcGFn
ZXMoc3RydWN0IGRvbWFpbiAqc2QsIGdmbl90IHNnZm4sIHNocl9oYW5kbGVfdCBzaCwKPiAgICAg
IC8qIEZyZWUgdGhlIGNsaWVudCBwYWdlICovCj4gICAgICBpZih0ZXN0X2FuZF9jbGVhcl9iaXQo
X1BHQ19hbGxvY2F0ZWQsICZjcGFnZS0+Y291bnRfaW5mbykpCj4gICAgICAgICAgcHV0X3BhZ2Uo
Y3BhZ2UpOwo+IC0gICAgcHV0X3BhZ2UoY3BhZ2UpOwo+ICsKPiArICAgIHdoaWxlKHB1dF9jb3Vu
dC0tKQo+ICsgICAgICAgIHB1dF9wYWdlX2FuZF90eXBlKGNwYWdlKTsKCi4uLiBwdXRfY291bnQg
bWF5IGJlIHplcm8gYmVmb3JlIHRoaXMgd2hpbGUoKS4gQXQgd2hpY2ggcG9pbnQgdGhlCmVhcmxp
ZXIgcHV0X3BhZ2UoKSB3b3VsZCBzdGlsbCBiZSB1bnNhZmUuCgpBbHNvLCBkZXNwaXRlIHRoZSBp
ZigpIGluIGNvbnRleHQgc3VnZ2VzdGluZyB0aGUgc3R5bGUgeW91IHVzZWQsCnRoZSByZXN0IG9m
IHRoZSBmdW5jdGlvbiBsb29rcyB0byB1c2UgcHJvcGVyIFhlbiBzdHlsZSwgc28gd291bGQKeW91
IHBsZWFzZSBhZGQgdGhlIHRocmVlIG1pc3NpbmcgYmxhbmtzIHRvIHRoZSB3aGlsZSgpIHlvdSBh
ZGQ/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
