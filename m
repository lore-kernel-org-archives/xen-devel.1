From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/HVM: don't give the wrong impression
 of WRMSR succeeding
Date: Fri, 23 Feb 2018 10:07:31 +0000
Message-ID: <6bbd6b49-6781-4fbb-3d5d-78ce183bda65@citrix.com>
References: <5A8ED75E02000078001AA6A4@prv-mh.provo.novell.com>
 <5A8FE09E02000078001AABC6@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ixqo=fr=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1epAGP-0001R8-6K
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 10:07:37 +0000
In-Reply-To: <5A8FE09E02000078001AABC6@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDIvMjAxOCAwODozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gLi4uIGZvciBub24tZXhp
c3RlbnQgTVNSczogd3Jtc3JfaHlwZXJ2aXNvcl9yZWdzKCkncyBjb21tZW50IGNsZWFybHkKPiBz
YXlzIHRoYXQgdGhlIGZ1bmN0aW9uIHJldHVybnMgMCBmb3IgdW5yZWNvZ25pemVkIE1TUnMsIHNv
Cj4ge3N2bSx2bXh9X21zcl93cml0ZV9pbnRlcmNlcHQoKSBzaG91bGQgbm90IGNvbnZlcnQgdGhp
cyBpbnRvIHN1Y2Nlc3MuIFdlCj4gZG9uJ3Qgd2FudCB0byB1bmNvbmRpdGlvbmFsbHkgZmFpbCB0
aGUgYWNjZXNzIHRob3VnaCwgYXMgd2UgY2FuJ3QgYmUKPiBjZXJ0YWluIHRoZSBsaXN0IG9mIGhh
bmRsZWQgTVNScyBpcyBjb21wbGV0ZSBlbm91Z2ggZm9yIHRoZSBndWVzdCB0eXBlcwo+IHdlIGNh
cmUgYWJvdXQsIHNvIGluc3RlYWQgbWlycm9yIHdoYXQgd2UgZG8gb24gdGhlIHJlYWQgcGF0aHMg
YW5kIHByb2JlCj4gdGhlIE1TUiB0byBkZWNpZGUgd2hldGhlciB0byByYWlzZSAjR1AuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpJJ20gbm90IGEg
ZmFuIG9mIHRoaXMgYXBwcm9hY2gsIGJ1dCBJIGFjY2VwdCB0aGF0IGl0IG1pZ2h0IGJlIHRoZSBs
ZWFzdApiYWQgb3B0aW9uIGdvaW5nLgoKSG93ZXZlciwgSSdtIHN0cnVnZ2xpbmcgdG8gdW5kZXJz
dGFuZCBob3cgaXQgcmVzb2x2ZXMgdGhlIGlzc3VlIHlvdQpwcmVzZW50ZWQ/wqAgSW4gdGhlIGV4
YW1wbGUsIExpbnV4IGRpZCBhIHdybXNyX3NhZmUoKSB0aGVuIGJsZXcgdXAgb24gYQpyZG1zcigp
LsKgIFdhcyB0aGF0IGluIGZhY3QgcnVubmluZyBvbiBoYXJkd2FyZSBsYWNraW5nIFBTUi9Rb1Mg
c3VwcG9ydD8KCklycmVzcGVjdGl2ZSwgSSB0aGluayB0aGF0IGVudGlyZSBibG9jayBvZiBNU1Jz
IHdhbnRzIGJsYWNrbGlzdGluZyBpbgp0aGUgc2hvcnQgdGVybSwgdG8gbWFrZSB0aGVtIGluYWNj
ZXNzaWJsZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
