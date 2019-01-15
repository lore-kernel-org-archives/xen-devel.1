From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: PING ARM [PATCH v2] xen/cmdline: Fix buggy
 strncmp(s, LITERAL, ss - s) construct
Date: Tue, 15 Jan 2019 01:47:49 -0700
Message-ID: <5C3D9E35020000780020DA3B@prv1-mh.provo.novell.com>
References: <1546622255-9324-1-git-send-email-andrew.cooper3@citrix.com>
 <8161196e-b6ff-2ab1-eaa8-cdb5341ae178@citrix.com>
 <4f1859e5-c901-3e3e-ffc2-0e7233d1c794@arm.com>
 <5d7290c3-02e2-c54d-9a65-cc8b8019a4cc@citrix.com>
 <cf0da64b-1dd5-8dfc-a041-cefe077dd0ff@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <cf0da64b-1dd5-8dfc-a041-cefe077dd0ff@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAxLjE5IGF0IDE4OjE2LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEhpIEFuZHJldywKPiAKPiBPbiAxNC8wMS8yMDE5IDE2OjU5LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+PiBPbiAxNC8wMS8yMDE5IDE2OjA3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBPbiAxNC8w
MS8yMDE5IDE1OjE3LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+PiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL2VmaS9lZmktYm9vdC5oIGIveGVuL2FyY2gvYXJtL2VmaS9lZmktYm9vdC5oCj4+
Pj4+IGluZGV4IGNhNjU1ZmYuLjIyYTg2ZWMgMTAwNjQ0Cj4+Pj4+IC0tLSBhL3hlbi9hcmNoL2Fy
bS9lZmkvZWZpLWJvb3QuaAo+Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0vZWZpL2VmaS1ib290LmgK
Pj4+Pj4gQEAgLTIxMiw3ICsyMTIsNyBAQCBFRklfU1RBVFVTIF9faW5pdAo+Pj4+PiBmZHRfYWRk
X3VlZmlfbm9kZXMoRUZJX1NZU1RFTV9UQUJMRSAqc3lzX3RhYmxlLAo+Pj4+PiAgICAgICAgICAg
ICAgICBicmVhazsKPj4+Pj4gICAgICAgICAgICAgIHR5cGUgPSBmZHRfZ2V0cHJvcChmZHQsIG5v
ZGUsICJkZXZpY2VfdHlwZSIsICZsZW4pOwo+Pj4+PiAtICAgICAgICBpZiAoIHR5cGUgJiYgc3Ry
bmNtcCh0eXBlLCAibWVtb3J5IiwgbGVuKSA9PSAwICkKPj4+Pj4gKyAgICAgICAgaWYgKCB0eXBl
ICYmIGxlbiA9PSA2ICYmIHN0cm5jbXAodHlwZSwgIm1lbW9yeSIsIDYpID09IDAgKQo+Pj4KPj4+
IHN0cmluZyBwcm9wZXJ0eSB0ZXJtaW5hdGVzIHdpdGggTlVMIGFuZCBpcyBpbmNsdWRlZCBpbiB0
aGUgbGVuLiBTbyBJCj4+PiBkb24ndCB0aGluayB0aGlzIGNoYW5nZSBpcyBjb3JyZWN0Lgo+PiAK
Pj4gQXJlIHlvdSBzYXlpbmcgdGhhdCBsZW4gaXMgNyBoZXJlIHRoZW4/Cj4gCj4gWWVzLiBCdXQg
SSBkb24ndCB0aGluayB0aGlzIGNoYW5nZSBpcyBuZWNlc3NhcnkgYXMgd2UgYWxyZWFkeSBpbmNs
dWRlIE5VTCBpbiB0aGUgCj4gY29tcGFyaXNvbi4KCklmIGxlbiBpcyA3LCB0aGVuIGluZGVlZCB5
b3UgZG8uIExvb2tpbmcgYXQgZmR0X2dldF9wcm9wZXJ0eV9ieV9vZmZzZXQoKQpJIGNhbid0IHNl
ZSB0aG91Z2ggd2hlcmUgdGhlIGd1YXJhbnRlZSBjb21lcyBmcm9tIHRoYXQgdGhlIHJldHVybmVk
CnN0cmluZyBpcyBudWwtdGVybWluYXRlZCwgYXMgaXQncyBwcm9wLT5sZW4gd2hpY2ggZ2V0cyBo
YW5kZWQgYmFjay4gSU9XCmlmIHlvdSBlLmcuIGdldCBiYWNrICJtZW0iICh3aXRoIG9yIHdpdGhv
dXQgYSBudWwgdGVybWluYXRvcikgYW5kIGxlbiAzLAp0aGVuIHN0cm5jbXAoKSB3b3VsZCBzdGls
bCByZXR1cm4gemVyby4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
