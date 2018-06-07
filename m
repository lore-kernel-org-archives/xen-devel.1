From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 5/7] public / x86: introduce
 __HYPERCALL_iommu_op
Date: Thu, 7 Jun 2018 15:21:06 +0100
Message-ID: <23321.16210.868949.648522@mariner.uk.xensource.com>
References: <20180212104714.1922-1-paul.durrant@citrix.com>
 <20180212104714.1922-6-paul.durrant@citrix.com>
 <5AABC5B402000078001B2C6B@prv-mh.provo.novell.com>
 <efc86f12783d4ab0b6ef15f50a7d59e2@AMSPEX02CL03.citrite.net>
 <5B19315402000078001C91C3@prv1-mh.provo.novell.com>
 <ab6e3d25-f0dc-1e1a-0b11-522a36217b79@citrix.com>
 <037261924f504968b8cfbcd882f9bf83@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=d4zl=iz=citrix.com=prvs=689a3d20f=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fQvn5-0004vw-TN
 for xen-devel@lists.xenproject.org; Thu, 07 Jun 2018 14:21:27 +0000
In-Reply-To: <037261924f504968b8cfbcd882f9bf83@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

UGF1bCBEdXJyYW50IHdyaXRlcyAoIlJFOiBbUEFUQ0ggNS83XSBwdWJsaWMgLyB4ODY6IGludHJv
ZHVjZSBfX0hZUEVSQ0FMTF9pb21tdV9vcCIpOgo+IEZXSVcgTGludXggYXBwZWFycyB0byB1c2Ug
YSBzaW5nbGUgJ18nIHByZWZpeCBhbmQgbm8gc3VmZml4LgoKVGhpcyBwcmFjdGljZSBvZiBzY2F0
dGVyaW5nIHVuZGVyc2NvcmVzIGFib3V0LCBhcHBhcmVudGx5IGF0IHJhbmRvbSwKaXMgYmFmZmxp
bmcgdG8gbWUuCgpJdCBkb2Vzbid0IGxvb2sgbGlrZSBtb3N0IG9mIHRoZSBwZW9wbGUgd2hvIGRv
IGl0IGFyZSBhd2FyZSBvZiB0aGUKcnVsZXMuICBGb3IgZXhhbXBsZSwgI2RlZmluaW5nIGFueSBp
ZGVudGlmaWVyIHN0YXJ0aW5nIF9fIGlzIGEgbGljZW5jZQp0byB0aGUgY29tcGlsZXIgdG8gc3R1
ZmYgZGVtb25zIHVwIHlvdXIgbm9zZS4KCldlIHNob3VsZCBkbyB0aGlzOgogICNkZWZpbmUgWEVO
X1BVQkxJQ19JT01NVV9PUF9ICndoaWNoIGlzIChpKSBub3QgaW4gYW55IG9mIHRoZSBjb21waWxl
cidzIG5hbWVzcGFjZXMgKGlpKSBoYXMgWEVOXyBhdAp0aGUgYmVnaW5uaW5nIHNvIHdlIGNhbiBq
dXN0aWZ5IHRoaW5raW5nIHRoYXQgaXQgd29uJ3QgY2xhc2ggd2l0aAphbnlvbmUgZWxzZSdzIGlk
ZW50aWZpZXJzIChJaWkpIHdpbGwgbmV2ZXIgY2xhc2ggd2l0aCBhbnkgb2Ygb3VyIG93bgpiZWNh
dXNlIGl0IGVuZHMgaW4gX0guCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
