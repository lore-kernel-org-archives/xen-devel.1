From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v5 1/5] x86/p2m: pass the p2m to
 write_p2m_entry handlers
Date: Thu, 21 Feb 2019 16:55:38 +0000
Message-ID: <20190221165538.gz54uafnsgusyieo@zion.uk.xensource.com>
References: <20190221165041.39394-1-roger.pau@citrix.com>
 <20190221165041.39394-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y0vM=Q4=citrix.com=prvs=948a3d738=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gwrdO-0006RG-8n
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 16:55:42 +0000
Content-Disposition: inline
In-Reply-To: <20190221165041.39394-2-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMjEsIDIwMTkgYXQgMDU6NTA6MzdQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IEN1cnJlbnQgY2FsbGVycyBwYXNzIHRoZSBwMm0gdG8gcGFnaW5nX3dyaXRlX3Ay
bV9lbnRyeSwgYnV0IHRoZQo+IGltcGxlbWVudGF0aW9uIHNwZWNpZmljIGhhbmRsZXJzIG9mIHRo
ZSB3cml0ZV9wMm1fZW50cnkgaG9vayBpbnN0ZWFkCj4gb2YgYSBwMm0gZ2V0IGEgZG9tYWluIHN0
cnVjdCBkdWUgdG8gdGhlIGhhbmRsaW5nIGRvbmUgaW4KPiBwYWdpbmdfd3JpdGVfcDJtX2VudHJ5
Lgo+IAo+IENoYW5nZSB0aGUgY29kZSBzbyB0aGF0IHRoZSBpbXBsZW1lbnRhdGlvbnMgb2Ygd3Jp
dGVfcDJtX2VudHJ5IHRha2UgYQo+IHAybSBpbnN0ZWFkIG9mIGEgZG9tYWluLgo+IAo+IFRoaXMg
aXMgYSBub24tZnVuY3Rpb25hbCBjaGFuZ2UsIGJ1dCB3aWxsIGJlIHVzZWQgYnkgZm9sbG93IHVw
Cj4gcGF0Y2hlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
