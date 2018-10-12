From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 13/17] x86: don't create Dom0 if neither PV
 nor HVM is available
Date: Fri, 12 Oct 2018 09:12:43 -0600
Message-ID: <5BC0B9EB02000078001F1145@prv1-mh.provo.novell.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
 <9f342296979cad0b5dea238c30a082428f25254f.1538667753.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=tlq1=my=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gAz7P-0001YA-Cj
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 15:12:47 +0000
In-Reply-To: <9f342296979cad0b5dea238c30a082428f25254f.1538667753.git-series.wei.liu2@citrix.com>
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

Pj4+IE9uIDA0LjEwLjE4IGF0IDE3OjQzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
VGhpcyB3aWxsIGdpdmUgdXMgYSBYZW4gc2V0dGluZyBpbiBpZGxlIGxvb3AuIFRoaXMgZG9lc24n
dCBoYXZlCj4gcHJhY3RpY2FsIHVzZSBleGNlcHQgZm9yIGRlYnVnZ2luZyBwdXJwb3NlLgoKSG1t
LCB0aGF0J3MgYW4gYWNjZXB0YWJsZSBhbHRlcm5hdGl2ZSB0byB0aGUgcGFuaWMoKSB2YXJpYW50
LCBidXQKSSdkIHN0aWxsIHByZWZlciB0aGF0IG9uZS4gQWdhaW4gLSBsZXQncyBzZWUgaWYgQW5k
cmV3IGhhcyBhbiBvcGluaW9uCmVpdGhlciB3YXkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
