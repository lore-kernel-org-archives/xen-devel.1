From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 2/3] drm/xen-front: Use Xen common shared
 buffer implementation
Date: Mon, 17 Dec 2018 09:52:24 -0500
Message-ID: <ce52ec2e-1b22-8a2f-7f99-d90fcfdbfebd__39232.1823667318$1545058289$gmane$org@oracle.com>
References: <20181130074205.20496-1-andr2000@gmail.com>
 <20181130074205.20496-2-andr2000@gmail.com>
 <3c69d924-11e1-7037-bfa5-276d22b245fe@gmail.com>
 <27491aa5-3548-4c39-13a2-132c738fae14@gmail.com>
 <71920419-f0ef-8489-35ff-ff8375cb7361@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h5pW=O2=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gYuGE-00053f-2f
 for xen-devel@lists.xenproject.org; Mon, 17 Dec 2018 14:52:46 +0000
In-Reply-To: <71920419-f0ef-8489-35ff-ff8375cb7361@gmail.com>
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

T24gMTIvMTcvMTggNToxOSBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4gSGVs
bG8sIEp1ZXJnZW4sIEJvcmlzIQo+Cj4gQXMgdGhpcyBEUk0gcGFydCBvZiB0aGUgc2VyaWVzIGlz
IHRoZSBvbmx5IG9uZSB3aGljaCBuZWVkcyBhY2svbmFjawo+Cj4gKGFuZCBpdCBtaWdodCB0YWtl
IHF1aXRlIHNvbWUgdGltZSB0byBjb21wbGV0ZSkgY291bGQgd2UgcGxlYXNlCj4KPiBtZXJnZSB0
aGUgcGF0Y2hlcyAxIGFuZCAzIG5vdyB0aGF0IGFscmVhZHkgaGF2ZSBhY2svci1iPwo+CgoKClRC
SCBJIGFtIG5vdCBzdXJlIGl0IG1ha2VzIHNlbnNlIHRvIGRvIHRoaXMgd2l0aG91dCB0aGUgc2Vj
b25kIHBhdGNoLgpSZWZhY3RvcmluZyAoYW5kIElJVUlDIHRoaXMgc2VyaWVzIGlzIHB1cmVseSBy
ZWZhY3RvcmluZyAtLS0gaXMgaXQgbm90PykKaXMgZG9uZSB0byByZWR1Y2UgYW1vdW50IG9mIGNv
ZGUsIGFuZCB3aXRoIG9ubHkgZmlyc3QgYW5kIHRoaXJkIHBhdGNoIHdlCmVuZCB1cCB3aXRoIHF1
aXRlIGEgc2lnbmlmaWNhbnQgaW5jcmVhc2UgaW4gdGhlIG51bWJlciBvZiBMb0MuIChJIGFtCmdv
aW5nIHB1cmVseSBieSBkaWZmc3RhdCkKCk9mIGNvdXJzZSwgdGhlIG90aGVyIHJlYXNvbiBmb3Ig
cmVmYWN0b3JpbmcgaXMgdG8gZWxpbWluYXRlIGNvZGUKZHVwbGljYXRpb24sIGJ1dCB3aXRob3V0
IHNlY29uZCBwYXRjaCB0aGF0IHdpbGwgbm90IGhhcHBlbi4KCi1ib3JpcwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
