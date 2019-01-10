From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH for-4.12] x86/p2m: fix
 p2m_finish_type_change()
Date: Thu, 10 Jan 2019 23:42:34 +0000
Message-ID: <1C501BB4-0253-4A02-BB57-AA4D33CF2055@citrix.com>
References: <1547030466-3547-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n6Fr=PS=citrix.com=prvs=906c3ced9=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ghjyA-00082I-Ba
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 23:42:38 +0000
In-Reply-To: <1547030466-3547-1-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US
Content-ID: <F6F940C8F05943449A4DFC1C6FB3FD63@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIEphbiA5LCAyMDE5LCBhdCA4OjQxIFBNLCBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+IAo+IGZpbmlzaF90eXBlX2NoYW5nZSgpIHJldHVy
bnMgYSBuZWdhdGl2ZSBpbnQgb24gZXJyb3IsIGJ1dCB0aGUKPiBjdXJyZW50IGNvZGUgY2hlY2tz
IGlmICggIXJjICkuIEFsc28gcHJvcGVybHkgaW5kZW50IHRoZSBvdXQ6Cj4gbGFiZWwgd2hpbGUg
YXQgaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0
ZGVmZW5kZXIuY29tPgoKQWNrZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0
cml4LmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
