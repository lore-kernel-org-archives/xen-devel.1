From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
Date: Tue, 14 May 2019 13:08:09 +0300
Message-ID: <4ac886b5-ad15-f0cf-5af8-91aaf7d2460e@gmail.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <e248dae9-c91c-c735-ea16-9bcb70c65e9d@arm.com>
 <959c8975-ec44-a788-25b3-84ee17520abc@gmail.com>
 <24f3e2b1-4889-1780-0e48-0c909f555997@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b0nL=TO=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hQUM2-00021V-NW
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 10:08:14 +0000
Received: by mail-lf1-x144.google.com with SMTP id v18so11421594lfi.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2019 03:08:13 -0700 (PDT)
In-Reply-To: <24f3e2b1-4889-1780-0e48-0c909f555997@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xen.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKT24gMTQuMDUuMTkgMTI6NTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4g
SSBndWVzcyB3ZSBzaG91bGQgYWdyZWUgd2hhdCB0byBpbXBsZW1lbnQgZmlyc3QuCj4gCj4gSSB0
aGluayB0aGVyZSBhcmUgYW4gYWdyZWVtZW50IHRoYXQgdGhlIHR3byBtZXRob2RzIHNob3VsZCBu
b3QgYmUgdXNlZCB0b2dldGhlci4KCkZvciBhIGRvbWFpbiBvciBmb3IgYSBwYXJ0aWN1bGFyIFZD
UFU/CkhvdyBzaG91bGQgd2UgcmVzcG9uc2Ugb24gdGhlIHJlcXVlc3QgdG8gcmVnaXN0ZXIgcGFk
ZHIgd2hlbiB3ZSBhbHJlYWR5IGhhdmUgcmVnaXN0ZXJlZCB2YWRkciBhbmQgdmljZSB2ZXJzYT8K
CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
