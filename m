From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v6 4/5] x86/mm: handle foreign mappings in
 p2m_entry_modify
Date: Wed, 27 Feb 2019 13:55:31 +0000
Message-ID: <20190227135531.u6jtsgriav4imoyw@zion.uk.xensource.com>
References: <20190227110905.53512-1-roger.pau@citrix.com>
 <20190227110905.53512-5-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wyqt=RC=citrix.com=prvs=954d42a2d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gyzgN-0000y3-5s
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 13:55:35 +0000
Content-Disposition: inline
In-Reply-To: <20190227110905.53512-5-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMjcsIDIwMTkgYXQgMTI6MDk6MDRQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFNvIHRoYXQgdGhlIHNwZWNpZmljIGhhbmRsaW5nIGNhbiBiZSByZW1vdmVkIGZy
b20KPiBhdG9taWNfd3JpdGVfZXB0X2VudHJ5IGFuZCBiZSBzaGFyZWQgd2l0aCBucHQgYW5kIHNo
YWRvdyBjb2RlLgo+IAo+IFRoaXMgY29tbWl0IGFsc28gcmVtb3ZlcyB0aGUgY2hlY2sgdGhhdCBw
cmV2ZW50IG5vbi1lcHQgUFZIIGRvbTAgZnJvbQo+IG1hcHBpbmcgZm9yZWlnbiBwYWdlcy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
PiBSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CgpSZXZpZXdl
ZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
