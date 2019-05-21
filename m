From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v8 19/50] x86emul: support AVX512F
 floating-point conversion insns
Date: Tue, 21 May 2019 12:33:31 +0100
Message-ID: <f23432bc-ab78-6de9-60ab-57767896b380@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B82BF020000780021F1C7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6u0k=TV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hT31Y-0002uA-D4
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 11:33:40 +0000
In-Reply-To: <5C8B82BF020000780021F1C7@prv1-mh.provo.novell.com>
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

T24gMTUvMDMvMjAxOSAxMDo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQEAgLTkzMTIsNyArOTM4
Niw4IEBAIHg4Nl9lbXVsYXRlKAo+ICAKPiAgICAgICAgICBpZiAoIGVhLnR5cGUgPT0gT1BfTUVN
ICkKPiAgICAgICAgICB7Cj4gLSAgICAgICAgICAgIHJjID0gb3BzLT53cml0ZShlYS5tZW0uc2Vn
LCBlYS5tZW0ub2ZmLCBtbXZhbHAsIDggPDwgdmV4LmwsIGN0eHQpOwo+ICsgICAgICAgICAgICBy
YyA9IG9wcy0+d3JpdGUoZWEubWVtLnNlZywgdHJ1bmNhdGVfZWEoZWEubWVtLm9mZiArIGZpcnN0
X2J5dGUpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHZvaWQgKiltbXZhbHAgKyBm
aXJzdF9ieXRlLCBvcF9ieXRlcywgY3R4dCk7Cj4gICAgICAgICAgICAgIGlmICggcmMgIT0gWDg2
RU1VTF9PS0FZICkKPiAgICAgICAgICAgICAgewo+ICAgICAgICAgICAgICAgICAgYXNtIHZvbGF0
aWxlICggImxkbXhjc3IgJTAiIDo6ICJtIiAobXhjc3IpICk7CgpUaGlzIGh1bmsgZG9lc24ndCBh
cHBlYXIgdG8gZml0IHdpdGggdGhlIHJlc3Qgb2YgdGhlIHBhdGNoLCBiZWNhdXNlIGl0Cmlzbid0
IHRoZSBmaXJzdCB1c2Ugb2YgZmlyc3RfYnl0ZS4KCkhhdmUgd2UgYmVlbiBzdWJ0bHkgYnJva2Vu
IGJlZm9yZT8KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
