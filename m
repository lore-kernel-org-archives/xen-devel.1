From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] x86: make sure module array is large
 enough in pvh-boot.c
Date: Fri, 28 Sep 2018 09:06:25 -0600
Message-ID: <5BAE437102000078001ECF05@prv1-mh.provo.novell.com>
References: <20180928082437.15140-1-wei.liu2@citrix.com>
 <20180928082437.15140-2-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ucvl=mk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g5uLe-0006wr-DH
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 15:06:30 +0000
In-Reply-To: <20180928082437.15140-2-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA5LjE4IGF0IDEwOjI0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
VGhlIHJlbG9jYXRpb24gY29kZSBpbiBfX3N0YXJ0X3hlbiByZXF1aXJlcyBvbmUgZXh0cmEgZWxl
bWVudCBpbiB0aGUKPiBtb2R1bGUgYXJyYXkuIEJ5IHRoZSBsb29rcyBvZiBpdCB0aGUgdGVtcG9y
YXJ5IGFycmF5IGlzIGFscmVhZHkgbGFyZ2UKPiBlbm91Z2guIEFkZCBhIEJVR19PTiB0byBjYXRj
aCBhbnkgaXNzdWUgaW4gdGhlIGZ1dHVyZS4KPiAKPiBXaGlsZSBhdCBpdCwgdHVybiBhbm90aGVy
IEFTU0VSVCB0byBCVUdfT04gYXMgd2VsbC4KCkhtbSwgYSBsaXR0bGUgc3RyYW5nZSAtIEkgdGhv
dWdodCB3ZSBoYWQgYWdyZWVkIG9uIHBhbmljKCkgYmVmb3JlLgpUaGUgZXh0cmEgb3V0cHV0IEJV
R19PTigpIHByb2R1Y2VzIGlzIHVubGlrZWx5IHRvIGJlIGhlbHBmdWwgaGVyZS4KV2l0aCB0aGlz
IHN3aXRjaGVkIHRvIHBhbmljKCkgaXQgY2VydGFpbmx5IGNhbiBoYXZlIG15IGFjay4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
