From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 08/20] xen/arm64: head: Move earlyprintk
 messages in .rodata.str
Date: Fri, 3 May 2019 18:57:05 +0300
Message-ID: <3ba51ec0-50d9-adff-f8a9-15b6e704f875@gmail.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-9-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaYf-0006sV-Te
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:57:09 +0000
Received: by mail-lf1-x141.google.com with SMTP id j20so4784956lfh.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:57:08 -0700 (PDT)
In-Reply-To: <20190422164937.21350-9-julien.grall@arm.com>
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKT24gMjIuMDQuMTkgMTk6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBB
dCB0aGUgbW9tZW50LCB0aGUgZWFybHlwcmludGsgbWVzc2FnZXMgYXJlIGludGVybGVhdmVkIHdp
dGggdGhlCj4gaW5zdHJ1Y3Rpb25zLiBUaGlzIG1ha2VzIG1vcmUgZGlmZmljdWx0IHRvIHJlYWQg
dGhlIG9iamR1bXAgb3V0cHV0Lgo+IAo+IEludHJvZHVjZSBhIG5ldyBtYWNybyB0byBhZGQgYSBz
dHJpbmcgaW4gLnJvZGF0YS5zdHIgYW5kIHVzZSBpdCBmb3IgYWxsCj4gdGhlIGVhcmx5cHJpbnRr
IG1lc3NhZ2VzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+CgoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBh
bS5jb20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
