From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 27/34] x86: make hvm_inject_* functions
 build when !CONFIG_HVM
Date: Tue, 21 Aug 2018 05:39:54 -0600
Message-ID: <5B7BFA0A02000078001E0709@prv1-mh.provo.novell.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <9166a931d5230e28f4677a2305a832e55c833ed0.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ip0d=le=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fs50x-0007qg-VR
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 11:39:59 +0000
In-Reply-To: <9166a931d5230e28f4677a2305a832e55c833ed0.1534518694.git-series.wei.liu2@citrix.com>
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

Pj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
VGhleSByZWZlcmVuY2UgaHZtX2luamVjdF9ldmVudCB3aGljaCBpcyBIVk0gY29kZSAobm90IGNv
bXBpbGVkKS4gVGhleQo+IGFyZW4ndCB1c2VkIGJ5IGNvZGUgb3V0c2lkZSBIVk0gY29kZSBhbnl3
YXkuCgpBZ2FpbiBsb29rcyB0byBiZSBhIGNhc2Ugb2YgRENFIGRvaW5nIGl0cyBqb2IgKGlmIGFy
cmFuZ2VkIGZvciBwcm9wZXJseSkKaW5zdGVhZCBvZiBhZGRpbmcgI2lmZGVmLXMgdG8gZnVuY3Rp
b25zIHdoaWNoIG91Z2h0IHRvIGJlIGVudGlyZWx5CnVuYXZhaWxhYmxlIHdoZW4gIUhWTS4gU28g
aWYgYW55dGhpbmcsIEkgY291bGQgb25jZSBhZ2FpbiBzZWUgdGhlCmZ1bmN0aW9ucyBhcyBhIHdo
b2xlIGRpc2FwcGVhciBpbiB0aGF0IGNhc2UsIG5vdCBqdXN0IHRoZWlyIGJvZGllcy4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
