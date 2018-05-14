From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 5/5] docs/pvh: document initial MTRR state
Date: Mon, 14 May 2018 10:13:47 -0600
Message-ID: <5AF9B5BB02000078001C299B@prv1-mh.provo.novell.com>
References: <20180510171505.37309-1-roger.pau@citrix.com>
 <20180510171505.37309-6-roger.pau@citrix.com>
 <20180514160352.3niqmzctpntjhoeg@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=r2k+=ib=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fIG6j-000617-00
 for xen-devel@lists.xenproject.org; Mon, 14 May 2018 16:13:53 +0000
In-Reply-To: <20180514160352.3niqmzctpntjhoeg@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjA1LjE4IGF0IDE4OjAzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBNYXkgMTAsIDIwMTggYXQgMDY6MTU6MDVQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+PiAtLS0gYS9kb2NzL21pc2MvcHZoLm1hcmtkb3duCj4+ICsrKyBiL2RvY3MvbWlz
Yy9wdmgubWFya2Rvd24KPj4gQEAgLTkyLDMgKzkyLDE4IEBAIGV2ZW50IGNoYW5uZWxzLiBEZWxp
dmVyeSBvZiB0aG9zZSBpbnRlcnJ1cHRzIGNhbiBiZSBjb25maWd1cmVkIGluIHRoZSBzYW1lIHdh
eQo+PiAgYXMgSFZNIGd1ZXN0cywgY2hlY2sgeGVuL2luY2x1ZGUvcHVibGljL2h2bS9wYXJhbXMu
aCBhbmQKPj4gIHhlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtXF9vcC5oIGZvciBtb3JlIGluZm9y
bWF0aW9uIGFib3V0IGF2YWlsYWJsZSBkZWxpdmVyeQo+PiAgbWV0aG9kcy4KPj4gKwo+PiArIyMg
TVRSUiAjIwo+PiArCj4+ICsjIyMgVW5wcml2aWxlZ2VkIGd1ZXN0cyAjIyMKPj4gKwo+PiArUFZI
IGd1ZXN0cyBhcmUgYm9vdGVkIHdpdGggdGhlIGRlZmF1bHQgTVRSUiB0eXBlIHNldCB0byB3cml0
ZS1iYWNrIGFuZCBNVFJSCj4+ICtlbmFibGVkLiBUaGlzIGFsbG93cyBEb21VcyB0byBzdGFydCB3
aXRoIGEgc2FuZSBNVFJSIHN0YXRlLiBOb3RlIHRoYXQgdGhpcyB3aWxsCj4+ICtoYXZlIHRvIGJl
IHJldmlzaXRlZCB3aGVuIHBjaS1wYXNzdGhyb3VnaCBpcyBhZGRlZCB0byBQVkggaW4gb3JkZXIg
dG8gc2V0IE1NSU8KPj4gK3JlZ2lvbnMgYXMgVUMuCj4gCj4gTXkgcmVhZGluZyBpcyAicmV2aXNp
dGVkIiBpbXBsaWVzIHRoZSBkZWZhdWx0IHR5cGUgd2lsbCBjaGFuZ2UuIEluIGZhY3QKPiBpdCBz
aG91bGRuJ3QuIFdlIHNob3VsZCBjbGFyaWZ5OiBmb3IgcmFtIGl0IHdpbGwgcmVtYWluIFdCLCBm
b3IgTU1JTwo+IGhvbGVzIGl0IHdpbGwgYmUgVUMuCgpXaHkgd291bGQgY2hhbmdpbmcgdGhlIGRl
ZmF1bHQgbGF0ZSBiZSBhIHByb2JsZW0/IEEgZmlybXdhcmUgdXBkYXRlIG9uCmJhcmUgaGFyZHdh
cmUgbWlnaHQgYWxzbyBoYXZlIHN1Y2ggYW4gZWZmZWN0LiBUaGUgZGVmYXVsdCB0eXBlIHJlYWQg
ZnJvbQp0aGUgTVNSIG11c3Qgbm90IGNoYW5nZSBhY3Jvc3MgdGhlIGxpZmV0aW1lIG9mIGEgVk0s
IGJ1dCBpbW8gbWF5IGNoYW5nZQphY3Jvc3MgcmVib290cyBvZiBpdC4KCkphbgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
