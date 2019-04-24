From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen: xen-pciback: fix warning Using plain
 integer as NULL pointer
Date: Wed, 24 Apr 2019 14:48:17 -0400
Message-ID: <92906d93-a89d-6f0c-4238-214a8fb56548__14692.2644389392$1556131803$gmane$org@oracle.com>
References: <20190406122912.GA403@hari-Inspiron-1545>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E0+D=S2=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hJMx9-0000GZ-OE
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 18:49:07 +0000
In-Reply-To: <20190406122912.GA403@hari-Inspiron-1545>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gNC82LzE5IDg6MjkgQU0sIEhhcmlwcmFzYWQgS2VsYW0gd3JvdGU6Cj4gQ2hhbmdlcyBwYXNz
aW5nIGZ1bmN0aW9uIGFyZ3VtZW50IDAgdG8gTlVMTCB0byBhdm9pZCBiZWxvdyBzcGFyc2UKPiB3
YXJuaW5nCj4KPiAgQ0hFQ0sgICBkcml2ZXJzL3hlbi94ZW4tcGNpYmFjay94ZW5idXMuYwo+IGRy
aXZlcnMveGVuL3hlbi1wY2liYWNrL3hlbmJ1cy5jOjcwMDo1MTogd2FybmluZzogVXNpbmcgcGxh
aW4gaW50ZWdlciBhcwo+IE5VTEwgcG9pbnRlcgo+Cj4gU2lnbmVkLW9mZi1ieTogSGFyaXByYXNh
ZCBLZWxhbSA8aGFyaXByYXNhZC5rZWxhbUBnbWFpbC5jb20+CgpBcHBsaWVkIHRvIGZvci1saW51
cy01LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
