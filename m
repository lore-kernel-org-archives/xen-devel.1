From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v2 2/3] drm/xen-front: Use Xen common shared
 buffer implementation
Date: Mon, 17 Dec 2018 17:03:43 +0200
Message-ID: <686a8b1e-3588-32bc-abc7-79221dc9c74e__36588.6550549932$1545058957$gmane$org@gmail.com>
References: <20181130074205.20496-1-andr2000@gmail.com>
 <20181130074205.20496-2-andr2000@gmail.com>
 <3c69d924-11e1-7037-bfa5-276d22b245fe@gmail.com>
 <27491aa5-3548-4c39-13a2-132c738fae14@gmail.com>
 <71920419-f0ef-8489-35ff-ff8375cb7361@gmail.com>
 <ce52ec2e-1b22-8a2f-7f99-d90fcfdbfebd@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nfmp=O2=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1gYuQv-000647-78
 for xen-devel@lists.xenproject.org; Mon, 17 Dec 2018 15:03:49 +0000
Received: by mail-lf1-x141.google.com with SMTP id b20so9668683lfa.12
 for <xen-devel@lists.xenproject.org>; Mon, 17 Dec 2018 07:03:47 -0800 (PST)
In-Reply-To: <ce52ec2e-1b22-8a2f-7f99-d90fcfdbfebd@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, jgross@suse.com
Cc: alsa-devel@alsa-project.org, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTcvMTggNDo1MiBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDEyLzE3LzE4
IDU6MTkgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiBIZWxsbywgSnVlcmdl
biwgQm9yaXMhCj4+Cj4+IEFzIHRoaXMgRFJNIHBhcnQgb2YgdGhlIHNlcmllcyBpcyB0aGUgb25s
eSBvbmUgd2hpY2ggbmVlZHMgYWNrL25hY2sKPj4KPj4gKGFuZCBpdCBtaWdodCB0YWtlIHF1aXRl
IHNvbWUgdGltZSB0byBjb21wbGV0ZSkgY291bGQgd2UgcGxlYXNlCj4+Cj4+IG1lcmdlIHRoZSBw
YXRjaGVzIDEgYW5kIDMgbm93IHRoYXQgYWxyZWFkeSBoYXZlIGFjay9yLWI/Cj4+Cj4KPgo+IFRC
SCBJIGFtIG5vdCBzdXJlIGl0IG1ha2VzIHNlbnNlIHRvIGRvIHRoaXMgd2l0aG91dCB0aGUgc2Vj
b25kIHBhdGNoLgo+IFJlZmFjdG9yaW5nIChhbmQgSUlVSUMgdGhpcyBzZXJpZXMgaXMgcHVyZWx5
IHJlZmFjdG9yaW5nIC0tLSBpcyBpdCBub3Q/KQo+IGlzIGRvbmUgdG8gcmVkdWNlIGFtb3VudCBv
ZiBjb2RlLCBhbmQgd2l0aCBvbmx5IGZpcnN0IGFuZCB0aGlyZCBwYXRjaCB3ZQo+IGVuZCB1cCB3
aXRoIHF1aXRlIGEgc2lnbmlmaWNhbnQgaW5jcmVhc2UgaW4gdGhlIG51bWJlciBvZiBMb0MuIChJ
IGFtCj4gZ29pbmcgcHVyZWx5IGJ5IGRpZmZzdGF0KQo+Cj4gT2YgY291cnNlLCB0aGUgb3RoZXIg
cmVhc29uIGZvciByZWZhY3RvcmluZyBpcyB0byBlbGltaW5hdGUgY29kZQo+IGR1cGxpY2F0aW9u
LCBidXQgd2l0aG91dCBzZWNvbmQgcGF0Y2ggdGhhdCB3aWxsIG5vdCBoYXBwZW4uCgpBZ3JlZSwg
YnV0IHRoaXMgaXMgdGhlIGJhc2lzIGZvciB0aGUgbmV3IHB2IGNhbWVyYSBmcm9udGVuZAoKSSBh
bSB3b3JraW5nIG9uIG5vdyBbMV0sIHNvIGV2ZW4gaWYgd2UgZG8gbm90IHJlbW92ZSB0aGUgY29k
ZSBmcm9tIERSTQoKdGhlbiB3ZSBhdCBsZWFzdCBkbyBub3QgYWRkIGl0IHRvIHRoZSBjYW1lcmEg
ZHJpdmVyCgo+IC1ib3JpcwoKVGhhbmsgeW91LAoKT2xla3NhbmRyCgpbMV0gCmh0dHBzOi8vZ2l0
aHViLmNvbS9hbmRyMjAwMC9saW51eC9ibG9iL2NhbWVyYV9mcm9udF92MS9kcml2ZXJzL21lZGlh
L3hlbi9LY29uZmlnI0w2CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
