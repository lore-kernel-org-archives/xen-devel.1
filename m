From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/mem-sharing: statically initialize
 audit list head and lock
Date: Wed, 10 Apr 2019 12:13:58 +0100
Message-ID: <2930e42d-5ba2-abb7-0dd7-c9dabfc7ddfe@citrix.com>
References: <5CADCC40020000780022621E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HBqT=SM=citrix.com=prvs=996c6fe0e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hEBDK-0005cj-Sq
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 11:16:22 +0000
In-Reply-To: <5CADCC40020000780022621E@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDQvMjAxOSAxMTo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlcmUncyBubyBuZWVk
IHRvIGV4ZWN1dGUgYW55IGluc3RydWN0aW9ucyBmb3IgZG9pbmcgc28uCj4KPiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gLS0tCj4gSSB3b25kZXIgd2hl
dGhlciBtZW1fc2hhcmluZ19pbml0KCkgc2hvdWxkbid0IGdvIGF3YXkgYWx0b2dldGhlciB0aGVu
LgoKSSB2b3RlIGZvciByZW1vdmluZyBpdCBjb21wbGV0ZWx5LsKgIFRoZSBwcmludGsgaXMgYSBv
dXQtb2YtY2hhcmFjdGVyCmNvbXBhcmVkIHRvIG90aGVyIHN1YnN5c3RlbXMgaW4gWGVuLgoKRWl0
aGVyIHdheSwgUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
