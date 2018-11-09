From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: eliminate pv_post_outb_hook
Date: Fri, 9 Nov 2018 16:32:36 +0000
Message-ID: <85842388-05cb-ba17-6345-e02f6980aecc@citrix.com>
References: <20181109162919.7543-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wzzi=nu=citrix.com=prvs=84405b137=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gL9iE-0008HO-Hg
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 16:32:50 +0000
In-Reply-To: <20181109162919.7543-1-wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMTEvMTggMTY6MjksIFdlaSBMaXUgd3JvdGU6Cj4gVXNlIGFtZF9hY3BpX2MxZV9xdWly
ayBhbmQgYW1kX2NoZWNrX2Rpc2FibGVfYzFlIGluc3RlYWQuCj4KPiBSZXF1ZXN0ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+CgpHb29kIHJpZGRhbmNlIHRvIHVubmVjZXNzYXJ5IGZ1bmN0aW9uIHBv
aW50ZXJzLCBlc3BlY2lhbGx5IGluIGEKcmV0cG9saW5lIHdvcmxkLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
