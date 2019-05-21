From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v8 23/50] x86emul: support AVX512{F,
 DQ} uint-to-FP conversion insns
Date: Tue, 21 May 2019 12:58:31 +0100
Message-ID: <8da21a84-ef11-eea0-5ce9-72b15c06f88e@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B8431020000780021F20E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6u0k=TV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hT3Pj-0004pj-NF
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 11:58:39 +0000
In-Reply-To: <5C8B8431020000780021F20E@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMjAxOSAxMDo1MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gU29tZSAibWFudWFsIiBv
dmVycmlkZXMgb2YgZGlzcDhzY2FsZSBhcmUgbmVlZGVkIGhlcmUgYWdhaW4uIEluCj4gcGFydGlj
dWxhciBjb2RlIGVuZHMgdXAgc2ltcGxlciB3aGVuIHVzaW5nIGQ4c19kcTY0IGluIHRoZQo+IHR3
b2J5dGVfdGFibGVbXSBlbnRyeS4KPgo+IFRlc3QgaGFybmVzcyBhZGRpdGlvbnMgd2lsbCBiZSBk
b25lIG9uY2UgdGhlIHJldmVyc2UgY29udmVyc2lvbnMgYXJlCj4gYWxzbyBhdmFpbGFibGUuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBY2tlZC1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
