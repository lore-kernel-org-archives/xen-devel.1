From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12] arm/p2m: do not invalidate p2m
 root if it is shared with IOMMU
Date: Mon, 28 Jan 2019 16:54:10 +0000
Message-ID: <097a2b33-3ede-7949-3fa2-b3dd4058b5c4@arm.com>
References: <1548689694-30028-1-git-send-email-andrii.anisov@gmail.com>
 <4ab0408f-edf2-5302-17ee-3c181d5d561e@arm.com>
 <eb581cac-7123-e61d-0680-8f409018fa15@gmail.com>
 <0aa633d6-e671-8c22-1b73-fa1d47c5f6c5@arm.com>
 <8cbacbc7-e57c-b0c5-7e0e-ad238f795b5d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CKwR=QE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1goAAo-0001Cw-Iy
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 16:54:14 +0000
In-Reply-To: <8cbacbc7-e57c-b0c5-7e0e-ad238f795b5d@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxLzI4LzE5IDQ6NDAgUE0sIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4gCj4gCj4gT24gMjgu
MDEuMTkgMTg6MzYsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSG9sZCBvbiwgQ0E1NyBhbmQgQ0E1
MyBhcmUgQVJNdjggY29yZXMuIFNvIGFyZSB5b3UgdXNpbmcgMzItYml0IG9yIAo+PiA2NC1iaXQg
Z3Vlc3RzPwo+IDY0LWJpdCBndWVzdHMuCj4gCj4+IDY0LWJpdCBndWVzdCBzaG91bGQgbm90IGhh
dmUgYW55IFNldC9XYXkgb3BlcmF0aW9ucyB1bmxlc3MgeW91IGFyZSAKPj4gdXNpbmcgYSB2ZXJ5
IHZlcnkgb2xkIExpbnV4LiBTbyB3aGF0IGlzIHRoZSB2ZXJzaW9uIG9mIGVhY2ggZ3Vlc3Q/Cj4g
QWxsIG9mIHRoZW0gZGVyaXZlZCBmcm9tIDQuMTQuMzUuCgpUaGVyZSBzaG91bGQgYmUgbm8gU2V0
L1dheSBpbiBMaW51eCA0LjE0LiBTbyBJIGFtIGEgYml0IGNvbmZ1c2VkIGhvdyBjYW4gCmV2ZW4g
cmVhY2ggdGhpcyBjb2RlLgoKQ2FuIHlvdSBsb29rIGlmIHRoZXJlIGFyZSBhIFNldC9XYXkgZXhl
Y3V0ZWQgaW4gTGludXg/IEFuZCB3aGVyZT8gWW91IApjYW4gYWRkIHNvbWUgY29kZSBpbiBhcm02
NC92c3lzcmVnLmMgdG8gdHJhY2sgdGhhdCBkb3duLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
