From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC 11/16] irq: skip action avalability check for
 guest's IRQ
Date: Wed, 12 Dec 2018 14:49:35 +0000
Message-ID: <74fb1410-5ba6-2da8-2be3-6de3bd89af38@arm.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-12-git-send-email-andrii.anisov@gmail.com>
 <3be90d82-cdcd-b3d5-c734-6da90ecd7344@arm.com>
 <c7678ede-86c5-f742-e749-acc4841d7481@gmail.com>
 <17e191b5-7252-c1d7-1f0f-39f98fdb9895@arm.com>
 <934f091c-234c-9bd6-52bc-2e78f9de4e17@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH0D=OV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gX5pV-0007B7-7h
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 14:49:41 +0000
In-Reply-To: <934f091c-234c-9bd6-52bc-2e78f9de4e17@gmail.com>
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

SGksCgpPbiAxMi8xMi8yMDE4IDEzOjUxLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEp1bGllbiwK
PiAKPiAKPiBPbiAxMi4xMi4xOCAxMzo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBBbiBBU1NF
UlQoLi4uKSBpcyBhbHJlYWR5IGVtYmVkIGluIGlycV9nZXRfZ3Vlc3RfaW5mbyhkZXNjKS4KPiBZ
ZXAuCj4gCj4+IEkgdGhvdWdodCBhYm91dCB0aGUgQVNTRVJUKC4uLikgb3ZlciB0aGUgY3VycmVu
dCBwcmludGsgeWVzdGVyZGF5LiBCdXQgSSAKPj4gZGlzY2FyZGVkIGl0IGJlY2F1c2UgaXQgZG9l
cyBub3QgZ2l2ZSB5b3UgbW9yZSBpbmZvcm1hdGlvbiBpZiBzb21ldGhpbmcgd2VudCAKPj4gcmVh
bGx5IHdyb25nIGFzIHRoZSBzdGFjayB0cmFjZSB3b3VsZCBub3QgcmVhbGx5IGJlIGhlbHBmdWwg
aW4gdGhhdCBjb250ZXh0Lgo+IEJ1dCBBU1NFUlQgYWxzbyBwcmludHMgYSBmYWlsZWQgY29uZGl0
aW9uIHRleHQuCgpBU1NFUlQgb25seSB0ZWxscyB5b3UgdGhhdCBkZXNjLT5hY3Rpb24gd2FzIE5V
TEwuIEl0IGRvZXMgbm90IHRlbGwgeW91IHdoaWNoIElSUSAKaGFzIHRoZSBkZXNjLT5hY3Rpb24g
PT0gTlVMTC4gSXQgaXMgYSBiaXQgYSBzaGFtZSB3ZSBkb24ndCBoYXZlIHdheSB0byBwcm92aWRl
IAphbm90aGVyIG1lc3NhZ2Ugd2l0aCBBU1NFUlQgdG8gaGVscCB5b3UgZGVidWdnaW5nLgoKPiAK
Pj4gU28gSSB3b3VsZCBwcmVmZXIgdGhlICNpZmRlZiBOREVCVUcgc29sdXRpb24uCj4gSSdtIGEg
Yml0IGNvbmZ1c2VkIGFib3V0IHlvdXIgc3VnZ2VzdGlvbi4KPiBEbyB5b3Ugd2FudCB0byBzZWUg
dHdvIGlkZW50aWNhbCBwaWVjZXMgb2YgY29kZSBiZWZvcmUgYW5kIGFmdGVyIHRoZSBgaWYgKCAK
PiB0ZXN0X2JpdChfSVJRX0dVRVNULCAmZGVzYy0+c3RhdHVzKSApYD8gT25lIHdpdGggYCNpZm5k
ZWYgTkRFQlVHYCwgb3RoZXIgd2l0aG91dC4KPiBJcyBteSB1bmRlcnN0YW5kaW5nIGNvcnJlY3Q/
CgpObywgSSBhbSBzdWdnZXN0aW5nIHRvIGhhdmUgdGhlIGN1cnJlbnQgaWYgKCB0ZXN0X2JpdCgu
Li4pICkgcHJvdGVjcmVkIHdpdGggCiNpZm5kZWYgTkRFQlVHLiBObyBjb2RlIGR1cGxpY2F0aW9u
LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
