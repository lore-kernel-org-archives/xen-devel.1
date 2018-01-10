From: "Alex Braunegg" <alex.braunegg@gmail.com>
Subject: Re: [BUG] kernel bug encountered at
	drivers/net/xen-netback/netback.c:430!
Date: Thu, 11 Jan 2018 06:55:04 +1100
Message-ID: <5a566fa0.8c11620a.9892a.2f8e@mx.google.com>
References: <23eb0f3f-590d-f03a-f971-65e86c52fbe4@ark-net.org>
 <5a4546b1.55da620a.5c435.4b4b@mx.google.com>
 <3f860d32831940e7aa40d97979155b6e@AMSPEX02CL03.citrite.net>
 <20180103203337.GA79570@elch.exwg.net>
 <3104994914c94a26baed6195f486c03f@AMSPEX02CL03.citrite.net>
 <20180107221904.GA78680@elch.exwg.net>
 <6f58d8db2c3a40248c447ff8f7f57067@AMSPEX02CL03.citrite.net>
 <ef22c8e42fc7441587dccba1e0729495@AMSPEX02CL03.citrite.net>
 <1fa2f53623a946e2b4ee2fc0b3632360@AMSPEX02CL03.citrite.net>
 <6ca3b938cb2949fba04f7fc9ce89f5aa@AMSPEX02CL03.citrite.net>
 <20180110175253.cxd7iedtdty4p63j@squirrel.exwg.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=46wc=ef=gmail.com=alex.braunegg@srs-us1.protection.inumbo.net>)
 id 1eZMSy-0001qr-IG
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 19:55:16 +0000
Received: by mail-pg0-x236.google.com with SMTP id q67so215533pga.9
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2018 11:55:14 -0800 (PST)
In-Reply-To: <20180110175253.cxd7iedtdty4p63j@squirrel.exwg.net>
Content-Language: en-au
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Christoph Moench-Tegeder' <cmt@burggraben.net>, 'Paul Durrant' <Paul.Durrant@citrix.com>
Cc: 'Michael Collins' <mike@ark-net.org>, 'Juergen Gross' <jgross@suse.com>, 'Wei Liu' <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Cj4gQWN0dWFsbHkgbm8gbmVlZC4uLiBUaGUgdW5kZXJseWluZyBpc3N1ZSB3YXMgcmVhbGx5IGEg
YnVnIGFuZCBoYXMKPiBiZWVuIGZpeGVkIGluIDQuMTQuMTEuCgpUaGFua3MgZm9yIHRyYWNraW5n
IHRoaXMgZG93biAmIHNwZW5kaW5nIHRpbWUgbG9va2luZyBhdCB0aGlzIFBhdWwuCgpCZXN0IHJl
Z2FyZHMsCgpBbGV4CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
