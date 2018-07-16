From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] tboot: Avoid recursive fault in early boot
 panic with tboot
Date: Mon, 16 Jul 2018 06:22:39 -0600
Message-ID: <5B4C8E0F02000078001D45EE@prv1-mh.provo.novell.com>
References: <20180716115902.5138-1-jandryuk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180716115902.5138-1-jandryuk@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org, Gang Wei <gang.wei@intel.com>, Shane Wang <shane.wang@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA3LjE4IGF0IDEzOjU5LCA8amFuZHJ5dWtAZ21haWwuY29tPiB3cm90ZToKPiAt
LS0gYS94ZW4vYXJjaC94ODYvdGJvb3QuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni90Ym9vdC5jCj4g
QEAgLTM5MSw3ICszOTEsMTIgQEAgdm9pZCB0Ym9vdF9zaHV0ZG93bih1aW50MzJfdCBzaHV0ZG93
bl90eXBlKQo+ICAgICAgICAgIHRib290X2dlbl94ZW5oZWFwX2ludGVncml0eShnX3Rib290X3No
YXJlZC0+czNfa2V5LCAmeGVuaGVhcF9tYWMpOwo+ICAgICAgfQo+ICAKPiAtICAgIHdyaXRlX3B0
YmFzZShpZGxlX3ZjcHVbMF0pOwo+ICsgICAgLyogRHVyaW5nIGVhcmx5IGJvb3QsIHdlIGNhbiBi
ZSBjYWxsZWQgYnkgcGFuaWMgYmVmb3JlIGlkbGVfdmNwdVswXSBpcwo+ICsgICAgICogc2V0dXAs
IGJ1dCBpbiB0aGF0IGNhc2Ugd2UgZG9uJ3QgbmVlZCB0byBjaGFuZ2UgcGFnZSB0YWJsZXMuICov
Cj4gKyAgICBpZiAoIGlkbGVfdmNwdVswXSAhPSBJTlZBTElEX1ZDUFUgKQo+ICsgICAgewo+ICsg
ICAgICAgIHdyaXRlX3B0YmFzZShpZGxlX3ZjcHVbMF0pOwo+ICsgICAgfQoKVGhlcmUgYXJlIHR3
byBzdHlsZSBpc3N1ZXMgaGVyZTogVGhlIGNvbW1lbnQgd2FudHMgdG8gYmUgcHJvcGVybHkKZm9y
bWF0dGVkLCBhbmQgdGhlIGJyYWNlcyB3YW50IHRvIGJlIGRyb3BwZWQuCgpBbHNvIHBsZWFzZSBo
b25vciBwYXRjaCBzdWJtaXNzaW9uIHJ1bGVzIC0gdGhleSBnZXQgc2VudCBfdG9fIHRoZQpsaXN0
LCB3aXRoIG1haW50YWluZXJzIF9jY18tZWQuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
