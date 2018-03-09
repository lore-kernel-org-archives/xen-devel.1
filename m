From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] x86: use invpcid to do global flushing
Date: Fri, 09 Mar 2018 08:29:39 -0700
Message-ID: <5AA2B67302000078001B0567@prv-mh.provo.novell.com>
References: <20180305095032.30062-1-wei.liu2@citrix.com>
 <20180305095032.30062-3-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ibp0=f7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1euJxn-0000nu-Jb
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 15:29:43 +0000
In-Reply-To: <20180305095032.30062-3-wei.liu2@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAzLjE4IGF0IDEwOjUwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
QEAgLTEyMCwxMSArMTIxLDI0IEBAIHVuc2lnbmVkIGludCBmbHVzaF9hcmVhX2xvY2FsKGNvbnN0
IHZvaWQgKnZhLCB1bnNpZ25lZCBpbnQgZmxhZ3MpCj4gICAgICAgICAgZWxzZQo+ICAgICAgICAg
IHsKPiAgICAgICAgICAgICAgdTMyIHQgPSBwcmVfZmx1c2goKTsKPiAtICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyBjcjQgPSByZWFkX2NyNCgpOwo+ICAKPiAtICAgICAgICAgICAgd3JpdGVfY3I0
KGNyNCAmIH5YODZfQ1I0X1BHRSk7Cj4gLSAgICAgICAgICAgIGJhcnJpZXIoKTsKPiAtICAgICAg
ICAgICAgd3JpdGVfY3I0KGNyNCk7Cj4gKyAgICAgICAgICAgIGlmICggIWNwdV9oYXNfaW52cGNp
ZCApCj4gKyAgICAgICAgICAgIHsKPiArICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgY3I0
ID0gcmVhZF9jcjQoKTsKPiArCj4gKyAgICAgICAgICAgICAgICB3cml0ZV9jcjQoY3I0ICYgflg4
Nl9DUjRfUEdFKTsKPiArICAgICAgICAgICAgICAgIGJhcnJpZXIoKTsKPiArICAgICAgICAgICAg
ICAgIHdyaXRlX2NyNChjcjQpOwo+ICsgICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgIGVsc2UK
PiArICAgICAgICAgICAgewo+ICsgICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICAg
ICAqIFVzaW5nIGludnBjaWQgdG8gZmx1c2ggYWxsIG1hcHBpbmdzIHdvcmtzCj4gKyAgICAgICAg
ICAgICAgICAgKiByZWdhcmRsZXNzIG9mIHdoZXRoZXIgUENJRCBpcyBlbmFibGVkIG9yIG5vdC4K
PiArICAgICAgICAgICAgICAgICAqIEl0IGlzIGZhc3RlciB0aGFuIHJlYWQtbW9kaWZ5LXdyaXRl
IENSNC4KPiArICAgICAgICAgICAgICAgICAqLwo+ICsgICAgICAgICAgICAgICAgaW52cGNpZF9m
bHVzaF9hbGwoKTsKPiArICAgICAgICAgICAgfQoKQXMganVzdCB2YWxpZGx5IGluZGljYXRlZCBi
eSBKw7xyZ2VuLCB0aGlzIGlzIHdoZXJlIG15IGNvbW1lbnQgSQpnYXZlIHRvIG9uZSBvZiBoaXMg
cGF0Y2hlcyBhY3R1YWxseSBiZWxvbmdzOiBUaGlzIGlzIGNvcnJlY3QgZm9yCkZMVVNIX1RMQl9H
TE9CQUwsIGJ1dCBnb2VzIHRvbyBmYXIgZm9yIEZMVVNIX1RMQi4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
