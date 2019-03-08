From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v11 5/9] xen/x86: use DECLARE_BOUNDS as
 required
Date: Fri, 8 Mar 2019 15:33:42 +0000
Message-ID: <23682.35670.304992.192210@mariner.uk.xensource.com>
References: <alpine.DEB.2.10.1903051433230.17552@sstabellini-ThinkPad-X260>
 <1551825512-8975-5-git-send-email-sstabellini@kernel.org>
 <5C7FE846020000780021C2BA@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1903061300510.17248@sstabellini-ThinkPad-X260>
 <23681.9326.135131.521459@mariner.uk.xensource.com>
 <5C822BDC0200007800150189@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DpA2=RL=citrix.com=prvs=963cf6c57=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1h2HVM-0007Sj-3i
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2019 15:33:48 +0000
In-Reply-To: <5C822BDC0200007800150189@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "stefanos@xilinx.com" <stefanos@xilinx.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, "julien.grall@arm.com" <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtQQVRDSCB2MTEgNS85XSB4ZW4veDg2OiB1c2UgREVD
TEFSRV9CT1VORFMgYXMgcmVxdWlyZWQiKToKPiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0
cml4LmNvbT4gMDMvMDcvMTkgMzowMiBQTQo+ID5KYW4sIGl0IGlzIHF1aXRlIHVuZm9ydHVuYXRl
IHRoYXQgeW91IGFyZSByZXBseWluZyB0byBTdGVmYW5vIHRvCj4gPmRpc2FncmVlIHdpdGggdGhp
bmdzIHRoYXQgU3RlZmFubyBkaWQgYmVjYXVzZSBJIHN1Z2dlc3RlZCB0aGVtLCByYXRoZXIKPiA+
dGhhbiByZXBseWluZyB0byBteSBwYXRjaCBjb21tZW50cy4gIFdlIG11c3Qgbm90IHB1dCBTdGVm
YW5vIGluIHRoZQo+ID5taWRkbGUgb2YgYSBkaXNhZ3JlZW1lbnQgYmV0d2VlbiBkaWZmZXJlbnQg
Y29tbWl0dGVycy4KPiAKPiBJJ20gc29ycnksIGJ1dCBJIG1heSBoYXZlIGVhc2lseSBvdmVybG9v
a2VkIHRoaXMgZWFybGllciBjb21tZW50IG9mIHlvdXJzLgo+IEFueXdheSwgYSBsYXRlciByZXBs
eSBieSBTdGVmYW5vIHN1Z2dlc3RzIHRoYXQgdGhlIGxpbmUgd291bGQgZW5kIHVwCj4gYmVpbmcg
NzkgY2hhcnMsIHdoaWNoIGlzIGluIGxpbmUgd2l0aCAuL0NPRElOR19TVFlMRS4KClJpZ2h0LiAg
R2l2ZW4gb3RoZXJzJyByZXBsaWVzLCBJIHdvbid0IHByZXNzIHRoaXMgcG9pbnQgZnVydGhlci4K
Ck9mIGNvdXJzZSBgbGVzcyB0aGFuIDgwIGNoYXJhY3RlcnMnIHdvdWxkIG1lYW4gdGhhdCB0aGUg
bWF4aW11bSB3YXMgNzkKYnV0IGlmIHlvdSBhbGwgZGVjaWRlIHRvIGluY3JlYXNlIGl0IGJ5IG9u
ZSB0aGVuIGdydW1wIGJ1dCB3aGF0ZXZlci4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
