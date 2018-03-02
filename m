From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: guard more stack pages
Date: Fri, 2 Mar 2018 12:47:33 +0000
Message-ID: <88f72c9d-4718-6154-e733-6645f8e3d085@citrix.com>
References: <5A99426C02000078001ADBAA@prv-mh.provo.novell.com>
 <b84b8bc7-da02-dfbf-3d3b-87430f239c07@citrix.com>
 <5A994B3F02000078001ADC2E@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=prhv=fy=citrix.com=prvs=592350325=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1erk69-0001RU-8X
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 12:47:41 +0000
In-Reply-To: <5A994B3F02000078001ADC2E@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDMvMTggMTI6MDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Cj4gQEAgLTE2LDkgKzE2LDkg
QEAKPiAgICoKPiAgICogNyAtIFByaW1hcnkgc3RhY2sgKHdpdGggYSBzdHJ1Y3QgY3B1X2luZm8g
YXQgdGhlIHRvcCkKPiAgICogNiAtIFByaW1hcnkgc3RhY2sKPiAtICogNSAtIE9wdGlvbmFsbHkg
bm90IHByZXNldCAoTUVNT1JZX0dVQVJEKQo+IC0gKiA0IC0gdW51c2VkCj4gLSAqIDMgLSBTeXNj
YWxsIHRyYW1wb2xpbmVzCj4gKyAqIDUgLSBPcHRpb25hbGx5IG5vdCBwcmVzZW50IChNRU1PUllf
R1VBUkQpCj4gKyAqIDQgLSBVbnVzZWQ7IG9wdGlvbmFsbHkgbm90IHByZXNlbnQgKE1FTU9SWV9H
VUFSRCkKPiArICogMyAtIFVudXNlZDsgb3B0aW9uYWxseSBub3QgcHJlc2VudCAoTUVNT1JZX0dV
QVJEKQo+ICAgKiAyIC0gTUNFIElTVCBzdGFjawo+ICAgKiAxIC0gTk1JIElTVCBzdGFjawo+ICAg
KiAwIC0gRG91YmxlIEZhdWx0IElTVCBzdGFjawo+Cj4+IFdpdGggYXQgbGVhc3QgdGhlIGZpcnN0
IGlzc3VlIGZpeGVkLCBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3Blcgo+PiA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KPiBUaGFua3MsIGJ1dCBmb3IgdGhlIGFib3ZlIHBsZWFzZSBsZXQgbWUg
a25vdy4KClllcyAtIHRoYXRzIGFsc28gZmluZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
