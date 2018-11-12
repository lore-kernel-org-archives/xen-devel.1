From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v6 04/11] libxl: Design of an async API to
 issue QMP commands to QEMU
Date: Mon, 12 Nov 2018 17:29:53 +0000
Message-ID: <23529.47249.121237.100337@mariner.uk.xensource.com>
References: <20181112164930.25893-1-anthony.perard@citrix.com>
 <20181112164930.25893-5-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0ka0=nx=citrix.com=prvs=847df0986=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gMG2E-0006Zb-62
 for xen-devel@lists.xenproject.org; Mon, 12 Nov 2018 17:30:02 +0000
In-Reply-To: <20181112164930.25893-5-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHY2IDA0LzExXSBsaWJ4bDogRGVzaWduIG9m
IGFuIGFzeW5jIEFQSSB0byBpc3N1ZSBRTVAgY29tbWFuZHMgdG8gUUVNVSIpOgo+IEFsbCB0aGUg
ZnVuY3Rpb25zIHdpbGwgYmUgaW1wbGVtZW50ZWQgaW4gbGF0ZXIgcGF0Y2hlcy4KPiAKPiBUaGlz
IHBhdGNoIGluY2x1ZGVzIHRoZSBBUEkgdGhhdCBsaWJ4bCBjYW4gdXNlIHRvIHNlbmQgUU1QIGNv
bW1hbmRzIHRvCj4gUUVNVS4KLi4uCj4gICAgICAgICBSZXdyaXRlIHRoZSBjb21tZW50IGFib3V0
IHRoZSBjYWxsYmFjaywgYW5kIGV4cGxhaW4gdGhhdCBvbiBlcnJvciwKPiAgICAgICAgICAgICB0
aGUgYGV2YCBtYXkgYmUgSWRsZSBvciBtYXkgc3RpbGwgYmUgQ29ubmVjdGVkCgpUaGlzIGlzIGdv
b2QsIHRoYW5rcy4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
