From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] hvmloader: fix build with LLVM Linker
Date: Mon, 27 Aug 2018 03:50:39 -0600
Message-ID: <5B83C96F02000078001E214F@prv1-mh.provo.novell.com>
References: <20180824095802.78002-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jola=lk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fuEAX-0000ah-Ef
 for xen-devel@lists.xenproject.org; Mon, 27 Aug 2018 09:50:45 +0000
In-Reply-To: <20180824095802.78002-1-roger.pau@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA4LjE4IGF0IDExOjU4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSAvZGV2L251bGwKPiArKysgYi90b29scy9maXJtd2FyZS9odm1sb2FkZXIvaHZtbG9hZGVy
Lmxkcwo+IEBAIC0wLDAgKzEsMTMgQEAKPiArU0VDVElPTlMKPiArewo+ICsgIC4gPSAweDEwMDAw
MDsKPiArICAvKgo+ICsgICAqIE5COiB0aGVyZSdzIG5vIG5lZWQgdG8gdXNlIHRoZSBBVCBrZXl3
b3JkIGluIG9yZGVyIHRvIHNldCB0aGUgTE1BLCBieQo+ICsgICAqIGRlZmF1bHQgdGhlIGxpbmtl
ciB3aWxsIHVzZSBWTUEgPSBMTUEgdW5sZXNzIHNwZWNpZmllZCBvdGhlcndpc2UuCj4gKyAgICov
Cj4gKyAgLnRleHQgOiB7ICooLnRleHQpIH0KPiArICAucm9kYXRhIDogeyAqKC5yb2RhdGEpIH0K
PiArICAuZGF0YSA6IHsgKiguZGF0YSkgfQo+ICsgIC5ic3MgOiB7ICooLmJzcykgfQo+ICsgIF9l
bmQgPSAuOwo+ICt9CgpJcyB0aGlzIHJlYWxseSBzdWZmaWNpZW50PyBJaXJjIHRoZSBjb21waWxl
ciBjb3VsZCBjcmVhdGUgcXVpdGUgYSBmZXcKbW9yZSB2YXJpYW50cyBvZiB0aGUgc2VjdGlvbnMg
bmFtZWQgYWJvdmUsIGxpa2UgLnJvZGF0YS5zdHIqIG9yCi50ZXh0LmNvbGQuIEhlbmNlIGF0IHRo
ZSB2ZXJ5IGxlYXN0IEknZCBleHBlY3QgLjxzZWN0aW9uPiBvbiB0aGUKcmlnaHQgc2lkZXMgYWJv
dmUgdG8gYmUgYWNjb21wYW5pZWQgYnkgLjxzZWN0aW9uPi4qIC4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
