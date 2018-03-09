From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 4/6] xen/x86: disable global pages for
 domains with XPTI active
Date: Fri, 09 Mar 2018 08:30:09 -0700
Message-ID: <5AA2B69102000078001B056A@prv-mh.provo.novell.com>
References: <20180302081403.16953-1-jgross@suse.com>
 <20180302081403.16953-5-jgross@suse.com>
 <5AA15F9702000078001AFDDF@prv-mh.provo.novell.com>
 <fcc57ee2-68dc-a6d4-44be-4200b85bb33d@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ibp0=f7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1euJyM-0001L9-VQ
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 15:30:18 +0000
In-Reply-To: <fcc57ee2-68dc-a6d4-44be-4200b85bb33d@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: andrew.cooper3@citrix.com, Dario Faggioli <dfaggioli@suse.com>, wei.liu2@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjAzLjE4IGF0IDE1OjQwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
OC8wMy8xOCAxNjowNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDAyLjAzLjE4IGF0IDA5
OjE0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IEBAIC0xMjMsMjIgKzE0MiwxNCBAQCB1
bnNpZ25lZCBpbnQgZmx1c2hfYXJlYV9sb2NhbChjb25zdCB2b2lkICp2YSwgdW5zaWduZWQgaW50
IGZsYWdzKQo+Pj4gICAgICAgICAgICAgIHUzMiB0ID0gcHJlX2ZsdXNoKCk7Cj4+PiAgCj4+PiAg
ICAgICAgICAgICAgaWYgKCAhY3B1X2hhc19pbnZwY2lkICkKPj4+IC0gICAgICAgICAgICB7Cj4+
PiAtICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgY3I0ID0gcmVhZF9jcjQoKTsKPj4+IC0K
Pj4+IC0gICAgICAgICAgICAgICAgd3JpdGVfY3I0KGNyNCAmIH5YODZfQ1I0X1BHRSk7Cj4+PiAt
ICAgICAgICAgICAgICAgIGJhcnJpZXIoKTsKPj4+IC0gICAgICAgICAgICAgICAgd3JpdGVfY3I0
KGNyNCk7Cj4+PiAtICAgICAgICAgICAgfQo+Pj4gKyAgICAgICAgICAgICAgICBkb19mbHVzaF90
bGIoMCk7Cj4+PiAgICAgICAgICAgICAgZWxzZQo+Pj4gLSAgICAgICAgICAgIHsKPj4+ICAgICAg
ICAgICAgICAgICAgLyoKPj4+ICAgICAgICAgICAgICAgICAgICogVXNpbmcgaW52cGNpZCB0byBm
bHVzaCBhbGwgbWFwcGluZ3Mgd29ya3MKPj4+ICAgICAgICAgICAgICAgICAgICogcmVnYXJkbGVz
cyBvZiB3aGV0aGVyIFBDSUQgaXMgZW5hYmxlZCBvciBub3QuCj4+PiAgICAgICAgICAgICAgICAg
ICAqIEl0IGlzIGZhc3RlciB0aGFuIHJlYWQtbW9kaWZ5LXdyaXRlIENSNC4KPj4+ICAgICAgICAg
ICAgICAgICAgICovCj4+PiAgICAgICAgICAgICAgICAgIGludnBjaWRfZmx1c2hfYWxsKCk7Cj4+
PiAtICAgICAgICAgICAgfQo+PiAKPj4gQnR3LCB0aGlzIGlzIGNvcnJlY3QgZm9yIEZMVVNIX1RM
Ql9HTE9CQUwsIGJ1dCBnb2VzIHRvbyBmYXIgZm9yCj4+IEZMVVNIX1RMQi4KPiAKPiBZb3UgYXJl
IGF3YXJlIHRoYXQgbXkgcGF0Y2hlcyBkaWRuJ3QgY2hhbmdlIGFueXRoaW5nIGluIHRoaXMgcmVn
YXJkPwoKT2gsIGluZGVlZCAtIEkndmUganVzdCByZXNwb25kZWQgdG8gV2VpJ3MgcGF0Y2guCgpK
YW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
