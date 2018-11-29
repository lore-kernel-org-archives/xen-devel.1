From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v5 13/13] IOMMU: patch certain indirect
 calls to direct ones
Date: Thu, 29 Nov 2018 14:49:37 +0000
Message-ID: <20181129144937.7tjbfaycvvk3ojvv@zion.uk.xensource.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BE45CB602000078001F9C6A@prv1-mh.provo.novell.com>
 <5BE4618202000078001F9D39@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wph9=oi=citrix.com=prvs=8644391f1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gSNeb-0002IP-Je
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 14:50:57 +0000
Content-Disposition: inline
In-Reply-To: <5BE4618202000078001F9D39@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMDk6MTc6MDZBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhpcyBpcyBpbnRlbnRpb25hbGx5IG5vdCB0b3VjaGluZyBob29rcyB1c2VkIHJhcmVs
eSAob3Igbm90IGF0IGFsbCkKPiBkdXJpbmcgdGhlIGxpZmV0aW1lIG9mIGEgVk0sIHVubGVzcyBw
ZXJoYXBzIHNpdHRpbmcgb24gYW4gZXJyb3IgcGF0aAo+IG5leHQgdG8gYSBjYWxsIHdoaWNoIGdl
dHMgY2hhbmdlZCAoaW4gd2hpY2ggY2FzZSBJIHRoaW5rIHRoZSBlcnJvcgo+IHBhdGggYmV0dGVy
IHJlbWFpbnMgY29uc2lzdGVudCB3aXRoIHRoZSByZXNwZWN0aXZlIG1haW4gcGF0aCkuCj4gCj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQt
Ynk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
