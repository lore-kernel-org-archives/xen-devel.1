From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/hvm: remove duplicate
 vlapic_find_highest_isr() calls
Date: Fri, 7 Dec 2018 17:54:15 +0000
Message-ID: <f8cd667b-8965-f0e8-1e8a-4aaa3267f482@citrix.com>
References: <20181207131302.27968-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aPx3=OQ=citrix.com=prvs=872c50cd2=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gVKKU-0006TH-6h
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 17:54:22 +0000
In-Reply-To: <20181207131302.27968-1-paul.durrant@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTIvMjAxOCAxMzoxMywgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFdoZW4gdmlyaWRpYW4g
QVBJQyBhc3Npc3QgaXMgYWN0aXZlLCB0aGUgY29kZSBpbiB2bGFwaWNfaGFzX3BlbmRpbmdfaXJx
KCkKPiBtYXkgZW5kIHVwIHJlLWNhbGxpbmcgdmxhcGljX2ZpbmRfaGlnaGVzdF9pc3IoKSBhZnRl
ciBlbXVsYXRpbmcgYW4gRU9JCj4gd2hlcmVhcyBzaW1wbHkgbW92aW5nIHRoZSBjYWxsIGFmdGVy
IHRoZSBFT0kgZW11bGF0aW9uIHJlbW92ZXMgdGhlIG5lZWQKPiBmb3IgdGhpcyBkdXBsaWNhdGlv
bi4KPgo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5j
b20+CgpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
