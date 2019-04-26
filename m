From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 1/7] xen/arm: mm: Consolidate setting
 SCTLR_EL2.WXN in a single place
Date: Fri, 26 Apr 2019 16:48:40 +0300
Message-ID: <5fdaab28-ee8e-180e-5cd5-2694bbab214c@gmail.com>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-2-julien.grall@arm.com>
 <52b107e1-fa03-54aa-3b64-3bba7104661b@gmail.com>
 <8bcf25e7-3c7a-b61d-6caf-a11eaf68a232@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TPdi=S4=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hK1Da-0000uJ-IT
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 13:48:46 +0000
Received: by mail-lj1-x241.google.com with SMTP id z26so3029307ljj.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2019 06:48:43 -0700 (PDT)
In-Reply-To: <8bcf25e7-3c7a-b61d-6caf-a11eaf68a232@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <Julien.Grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>, nd <nd@arm.com>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKT24gMjUuMDQuMTkgMjM6MjYsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBX
aHkgY2FuJ3Qgd2UgbGV0IHRoZSBjb21waWxlciBkZWNpZGluZyBmb3IgdXM/IFRoZSBtb3JlIHRo
YXQgaW5saW5lIGlzCj4gcHJldHR5IGJyb2tlbi4gU2VlOgo+IAo+IGh0dHBzOi8vd3d3Lmtlcm5l
bC5vcmcvZG9jL2xvY2FsL2lubGluZS5odG1sCgpBaCwgb2suIFNvIGxldCBpdCBiZS4KCi0tIApT
aW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
