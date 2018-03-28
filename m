From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] xen/acpi: off by one in read_acpi_id()
Date: Wed, 28 Mar 2018 14:47:47 +0300
Message-ID: <20180328114747.GB29050@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=idvp=gs=oracle.com=dan.carpenter@srs-us1.protection.inumbo.net>)
 id 1f19Yd-00064D-71
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 11:47:59 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Joao Martins <joao.m.martins@oracle.com>, kernel-janitors@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

SWYgYWNwaV9pZCBpcyA9PSBucl9hY3BpX2JpdHMsIHRoZW4gd2UgYWNjZXNzIG9uZSBlbGVtZW50
IGJleW9uZCB0aGUgZW5kCm9mIHRoZSBhY3BpX3BzZFtdIGFycmF5IG9yIHdlIHNldCBvbmUgYml0
IGJleW9uZCB0aGUgZW5kIG9mIHRoZSBiaXQgbWFwCndoZW4gd2UgZG8gX19zZXRfYml0KGFjcGlf
aWQsIGFjcGlfaWRfY3N0X3ByZXNlbnQpOwoKRml4ZXM6IDU5YTU2ODAyOTE4MSAoInhlbi9hY3Bp
LXByb2Nlc3NvcjogQyBhbmQgUC1zdGF0ZSBkcml2ZXIgdGhhdCB1cGxvYWRzIHNhaWQgZGF0YSB0
byBoeXBlcnZpc29yLiIpClNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50
ZXJAb3JhY2xlLmNvbT4KCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW4tYWNwaS1wcm9jZXNz
b3IuYyBiL2RyaXZlcnMveGVuL3hlbi1hY3BpLXByb2Nlc3Nvci5jCmluZGV4IGM4MDE5NWU4ZmJk
MS4uZDIzYzljMTUwMTk5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi94ZW4tYWNwaS1wcm9jZXNz
b3IuYworKysgYi9kcml2ZXJzL3hlbi94ZW4tYWNwaS1wcm9jZXNzb3IuYwpAQCAtMzY0LDcgKzM2
NCw3IEBAIHJlYWRfYWNwaV9pZChhY3BpX2hhbmRsZSBoYW5kbGUsIHUzMiBsdmwsIHZvaWQgKmNv
bnRleHQsIHZvaWQgKipydikKIAl9CiAJLyogVGhlcmUgYXJlIG1vcmUgQUNQSSBQcm9jZXNzb3Ig
b2JqZWN0cyB0aGFuIGluIHgyQVBJQyBvciBNQURULgogCSAqIFRoaXMgY2FuIGhhcHBlbiB3aXRo
IGluY29ycmVjdCBBQ1BJIFNTRFQgZGVjbGVyYXRpb25zLiAqLwotCWlmIChhY3BpX2lkID4gbnJf
YWNwaV9iaXRzKSB7CisJaWYgKGFjcGlfaWQgPj0gbnJfYWNwaV9iaXRzKSB7CiAJCXByX2RlYnVn
KCJXZSBvbmx5IGhhdmUgJXUsIHRyeWluZyB0byBzZXQgJXVcbiIsCiAJCQkgbnJfYWNwaV9iaXRz
LCBhY3BpX2lkKTsKIAkJcmV0dXJuIEFFX09LOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
