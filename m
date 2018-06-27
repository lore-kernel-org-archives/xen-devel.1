From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/3] x86/cpuid: fix generation of auto cpuid
 header
Date: Wed, 27 Jun 2018 15:44:11 +0100
Message-ID: <20180627144411.bz5jb2ubdyxfdz5a@citrix.com>
References: <20180627143214.35751-1-roger.pau@citrix.com>
 <20180627143214.35751-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0gw0=jn=citrix.com=prvs=7093bb682=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fYBg7-0007jk-St
 for xen-devel@lists.xenproject.org; Wed, 27 Jun 2018 14:44:15 +0000
Content-Disposition: inline
In-Reply-To: <20180627143214.35751-2-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdW4gMjcsIDIwMTggYXQgMDQ6MzI6MTJQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFRoZSBtYWtlZmlsZSBydWxlIHRvIGdlbmVyYXRlIHRoZSBjcHVpZC1hdXRvZ2Vu
LmggaGVhZGVyIHBhc3NlcyB0aGUKPiB3aG9sZSBsaXN0IG9mIGRlcGVuZGVuY2llcyB0byBnZW4t
Y3B1aWQucHkgYnV0IG9ubHkgdGhlIGZpcnN0Cj4gZGVwZW5kZW5jeSBpcyBhY3R1YWxseSBuZWVk
ZWQuCj4gCj4gU28gZmFyIHRoaXMgc2VlbXMgdG8gYmUgaGFybWxlc3MuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpBY2tlZC1ieTog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
