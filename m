From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 02/39] ARM: GIC: add GIC_INVALID to enum
 gic_version
Date: Mon, 26 Mar 2018 13:08:13 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1803261308050.12360@sstabellini-ThinkPad-X260>
References: <20180321163235.12529-1-andre.przywara@linaro.org>
 <20180321163235.12529-3-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=desu=gq=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1f0YPg-0007Ev-Ku
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 20:08:16 +0000
In-Reply-To: <20180321163235.12529-3-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyMSBNYXIgMjAxOCwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gVGhlIGVudW0gZ2lj
X3ZlcnNpb24gYXQgdGhlIG1vbWVudCBqdXN0IGNvbnRhaW5zIEdJQ19WMiBhbmQgR0lDX1YzLAo+
IHdoZXJlIEdJQ19WMiBoYXBwZW5zIHRvIG1hcCB0byAwLiBTbyB3aXRob3V0IGhhdmluZyBpbml0
aWFsaXNlZCBhCj4gdmFyaWFibGUgb2YgdGhhdCB0eXBlLCB3ZSB3aWxsIHJlYWQgYmFjayBHSUNf
VjIgKHdoZW4gYWxsb2NhdGVkIHdpdGggemVyb2luZwo+IHRoZSBtZW1vcnkpLgo+IFRvIHByZXZl
bnQgYW1iaWd1aXRpZXMgYW5kIHRvIGdpdmUgYW4gZXhwbGljaXRseSB1bmluaXRpYWxpc2VkIHN0
YXRlLCBhZGQKPiBhIG5ldyBmaXJzdCBtZW1iZXI6IEdJQ19JTlZBTElELiBBbHNvIG1ha2UgaXQg
b2J2aW91cyB0aGF0IHRoaXMgaGFzIGEKPiAiMCIgZW5jb2RpbmcuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnByenl3YXJhQGxpbmFyby5vcmc+CgpBY2tlZC1ieTog
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4gLS0tCj4gIHhl
bi9pbmNsdWRlL2FzbS1hcm0vZ2ljLmggfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ2ljLmggYi94ZW4v
aW5jbHVkZS9hc20tYXJtL2dpYy5oCj4gaW5kZXggNTY1YjA4NzVjYS4uMzA3OTM4N2UwNiAxMDA2
NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2dpYy5oCj4gKysrIGIveGVuL2luY2x1ZGUv
YXNtLWFybS9naWMuaAo+IEBAIC0yMjcsNiArMjI3LDcgQEAgc3RydWN0IGdpY19sciB7Cj4gIH07
Cj4gIAo+ICBlbnVtIGdpY192ZXJzaW9uIHsKPiArICAgIEdJQ19JTlZBTElEID0gMCwgICAgLyog
dGhlIGRlZmF1bHQgdW50aWwgZXhwbGljaXRseSBzZXQgdXAgKi8KPiAgICAgIEdJQ19WMiwKPiAg
ICAgIEdJQ19WMywKPiAgfTsKPiAtLSAKPiAyLjE0LjEKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
