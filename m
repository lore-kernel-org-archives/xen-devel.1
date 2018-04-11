From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: Re: [PATCH 1/4] xen: xen-pciback: Replace GFP_ATOMIC
 with GFP_KERNEL in pcistub_probe
Date: Wed, 11 Apr 2018 09:00:40 +0800
Message-ID: <311acb17-1cab-bb1a-b612-23e7523f6709__15094.9336159558$1523408410$gmane$org@gmail.com>
References: <1523286216-26345-1-git-send-email-baijiaju1990@gmail.com>
 <b07f0a27-f09d-1617-ab9e-ebbc761cb3a4@oracle.com>
 <74fe5dd3-fb85-bed8-82b6-a9fb7a3a376d@gmail.com>
 <9703e77f-35e8-aa11-9ddb-fdc322efd6d2@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+c8v=ha=gmail.com=baijiaju1990@srs-us1.protection.inumbo.net>)
 id 1f648C-00089X-GF
 for xen-devel@lists.xenproject.org; Wed, 11 Apr 2018 01:01:00 +0000
Received: by mail-pl0-x244.google.com with SMTP id t20-v6so115979ply.9
 for <xen-devel@lists.xenproject.org>; Tue, 10 Apr 2018 18:00:59 -0700 (PDT)
In-Reply-To: <9703e77f-35e8-aa11-9ddb-fdc322efd6d2@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, jgross@suse.com, gregkh@linuxfoundation.org
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMDE4LzQvMTAgMjM6MDEsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAwNC8xMC8y
MDE4IDEwOjMxIEFNLCBKaWEtSnUgQmFpIHdyb3RlOgo+Pgo+Pgo+PiBPbiAyMDE4LzQvMTAgMjI6
MjcsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4+IE9uIDA0LzA5LzIwMTggMTE6MDMgQU0sIEpp
YS1KdSBCYWkgd3JvdGU6Cj4+Pj4gcGNpc3R1Yl9wcm9iZSgpIGlzIG5ldmVyIGNhbGxlZCBpbiBh
dG9taWMgY29udGV4dC4KPj4+PiBUaGlzIGZ1bmN0aW9uIGlzIG9ubHkgc2V0IGFzICIucHJvYmUi
IGluIHN0cnVjdCBwY2lfZHJpdmVyLgo+Pj4+Cj4+Pj4gRGVzcGl0ZSBuZXZlciBnZXR0aW5nIGNh
bGxlZCBmcm9tIGF0b21pYyBjb250ZXh0LAo+Pj4+IHBjaXN0dWJfcHJvYmUoKSBjYWxscyBrbWFs
bG9jKCkgd2l0aCBHRlBfQVRPTUlDLAo+Pj4+IHdoaWNoIGRvZXMgbm90IHNsZWVwIGZvciBhbGxv
Y2F0aW9uLgo+Pj4+IEdGUF9BVE9NSUMgaXMgbm90IG5lY2Vzc2FyeSBhbmQgY2FuIGJlIHJlcGxh
Y2VkIHdpdGggR0ZQX0tFUk5FTCwKPj4+PiB3aGljaCBjYW4gc2xlZXAgYW5kIGltcHJvdmUgdGhl
IHBvc3NpYmlsaXR5IG9mIHN1Y2Vzc2Z1bCBhbGxvY2F0aW9uLgo+Pj4+Cj4+Pj4gVGhpcyBpcyBm
b3VuZCBieSBhIHN0YXRpYyBhbmFseXNpcyB0b29sIG5hbWVkIERDTlMgd3JpdHRlbiBieSBteXNl
bGYuCj4+Pj4gQW5kIEkgYWxzbyBtYW51YWxseSBjaGVjayBpdC4KPj4+Pgo+Pj4+IFNpZ25lZC1v
ZmYtYnk6IEppYS1KdSBCYWkgPGJhaWppYWp1MTk5MEBnbWFpbC5jb20+Cj4+PiBXaGF0IGFib3V0
IHVzZSBvZiBHRlBfQVRPTUlDIGluIHBjaXN0dWJfcmVnX2FkZCgpPwo+PiBUaGFua3MgZm9yIHlv
dXIgcmVwbHkgOikKPj4gSSBmaW5kIHBjaXN0dWJfcmVnX2FkZCgpIGlzIGNhbGxlZCBieSBwY2lz
dHViX3F1aXJrX2FkZCgpLgo+PiBBbmQgcGNpc3R1Yl9xdWlya19hZGQoKSBpcyBjYWxsZWQgaW4g
dGhlIG1hY3JvIERSSVZFUl9BVFRSKCkuCj4+IEkgYW0gbm90IHN1cmUgd2hldGhlciBEUklWRVJf
QVRUUigpIGNhbiBtYWtlIHRoZSBmdW5jdGlvbiBjYWxsZWQgaW4KPj4gYXRvbWljIGNvbnRleHQs
Cj4+IHNvIEkgZG8gbm90IGFuYWx5emUgaXQgaW4gbXkgdG9vbC4KPiBJIGRvbid0IHNlZSB3aHkg
aXQgbmVlZHMgdG8gYmUgQVRPTUlDLCBpdCdzIHN5c2ZzIGFjY2Vzcy4gQ2FuIHlvdSBzZW5kIGEK
PiBwYXRjaCB0byBmaXggaXQgYXMgd2VsbD8KCk9rYXksIEkgd2lsbCBzZW5kIGEgcGF0Y2ggZm9y
IGl0IHNvb24uCllvdSBjYW4gaGF2ZSBhIGxvb2sgOikKCgpCZXN0IHdpc2hlcywKSmlhLUp1IEJh
aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
