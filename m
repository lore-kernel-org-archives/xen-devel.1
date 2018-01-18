From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/6] xen/pvshim: simplify replace_va_mapping
	code
Date: Thu, 18 Jan 2018 01:50:04 -0700
Message-ID: <5A606DCC020000780019FBBE@prv-mh.provo.novell.com>
References: <20180117094814.32772-1-roger.pau@citrix.com>
 <20180117094814.32772-5-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=udw+=en=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ec5tl-0001Vf-Rs
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 08:50:13 +0000
In-Reply-To: <20180117094814.32772-5-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjAxLjE4IGF0IDEwOjQ4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KCkknbSBub3Qgc3VyZSBJJ2QgY2FsbCBpdCBhIHNpbXBsaWZpY2F0aW9uLCB0
aG91Z2ggLSB5b3Ugb25seSByZS1vcmRlcgpjb2RlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
