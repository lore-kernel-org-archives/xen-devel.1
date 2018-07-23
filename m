From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v3] drm: Replace NULL with error value in
 drm_prime_pages_to_sg
Date: Mon, 23 Jul 2018 12:09:36 +0300
Message-ID: <5d26570f-3b29-830c-9b42-97ff44bb774d__47306.5841397785$1532336923$gmane$org@gmail.com>
References: <20180719093713.3643-1-andr2000@gmail.com>
 <20180719102416.7gnzuo4vmax44qv2@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ydw3=kh=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fhWqb-00051c-2g
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 09:09:41 +0000
Received: by mail-lj1-x233.google.com with SMTP id f8-v6so16228159ljk.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jul 2018 02:09:39 -0700 (PDT)
In-Reply-To: <20180719102416.7gnzuo4vmax44qv2@mwanda>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: jgross@suse.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, airlied@linux.ie, gustavo@padovan.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, seanpaul@chromium.org, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTkvMjAxOCAwMToyNCBQTSwgRGFuIENhcnBlbnRlciB3cm90ZToKPiBSZXZpZXdlZC1i
eTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgo+Cj4gcmVnYXJkcywK
PiBkYW4gY2FycGVudGVyCj4KQXBwbGllZCB0byBkcm0tbWlzYy1uZXh0CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
