From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 5/7] public / x86: introduce
 __HYPERCALL_iommu_op
Date: Thu, 7 Jun 2018 15:21:44 +0000
Message-ID: <98d6267dded342d7ab9263b86b265bb1@AMSPEX02CL03.citrite.net>
References: <20180212104714.1922-1-paul.durrant@citrix.com>
 <20180212104714.1922-6-paul.durrant@citrix.com>
 <5AABC5B402000078001B2C6B@prv-mh.provo.novell.com>
 <efc86f12783d4ab0b6ef15f50a7d59e2@AMSPEX02CL03.citrite.net>
 <5B19315402000078001C91C3@prv1-mh.provo.novell.com>
 <ab6e3d25-f0dc-1e1a-0b11-522a36217b79@citrix.com>
 <037261924f504968b8cfbcd882f9bf83@AMSPEX02CL03.citrite.net>
 <23321.16210.868949.648522@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kn0o=iz=citrix.com=prvs=689de9a9b=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fQwjd-0006g9-Ep
 for xen-devel@lists.xenproject.org; Thu, 07 Jun 2018 15:21:57 +0000
In-Reply-To: <23321.16210.868949.648522@mariner.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIFttYWlsdG86
aWFuLmphY2tzb25AY2l0cml4LmNvbV0KPiBTZW50OiAwNyBKdW5lIDIwMTggMTU6MjEKPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogR2VvcmdlIER1bmxh
cCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgSmFuIEJldWxpY2gKPiA8SkJldWxpY2hAc3Vz
ZS5jb20+OyBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgV2VpCj4g
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPjsgeGVuLQo+IGRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmc+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsKPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IERh
bmllbCBkZSBHcmFhZiA8ZGdkZWdyYUB0eWNoby5uc2EuZ292PjsgVGltCj4gKFhlbi5vcmcpIDx0
aW1AeGVuLm9yZz4KPiBTdWJqZWN0OiBSRTogW1BBVENIIDUvN10gcHVibGljIC8geDg2OiBpbnRy
b2R1Y2UgX19IWVBFUkNBTExfaW9tbXVfb3AKPiAKPiBQYXVsIER1cnJhbnQgd3JpdGVzICgiUkU6
IFtQQVRDSCA1LzddIHB1YmxpYyAvIHg4NjogaW50cm9kdWNlCj4gX19IWVBFUkNBTExfaW9tbXVf
b3AiKToKPiA+IEZXSVcgTGludXggYXBwZWFycyB0byB1c2UgYSBzaW5nbGUgJ18nIHByZWZpeCBh
bmQgbm8gc3VmZml4Lgo+IAo+IFRoaXMgcHJhY3RpY2Ugb2Ygc2NhdHRlcmluZyB1bmRlcnNjb3Jl
cyBhYm91dCwgYXBwYXJlbnRseSBhdCByYW5kb20sCj4gaXMgYmFmZmxpbmcgdG8gbWUuCj4gCj4g
SXQgZG9lc24ndCBsb29rIGxpa2UgbW9zdCBvZiB0aGUgcGVvcGxlIHdobyBkbyBpdCBhcmUgYXdh
cmUgb2YgdGhlCj4gcnVsZXMuICBGb3IgZXhhbXBsZSwgI2RlZmluaW5nIGFueSBpZGVudGlmaWVy
IHN0YXJ0aW5nIF9fIGlzIGEgbGljZW5jZQo+IHRvIHRoZSBjb21waWxlciB0byBzdHVmZiBkZW1v
bnMgdXAgeW91ciBub3NlLgo+IAo+IFdlIHNob3VsZCBkbyB0aGlzOgo+ICAgI2RlZmluZSBYRU5f
UFVCTElDX0lPTU1VX09QX0gKPiB3aGljaCBpcyAoaSkgbm90IGluIGFueSBvZiB0aGUgY29tcGls
ZXIncyBuYW1lc3BhY2VzIChpaSkgaGFzIFhFTl8gYXQKPiB0aGUgYmVnaW5uaW5nIHNvIHdlIGNh
biBqdXN0aWZ5IHRoaW5raW5nIHRoYXQgaXQgd29uJ3QgY2xhc2ggd2l0aAo+IGFueW9uZSBlbHNl
J3MgaWRlbnRpZmllcnMgKElpaSkgd2lsbCBuZXZlciBjbGFzaCB3aXRoIGFueSBvZiBvdXIgb3du
Cj4gYmVjYXVzZSBpdCBlbmRzIGluIF9ILgo+IAoKU291bmRzIG9rIHRvIG1lLiBQYXRjaCB0byBD
T0RJTkdfU1RZTEU/CgogIFBhdWwKCj4gSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
