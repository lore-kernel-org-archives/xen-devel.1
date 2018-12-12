From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC 11/16] irq: skip action avalability check for
 guest's IRQ
Date: Wed, 12 Dec 2018 11:59:54 +0000
Message-ID: <17e191b5-7252-c1d7-1f0f-39f98fdb9895@arm.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-12-git-send-email-andrii.anisov@gmail.com>
 <3be90d82-cdcd-b3d5-c734-6da90ecd7344@arm.com>
 <c7678ede-86c5-f742-e749-acc4841d7481@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH0D=OV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gX3BG-0006Xn-FT
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 11:59:58 +0000
In-Reply-To: <c7678ede-86c5-f742-e749-acc4841d7481@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMi8xMi8yMDE4IDExOjMwLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IAo+IAo+IE9uIDEx
LjEyLjE4IDE2OjQ4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEFuZCB5b3UgY2FuJ3Qgc2VlIGFu
eSBwb3RlbnRpYWwgcmFjZSBpbiB0aGF0IGNvZGUgaGFwcGVuaW5nIGluIHRoZSBmdXR1cmU/Cj4g
SXQgaXMgcHJvdGVjdGVkIHdpdGggYGRlc2MtPmxvY2tgIHNvIGZhci4gSWYgb25lIGRlY2lkZWQg
dG8gZ2V0IGl0IGZyb20gdW5kZXIgCj4gdGhlIGxvY2ssIHRoZSByYWNlIGlzIHBvc3NpYmxlIHdp
dGggYHJlbGVhc2VfaXJxKClgLgo+IAo+Pj4gQWxzbyBnZXR0aW5nIGFuIHVua25vd24KPj4+IGlu
dGVycnVwdCBpcyB2ZXJ5IHVubGlrZWx5IG9uIGEgbm9uLWRlYnVnIHBsYXRmb3JtLgo+Pgo+PiBJ
IGFtIHRlbXB0ZWQgdG8ga2VlcCB0aGUgY29kZSBhdCB0aGUgc2FtZSBwbGFjZSBidXQgcHJvdGVj
dCB3aXRoIGFuICNpZm5kZWYgCj4+IE5ERUJVRy4gV2hhdCBkbyB5b3UgdGhpbms/Cj4gV2VsbCwg
SSB0aGluayBhYm91dCBhIGNvcnJlc3BvbmRlbnQgQVNTRVJUIGZvciB0aGUgZ3Vlc3QgSVJRLiBM
aWtlIGZvbGxvd2luZzoKPiAKPj4+IMKgwqDCoMKgwqAgaWYgKCB0ZXN0X2JpdChfSVJRX0dVRVNU
LCAmZGVzYy0+c3RhdHVzKSApCj4+PiDCoMKgwqDCoMKgIHs+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
c3RydWN0IGlycV9ndWVzdCAqaW5mbyA9IGlycV9nZXRfZ3Vlc3RfaW5mbyhkZXNjKTsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBBU1NFUlQoIGRlc2MtPmFjdGlvbiAhPSBOVUxMICk7Cj4gCj4g
V2hhdCB3b3VsZCB5b3UgcHJlZmVyPwoKQW4gQVNTRVJUKC4uLikgaXMgYWxyZWFkeSBlbWJlZCBp
biBpcnFfZ2V0X2d1ZXN0X2luZm8oZGVzYykuCgpJIHRob3VnaHQgYWJvdXQgdGhlIEFTU0VSVCgu
Li4pIG92ZXIgdGhlIGN1cnJlbnQgcHJpbnRrIHllc3RlcmRheS4gQnV0IEkgCmRpc2NhcmRlZCBp
dCBiZWNhdXNlIGl0IGRvZXMgbm90IGdpdmUgeW91IG1vcmUgaW5mb3JtYXRpb24gaWYgc29tZXRo
aW5nIHdlbnQgCnJlYWxseSB3cm9uZyBhcyB0aGUgc3RhY2sgdHJhY2Ugd291bGQgbm90IHJlYWxs
eSBiZSBoZWxwZnVsIGluIHRoYXQgY29udGV4dC4KClNvIEkgd291bGQgcHJlZmVyIHRoZSAjaWZk
ZWYgTkRFQlVHIHNvbHV0aW9uLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
