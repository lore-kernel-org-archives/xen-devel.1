From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v3] drm: Replace NULL with error value in
 drm_prime_pages_to_sg
Date: Thu, 19 Jul 2018 13:25:48 +0300
Message-ID: <d11c3a5a-fcd4-e4cd-683d-cb0384d35757__49165.967180352$1531995872$gmane$org@gmail.com>
References: <20180719093713.3643-1-andr2000@gmail.com>
 <20180719102416.7gnzuo4vmax44qv2@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ilhm=kd=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fg688-0004im-Si
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 10:25:52 +0000
Received: by mail-lf0-x22b.google.com with SMTP id a4-v6so5649844lff.5
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jul 2018 03:25:52 -0700 (PDT)
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
eTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgpUaGFuayB5b3UsCmlm
IG5vYm9keSBvYmplY3RzIEknbGwgcHVzaCBpdCB0byBkcm0tbWlzYy1uZXh0IG5leHQgTW9uZGF5
Cj4gcmVnYXJkcywKPiBkYW4gY2FycGVudGVyCj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
