From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 5/5] build/clang: add a check whether the
 assembler supports .skip with labels
Date: Thu, 22 Feb 2018 07:43:21 -0700
Message-ID: <5A8EE51902000078001AA72C@prv-mh.provo.novell.com>
References: <20180220141015.30714-1-roger.pau@citrix.com>
 <20180220141015.30714-6-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=x7kc=fq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eos5q-0007YW-Eg
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 14:43:30 +0000
In-Reply-To: <20180220141015.30714-6-roger.pau@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjAyLjE4IGF0IDE1OjEwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9yIGVsc2UgZGlzYWJsZSB0aGUgaW50ZWdyYXRlZCBhc3NlbWJsZXIgZm9yIGFzc2VtYmx5IGZp
bGVzLiBUaGlzIGlzCj4gcmVsZXZhbnQgZm9yIG9sZGVyIGNsYW5nIHZlcnNpb25zIHdoaWNoIGlu
dGVncmF0ZWQgYXNzZW1ibGVyIGRvbid0Cj4gc3VwcG9ydCAuc2tpcCB3aXRoIGxhYmVscy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CmJ1dCBwZW5kaW5nIHRo
ZSBkZWNpc2lvbiB3aGF0IHRvIGRvIGFib3V0IGFzLWluc24tY2hlY2sncyBuYW1lLgoKSmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
