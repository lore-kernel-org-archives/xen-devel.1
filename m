From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4.9 and older] cmdline: fix parse_boolean()
 for NULL incoming end pointer
Date: Mon, 16 Jul 2018 11:03:43 +0100
Message-ID: <2c06e0d2-8a36-c372-90b6-2e2fe33600e8@citrix.com>
References: <5B4C5C4C02000078001D42CC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pxdv=ka=citrix.com=prvs=728a4bfaa=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ff0M8-0003Tm-KT
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 10:03:48 +0000
In-Reply-To: <5B4C5C4C02000078001D42CC@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDcvMTggMDk6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFVzZSB0aGUgY2FsY3VsYXRl
ZCBsZW5ndGhzIGluc3RlYWQgb2YgcG9pbnRlcnMsIGFzICdlJyBiZWluZyBOVUxMIHdpbGwKPiBv
dGhlcndpc2UgY2F1c2UgdW5kdWUgcGFyc2luZyBmYWlsdXJlcy4KPgo+IFJlcG9ydGVkLWJ5OiBL
YXJsIEpvaG5zb24gPGthcmxqb2huc29uLml0QGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
