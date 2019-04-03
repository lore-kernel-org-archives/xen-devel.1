From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: use struct_size() helper in kzalloc()
Date: Wed, 3 Apr 2019 08:00:10 +0200
Message-ID: <86ebff84-6fe5-1f1f-d827-abcfb674cbf7__30659.6905271121$1554271277$gmane$org@suse.com>
References: <20190403052636.GC21532@xps-13>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CqVI=SF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hBYwa-0003jH-Iv
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 06:00:16 +0000
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
LmNvbT4KClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVl
cmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
