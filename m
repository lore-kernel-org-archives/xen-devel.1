From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86emul/fuzz: adjust canonicalization in
 sanitize_input()
Date: Mon, 01 Apr 2019 00:57:06 -0600
Message-ID: <5CA1B642020000780022363D@prv1-mh.provo.novell.com>
References: <5C9E30F40200007800222DDC@prv1-mh.provo.novell.com>
 <8B8E72C2-696B-4C0D-8733-78C7B93B9FB0@citrix.com>
 <5C9E38620200007800222F8B@prv1-mh.provo.novell.com>
 <F2552738-0569-4DC0-A93D-F0D3191C5D5E@citrix.com>
 <5C9E447B0200007800223018@prv1-mh.provo.novell.com>
 <DC8F0A76-5080-40AB-BB46-03298755E295@citrix.com>
 <31f12c74-d990-9c94-5b5c-f091f37be36f@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hAqsb-0001Uk-5y
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 06:57:13 +0000
In-Reply-To: <31f12c74-d990-9c94-5b5c-f091f37be36f@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, george.dunlap@citrix.com, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAzLjE5IGF0IDIxOjQwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gSSBjYW4ndCB0aGluayBvZiBhbnkgaW5zdHJ1Y3Rpb24gd2hpY2ggdXNlcyAlcmJwIGlu
IHRoaXMgd2F5LiAKPiBFTlRFUi9MRUFWRS9QVVNIQS9QT1BBIHVzZS9tb2RpZnkgaXQsIGJ1dCBv
bmx5IGluIGl0cyBpbnRlZ2VyIGZvcm0gLSBub3QKPiBhcyBhIG1lbW9yeSBhZGRyZXNzLgoKRU5U
RVIgd2l0aCBhIG5lc3RpbmcgbGV2ZWwgYWJvdmUgMSB3aWxsIHVzZSAlcmJwIGFzIGEgbWVtb3J5
CmFkZHJlc3MgKG9yIHRvIGJlIHByZWNpc2UsICVyYnAgbWludXMgc29tZSBzbWFsbCBvZmZzZXQp
LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
