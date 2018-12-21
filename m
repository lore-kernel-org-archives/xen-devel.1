From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH for-4.12 v3 4/8] xen/arm: Make
 get_page_from_gfn working with DOMID_XEN
Date: Fri, 21 Dec 2018 19:28:57 +0200
Message-ID: <f748d7e9-46e4-e571-a30a-f9bab48c7866@gmail.com>
References: <20181221162650.11515-1-julien.grall@arm.com>
 <20181221162650.11515-5-julien.grall@arm.com>
 <a96fbf44-77e6-fd15-740e-8d1ede2b8694@gmail.com>
 <da986b89-a13d-cc91-d12d-9d90d8adc5b5@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/5Gq=O6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gaObd-0006Ew-7k
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 17:29:01 +0000
Received: by mail-lj1-x241.google.com with SMTP id k15-v6so5409603ljc.8
 for <xen-devel@lists.xenproject.org>; Fri, 21 Dec 2018 09:29:00 -0800 (PST)
In-Reply-To: <da986b89-a13d-cc91-d12d-9d90d8adc5b5@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMS4xMi4xOCAxOToyNywgSnVsaWVuIEdyYWxsIHdyb3RlOgoKPiBJcyBpdCBhIHdpbGRj
YXJkIHRhZz8gOikKCk5vLCBqdXN0IGEgd3JvbmcgY29weS1wYXN0ZS4KTXVzdCBiZToKClJldmll
d2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKOykKCi0tIApT
aW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
