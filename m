From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/3] x86emul: raise #GP(0) in VME mode
 for POPF with TF set in new value
Date: Mon, 3 Dec 2018 19:24:49 +0000
Message-ID: <8efdb00b-ef80-df1c-8c44-f66880de3735@citrix.com>
References: <5BDC7E5802000078001F75BA@prv1-mh.provo.novell.com>
 <5BE1981502000078001F89C7@prv1-mh.provo.novell.com>
 <5BE19AE602000078001F8A0D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rgki=om=citrix.com=prvs=868a16509=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gTtqd-00049t-Hb
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 19:25:39 +0000
In-Reply-To: <5BE19AE602000078001F8A0D@prv1-mh.provo.novell.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTEvMjAxOCAxMzo0NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhpcyBpcyBhIGNoZWNr
IGV4cGxpY2l0bHkgbGlzdGVkIGJ5IHRoZSBpbnN0cnVjdGlvbiBwYWdlIGluIHRoZSBTRE0uCj4K
PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdl
ZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
