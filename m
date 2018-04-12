From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 1/4] xen: xen-pciback: Replace GFP_ATOMIC
 with GFP_KERNEL in pcistub_probe
Date: Wed, 11 Apr 2018 22:16:12 -0400
Message-ID: <7096e165-3f2b-3c81-f59a-c9a96cef22ef__4584.76839489794$1523499327$gmane$org@oracle.com>
References: <1523286216-26345-1-git-send-email-baijiaju1990@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7qv6=hb=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1f6Rme-0004FH-4K
 for xen-devel@lists.xenproject.org; Thu, 12 Apr 2018 02:16:20 +0000
In-Reply-To: <1523286216-26345-1-git-send-email-baijiaju1990@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jia-Ju Bai <baijiaju1990@gmail.com>, jgross@suse.com, gregkh@linuxfoundation.org
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNC8wOS8yMDE4IDExOjAzIEFNLCBKaWEtSnUgQmFpIHdyb3RlOgo+IHBjaXN0dWJfcHJv
YmUoKSBpcyBuZXZlciBjYWxsZWQgaW4gYXRvbWljIGNvbnRleHQuCj4gVGhpcyBmdW5jdGlvbiBp
cyBvbmx5IHNldCBhcyAiLnByb2JlIiBpbiBzdHJ1Y3QgcGNpX2RyaXZlci4KPiAKPiBEZXNwaXRl
IG5ldmVyIGdldHRpbmcgY2FsbGVkIGZyb20gYXRvbWljIGNvbnRleHQsCj4gcGNpc3R1Yl9wcm9i
ZSgpIGNhbGxzIGttYWxsb2MoKSB3aXRoIEdGUF9BVE9NSUMsCj4gd2hpY2ggZG9lcyBub3Qgc2xl
ZXAgZm9yIGFsbG9jYXRpb24uCj4gR0ZQX0FUT01JQyBpcyBub3QgbmVjZXNzYXJ5IGFuZCBjYW4g
YmUgcmVwbGFjZWQgd2l0aCBHRlBfS0VSTkVMLAo+IHdoaWNoIGNhbiBzbGVlcCBhbmQgaW1wcm92
ZSB0aGUgcG9zc2liaWxpdHkgb2Ygc3VjZXNzZnVsIGFsbG9jYXRpb24uCj4gCj4gVGhpcyBpcyBm
b3VuZCBieSBhIHN0YXRpYyBhbmFseXNpcyB0b29sIG5hbWVkIERDTlMgd3JpdHRlbiBieSBteXNl
bGYuCj4gQW5kIEkgYWxzbyBtYW51YWxseSBjaGVjayBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBK
aWEtSnUgQmFpIDxiYWlqaWFqdTE5OTBAZ21haWwuY29tPgoKRm9yIGFsbCA1IHBhdGNoZXM6CgpS
ZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
