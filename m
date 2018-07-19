From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 07/13] iommu: track reserved ranges using
 a rangeset
Date: Thu, 19 Jul 2018 10:01:11 +0100
Message-ID: <20180719090111.uoygardgnyl6c5dv@citrix.com>
References: <20180717133816.37958-1-paul.durrant@citrix.com>
 <20180717133816.37958-8-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xz3x=kd=citrix.com=prvs=731336292=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fg4oJ-0005Bx-RO
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 09:01:19 +0000
Content-Disposition: inline
In-Reply-To: <20180717133816.37958-8-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMTcsIDIwMTggYXQgMDI6Mzg6MTBQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFJhbmdlcyB0aGF0IHNob3VsZCBiZSBjb25zaWRlcmVkIHJlc2VydmVkIGluIHRoZSBJ
T01NVSBhcmUgbm90IG5lY2Vzc2FyaWx5Cj4gbGltaXRlZCB0byBSTVJScy4gSWYgaW9tbXVfaW5j
bHVzaXZlX21hcHBpbmcgaXMgc2V0IHRoZW4gYW55IGZyYW1lIG51bWJlcgo+IGZhbGxpbmcgd2l0
aGluIGFuIEU4MjAgcmVzZXJ2ZWQgcmVnaW9uIHNob3VsZCBhbHNvIGJlIGNvbnNpZGVyZWQgYXMK
PiByZXNlcnZlZCBpbiB0aGUgSU9NTVUuCj4gVGhpcyBwYXRjaCBhZGRzIGEgcmFuZ2VzZXQgdG8g
dGhlIGRvbWFpbl9pb21tdSBzdHJ1Y3R1cmUgdGhhdCBpcyB0aGVuIHVzZWQKPiB0byB0cmFjayBh
bGwgcmVzZXJ2ZWQgcmFuZ2VzLiBUaGlzIHdpbGwgYmUgbmVlZGVkIGJ5IGEgc3Vic2VxdWVudCBw
YXRjaAo+IHRvIHRlc3Qgd2hldGhlciBpdCBpcyBzYWZlIHRvIG1vZGlmeSBhIHBhcnRpY3VsYXIg
SU9NTVUgZW50cnkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxh
cEBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
