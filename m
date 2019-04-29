From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/9] x86/IRQ: reduce unused space in struct
 arch_irq_desc
Date: Mon, 29 Apr 2019 12:46:16 +0100
Message-ID: <17ba6e1a-ae9d-c5d0-7b68-6e263a3d58d2@citrix.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CC6DF3D0200007800229EBF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AiJS=S7=citrix.com=prvs=0159f91d2=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hL4jk-0002Ia-N5
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 11:46:20 +0000
In-Reply-To: <5CC6DF3D0200007800229EBF@prv1-mh.provo.novell.com>
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

T24gMjkvMDQvMjAxOSAxMjoyNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
