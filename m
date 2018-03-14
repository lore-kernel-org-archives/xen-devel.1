From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: xl.cfg error in usbdev, doc and code are different
Date: Wed, 14 Mar 2018 12:36:18 +0000
Message-ID: <b3d41bb3-6547-f227-b715-e609db2666b1@citrix.com>
References: <20180314114346.GA2109@perard>
 <20180314114530.ggo2e6zrftrtqs43@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=td4q=ge=citrix.com=prvs=6046475dd=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ew5eM-0001Ig-Il
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 12:36:58 +0000
In-Reply-To: <20180314114530.ggo2e6zrftrtqs43@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org, Ian Jackson <Ian.Jackson@eu.citrix.com>, Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTQvMjAxOCAxMTo0NSBBTSwgV2VpIExpdSB3cm90ZToKPiBDYyBHZW9yZ2UgYW5kIEp1
ZXJnZW4KPiAKPiBPbiBXZWQsIE1hciAxNCwgMjAxOCBhdCAxMTo0Mzo0NkFNICswMDAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPj4gSGksCj4+Cj4+IEkgZm9sbG93ZWQgYG1hbiB4bC5jZmdgIHRv
IGFkZCBhbiB1c2JkZXYgcHJvcGVydHkgdG8gbXkgZ3Vlc3QgY29uZmlnLAo+PiBhbmQgeGwgcmVq
ZWN0ZWQgaXQuCj4+Cj4+ICMgeGwgY3JlYXRlICJ1c2JkZXY9WydkZXZ0eXBlPWhvc3RkZXYsaG9z
dGJ1cz0xLGhvc3RhZGRyPTInLF0iIH4vYXJjaC5odm0KPj4gVW5rbm93biBzdHJpbmcgYGRldnR5
cGU9aG9zdGRldicgaW4gdXNiZGV2IHNwZWMKPj4KPj4KPj4gSW4geGxfcGFyc2UuYywgdGhlIGV4
cGVjdGVkIHN0cmluZyBzZWVtcyB0byBiZSAidHlwZT1ob3N0ZGV2Iiwgbm90Cj4+ICJkZXZ0eXBl
Ii4KPj4KPj4gV2hhdCdzIHRoZSByaWdodCBwcm9wZXJ0eSBuYW1lPwoKSSBkaWQgc29tZSBhcmNo
YWVvbG9neSwgYW5kIGl0IGFwcGVhcnM6CgoqIEluIHJlc3BvbnNlIHRvIHY3IG9mIENodW55YW4n
cyBwdnVzYiBzZXJpZXMsIEkgc3VnZ2VzdGVkIGFkZGluZyB0aGUKJ3R5cGU9aG9zdGRldicgb3B0
aW9uIChpbiByZXNwb25zZSB0byBwYXRjaCA3LzcsIHhsLmNmZykKCiogSW4gdjggb2YgdGhlIHNl
cmllcywgQ2h1bnlhbiBhZGRlZCB0aGUgImRldnR5cGU9aG9zdGRldiIgb3B0aW9uIChpbgo1Lzcs
IHRoZSBjb21tYW5kLWxpbmUgcGFyc2luZyBmdW5jdGlvbnMsIHdoaWNoIGFyZSByZS11c2VkIGZv
ciBjb25maWcKcGFyc2luZykuICBJdCB3YXMgYWxzbyBjYWxsZWQgImRldnR5cGUiIGluIHRoZSB4
bC5jZmcgbWFuIHBhZ2UuCgoqIEluIHY5IGZpcnN0IHNlbmQsIENodW55YW4gc3RpbGwgaGFkICJk
ZXZ0eXBlPWhvc3RkZXYiIGluIHRoZSBwYXJzZXIKYW5kIHRoZSBtYW4gcGFnZQoKKiBJbiB2OSdz
IFJFU0VORCAodG8gd2hpY2ggSSBnYXZlIG15IFItYiksIGl0IGhhZCBzaWxlbnRseSBjaGFuZ2Vk
IHRvCiJ0eXBlPWhvc3RkZXYiIGluIHRoZSBwYXJzZXIsIGJ1dCB3YXMgc3RpbGwgImRldnR5cGU9
aG9zdGRldiIgaW4gdGhlIG1hbgpwYWdlLgoKUGVyc29uYWxseSBJJ2QgcHJvYmFibHkgY2hhbmdl
IHRoZSBkb2NzIHRvIGZpdCB0aGUgYWN0dWFsIGJlaGF2aW9yLiAgQW55Cm90aGVyIHRob3VnaHRz
PwoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
