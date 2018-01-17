From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/5] xen/arm: Introduce enable callback to
 enable a capabilities on each online CPU
Date: Wed, 17 Jan 2018 09:16:59 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1801170914190.6440@sstabellini-ThinkPad-X260>
References: <20180116142337.24942-1-julien.grall@linaro.org>
 <20180116142337.24942-2-julien.grall@linaro.org>
 <alpine.DEB.2.10.1801161554390.6440@sstabellini-ThinkPad-X260>
 <3f287ea5-f122-b375-4d98-e33733516816@linaro.org>
 <7F2FA84A-2CBA-45EC-9073-7FC86205BE5A@gmail.com>
 <fbca8a32-b800-dfdc-d3cf-27740d98c9cf@linaro.org>
 <D1C765BC-DE91-439E-B7DE-27EEA33EBD12@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <D1C765BC-DE91-439E-B7DE-27EEA33EBD12@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Cc: Julien Grall <julien.grall@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, andre.przywara@linaro.org, xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAxNyBKYW4gMjAxOCwgTGFycyBLdXJ0aCB3cm90ZToKPiAgICAgICBSZWdhcmRpbmcg
UkVBRE1FLnNvdXJjZSwgdGhpcyBpcyBjb3ZlcmluZyBmaWxlIGFuZCBjb250YWluIHRoZSBzYW1l
IG1lbnRpb24gYXMgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLiBBcyB0aGlzIGlzIGEgc2luZ2xlIGZ1
bmN0aW9uLiBJc24ndCB0aGUgY29tbWl0IG1lc3NhZ2UKPiAgICAgICBlbm91Z2g/Cj4gCj4gCj4g
RnJvbSBhIGxlZ2FsIHZpZXdwb2ludCBpdCBpcyBlbm91Z2guCgpJZiB0aGF0IGlzIGVub3VnaCBm
cm9tIGEgbGVnYWwgdmlld3BvaW50LCB0aGVuIGl0IGlzIGVub3VnaCBmb3IgbWUuCgpIb3dldmVy
LCBmcm9tIGEgbGVnYWwgdmlld3BvaW50LCBJIHRob3VnaHQgd2UgbmVlZGVkIHRvIGV4cGxpY2l0
bHkKbWVudGlvbiBhbGwgdGhlIG9yaWdpbmFsIHNpZ25lZC1vZmYtYnlzIGJlY2F1c2UgSnVsaWVu
IGlzIG5vdCBhY3R1YWxseQp0aGUgY29weXJpZ2h0IGhvbGRlciBmb3IgdGhhdCBmdW5jdGlvbiwg
aGVuY2UsIHdlIG5lZWQgdG8gYWRkIHRoZQpzaWduZWQtb2ZmLWJ5cyBvZiBhbGwgdGhlIG1pc3Np
bmcgY29weXJpZ2h0IGhvbGRlcnMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
