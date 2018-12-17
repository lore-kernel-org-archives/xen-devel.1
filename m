From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 2/3] drm/xen-front: Use Xen common shared
 buffer implementation
Date: Mon, 17 Dec 2018 10:26:42 -0500
Message-ID: <19501fdd-eae6-295e-7394-777c25ea4cf1__40425.4689849496$1545060360$gmane$org@oracle.com>
References: <20181130074205.20496-1-andr2000@gmail.com>
 <20181130074205.20496-2-andr2000@gmail.com>
 <3c69d924-11e1-7037-bfa5-276d22b245fe@gmail.com>
 <27491aa5-3548-4c39-13a2-132c738fae14@gmail.com>
 <71920419-f0ef-8489-35ff-ff8375cb7361@gmail.com>
 <ce52ec2e-1b22-8a2f-7f99-d90fcfdbfebd@oracle.com>
 <686a8b1e-3588-32bc-abc7-79221dc9c74e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h5pW=O2=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gYunW-0007iM-Nd
 for xen-devel@lists.xenproject.org; Mon, 17 Dec 2018 15:27:10 +0000
In-Reply-To: <686a8b1e-3588-32bc-abc7-79221dc9c74e@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, jgross@suse.com
Cc: alsa-devel@alsa-project.org, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTcvMTggMTA6MDMgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+IE9u
IDEyLzE3LzE4IDQ6NTIgUE0sIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4gT24gMTIvMTcvMTgg
NToxOSBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+PiBIZWxsbywgSnVlcmdl
biwgQm9yaXMhCj4+Pgo+Pj4gQXMgdGhpcyBEUk0gcGFydCBvZiB0aGUgc2VyaWVzIGlzIHRoZSBv
bmx5IG9uZSB3aGljaCBuZWVkcyBhY2svbmFjawo+Pj4KPj4+IChhbmQgaXQgbWlnaHQgdGFrZSBx
dWl0ZSBzb21lIHRpbWUgdG8gY29tcGxldGUpIGNvdWxkIHdlIHBsZWFzZQo+Pj4KPj4+IG1lcmdl
IHRoZSBwYXRjaGVzIDEgYW5kIDMgbm93IHRoYXQgYWxyZWFkeSBoYXZlIGFjay9yLWI/Cj4+Pgo+
Pgo+Pgo+PiBUQkggSSBhbSBub3Qgc3VyZSBpdCBtYWtlcyBzZW5zZSB0byBkbyB0aGlzIHdpdGhv
dXQgdGhlIHNlY29uZCBwYXRjaC4KPj4gUmVmYWN0b3JpbmcgKGFuZCBJSVVJQyB0aGlzIHNlcmll
cyBpcyBwdXJlbHkgcmVmYWN0b3JpbmcgLS0tIGlzIGl0IG5vdD8pCj4+IGlzIGRvbmUgdG8gcmVk
dWNlIGFtb3VudCBvZiBjb2RlLCBhbmQgd2l0aCBvbmx5IGZpcnN0IGFuZCB0aGlyZCBwYXRjaCB3
ZQo+PiBlbmQgdXAgd2l0aCBxdWl0ZSBhIHNpZ25pZmljYW50IGluY3JlYXNlIGluIHRoZSBudW1i
ZXIgb2YgTG9DLiAoSSBhbQo+PiBnb2luZyBwdXJlbHkgYnkgZGlmZnN0YXQpCj4+Cj4+IE9mIGNv
dXJzZSwgdGhlIG90aGVyIHJlYXNvbiBmb3IgcmVmYWN0b3JpbmcgaXMgdG8gZWxpbWluYXRlIGNv
ZGUKPj4gZHVwbGljYXRpb24sIGJ1dCB3aXRob3V0IHNlY29uZCBwYXRjaCB0aGF0IHdpbGwgbm90
IGhhcHBlbi4KPgo+IEFncmVlLCBidXQgdGhpcyBpcyB0aGUgYmFzaXMgZm9yIHRoZSBuZXcgcHYg
Y2FtZXJhIGZyb250ZW5kCj4KPiBJIGFtIHdvcmtpbmcgb24gbm93IFsxXSwgc28gZXZlbiBpZiB3
ZSBkbyBub3QgcmVtb3ZlIHRoZSBjb2RlIGZyb20gRFJNCj4KPiB0aGVuIHdlIGF0IGxlYXN0IGRv
IG5vdCBhZGQgaXQgdG8gdGhlIGNhbWVyYSBkcml2ZXIKCgpTaW5jZSAxIGFuZCAzIGFyZSBhbHJl
YWR5IEFDS2VkIHlvdSBzaG91bGQgYmUgYWJsZSB0byBzdGFydCB0aGUgY2FtZXJhCnNlcmllcyB3
aXRoIHRoZXNlIHR3byBwYXRjaGVzIGFzIHByZS1yZXF1aXNpdGVzIGV2ZW4gaWYgcGF0Y2ggMiBp
cyBzdGlsbApzdGFsbGVkIGJ5IHRoZSB0aW1lIHlvdXIgY2FtZXJhIGNvZGUgaXMgcG9zdGVkICh3
aGljaCBJIGFzc3VtZSB3aWxsIGJlCjQuMjIgb3IgbGF0ZXIpLgoKCgotYm9yaXMKCgo+Cj4+IC1i
b3Jpcwo+Cj4gVGhhbmsgeW91LAo+Cj4gT2xla3NhbmRyCj4KPiBbMV0KPiBodHRwczovL2dpdGh1
Yi5jb20vYW5kcjIwMDAvbGludXgvYmxvYi9jYW1lcmFfZnJvbnRfdjEvZHJpdmVycy9tZWRpYS94
ZW4vS2NvbmZpZyNMNgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
