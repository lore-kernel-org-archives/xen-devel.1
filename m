From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] libxl: fix regression introduced in
 5c883cf036cf
Date: Thu, 16 May 2019 11:00:01 +0100
Message-ID: <23773.13473.418042.796038@mariner.uk.xensource.com>
References: <20190516091153.31502-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=62Tc=TQ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hRDBm-0002Io-Kn
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 10:00:38 +0000
In-Reply-To: <20190516091153.31502-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJbUEFUQ0hdIGxpYnhsOiBmaXggcmVncmVzc2lvbiBpbnRyb2R1Y2Vk
IGluIDVjODgzY2YwMzZjZiIpOgo+IFR3byBsaW5lcyB3ZXJlIGVycm9uZW91c2x5IGRlbGV0ZWQg
ZHVyaW5nIHJlYmFzZSB3aGljaCBjYXVzZWQgZG9tYWluCj4gZGVzdHJ1Y3Rpb24gdG8gZmFpbC4K
CkkgaGF2ZSB0YWtlbiB0aGlzIGFzIGEgc2lnbiB0aGF0IEkgc2hvdWxkIGhhdmUgcHJvcGVybHkg
cmV2aWV3ZWQgd2hhdApiZWNhbWUgNWM4ODNjZjAzNmNmLgoKSGF2aW5nIGRvbmUgc28gSSBoYXZl
IGFsc28gc3BvdHRlZCB0aGF0OgoKVGhlIG5ld2x5IGludHJvZHVjZWQgRVJST1JfRkFJTCByZXR1
cm5zIGluIGxpYnhsIHNob3VsZCBiZSBFUlJPUl9OSQooIm5vdCBpbXBsZW1lbnRlZCIpLgoKQnV0
IEkgZGlkbid0IHNlZSBhbnl0aGluZyBlbHNlLCBvdGhlciB0aGFuIHRoZSByZWJhc2UgZXJyb3Ig
dGhhdCB5b3UKYXJlIGZpeGluZyBub3cuICBTbyBmb3IgdGhpcyBwYXRjaDoKCkFja2VkLWJ5OiBJ
YW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCklhbi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
