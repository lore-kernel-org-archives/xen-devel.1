From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/1] xen-blkback: do not wake up shutdown_wq
 after xen_blkif_schedule() is stopped
Date: Wed, 16 Jan 2019 15:29:43 +0100
Message-ID: <20190116142943.b4nlpoaeitn6esb2__28407.0591129877$1547648910$gmane$org@mac>
References: <1547646461-29803-1-git-send-email-dongli.zhang@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=66eY=PY=citrix.com=prvs=912d4b2fb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gjmCW-00041G-Ir
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 14:29:52 +0000
Content-Disposition: inline
In-Reply-To: <1547646461-29803-1-git-send-email-dongli.zhang@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, axboe@kernel.dk, linux-kernel@vger.kernel.org, konrad.wilk@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgMDk6NDc6NDFQTSArMDgwMCwgRG9uZ2xpIFpoYW5nIHdy
b3RlOgo+IFRoZXJlIGlzIG5vIG5lZWQgdG8gd2FrZSB1cCB4ZW5fYmxraWZfc2NoZWR1bGUoKSBh
cyBrdGhyZWFkX3N0b3AoKSBpcyBhYmxlCj4gdG8gYWxyZWFkeSB3YWtlIHVwIHRoZSBrZXJuZWwg
dGhyZWFkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERvbmdsaSBaaGFuZyA8ZG9uZ2xpLnpoYW5nQG9y
YWNsZS5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+CgprdGhyZWFkX3N0b3Agd2FpdHMgZm9yIHRoZSB0aHJlYWQgdG8gZXhpdCwgc28gaXQg
bXVzdCBvYnZpb3VzbHkgd2FrZQppdCB1cC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
