From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] x86/XPTI: fix S3 resume (and CPU
 offlining in general)
Date: Mon, 28 May 2018 06:33:32 +0200
Message-ID: <b19b185f-8f4d-abd6-8940-31e7481698b4@suse.com>
References: <5B07A70402000078001C5D20@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jm/y=ip=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fNKTI-00071R-S3
 for xen-devel@lists.xenproject.org; Mon, 28 May 2018 15:54:08 +0000
In-Reply-To: <5B07A70402000078001C5D20@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Simon Gaiser <simon@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDUvMTggMDg6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFdlIHNob3VsZCBpbmRleCBh
biBMMSB0YWJsZSB3aXRoIGFuIEwxIGluZGV4Lgo+IAo+IFJlcG9ydGVkLWJ5OiBTaW1vbiBHYWlz
ZXIgPHNpbW9uQGludmlzaWJsZXRoaW5nc2xhYi5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
