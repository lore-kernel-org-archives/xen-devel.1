From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 16/47] x86emul: use simd_128 also for
 legacy vector shift insns
Date: Mon, 19 Nov 2018 19:21:49 +0000
Message-ID: <2ce6aac7-6ddc-59be-7f2b-88145dbe28b8@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BF289D802000078001FD3DF@prv1-mh.provo.novell.com>
 <5BF28EE102000078001FD4B7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gnyi=N6=citrix.com=prvs=8544ffb4f=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gOp7J-0005hl-Tm
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 19:21:53 +0000
In-Reply-To: <5BF28EE102000078001FD4B7@prv1-mh.provo.novell.com>
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

T24gMTkvMTEvMjAxOCAxMDoyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQEAgLTMzNDQsNyArMzM0
NCw4IEBAIHg4Nl9kZWNvZGUoCj4gICAgICAgICAgYnJlYWs7Cj4gIAo+ICAgICAgY2FzZSBzaW1k
XzEyODoKPiAtICAgICAgICBvcF9ieXRlcyA9IDE2Owo+ICsgICAgICAgIC8qIFRoZSBzcGVjaWFs
IGNhc2UgaGVyZSBhcmUgTU1YIHNoaWZ0IGluc25zLiAqLwoKInNwZWNpYWwgY2FzZSBoZXJlIGlz
IHRoZSBNTVgiIG9yICJzcGVjaWFsIGNhc2VzIGhlcmUgYXJlIi4KCk90aGVyd2lzZSwgQWNrZWQt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
