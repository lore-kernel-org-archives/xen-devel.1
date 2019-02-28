From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v6 4/5] x86/mm: handle foreign mappings in
 p2m_entry_modify
Date: Thu, 28 Feb 2019 17:32:57 +0000
Message-ID: <679dcb2d-58d2-2867-29c3-692d2b1aad7a@citrix.com>
References: <20190227110905.53512-1-roger.pau@citrix.com>
 <20190227110905.53512-5-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2BcS=RD=citrix.com=prvs=955e9f503=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gzPYX-0005tc-5R
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 17:33:13 +0000
In-Reply-To: <20190227110905.53512-5-roger.pau@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8yNy8xOSAxMTowOSBBTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFNvIHRoYXQgdGhl
IHNwZWNpZmljIGhhbmRsaW5nIGNhbiBiZSByZW1vdmVkIGZyb20KPiBhdG9taWNfd3JpdGVfZXB0
X2VudHJ5IGFuZCBiZSBzaGFyZWQgd2l0aCBucHQgYW5kIHNoYWRvdyBjb2RlLgo+IAo+IFRoaXMg
Y29tbWl0IGFsc28gcmVtb3ZlcyB0aGUgY2hlY2sgdGhhdCBwcmV2ZW50IG5vbi1lcHQgUFZIIGRv
bTAgZnJvbQo+IG1hcHBpbmcgZm9yZWlnbiBwYWdlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogS2V2aW4g
VGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CgpSZXZpZXdlZC1ieTogR2VvcmdlIER1bmxhcCA8
Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
