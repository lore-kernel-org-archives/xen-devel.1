From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: use struct_size() helper in kzalloc()
Date: Fri, 5 Apr 2019 08:48:12 +0200
Message-ID: <ae3a31f9-d254-fd68-2257-2337fbfefa70__8847.48342666484$1554446947$gmane$org@suse.com>
References: <20190403052636.GC21532@xps-13>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AWOr=SH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hCIe8-0000P0-O4
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 06:48:16 +0000
In-Reply-To: <20190403052636.GC21532@xps-13>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrea Righi <andrea.righi@canonical.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDQvMjAxOSAwNzoyNiwgQW5kcmVhIFJpZ2hpIHdyb3RlOgo+IHN0cnVjdCBwcml2Y21k
X2J1Zl92bWFfcHJpdmF0ZSBoYXMgYSB6ZXJvLXNpemVkIGFycmF5IGF0IHRoZSBlbmQKPiAocGFn
ZXMpLCB1c2UgdGhlIG5ldyBzdHJ1Y3Rfc2l6ZSgpIGhlbHBlciB0byBkZXRlcm1pbmUgdGhlIHBy
b3Blcgo+IGFsbG9jYXRpb24gc2l6ZSBhbmQgYXZvaWQgcG90ZW50aWFsIHR5cGUgbWlzdGFrZXMu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmVhIFJpZ2hpIDxhbmRyZWEucmlnaGlAY2Fub25pY2Fs
LmNvbT4KClB1c2hlZCB0byB4ZW4vdGlwLmdpdCBmb3ItbGludXMtNS4xYgoKCkp1ZXJnZW4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
