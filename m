From: Julien Grall <julien.grall@arm.com>
Subject: Re: PING ARM [PATCH v2] xen/cmdline: Fix buggy
 strncmp(s, LITERAL, ss - s) construct
Date: Mon, 14 Jan 2019 16:07:17 +0000
Message-ID: <4f1859e5-c901-3e3e-ffc2-0e7233d1c794@arm.com>
References: <1546622255-9324-1-git-send-email-andrew.cooper3@citrix.com>
 <8161196e-b6ff-2ab1-eaa8-cdb5341ae178@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <8161196e-b6ff-2ab1-eaa8-cdb5341ae178@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3LAoKT24gMTQvMDEvMjAxOSAxNToxNywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9lZmkvZWZpLWJvb3QuaCBiL3hlbi9hcmNoL2FybS9l
ZmkvZWZpLWJvb3QuaAo+PiBpbmRleCBjYTY1NWZmLi4yMmE4NmVjIDEwMDY0NAo+PiAtLS0gYS94
ZW4vYXJjaC9hcm0vZWZpL2VmaS1ib290LmgKPj4gKysrIGIveGVuL2FyY2gvYXJtL2VmaS9lZmkt
Ym9vdC5oCj4+IEBAIC0yMTIsNyArMjEyLDcgQEAgRUZJX1NUQVRVUyBfX2luaXQgZmR0X2FkZF91
ZWZpX25vZGVzKEVGSV9TWVNURU1fVEFCTEUgKnN5c190YWJsZSwKPj4gICAgICAgICAgICAgICBi
cmVhazsKPj4gICAKPj4gICAgICAgICAgIHR5cGUgPSBmZHRfZ2V0cHJvcChmZHQsIG5vZGUsICJk
ZXZpY2VfdHlwZSIsICZsZW4pOwo+PiAtICAgICAgICBpZiAoIHR5cGUgJiYgc3RybmNtcCh0eXBl
LCAibWVtb3J5IiwgbGVuKSA9PSAwICkKPj4gKyAgICAgICAgaWYgKCB0eXBlICYmIGxlbiA9PSA2
ICYmIHN0cm5jbXAodHlwZSwgIm1lbW9yeSIsIDYpID09IDAgKQoKc3RyaW5nIHByb3BlcnR5IHRl
cm1pbmF0ZXMgd2l0aCBOVUwgYW5kIGlzIGluY2x1ZGVkIGluIHRoZSBsZW4uIFNvIEkgZG9uJ3Qg
dGhpbmsgCnRoaXMgY2hhbmdlIGlzIGNvcnJlY3QuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
