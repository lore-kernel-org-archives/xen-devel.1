From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v2 2/3] drm/xen-front: Use Xen common shared
 buffer implementation
Date: Tue, 18 Dec 2018 17:15:55 +0100
Message-ID: <75f3a715-94a0-a21d-04c1-aa3cf4cdb331__21156.1954500668$1545149760$gmane$org@tronnes.org>
References: <20181130074205.20496-1-andr2000@gmail.com>
 <20181130074205.20496-2-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=S6qN=O3=tronnes.org=noralf@srs-us1.protection.inumbo.net>)
 id 1gZI2O-0005n4-Et
 for xen-devel@lists.xenproject.org; Tue, 18 Dec 2018 16:16:04 +0000
In-Reply-To: <20181130074205.20496-2-andr2000@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org, jgross@suse.com, boris.ostrovsky@oracle.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

CkRlbiAzMC4xMS4yMDE4IDA4LjQyLCBza3JldiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbzoKPiBG
cm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBh
bS5jb20+Cj4KPiBVc2UgcGFnZSBkaXJlY3RvcnkgYmFzZWQgc2hhcmVkIGJ1ZmZlciBpbXBsZW1l
bnRhdGlvbgo+IG5vdyBhdmFpbGFibGUgYXMgY29tbW9uIGNvZGUgZm9yIFhlbiBmcm9udGVuZCBk
cml2ZXJzLgo+Cj4gUmVtb3ZlIGZsdXNoaW5nIG9mIHNoYXJlZCBidWZmZXIgb24gcGFnZSBmbGlw
IGFzIHRoaXMKPiB3b3JrYXJvdW5kIG5lZWRzIGEgcHJvcGVyIGZpeC4KPgo+IFNpZ25lZC1vZmYt
Ynk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFt
LmNvbT4KPiAtLS0KClJldmlld2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVz
Lm9yZz4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
