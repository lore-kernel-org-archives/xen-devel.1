From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/4] xen/arch: Switch local_irq_save() to
 being a static inline helper
Date: Mon, 26 Nov 2018 06:22:29 -0700
Message-ID: <5BFBF39502000078001FFFEC@prv1-mh.provo.novell.com>
References: <1542991976-6190-1-git-send-email-andrew.cooper3@citrix.com>
 <1542991976-6190-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542991976-6190-4-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjExLjE4IGF0IDE3OjUyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLi4uIHJhdGhlciB0aGFuIGEgbWFjcm8gd2hpY2ggd3JpdGVzIHRvIGl0cyBwYXJhbWV0
ZXIgYnkgbmFtZS4gIFRha2UgdGhlCj4gb3Bwb3J0dW5pdHkgdG8gZm9sZCB0aGUgYXNzaWdubWVu
dCBpbnRvIHRoZSBmbGFncyBkZWNsYXJhaW9uIHdoZXJlCj4gYXBwcm9wcmlhdGUuCgpEbyB5b3Ug
cmVhbGx5PyBXaHkgbm90IC4uLgoKPiAtLS0gYS94ZW4vYXJjaC9hcm0vbW0uYwo+ICsrKyBiL3hl
bi9hcmNoL2FybS9tbS5jCj4gQEAgLTQwMSw3ICs0MDEsNyBAQCB2b2lkICptYXBfZG9tYWluX3Bh
Z2UobWZuX3QgbWZuKQo+ICAgICAgbHBhZV90IHB0ZTsKPiAgICAgIGludCBpLCBzbG90Owo+ICAK
PiAtICAgIGxvY2FsX2lycV9zYXZlKGZsYWdzKTsKPiArICAgIGZsYWdzID0gbG9jYWxfaXJxX3Nh
dmUoKTsKCi4uLiBoZXJlLCBmb3IgZXhhbXBsZT8gVGhlcmUgYXJlIGEgZmV3IG1vcmUgY2FzZXMs
IEkgdGhpbmsuCgo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvc3lzdGVtLmgKPiArKysgYi94
ZW4vaW5jbHVkZS9hc20teDg2L3N5c3RlbS5oCj4gQEAgLTI2MiwxMSArMjYyLDE1IEBAIHN0YXRp
YyBpbmxpbmUgdW5zaWduZWQgbG9uZyBsb2NhbF9zYXZlX2ZsYWdzKHZvaWQpCj4gICAgICByZXR1
cm4gZmxhZ3M7Cj4gIH0KPiAgCj4gLSNkZWZpbmUgbG9jYWxfaXJxX3NhdmUoeCkgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+IC0oeyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAtICAgIHggPSBs
b2NhbF9zYXZlX2ZsYWdzKCk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gLSAgICBsb2NhbF9pcnFfZGlzYWJsZSgpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+IC19KQo+ICtzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgbG9jYWxf
aXJxX3NhdmUodm9pZCkKPiArewo+ICsgICAgdW5zaWduZWQgbG9uZyBmbGFncyA9IGxvY2FsX3Nh
dmVfZmxhZ3MoKTsKPiArCj4gKyAgICBsb2NhbF9pcnFfZGlzYWJsZSgpOwo+ICsKPiArICAgIHJl
dHVybiBmbGFnczsKPiArfQoKRG8gd2UgcmVhbGx5IG5lZWQvd2FudCB0byByZXRhaW4gdGhpcyBh
cyBhIHBlci1hcmNoIGNvbnN0cnVjdD8KU2luY2UgeW91IHRvdWNoIGFsbCBpbnN0YW5jZXMgYW55
d2F5LCBkbyB3ZSByZWFsbHkgd2FudCB0bwpzdGljayB0byBpdHMgbWlzbGVhZGluZyBuYW1lPwoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
