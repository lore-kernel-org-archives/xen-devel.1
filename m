From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3] xen/drivers/char: Protect the
 asm/vpl011.h include
Date: Wed, 22 May 2019 02:41:38 -0600
Message-ID: <5CE50B42020000780023135C@prv1-mh.provo.novell.com>
References: <20190521222418.27107-1-alistair.francis@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTMog-0001dX-Hd
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 08:41:42 +0000
In-Reply-To: <20190521222418.27107-1-alistair.francis@wdc.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, alistair23@gmail.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjA1LjE5IGF0IDAwOjI0LCA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPiB3cm90
ZToKPiBUaGUgb25seSB1c2Ugb2YgYXNtL3ZwbDAxMS5oIGlzIHByb3RlY3RlZCBieSB0aGUgQ09O
RklHX1NCU0FfVlVBUlRfQ09OU09MRQo+IGRlZmluZSBzbyBsZXRzIHByb3RlY3QgdGhlIGluY2x1
ZGUgYXMgd2VsbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFp
ci5mcmFuY2lzQHdkYy5jb20+CgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
