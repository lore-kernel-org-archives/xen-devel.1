From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen/spinlock: Don't use pvqspinlock if only
 1 vCPU
Date: Thu, 19 Jul 2018 15:18:58 -0400
Message-ID: <22f2465a-128e-730f-bc51-5a55ef16a039__20257.64990035$1532027862$gmane$org@oracle.com>
References: <1532008100-26922-1-git-send-email-longman@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ez6l=kd=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fgERt-0004Zu-CV
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 19:18:49 +0000
In-Reply-To: <1532008100-26922-1-git-send-email-longman@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Waiman Long <longman@redhat.com>, Juergen Gross <jgross@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTkvMjAxOCAwOTo0OCBBTSwgV2FpbWFuIExvbmcgd3JvdGU6Cj4gT24gYSBWTSB3aXRo
IG9ubHkgMSB2Q1BVLCB0aGUgbG9ja2luZyBmYXN0IHBhdGhzIHdpbGwgYWx3YXlzIGJlCj4gc3Vj
Y2Vzc2Z1bC4gSW4gdGhpcyBjYXNlLCB0aGVyZSBpcyBubyBuZWVkIHRvIHVzZSB0aGUgdGhlIFBW
IHFzcGlubG9jawo+IGNvZGUgd2hpY2ggaGFzIGhpZ2hlciBvdmVyaGVhZCBvbiB0aGUgdW5sb2Nr
IHNpZGUgdGhhbiB0aGUgbmF0aXZlCj4gcXNwaW5sb2NrIGNvZGUuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBXYWltYW4gTG9uZyA8bG9uZ21hbkByZWRoYXQuY29tPgo+IC0tLQo+ICBhcmNoL3g4Ni94ZW4v
c3BpbmxvY2suYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vc3BpbmxvY2suYyBiL2Fy
Y2gveDg2L3hlbi9zcGlubG9jay5jCj4gaW5kZXggY2Q5N2E2Mi4uMzhmNDdhZSAxMDA2NDQKPiAt
LS0gYS9hcmNoL3g4Ni94ZW4vc3BpbmxvY2suYwo+ICsrKyBiL2FyY2gveDg2L3hlbi9zcGlubG9j
ay5jCj4gQEAgLTEzMCw3ICsxMzAsOCBAQCB2b2lkIHhlbl91bmluaXRfbG9ja19jcHUoaW50IGNw
dSkKPiAgdm9pZCBfX2luaXQgeGVuX2luaXRfc3BpbmxvY2tzKHZvaWQpCj4gIHsKPiAgCj4gLQlp
ZiAoIXhlbl9wdnNwaW4pIHsKPiArCS8qICBEb24ndCBuZWVkIHRvIHVzZSBwdnFzcGlubG9jayBj
b2RlIGlmIHRoZXJlIGlzIG9ubHkgMSB2Q1BVLiAqLwo+ICsJaWYgKCF4ZW5fcHZzcGluIHx8IG51
bV9wb3NzaWJsZV9jcHVzKCkgPT0gMSkgewo+ICAJCXByaW50ayhLRVJOX0RFQlVHICJ4ZW46IFBW
IHNwaW5sb2NrcyBkaXNhYmxlZFxuIik7Cj4gIAkJcmV0dXJuOwo+ICAJfQoKCkkgdGhpbmsgd2Ug
bmVlZCB0byBzZXQgeGVuX3B2c3BpbiB0byBmYWxzZSBmb3Igc3VjaCBjb25maWd1cmF0aW9ucy4K
Tm90aWNlIHRoYXQgeGVuX2luaXRfbG9ja19jcHUoKSB3aWxsIHRyeSB0byBwZXJmb3JtIHNvbWUg
YWRkaXRpb25hbApwdnNwaW5sb2NrIGluaXRpYWxpemF0aW9ucy4KCgotYm9yaXMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
