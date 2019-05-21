From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v8 22/50] x86emul: support AVX512DQ packed
 quad-int/FP conversion insns
Date: Tue, 21 May 2019 12:53:13 +0100
Message-ID: <ee5cfb78-a0e7-e00d-10e8-fe5743d29491@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B83EE020000780021F20B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6u0k=TV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hT3KZ-0004ey-02
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 11:53:19 +0000
In-Reply-To: <5C8B83EE020000780021F20B@prv1-mh.provo.novell.com>
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

T24gMTUvMDMvMjAxOSAxMDo1MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVkNWVHssVH1QUzJRUSwg
c2hhcmluZyB0aGVpciBtYWluIG9wY29kZXMgd2l0aCBvdGhlcnMsIG9uY2UgYWdhaW4gbmVlZAo+
ICJtYW51YWwiIG92ZXJyaWRlcyBvZiBkaXNwOHNjYWxlLgo+Cj4gV2hpbGUgbm90IGRpcmVjdGx5
IHJlbGF0ZWQgaGVyZSwgYWxzbyBhZGQgYSBzY2FsYXIgdmFyaWFudCBvZiB0b193aW50KCkKPiB0
byB0aGUgdGVzdCBoYXJuZXNzLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
