From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 14/16] xen/grant: Switch
 common/grant_table.c to use typesafe MFN
Date: Fri, 02 Mar 2018 08:54:25 -0700
Message-ID: <5A9981C102000078001ADEDA@prv-mh.provo.novell.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-15-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180221140259.29360-15-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAyLjE4IGF0IDE1OjAyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEBAIC04NzIsNyArODc5LDcgQEAgbWFwX2dyYW50X3JlZigKPiAgICAgIHN0cnVjdCBncmFudF90
YWJsZSAqbGd0LCAqcmd0Owo+ICAgICAgc3RydWN0IHZjcHUgICAqbGVkOwo+ICAgICAgZ3JhbnRf
aGFuZGxlX3QgaGFuZGxlOwo+IC0gICAgdW5zaWduZWQgbG9uZyAgZnJhbWUgPSAwOwo+ICsgICAg
bWZuX3QgZnJhbWUgPSBfbWZuKDApOwoKSWYgdGhlIGluaXRpYWxpemVyIGlzIG5lZWRlZCBhdCBh
bGwsIEkgdGhpbmsgaXQgc2hvdWxkIGFnYWluIGJlY29tZQpJTlZBTElEX01GTi4gU2FtZSBpbiBh
IGZldyBvdGhlciBwbGFjZXMuCgo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3JhbnRfdGFi
bGUuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3JhbnRfdGFibGUuaAo+IEBAIC03Niw3
ICs3Niw3IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IGdudHRhYl9kb20wX21heCh2b2lk
KQo+ICAjZGVmaW5lIGdudHRhYl9zdGF0dXNfZ21mbihkLCB0LCBpKSAgICAgICAgICAgICAgICAg
ICAgIFwKPiAgICAgIChtZm5fdG9fZ21mbihkLCBnbnR0YWJfc3RhdHVzX21mbih0LCBpKSkpCj4g
IAo+IC0jZGVmaW5lIGdudHRhYl9tYXJrX2RpcnR5KGQsIGYpIHBhZ2luZ19tYXJrX2RpcnR5KChk
KSwgX21mbihmKSkKPiArI2RlZmluZSBnbnR0YWJfbWFya19kaXJ0eShkLCBmKSBwYWdpbmdfbWFy
a19kaXJ0eSgoZCksIGYpCgpQbGVhc2UgdGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5kIGFsc28gZHJv
cCB0aGUgc3RyYXkgcGFyZW50aGVzZXMKYXJvdW5kIGQuCgpXaXRoIHRoZXNlIHRha2VuIGNhcmUg
b2YgYW5kIHdpdGggV2VpJ3MgUi1iCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
