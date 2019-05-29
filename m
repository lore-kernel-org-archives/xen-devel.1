From: Greg KH <greg@kroah.com>
Subject: Re: Linux 3.18 no longer boots under Xen,
 Xen CI dropping it
Date: Wed, 29 May 2019 09:13:27 -0700
Message-ID: <20190529161327.GA16496__12600.3118044295$1559146474$gmane$org@kroah.com>
References: <E1hSRQF-0006xk-BS@osstest.test-lab.xenproject.org>
 <23778.34168.78221.110803@mariner.uk.xensource.com>
 <20190520114147.GU2798@zion.uk.xensource.com>
 <5CE2B0DA0200007800230A08@prv1-mh.provo.novell.com>
 <23790.44034.186393.25330@mariner.uk.xensource.com>
 <5CEEADE80200007800233811@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WiQL=T5=kroah.com=greg@srs-us1.protection.inumbo.net>)
 id 1hW1Co-0001RZ-0g
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 16:13:34 +0000
Content-Disposition: inline
In-Reply-To: <5CEEADE80200007800233811@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, stable@vger.kernel.org, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMTA6MDY6MDBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI5LjA1LjE5IGF0IDE3OjU3LCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4g
d3JvdGU6Cj4gPiBMaW51eCAzLjE4IG5vIGxvbmdlciBib290cyB1bmRlciBYZW4uCj4gPiAKPiA+
IFRoaXMgaGFzIGJlZW4gdHJ1ZSBmb3Igb3ZlciBoYWxmIGEgeWVhci4gIFRoZSBYZW4gcHJvamVj
dCBDSSBoYXMgYmVlbgo+ID4gc2VuZGluZyBhdXRvbWF0aWMgbWFpbHMgaW5jbHVkaW5nIGJpc2Vj
dGlvbiByZXBvcnRzIChzZWUgYmVsb3cpLgo+ID4gSSBlbWFpbGVkIFhlbiBrZXJuZWwgZm9sa3Mg
YW5kIGdvdCBubyB0YWtlcnMgZm9yIGZpeGluZyB0aGlzLgo+ID4gCj4gPiBVbmxlc3MgdGhpcyBp
cyBmaXhlZCBzb29uLCBvciBhdCBsZWFzdCBzb21lb25lIHNob3dzIHNvbWUgaW5jbGluYXRpb24K
PiA+IHRvIGludmVzdGlnYXRlIHRoaXMgcmVncmVzc2lvbiwgSSBpbnRlbmQgdG8gZHJvcCBhbGwg
dGVzdGluZyBvZiB0aGlzCj4gPiAic3RhYmxlIiBicmFuY2guICBJdCBoYXMgcm90dGVkIGFuZCBu
by1vbmUgaXMgZml4aW5nIGl0Lgo+IAo+IEFmYWljcyAzLjE4IGhhcyBiZWVuIG1hcmtlZCBFT0wg
dXBzdHJlYW0uCgpZZXMsIHRoZXJlIHdpbGwgbm90IGJlIGFueSBtb3JlIDMuMTgueSByZWxlYXNl
cyBvbiBrZXJuZWwub3JnIGFueW1vcmUuCgpJIGRvbid0IHRoaW5rIEkgcmVjYWxsIGFueSBwZW9w
bGUgY29tcGxhaW5pbmcgYWJvdXQgMy4xOCBicmVha2luZyBvbgpYZW4gYXMgdGhlIG9ubHkgdXNl
cnMgdGhhdCBJIGtub3cgb2YgZm9yIHRoYXQga2VybmVsIGFyZSBzb21lIFNvQy1iYXNlZApkZXZp
Y2VzLCBhbmQgdGhleSBkbyBub3QgdXNlIFhlbi4KCnRoYW5rcywKCmdyZWcgay1oCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
