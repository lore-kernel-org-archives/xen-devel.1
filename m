From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen-netback: fix occasional leak of grant
 ref mappings under memory pressure
Date: Thu, 28 Feb 2019 09:50:08 +0000
Message-ID: <efd4aa90-e2f4-cd14-7890-6b47f3f94497__27985.6319468067$1551347470$gmane$org@citrix.com>
References: <1551319382-32595-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CBPn=RD=citrix.com=prvs=95589b391=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gzIKW-000677-4K
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 09:50:16 +0000
In-Reply-To: <1551319382-32595-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: paul.durrant@citrix.com, wei.liu2@citrix.com, davem@davemloft.net
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDIvMjAxOSAwMjowMywgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gWmVyby1jb3B5IGNh
bGxiYWNrIGZsYWcgaXMgbm90IHlldCBzZXQgb24gZnJhZyBsaXN0IHNrYiBhdCB0aGUgbW9tZW50
Cj4geGVudmlmX2hhbmRsZV9mcmFnX2xpc3QoKSByZXR1cm5zIC1FTk9NRU0uIFRoaXMgZXZlbnR1
YWxseSByZXN1bHRzIGluCj4gbGVha2luZyBncmFudCByZWYgbWFwcGluZ3Mgc2luY2UgeGVudmlm
X3plcm9jb3B5X2NhbGxiYWNrKCkgaXMgbmV2ZXIKPiBjYWxsZWQgZm9yIHRoZXNlIGZyYWdtZW50
cy4gVGhvc2UgZXZlbnR1YWxseSBidWlsZCB1cCBhbmQgY2F1c2UgWGVuCj4gdG8ga2lsbCBEb20w
IGFzIHRoZSBzbG90cyBnZXQgcmV1c2VkIGZvciBuZXcgbWFwcGluZ3MuCgpJdHMgd29ydGggcG9p
bnRpbmcgb3V0IHdoYXQgKGRlYnVnKSBYZW4gbm90aWNlcyBpcyBkb20wIHBlcmZvcm1pbmcKaW1w
bGljaXQgZ3JhbnQgdW5tYXAuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
