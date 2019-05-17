From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: cover for clang's lack of support of
 -mpreferred-stack-boundary=<N>
Date: Fri, 17 May 2019 16:11:06 +0100
Message-ID: <70e61ed3-a2f5-b12c-28f9-bb8ad56cf6bf@citrix.com>
References: <5CDECC9F020000780023023C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gdXm=TR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hReVr-0004Tf-Qu
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 15:11:11 +0000
In-Reply-To: <5CDECC9F020000780023023C@prv1-mh.provo.novell.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDUvMjAxOSAxNjowMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2hpbGUgY2xhbmcgc3Vw
cG9zZWRseSBzdXBwb3J0cyAtbXN0YWNrLWFsaWdubWVudD08Tj4gaW5zdGVhZCwgSSdtIG5vdAo+
IHVzaW5nIHRoYXQgYWx0ZXJuYXRpdmUgaGVyZSBkdWUgdG8gYmVpbmcgdW5jZXJ0YWluIHdoZXRo
ZXIgdGhhdCdzIGluZGVlZAo+IGFuIGV4YWN0IGVxdWl2YWxlbnQgb2YgdGhlIGdjYyBvcHRpb24u
IE9ubHkgbWFrZSB1c2Ugb2YgdGhlIG9wdGlvbgo+IGVudGlyZWx5IGNvbmRpdGlvbmFsIGZvciBu
b3cuCj4KPiBSZXBvcnRlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpB
Y2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
