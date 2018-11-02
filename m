From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 7/7] amd/pvh: enable ACPI C1E disable
 quirk on PVH Dom0
Date: Fri, 02 Nov 2018 03:06:58 -0600
Message-ID: <5BDC13B202000078001F7174@prv1-mh.provo.novell.com>
References: <20181030154123.4218-1-roger.pau@citrix.com>
 <20181030154123.4218-8-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wbrw=nn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gIVPy-0007AP-Kx
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 09:07:02 +0000
In-Reply-To: <20181030154123.4218-8-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjEwLjE4IGF0IDE2OjQxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMKPiArKysgYi94ZW4vYXJjaC94ODYvY3B1L2Ft
ZC5jCj4gQEAgLTQ0LDYgKzQ0LDkgQEAgaW50ZWdlcl9wYXJhbSgiY3B1aWRfbWFza190aGVybWFs
X2VjeCIsIG9wdF9jcHVpZF9tYXNrX3RoZXJtYWxfZWN4KTsKPiAgczggX19yZWFkX21vc3RseSBv
cHRfYWxsb3dfdW5zYWZlOwo+ICBib29sZWFuX3BhcmFtKCJhbGxvd191bnNhZmUiLCBvcHRfYWxs
b3dfdW5zYWZlKTsKPiAgCj4gKy8qIFNpZ25hbCB3aGV0aGVyIHRoZSBBQ1BJIEMxRSBxdWlyayBp
cyByZXF1aXJlZC4gKi8KPiArYm9vbCBhbWRfYWNwaV9jMWVfcXVpcms7CgpfX3JlYWRfbW9zdGx5
Cgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jCj4gKysrIGIveGVuL2FyY2gveDg2
L2h2bS9zdm0vc3ZtLmMKPiBAQCAtMTI3Myw2ICsxMjczLDI0IEBAIHZvaWQgc3ZtX2hvc3Rfb3N2
d19pbml0KCkKPiAgICAgIHNwaW5fdW5sb2NrKCZvc3Z3X2xvY2spOwo+ICB9Cj4gIAo+ICtzdGF0
aWMgaW50IGFjcGlfYzFlX3F1aXJrKGludCBkaXIsIHVuc2lnbmVkIGludCBwb3J0LCB1bnNpZ25l
ZCBpbnQgYnl0ZXMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgKnZhbCkK
PiArewo+ICsgICAgQVNTRVJUKGJ5dGVzID09IDEgJiYgcG9ydCA9PSBhY3BpX3NtaV9jbWQpOwo+
ICsKPiArICAgIGlmICggZGlyID09IElPUkVRX1JFQUQgKQo+ICsgICAgewo+ICsgICAgICAgICp2
YWwgPSBpbmIocG9ydCk7Cj4gKyAgICAgICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsKPiArICAgIH0K
PiArCj4gKyAgICBvdXRiKCp2YWwsIHBvcnQpOwo+ICsgICAgaWYgKCAqdmFsID09IGFjcGlfZW5h
YmxlX3ZhbHVlICkKPiArICAgICAgIG9uX2VhY2hfY3B1KGFtZF9kaXNhYmxlX2MxZSwgTlVMTCwg
MSk7Cj4gKwo+ICsgICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsKPiArfQoKSSB0aGluayB5b3UgY291
bGQgZG8gd2l0aCBldmVuIGxlc3MgbG9naWMgZHVwbGljYXRpb24gaWYgaW5zdGVhZCB5b3UKY2Fs
bGVkIGNoZWNrX2Rpc2FibGVfYzFlKCkgKHRoZW4gZ2l2ZW4gYW4gYW1kXyBwcmVmaXggb2YgY291
cnNlKQpoZXJlLiBJJ2QgdGhlbiBmdXJ0aGVyIGNvbnNpZGVyIHRvIGRvIGF3YXkgd2l0aApwdl9w
b3N0X291dGJfaG9vayBpbiBhIGZvbGxvdy11cCBwYXRjaCwgZ2V0dGluZyB0aGUgUFYgc2lkZQpj
bG9zZXIgdG8gdGhlIG1vZGVsIHVzZWQgaGVyZS4KCk5vdCBiZWluZyB0aGUgbWFpbnRhaW5lciBv
ZiB0aGlzIGNvZGUsIEknZCBuZXZlcnRoZWxlc3MgbGlrZSB0byBhbHNvCnN1Z2dlc3QgdG8gdXNl
IGlmL2Vsc2UgaGVyZSwgbWFraW5nIHRoZSBmdW5jdGlvbiBnZXQgYXdheSB3aXRoCmp1c3QgYSBz
aW5nbGUgcmV0dXJuIHBvaW50LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
