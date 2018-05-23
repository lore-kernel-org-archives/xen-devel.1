From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: suppress sync when XPTI is disabled
 for a domain
Date: Wed, 23 May 2018 16:41:31 +0100
Message-ID: <15f80ca9-18d7-ab7c-f5b4-884e69e1e26a@citrix.com>
References: <5B0579AF02000078001C51CB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lmm1=ik=citrix.com=prvs=674cdb2fc=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fLVtV-0005Wq-EM
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 15:41:41 +0000
In-Reply-To: <5B0579AF02000078001C51CB@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDUvMTggMTU6MjQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE5vdyB0aGF0IHdlIGhhdmUg
YSBwZXItZG9tYWluIGZsYWcgd2UgY2FuIGFuZCBzaG91bGQgY29udHJvbCBzeW5jLWluZyBpbgo+
IGEgbW9yZSBmaW5lIGdyYWluZWQgbWFubmVyOiBPbmx5IGRvbWFpbnMgaGF2aW5nIFhQVEkgZW5h
YmxlZCBuZWVkIHRoZQo+IHN5bmMgdG8gb2NjdXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
