From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 2/3] drm/xen-front: Use Xen common shared
 buffer implementation
Date: Tue, 18 Dec 2018 13:31:41 -0500
Message-ID: <0f699d62-41be-33ec-d62c-6fce10f8fd30__28719.7394566194$1545157847$gmane$org@oracle.com>
References: <20181130074205.20496-1-andr2000@gmail.com>
 <20181130074205.20496-2-andr2000@gmail.com>
 <75f3a715-94a0-a21d-04c1-aa3cf4cdb331@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mp/4=O3=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gZKA0-0000yk-B5
 for xen-devel@lists.xenproject.org; Tue, 18 Dec 2018 18:32:04 +0000
In-Reply-To: <75f3a715-94a0-a21d-04c1-aa3cf4cdb331@tronnes.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org, jgross@suse.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTgvMTggMTE6MTUgQU0sIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPgo+IERlbiAzMC4x
MS4yMDE4IDA4LjQyLCBza3JldiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbzoKPj4gRnJvbTogT2xl
a3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+
Pgo+PiBVc2UgcGFnZSBkaXJlY3RvcnkgYmFzZWQgc2hhcmVkIGJ1ZmZlciBpbXBsZW1lbnRhdGlv
bgo+PiBub3cgYXZhaWxhYmxlIGFzIGNvbW1vbiBjb2RlIGZvciBYZW4gZnJvbnRlbmQgZHJpdmVy
cy4KPj4KPj4gUmVtb3ZlIGZsdXNoaW5nIG9mIHNoYXJlZCBidWZmZXIgb24gcGFnZSBmbGlwIGFz
IHRoaXMKPj4gd29ya2Fyb3VuZCBuZWVkcyBhIHByb3BlciBmaXguCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvCj4+IDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0Bl
cGFtLmNvbT4KPj4gLS0tCj4KPiBSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZA
dHJvbm5lcy5vcmc+Cj4KCgpOb3cgdGhhdCBhbGwgMyBoYXZlIGJlZW4gYWNrZWQvcmV2aWV3ZWQK
CkFwcGxpZWQgdG8gZm9yLWxpbnVzLTQuMjEKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
