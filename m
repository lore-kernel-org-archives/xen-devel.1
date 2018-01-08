From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 05/23] char: optionally redirect {,
 g}printk output to QEMU debug log
Date: Mon, 8 Jan 2018 12:16:05 +0000
Message-ID: <20180108121605.dags3eci52bxssar@citrix.com>
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
 <1515356919-922-6-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=9h6o=ed=citrix.com=prvs=53941dece=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eYWPq-00048J-BY
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 12:20:34 +0000
Content-Disposition: inline
In-Reply-To: <1515356919-922-6-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <aliguori@amzn.com>
Cc: Wei Liu <wei.liu2@citrix.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan =?iso-8859-1?Q?H=2E_Sch=F6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, xen-devel@lists.xenproject.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gMDcsIDIwMTggYXQgMTI6Mjg6MjFQTSAtMDgwMCwgQW50aG9ueSBMaWd1b3Jp
IHdyb3RlOgo+IEZyb206IE1hdHQgV2lsc29uIDxtc3dAYW1hem9uLmNvbT4KPiAKPiBXaGVuIHVz
aW5nIFZpeGVuLCBpdCBpcyBoZWxwZnVsIHRvIGdldCB0aGUgWGVuIG1lc3NhZ2VzIGluIGEKPiBz
ZXBhcmF0ZSBjaGFubmVsIHRoYW4gdGhlIGNvbnNvbGUgb3V0cHV0LiAgQWRkIGFuIG9wdGlvbiB0
bwo+IG91dHB1dCB0byB0aGUgUUVNVSBiYWNrZG9vciBsb2dnaW5nIHBvcnQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogTWF0dCBXaWxzb24gPG1zd0BhbWF6b24uY29tPgoKSSB0aGluayB0aGlzIHNob3Vs
ZCBiZSBtZXJnZWQgd2l0aCBvciBidWlsdCBvbiB0b3Agb2Ygb25lIG9mIHRoZSBwYXRjaGVzCmlu
IHB2LWluLXB2aCBzaGltIHNlcmllcyB0aGF0IGFkZHMgY29uc29sZSBhbmQgbWFnaWMgZGVidWcg
cG9ydCBvdXRwdXQuCgpJIHdpbGwgc2VlIHdoYXQgSSBjYW4gZG8uCgpXZWkuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
