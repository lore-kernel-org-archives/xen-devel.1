From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2] gic: drop interrupts enabling on
 interrupts processing
Date: Fri, 31 May 2019 18:54:16 +0100
Message-ID: <56280030-d23f-5a6d-ed4d-6863af63b629@arm.com>
References: <1558949370-14331-1-git-send-email-andrii.anisov@gmail.com>
 <d63ff1d7-963a-bd1a-7835-ee5b30504628@arm.com>
 <20190531182511.7de8ff68@donnerap.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tza=T7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hWljQ-0008LA-BA
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 17:54:20 +0000
In-Reply-To: <20190531182511.7de8ff68@donnerap.cambridge.arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Andrii Anisov <andrii.anisov@gmail.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAzMS8wNS8yMDE5IDE4OjI1LCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPiBPbiBUdWUsIDI4
IE1heSAyMDE5IDE4OjA3OjE5ICswMTAwCj4gSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4gd3JvdGU6Cj4gCj4gWyAuLi4gXQo+IAo+PiBXaGlsZSBsb29raW5nIGF0IHRoZSBjb2Rl
LCBJIG5vdGljZWQgdGhhdCBpbiB0aGUgbmV3IHZnaWMgdmdpY19nZXRfaXJxKCkKPj4gbG9va3Mg
dW5zYWZlIHRvIGJlIGNhbGxlZCB3aXRoIGludGVycnVwdCB1bm1hc2tlZC4gVGhpcyBpcyBiZWNh
dXNlIG9uZQo+PiBvZiB0aGUgY2FsbGVlICh2Z2ljX2dldF9scGkoKSkgdGFrZXMgYSBzcGlubG9j
ayBhbmQgbm90IGEgc3BpbmxvY2tfaXJxLgo+PiBBbmRyZSwgd2hhdCBkbyB5b3UgdGhpbms/Cj4g
Cj4gSSB0aGluayB5b3UgYXJlIHJpZ2h0LiBJbiB2Z2ljX2luamVjdF9pcnEoKSwgcmlnaHQgYWZ0
ZXIgdGhlIGNhbGwgdG8gdmdpY19nZXRfaXJxKCksIHdlIHVzZSBzcGluX2xvY2tfaXJxc2F2ZSgp
IG9uIHRoZSBpcnFfbG9jaywgc28gdXNpbmcgdGhlIHNhbWUgaXJxc2F2ZSB2ZXJzaW9uIG9uIHRo
ZSBscGlfbGlzdF9sb2NrIHNlZW1zIG5lZWRlZC4gQnV0IHRoaXMgaXMgc29tZXdoYXQgdGhlb3Jl
dGljYWwgYXQgdGhlIG1vbWVudCwgYXMgSSB0aGluayB3ZSB3aWxsIG5ldmVyIExQSXMgdGhyb3Vn
aCB0aGUgbmV3IFZHSUMgYXQgdGhlIG1vbWVudC4KClRoYXQncyBjb3JyZWN0LCB3ZSBwcm9iYWJs
eSB3YW50IHRvIGFkZCB0aGF0IGluIHRoZSBsaXN0IG9mIFRPRE9zIGZvciB0aGUgbmV3IAp2R0lD
IDopLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
