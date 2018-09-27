From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] xen/blkfront: When purging persistent
 grants, keep them in the buffer
Date: Thu, 27 Sep 2018 08:26:16 -0600
Message-ID: <5bd1a695-50c6-e79f-38dd-c980fc2138ad__10538.3489434191$1538058311$gmane$org@kernel.dk>
References: <20180922195549.27953-1-boris.ostrovsky@oracle.com>
 <28aa9249-7406-21c6-f509-65411828e2d7@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=moov=mj=kernel.dk=axboe@srs-us1.protection.inumbo.net>)
 id 1g5XFF-0003L7-HK
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 14:26:21 +0000
Received: by mail-io1-xd41.google.com with SMTP id y10-v6so2057200ioa.10
 for <xen-devel@lists.xenproject.org>; Thu, 27 Sep 2018 07:26:19 -0700 (PDT)
In-Reply-To: <28aa9249-7406-21c6-f509-65411828e2d7@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, konrad.wilk@oracle.com, roger.pau@citrix.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gOS8yNy8xOCAxOjEyIEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDIyLzA5LzE4IDIx
OjU1LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+IENvbW1pdCBhNDZiNTM2NzJiMmMgKCJ4ZW4v
YmxrZnJvbnQ6IGNsZWFudXAgc3RhbGUgcGVyc2lzdGVudCBncmFudHMiKQo+PiBhZGRlZCBzdXBw
b3J0IGZvciBwdXJnaW5nIHBlcnNpc3RlbnQgZ3JhbnRzIHdoZW4gdGhleSBhcmUgbm90IGluIHVz
ZS4gQXMKPj4gcGFydCBvZiB0aGUgcHVyZ2UsIHRoZSBncmFudHMgd2VyZSByZW1vdmVkIGZyb20g
dGhlIGdyYW50IGJ1ZmZlciwgVGhpcwo+PiBldmVudHVhbGx5IGNhdXNlcyB0aGUgYnVmZmVyIHRv
IGJlY29tZSBlbXB0eSwgd2l0aCBCVUdfT04gdHJpZ2dlcmVkIGluCj4+IGdldF9mcmVlX2dyYW50
KCkuIFRoaXMgY2FuIGJlIG9ic2VydmVkIGV2ZW4gb24gYW4gaWRsZSBzeXN0ZW0sIHdpdGhpbgo+
PiAyMC0zMCBtaW51dGVzLgo+Pgo+PiBXZSBzaG91bGQga2VlcCB0aGUgZ3JhbnRzIGluIHRoZSBi
dWZmZXIgd2hlbiBwdXJnaW5nLCBhbmQgb25seSBmcmVlIHRoZQo+PiBncmFudCByZWYuCj4+Cj4+
IEZpeGVzOiBhNDZiNTM2NzJiMmMgKCJ4ZW4vYmxrZnJvbnQ6IGNsZWFudXAgc3RhbGUgcGVyc2lz
dGVudCBncmFudHMiKQo+PiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9z
dHJvdnNreUBvcmFjbGUuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+CgpTaW5jZSBLb25yYWQgaXMgb3V0LCBJJ20gZ29pbmcgdG8gcXVldWUgdGhp
cyB1cCBmb3IgNC4xOS4KCi0tIApKZW5zIEF4Ym9lCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
