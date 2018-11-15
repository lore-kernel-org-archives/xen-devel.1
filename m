From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 2/8] xen/arm: p2m: Introduce
 p2m_get_page_from_gfn
Date: Thu, 15 Nov 2018 15:22:07 +0000
Message-ID: <ba051c7c-f957-368a-9556-b857f9f5011c@arm.com>
References: <20181106191454.22143-1-julien.grall@arm.com>
 <20181106191454.22143-3-julien.grall@arm.com>
 <CAC1Wxdiko1Avrnxinq4Nk2+9=f9V2GHPvAzwGrRv5nH7WBe=qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zbOG=N2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gNJT9-0007RS-Kq
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 15:22:11 +0000
In-Reply-To: <CAC1Wxdiko1Avrnxinq4Nk2+9=f9V2GHPvAzwGrRv5nH7WBe=qg@mail.gmail.com>
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMS8xNS8xOCAxOjMxIFBNLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGll
biwKCkhpLAoKPiAKPiDQstGCLCA2INC70LjRgdGCLiAyMDE4INC+IDIxOjE2IEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGFybS5jb20+INC/0LjRiNC1Ogo+Pgo+PiBJbiBhIGZvbGxvdy11cCBw
YXRjaGVzLCB3ZSB3aWxsIG5lZWQgdG8gaGFuZGxlIGdldF9wYWdlX2Zyb21fZ2ZuCj4+IGRpZmZl
cmVudGx5IGZvciBET01JRF9YRU4uIFRvIGtlZXAgdGhlIGNvZGUgc2ltcGxlIG1vdmUgdGhlIGN1
cnJlbnQKPj4gY29udGVudCBpbiBhIG5ldyBzZXBhcmF0ZSBoZWxwZXIgcDJtX2dldF9wYWdlX2Zy
b21fZ2ZuLgo+Pgo+PiBOb3RlIHRoZSBuZXcgaGVscGVyIGlzIGEgbm90IGFueW1vcmUgYSBzdGF0
aWMgaW5saW5lIGZ1bmN0aW9uIGFzIHRoZSBoZWxwZXIKPj4gaXMgcXVpdGUgY29tcGxleC4KPiAK
PiBJbiB0aGUgcGF0Y2ggIltQQVRDSCA0LzhdIHhlbi9hcm06IEFkZCBzdXBwb3J0IGZvciByZWFk
LW9ubHkgZm9yZWlnbgo+IG1hcHBpbmdzIiB5b3UgbWFrZSBwMm1fZ2V0X3BhZ2VfZnJvbV9nZm4o
KSBjb21wYXJpbmdseSBjb21wbGV4LCBidXQKPiBzdGlsbCBrZWVwIGl0IGFzIHN0YXRpYyBpbmxp
bmUuIENvdWxkIHlvdSBwbGVhc2UgYmUgY29uc2lzdGVudCAobWFraW5nCj4gYm90aCBvZiB0aG9z
ZSBmdW5jdGlvbnMgaW5saW5lIG9yIG5vbi1pbmxpbmUpCgpUaGUgcmVhc29uIEkgZGlkbid0IG1v
dmUgdGhlIG90aGVyIG9uZSBpbiBwMm0uYyBpcyBiZWNhdXNlIHNvIGZhciBwMm0uYyAKaXMgb25s
eSBkZWFsaW5nIHdpdGggYXV0by10cmFuc2xhdGVkIGd1ZXN0LiBJIGRpZG4ndCB3YW50IHRvIGFk
ZCAKZnVuY3Rpb24gcmVsYXRlZCB3aXRoIG5vbi1hdXRvIHRyYW5zbGF0ZWQgZ3Vlc3QgaW4gaXQu
CgpJIGFsc28gZG9uJ3QgdGhpbmsgaW50cm9kdWNlIGEgbmV3IGZpbGUgZm9yIG9uZSAxMCBsaW5l
IGZ1bmN0aW9uIGlzIApyZWFsbHkgdXNlZnVsLgoKU28gdGhhdCB3YXMgdGhlIGJlc3Qgc29sdXRp
b24uIEkgYW0gb3BlbiB0byBvdGhlciBzdWdnZXN0aW9uLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
