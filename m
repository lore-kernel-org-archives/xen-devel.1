From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH] libgnttab: Add support for Linux dma-buf
Date: Wed, 25 Jul 2018 12:49:29 +0300
Message-ID: <17f7f750-caf2-8f6e-782a-a17cb21a2ad1@gmail.com>
References: <20180723122725.5476-1-andr2000@gmail.com>
 <20180725093921.22ncfttvjfiu4bkl@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i4nl=kj=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fiGQH-0004E1-R0
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 09:49:33 +0000
Received: by mail-lf1-x143.google.com with SMTP id a134-v6so4998131lfe.6
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jul 2018 02:49:32 -0700 (PDT)
In-Reply-To: <20180725093921.22ncfttvjfiu4bkl@citrix.com>
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, ian.jackson@eu.citrix.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMjUvMjAxOCAxMjozOSBQTSwgV2VpIExpdSB3cm90ZToKPiBPbiBNb24sIEp1bCAyMywg
MjAxOCBhdCAwMzoyNzoyNVBNICswMzAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToK
Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtv
QGVwYW0uY29tPgo+Pgo+PiBBZGQgc3VwcG9ydCBmb3IgTGludXggZ3JhbnQgZGV2aWNlIGRyaXZl
ciBleHRlbnNpb24gd2hpY2ggYWxsb3dzCj4+IGNvbnZlcnRpbmcgZXhpc3RpbmcgZG1hLWJ1Zidz
IGludG8gYW4gYXJyYXkgb2YgZ3JhbnQgcmVmZXJlbmNlcwo+PiBhbmQgdmlzZSB2ZXJzYS4gVGhp
cyBpcyBvbmx5IGltcGxlbWVudGVkIGZvciBMaW51eCBhcyBvdGhlciBPU2VzCj4+IGhhdmUgbm8g
TGludXggZG1hLWJ1ZiBzdXBwb3J0Lgo+Pgo+PiBCdW1wIGdudHRhYiBsaWJyYXJ5IG1pbm9yIHZl
cnNpb24gdG8gMy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
PG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+IEhhcyB0aGUgTGludXggc2lkZSBi
ZWVuIG1lcmdlZCB5ZXQ/Ckl0IGlzIGdvaW5nIHRvIGJlIG1lcmdlZCBpbnRvIEJvcmlzJyBzdGFn
aW5nIGZvciBub3cKYW5kIHRoZW4gZXZlbnR1YWxseSBtb3ZlIGludG8gWGVuIHRpcCdzIGZvci1s
aW51cyAoQm9yaXMgY2FuCnRlbGwgbW9yZSBvbiB0aGF0OiBMaW51eCBpcyBhbHJlYWR5IGF0IHJj
Niwgc28gSSB0aGluayB0aGlzCmNhbiBoYXBwZW4gaW4gdGhlIG5lYXJlc3QgZnV0dXJlKS4KCkdp
dmVuIHRoYXQgWGVuIGFuZCBMaW51eCBwYXJ0cyBhcmUgYWN0dWFsbHkgaW5kZXBlbmRlbnQsCkkg
ZGVjaWRlZCB0byBzdGFydCB1cHN0cmVhbWluZyBsaWJnbnR0YWIgY2hhbmdlcyBub3csIGFsbG93
aW5nCm1lIHRvIG1hdHVyZSB0aGUgY29kZSBhbmQgYWRkcmVzcyBjb21tZW50cwo+IFdlaS4KVGhh
bmsgeW91LApPbGVrc2FuZHIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
