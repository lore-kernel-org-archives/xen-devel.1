From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v2 2/3] drm/xen-front: Use Xen common shared
 buffer implementation
Date: Tue, 18 Dec 2018 20:48:41 +0200
Message-ID: <ee6401d6-0e36-11f0-785a-ef0e26e2f60b__41252.5256084793$1545158857$gmane$org@gmail.com>
References: <20181130074205.20496-1-andr2000@gmail.com>
 <20181130074205.20496-2-andr2000@gmail.com>
 <75f3a715-94a0-a21d-04c1-aa3cf4cdb331@tronnes.org>
 <0f699d62-41be-33ec-d62c-6fce10f8fd30@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3HKb=O3=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1gZKQA-00024I-Pu
 for xen-devel@lists.xenproject.org; Tue, 18 Dec 2018 18:48:46 +0000
Received: by mail-lj1-x244.google.com with SMTP id s5-v6so15110497ljd.12
 for <xen-devel@lists.xenproject.org>; Tue, 18 Dec 2018 10:48:45 -0800 (PST)
In-Reply-To: <0f699d62-41be-33ec-d62c-6fce10f8fd30@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org, jgross@suse.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDEyLzE4LzE4IDIwOjMxLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4gT24gMTIvMTgvMTgg
MTE6MTUgQU0sIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPj4gRGVuIDMwLjExLjIwMTggMDguNDIs
IHNrcmV2IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvOgo+Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+Pj4KPj4+IFVzZSBw
YWdlIGRpcmVjdG9yeSBiYXNlZCBzaGFyZWQgYnVmZmVyIGltcGxlbWVudGF0aW9uCj4+PiBub3cg
YXZhaWxhYmxlIGFzIGNvbW1vbiBjb2RlIGZvciBYZW4gZnJvbnRlbmQgZHJpdmVycy4KPj4+Cj4+
PiBSZW1vdmUgZmx1c2hpbmcgb2Ygc2hhcmVkIGJ1ZmZlciBvbiBwYWdlIGZsaXAgYXMgdGhpcwo+
Pj4gd29ya2Fyb3VuZCBuZWVkcyBhIHByb3BlciBmaXguCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTog
T2xla3NhbmRyIEFuZHJ1c2hjaGVua28KPj4+IDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFt
LmNvbT4KPj4+IC0tLQo+PiBSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJv
bm5lcy5vcmc+ClRoYW5rIHlvdSwgTm9yYWxmIQo+Cj4gTm93IHRoYXQgYWxsIDMgaGF2ZSBiZWVu
IGFja2VkL3Jldmlld2VkCj4KPiBBcHBsaWVkIHRvIGZvci1saW51cy00LjIxClRoYW5rIHlvdSwg
Qm9yaXMsIEp1ZXJnZW4hCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
