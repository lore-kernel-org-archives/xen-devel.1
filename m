From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12 v3 4/5] xen/arm: Implement Set/Way
 operations
Date: Tue, 18 Dec 2018 17:58:19 +0000
Message-ID: <b0136d6c-ee03-3f9d-fb86-6be3985d12d6@arm.com>
References: <20181214115855.6713-1-julien.grall@arm.com>
 <20181214115855.6713-5-julien.grall@arm.com>
 <a70e7603-5cd1-ab16-9c8a-7ed029d528d5@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v4z/=O3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gZJdQ-0005i8-DJ
 for xen-devel@lists.xenproject.org; Tue, 18 Dec 2018 17:58:24 +0000
In-Reply-To: <a70e7603-5cd1-ab16-9c8a-7ed029d528d5@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3LAoKT24gMTIvMTQvMTggOTozMSBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBP
biAxNC8xMi8yMDE4IDAzOjU4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFNldC9XYXkgb3BlcmF0
aW9ucyBhcmUgdXNlZCB0byBwZXJmb3JtIG1haW50ZW5hbmNlIG9uIGEgZ2l2ZW4gY2FjaGUuCj4+
IEF0IHRoZSBtb21lbnQsIFNldC9XYXkgb3BlcmF0aW9ucyBhcmUgbm90IHRyYXBwZWQgYW5kIHRo
ZXJlZm9yZSBhIGd1ZXN0Cj4+IE9TIHdpbGwgZGlyZWN0bHkgYWN0IG9uIHRoZSBsb2NhbCBjYWNo
ZS4gSG93ZXZlciwgYSB2Q1BVIG1heSBtaWdyYXRlIHRvCj4+IGFub3RoZXIgcENQVSBpbiB0aGUg
bWlkZGxlIG9mIHRoZSBwcm9jZXNzb3IuIFRoaXMgd2lsbCByZXN1bHQgdG8gaGF2ZQo+PiBjYWNo
ZSB3aXRoIHN0YWxsIGRhdGEgKFNldC9XYXkgYXJlIG5vdCBwcm9wYWdhdGVkKSBwb3RlbnRpYWxs
eSBjYXVzaW5nCj4gCj4gcy9zdGFsbC9zdGFsZS8gPwoKWWVzLiBJIHRlbmQgdG8gY29uZnVzZSB0
aGUgYm90aCBhIGxvdC4KCkNoZWVycywKCj4gCj4gfkFuZHJldwo+IAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
