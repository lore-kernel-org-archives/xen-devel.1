From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 5/8] xen/gntdev: Add initial support for
 dma-buf UAPI
Date: Tue, 29 May 2018 18:34:14 -0400
Message-ID: <232459a8-695f-56bf-e39b-693a2d2b27e3__21105.3740153604$1527633003$gmane$org@oracle.com>
References: <20180525153331.31188-1-andr2000@gmail.com>
 <20180525153331.31188-6-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4xbq=iq=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fNn97-0003NP-41
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 22:31:13 +0000
In-Reply-To: <20180525153331.31188-6-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMjUvMjAxOCAxMTozMyBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cgo+
ICAKPiArLyoKPiArICogQ3JlYXRlIGEgZG1hLWJ1ZiBbMV0gZnJvbSBncmFudCByZWZlcmVuY2Vz
IEByZWZzIG9mIGNvdW50IEBjb3VudCBwcm92aWRlZAo+ICsgKiBieSB0aGUgZm9yZWlnbiBkb21h
aW4gQGRvbWlkIHdpdGggZmxhZ3MgQGZsYWdzLgo+ICsgKgo+ICsgKiBCeSBkZWZhdWx0IGRtYS1i
dWYgaXMgYmFja2VkIGJ5IHN5c3RlbSBtZW1vcnkgcGFnZXMsIGJ1dCBieSBwcm92aWRpbmcKPiAr
ICogb25lIG9mIHRoZSBHTlRERVZfRE1BX0ZMQUdfWFhYIGZsYWdzIGl0IGNhbiBhbHNvIGJlIGNy
ZWF0ZWQgYXMKPiArICogYSBETUEgd3JpdGUtY29tYmluZSBvciBjb2hlcmVudCBidWZmZXIsIGUu
Zy4gYWxsb2NhdGVkIHdpdGggZG1hX2FsbG9jX3djLwo+ICsgKiBkbWFfYWxsb2NfY29oZXJlbnQu
Cj4gKyAqCj4gKyAqIFJldHVybnMgMCBpZiBkbWEtYnVmIHdhcyBzdWNjZXNzZnVsbHkgY3JlYXRl
ZCBhbmQgdGhlIGNvcnJlc3BvbmRpbmcKPiArICogZG1hLWJ1ZidzIGZpbGUgZGVzY3JpcHRvciBp
cyByZXR1cm5lZCBpbiBAZmQuCj4gKyAqCj4gKyAqIFsxXSBodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC9sYXRlc3Qvc291cmNlL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9kbWEtYnVm
LnJzdAoKCkRvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9kbWEtYnVmLnJzdC4KCgotYm9yaXMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
