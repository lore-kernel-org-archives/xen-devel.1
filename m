From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH-for-4.12] docs: Fix dm_restrict documentation
Date: Fri, 25 Jan 2019 14:47:20 +0000
Message-ID: <682e640c-565e-f20c-b2fe-13d7ebfe075c@citrix.com>
References: <20190124174827.15902-1-george.dunlap@citrix.com>
 <20190125113305.aiw2u2fzzblb33mu@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=impP=QB=citrix.com=prvs=9214c967e=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gn2lY-00079H-3J
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 14:47:32 +0000
In-Reply-To: <20190125113305.aiw2u2fzzblb33mu@zion.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMS8yNS8xOSAxMTozMyBBTSwgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIEphbiAyNCwgMjAx
OSBhdCAwNTo0ODoyN1BNICswMDAwLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBSZW1vdmUgImNo
YXR0eSIgYW5kIHJlZHVuZGFudCBpbmZvcm1hdGlvbiBmcm9tIHRoZSB4bCBtYW4gcGFnZTsKPj4g
cmVzdHJpY3QgaXQgdG8gZnVuY3Rpb25hbCBkZXNjcmlwdGlvbnMgb25seSwgYW5kIHBvaW50IGlu
c3RlYWQgdG8KPj4gcWVtdS1kZXByaXYucGFuZG9jIGFuZCBTVVBQT1JULm1kIGFzIGxvY2F0aW9u
cyBmb3IgImNhbm9uaWNhbCIKPj4gaW5mb3JtYXRpb24uCj4+Cj4+IEFkZCBhIG1hbiBwYWdlIGVu
dHJ5IGZvciBkZXZpY2VfbW9kZWxfdXNlci4KPj4KPj4gVXBkYXRlIHFlbXUtZGVwcml2aWxlZ2Uu
cGFuZG9jOgo+Pgo+PiBDaGFuZ2VzIGluIG1pc3NpbmcgZmVhdHVyZSBsaXN0Ogo+PiAtIE1pZ3Jh
dGlvbiBpcyBmdW5jdGlvbmFsCj4+IC0gQnV0IHFkaXNrIGJhY2tlbmRzIGFyZSBub3QKPj4KPj4g
QWRkIGEgbWlzc2luZyByZXN0cmljdGlvbiBsaXN0Lgo+Pgo+PiBUaGUgZm9sbG93aW5nIHN0YXRl
bWVudHMgZnJvbSB0aGUgbWFuIHBhZ2UgYXJlIGRyb3BwZWQ6Cj4+IC0gTWVudGlvbmluZyBQVjsg
UFYgZ3Vlc3RzIG5ldmVyIGhhdmUgYSBkZXZpY2UgbW9kZWwuCj4+IC0gRHJvcCB0aGUgY29uZnVz
aW5nIHN0YXRlbWVudCBhYm91dCBzdGR2Z2EgYW5kIGNpcnJ1cyB2Z2Egb3B0aW9ucy4KPj4gLSBS
ZS11c2VkIGRvbWFpbiBJRHMgYXJlIG5vdyBoYW5kbGVkLgo+PiAtIERldmljZSBtb2RlbHMgc2hv
dWxkIG5vIGxvbmdlciBiZSBhYmxlIHRvIGNyZWF0ZSB3b3JsZC1yZWFkYWJsZQo+PiAgIGZpbGVz
IG9uIGRvbTAncyBmaWxlc3lzdGVtLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFw
IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4+IC0tLQo+PiBSRkM6IEkgZG9uJ3Qga25vdyB3
aGF0IHRoZSAndmdhJyBsaW1pdGF0aW9uIHRoaW5nIHdhcyBhYm91dCAtLSBJIHRyaWVkCj4+IGJv
dGggJ2RlZmF1bHQnIGFuZCAnc3RndmdhJyB3aXRoIGRtX3Jlc3RyaWN0IGFuZCB0aGV5IHdvcmtl
ZCBmaW5lLgo+IAo+IEkgdGhpbmsgdW50aWwgd2UgZmlndXJlIG91dCB0aGUgc2l0dWF0aW9uIG9m
IHZnYSwgdGhlIHN0YXRlbWVudCBzaG91bGQKPiBzdGF5LgoKSG93IHdvdWxkIHdlIGRvIHRoYXQ/
CgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
