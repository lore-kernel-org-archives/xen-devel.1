From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 06/39] ARM: evtchn: Handle level
 triggered IRQs correctly
Date: Thu, 22 Mar 2018 02:08:42 +0000
Message-ID: <0a75bc53-8b52-99c2-395e-7f0091a1ff0a@arm.com>
References: <20180321163235.12529-1-andre.przywara@linaro.org>
 <20180321163235.12529-7-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rlws=gm=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eypep-0007Li-6K
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 02:08:47 +0000
In-Reply-To: <20180321163235.12529-7-andre.przywara@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMy8yMS8yMDE4IDA0OjMyIFBNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPiBUaGUgZXZl
bnQgY2hhbm5lbCBJUlEgaGFzIGxldmVsIHRyaWdnZXJlZCBzZW1hbnRpY3MsIGhvd2V2ZXIgdGhl
IGN1cnJlbnQKPiBWR0lDIHRyZWF0cyBldmVyeXRoaW5nIGFzIGVkZ2UgdHJpZ2dlcmVkLgo+IFRv
IGNvcnJlY3RseSBwcm9jZXNzIHRob3NlIElSUXMsIHdlIGhhdmUgdG8gbG93ZXIgdGhlICh2aXJ0
dWFsKSBJUlEgbGluZQo+IGF0IHNvbWUgcG9pbnQgaW4gdGltZSwgZGVwZW5kaW5nIG9uIHdoZXRo
ZXIgdGhlciBpbnRlcnJ1cHQgY29uZGl0aW9uCgpOSVQ6IHMvdGhlci90aGUvCgotLSAKSnVsaWVu
IEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
