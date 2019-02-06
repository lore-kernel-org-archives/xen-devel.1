From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VMX: don't ignore P2M setup error
Date: Wed, 6 Feb 2019 11:42:27 +0000
Message-ID: <6fd67305-53ad-b310-2fde-8e678fc56784@citrix.com>
References: <5C5AB5DA020000780021436D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=su2n=QN=citrix.com=prvs=933dc5b42=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1grLb5-0000G9-6f
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 11:42:31 +0000
In-Reply-To: <5C5AB5DA020000780021436D@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDIvMjAxOSAxMDoyNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gc2V0X21taW9fcDJtX2Vu
dHJ5KCkgbWF5IGZhaWwsIGluIHBhcnRpY3VsYXIgd2l0aCAtRU5PTUVNLiBEb24ndCBpZ25vcmUK
PiBzdWNoIGFuIGVycm9yLCBidXQgaW5zdGVhZCBjYXVzZSBkb21haW4gY3JlYXRpb24gdG8gZmFp
bCBpbiBzdWNoIGEgY2FzZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
