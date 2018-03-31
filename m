From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2] xen/acpi: off by one in read_acpi_id()
Date: Sat, 31 Mar 2018 14:07:17 -0400
Message-ID: <739884bb-f780-2b85-c3d7-074342f9b957@oracle.com>
References: <20180329090153.GA17927@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lplb=gv=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1f2L3Q-0004xo-7f
 for xen-devel@lists.xenproject.org; Sat, 31 Mar 2018 18:16:40 +0000
In-Reply-To: <20180329090153.GA17927@mwanda>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Joao Martins <joao.m.martins@oracle.com>, kernel-janitors@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMy8yOS8yMDE4IDA1OjAxIEFNLCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+IElmIGFjcGlf
aWQgaXMgPT0gbnJfYWNwaV9iaXRzLCB0aGVuIHdlIGFjY2VzcyBvbmUgZWxlbWVudCBiZXlvbmQg
dGhlIGVuZAo+IG9mIHRoZSBhY3BpX3BzZFtdIGFycmF5IG9yIHdlIHNldCBvbmUgYml0IGJleW9u
ZCB0aGUgZW5kIG9mIHRoZSBiaXQgbWFwCj4gd2hlbiB3ZSBkbyBfX3NldF9iaXQoYWNwaV9pZCwg
YWNwaV9pZF9wcmVzZW50KTsKPiAKPiBGaXhlczogNTlhNTY4MDI5MTgxICgieGVuL2FjcGktcHJv
Y2Vzc29yOiBDIGFuZCBQLXN0YXRlIGRyaXZlciB0aGF0IHVwbG9hZHMgc2FpZCBkYXRhIHRvIGh5
cGVydmlzb3IuIikKPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVy
QG9yYWNsZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEpvYW8gTWFydGlucyA8am9hby5tLm1hcnRpbnNA
b3JhY2xlLmNvbT4KPiBSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgoKCkFwcGxpZWQgdG8gZm9yLWxpbnVzLTQuMTcKCi1ib3JpcwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
