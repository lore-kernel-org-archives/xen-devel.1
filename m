From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [PATCH 6/6] firmware/shim: fix build process to use
 POSIX find options
Date: Thu, 18 Jan 2018 11:12:22 +0000
Message-ID: <23136.33046.181376.281007@mariner.uk.xensource.com>
References: <20180117094814.32772-1-roger.pau@citrix.com>
 <20180117094814.32772-7-roger.pau@citrix.com>
 <23135.30907.66445.273053@mariner.uk.xensource.com>
 <20180117173205.h2etk5yh3se4e5hj@MacBook-Pro-de-Roger.local>
 <75449e60-6e31-b1ba-8224-52400d9810d2@citrix.com>
 <20180118101420.qq22nz4x5ewctnwx@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vw+9=en=citrix.com=prvs=549f7cad3=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ec87S-0007zI-8x
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 11:12:30 +0000
In-Reply-To: <20180118101420.qq22nz4x5ewctnwx@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Um9nZXIgUGF1IE1vbm7DqSB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIIDYvNl0gZmly
bXdhcmUvc2hpbTogZml4IGJ1aWxkIHByb2Nlc3MgdG8gdXNlIFBPU0lYIGZpbmQgb3B0aW9ucyIp
Ogo+IFdoYXQgYWJvdXQgdXNpbmc6Cj4gCj4gZmluZCAkKFhFTl9ST09UKS8kKGQpLyAtdHlwZSBk
IHwgc2VkICdzLF4kKFhFTl9ST09UKS8kKGQpLywsZycgfCB4YXJncyBta2RpciAtcAo+IAo+IFRo
aXMgQUZBSUNUIHdvcmtzIGZpbmUsIGFuZCBzaG91bGQgYmUgdGhlIG9uZSBpbnZvbHZpbmcgbGVz
cyBmb3Jrcwo+IHNpbmNlIHRoZSB3aG9sZSBvdXRwdXQgaXMgcHJvY2Vzc2VkIGF0IG9uY2UuCgpN
dWNoIG5pY2VyLCB0aGFua3MuICBUaGF0IElNTyBtYWtlcyBpdCBlYXN5IHRvIHNlZSB3aGF0J3Mg
Z29pbmcgb24uCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
