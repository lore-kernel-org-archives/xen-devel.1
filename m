From: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [edk2-devel] [PATCH v2 26/31] OvmfPkg/XenOvmf:
 Override PcdFSBClock to Xen vLAPIC timer frequency
Date: Mon, 15 Apr 2019 15:52:38 +0200
Message-ID: <0fbcb171-d7da-09d1-bda5-4227b1c25e99@redhat.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-27-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DCQv=SR=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hG22O-00033T-3k
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 13:52:44 +0000
In-Reply-To: <20190409110844.14746-27-anthony.perard@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: devel@edk2.groups.io, anthony.perard@citrix.com
Cc: Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDkvMTkgMTM6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFRoYXQgdmFsdWUgaXMg
dXNlZCBieSBTZWNQZWlEeGVUaW1lckxpYkNwdSwgdGhlIFRpbWVyTGliIGltcGxlbWVudGF0aW9u
Lgo+IEl0IHdpbGwgYWxzbyBiZSB1c2VkIGJ5IFhlblRpbWVyRHhlLgoKKDEpIHBsZWFzZSBleHBh
bmQgInRoYXQgdmFsdWUiLgoKd2l0aCB0aGF0LAoKQWNrZWQtYnk6IExhc3psbyBFcnNlayA8bGVy
c2VrQHJlZGhhdC5jb20+CgpUaGFua3MKTGFzemxvCgo+IAo+IENvbnRyaWJ1dGVkLXVuZGVyOiBU
aWFub0NvcmUgQ29udHJpYnV0aW9uIEFncmVlbWVudCAxLjEKPiBTaWduZWQtb2ZmLWJ5OiBBbnRo
b255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0KPiAKPiBOb3RlczoK
PiAgICAgbmV3IHBhdGNoIGluIHYyLgo+IAo+ICBPdm1mUGtnL1hlbk92bWYuZHNjIHwgMyArKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Pdm1m
UGtnL1hlbk92bWYuZHNjIGIvT3ZtZlBrZy9YZW5Pdm1mLmRzYwo+IGluZGV4IDk1MjliNDgzNGYu
LjU0NjAxYzY5N2YgMTAwNjQ0Cj4gLS0tIGEvT3ZtZlBrZy9YZW5Pdm1mLmRzYwo+ICsrKyBiL092
bWZQa2cvWGVuT3ZtZi5kc2MKPiBAQCAtNDUyLDYgKzQ1Miw5IEBAIFtQY2RzRml4ZWRBdEJ1aWxk
XQo+ICAgICMgUG9pbnQgdG8gdGhlIE1kZU1vZHVsZVBrZy9BcHBsaWNhdGlvbi9VaUFwcC9VaUFw
cC5pbmYKPiAgICBnRWZpTWRlTW9kdWxlUGtnVG9rZW5TcGFjZUd1aWQuUGNkQm9vdE1hbmFnZXJN
ZW51RmlsZXx7IDB4MjEsIDB4YWEsIDB4MmMsIDB4NDYsIDB4MTQsIDB4NzYsIDB4MDMsIDB4NDUs
IDB4ODMsIDB4NmUsIDB4OGEsIDB4YjYsIDB4ZjQsIDB4NjYsIDB4MjMsIDB4MzEgfQo+ICAKPiAr
ICAjIyBYZW4gdmxhcGljJ3MgZnJlcXVlbmNlIGlzIDEwMCBNSHoKPiArICBnRWZpTWRlUGtnVG9r
ZW5TcGFjZUd1aWQuUGNkRlNCQ2xvY2t8MTAwMDAwMDAwCj4gKwo+ICAjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwo+ICAjCj4gICMgUGNkIER5bmFtaWMgU2VjdGlvbiAtIGxpc3Qgb2YgYWxsIEVESyBJ
SSBQQ0QgRW50cmllcyBkZWZpbmVkIGJ5IHRoaXMgUGxhdGZvcm0KPiAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
