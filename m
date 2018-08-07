From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: don't use privcmd_call() from
 xen_mc_flush()
Date: Tue, 7 Aug 2018 15:11:37 +0200
Message-ID: <2a9600b0-3b49-7835-a664-9deb30b100a4__24169.2356103615$1533647422$gmane$org@suse.com>
References: <20180613095806.2978-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rp5o=kw=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fn1m0-0007P3-LW
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 13:11:40 +0000
In-Reply-To: <20180613095806.2978-1-jgross@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMDYvMTggMTE6NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gVXNpbmcgcHJpdmNtZF9j
YWxsKCkgZm9yIGEgc2luZ2xldG9uIG11bHRpY2FsbCBzZWVtcyB0byBiZSB3cm9uZywgYXMKPiBw
cml2Y21kX2NhbGwoKSBpcyB1c2luZyBzdGFjKCkvY2xhYygpIHRvIGVuYWJsZSBoeXBlcnZpc29y
IGFjY2VzcyB0bwo+IExpbnV4IHVzZXIgc3BhY2UuCj4gCj4gQWRkIGEgbmV3IHhlbl9zaW5nbGVf
Y2FsbCgpIGZ1bmN0aW9uIHRvIGJlIHVzZSBmb3IgdGhhdCBwdXJwb3NlLgo+IAo+IFJlcG9ydGVk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKQm9yaXMsIGFueSBvYmplY3Rpb25zPwoKCkp1
ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
