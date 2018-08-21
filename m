From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 25/34] x86/mm/shadow: make it build with
 !CONFIG_HVM
Date: Tue, 21 Aug 2018 02:41:22 -0600
Message-ID: <5B7BD03202000078001E0505@prv1-mh.provo.novell.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <299eb6a4020c01e57f0d7e30180ab66edc9836bf.1534518694.git-series.wei.liu2@citrix.com>
 <20180821082921.sbhlsylawka6qxst@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ip0d=le=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fs2EB-0006aO-Oy
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 08:41:27 +0000
In-Reply-To: <20180821082921.sbhlsylawka6qxst@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjA4LjE4IGF0IDEwOjI5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgQXVnIDE3LCAyMDE4IGF0IDA0OjEyOjQzUE0gKzAxMDAsIFdlaSBMaXUgd3JvdGU6
Cj4+IEBAIC0yNzIzLDEyICsyNzM2LDEzIEBAIHN0YXRpYyBpbnQgc2hfcmVtb3ZlX2FsbF9tYXBw
aW5ncyhzdHJ1Y3QgZG9tYWluICpkLCBtZm5fdCBnbWZuLCBnZm5fdCBnZm4pCj4+ICAgICAgICAg
ICAgICAgICAmJiAocGFnZS0+Y291bnRfaW5mbyAmIFBHQ19jb3VudF9tYXNrKSA8PSAzCj4+ICAg
ICAgICAgICAgICAgICAmJiAoKHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvICYgUEdUX2NvdW50X21h
c2spCj4+ICAgICAgICAgICAgICAgICAgICAgPT0gKGlzX3hlbl9oZWFwX3BhZ2UocGFnZSkgfHwK
Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgaXNfaW9yZXFfc2VydmVyX3BhZ2UoZCwgcGFnZSkp
KSkgKQo+PiArICAgICAgICAgICAgICAgICAgICAgICAoaXNfaHZtX2RvbWFpbihkKSAmJiBpc19p
b3JlcV9zZXJ2ZXJfcGFnZShkLCBwYWdlKSkpKSkgKQo+IAo+IElzbid0IHRoaXMgYSBzZXBhcmF0
ZSBidWdmaXg/IGlzX2lvcmVxX3NlcnZlcl9wYWdlIHNob3VsZG4ndCBiZSBjYWxsZWQKPiBmb3Ig
UFYgZG9tYWlucyBhdCBhbGwgKHNhbWUgYmVsb3cpLgoKVGhlcmUncyBhIHNoYWRvd19tb2RlX2V4
dGVybmFsKCkganVzdCBvdXQgb2YgY29udGV4dCBoZXJlLiBBbG9uZyB0aGUKbGluZXMgb2YgbXkg
cHJldmlvdXMgcmVwbHksIHRoaXMgb25lIHRvbyBzaG91bGQgYmUgZm9yY2VkIHRvIGNvbnN0YW50
CmZhbHNlIHdoZW4gIUhWTS4KCldpdGhvdXQgdGhpcywgaS5lLiBpZiB0aGUgY29kZSB3YXMgc29t
ZWhvdyByZWFjaGFibGUgZm9yIFBWIGd1ZXN0cywKdGhpcyB3b3VsZCBoYXZlIGJlZW4gYSBzZWN1
cml0eSBpc3N1ZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
