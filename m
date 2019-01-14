From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: PING ARM [PATCH v2] xen/cmdline: Fix buggy
 strncmp(s, LITERAL, ss - s) construct
Date: Mon, 14 Jan 2019 17:43:59 +0000
Message-ID: <9a301cf7-4e6e-c147-a7ae-b901b024b107@citrix.com>
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
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDEvMjAxOSAxNzoxNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEFuZHJldywKPgo+
IE9uIDE0LzAxLzIwMTkgMTY6NTksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDE0LzAxLzIw
MTkgMTY6MDcsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IE9uIDE0LzAxLzIwMTkgMTU6MTcsIEFu
ZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZWZpL2Vm
aS1ib290LmgKPj4+Pj4gYi94ZW4vYXJjaC9hcm0vZWZpL2VmaS1ib290LmgKPj4+Pj4gaW5kZXgg
Y2E2NTVmZi4uMjJhODZlYyAxMDA2NDQKPj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2VmaS9lZmkt
Ym9vdC5oCj4+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9lZmkvZWZpLWJvb3QuaAo+Pj4+PiBAQCAt
MjEyLDcgKzIxMiw3IEBAIEVGSV9TVEFUVVMgX19pbml0Cj4+Pj4+IGZkdF9hZGRfdWVmaV9ub2Rl
cyhFRklfU1lTVEVNX1RBQkxFICpzeXNfdGFibGUsCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgYnJlYWs7Cj4+Pj4+IMKgwqAgwqDCoMKgwqDCoMKgwqDCoMKgIHR5cGUgPSBmZHRf
Z2V0cHJvcChmZHQsIG5vZGUsICJkZXZpY2VfdHlwZSIsICZsZW4pOwo+Pj4+PiAtwqDCoMKgwqDC
oMKgwqAgaWYgKCB0eXBlICYmIHN0cm5jbXAodHlwZSwgIm1lbW9yeSIsIGxlbikgPT0gMCApCj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIHR5cGUgJiYgbGVuID09IDYgJiYgc3RybmNtcCh0eXBl
LCAibWVtb3J5IiwgNikgPT0gMCApCj4+Pgo+Pj4gc3RyaW5nIHByb3BlcnR5IHRlcm1pbmF0ZXMg
d2l0aCBOVUwgYW5kIGlzIGluY2x1ZGVkIGluIHRoZSBsZW4uIFNvIEkKPj4+IGRvbid0IHRoaW5r
IHRoaXMgY2hhbmdlIGlzIGNvcnJlY3QuCj4+Cj4+IEFyZSB5b3Ugc2F5aW5nIHRoYXQgbGVuIGlz
IDcgaGVyZSB0aGVuPwo+Cj4gWWVzLiBCdXQgSSBkb24ndCB0aGluayB0aGlzIGNoYW5nZSBpcyBu
ZWNlc3NhcnkgYXMgd2UgYWxyZWFkeSBpbmNsdWRlCj4gTlVMIGluIHRoZSBjb21wYXJpc29uLgoK
QWggLSBmYWlyIHBvaW50LsKgIEknbGwgZHJvcCB0aGlzIGh1bmsgdGhlbi4KCkFyZSB5b3UgaGFw
cHkgd2l0aCB0aGUgYWRqdXN0bWVudCBpbiBhcmNoL2FybS9jcHVlcnJhdGEuYyA/Cgp+QW5kcmV3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
