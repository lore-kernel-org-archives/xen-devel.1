From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] x86: move quoting of __ASM_{STAC,CLAC}
Date: Thu, 15 Mar 2018 13:17:17 +0000
Message-ID: <55b41988-1727-c558-6879-3efb7f61bb64@citrix.com>
References: <5AA8E9BE02000078001B15B0@prv-mh.provo.novell.com>
 <5AA8EB7D02000078001B15C1@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=h5rp=gf=citrix.com=prvs=605c7d53e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ewSrc-0005Jg-TJ
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 13:24:12 +0000
In-Reply-To: <5AA8EB7D02000078001B15C1@prv-mh.provo.novell.com>
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
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMTggMDg6MjksIEphbiBCZXVsaWNoIHdyb3RlOgo+IEJvdGggY29uc3VtZXJzIHdh
bnQgdGhlbSBxdW90ZWQsIHNvIHF1b3RlIHRoZW0gcmlnaHQgYXdheSBpbnN0ZWFkIG9mCj4gdXNp
bmcgX19zdHJpbmdpZnkoKSB1cG9uIHVzZS4gSW4gdGhlIHNwaXJpdCBvZiBvdGhlciByZWNlbnQg
YWRkaXRpb25zCj4gYWxzbyBtYWtlIHRoZSBhc3NlbWJseSBmb3JtcyBhc3NlbWJsZXIgbWFjcm9z
LCBhbGxvd2luZyB0aGUgaGVscGVyCj4gI2RlZmluZS1zIHRvIGJlICN1bmRlZi1lZCBzdWJzZXF1
ZW50bHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
