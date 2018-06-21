From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] xen-netfront: Fix mismatched rtnl_unlock
Date: Thu, 21 Jun 2018 15:05:36 +0200
Message-ID: <b00563d1-0de0-f3e0-388b-2f4658eceeae__17685.9620529742$1529586264$gmane$org@suse.com>
References: <20180621130021.27029-1-ross.lagerwall@citrix.com>
 <20180621130021.27029-2-ross.lagerwall@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cai1=jh=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fVzHQ-0005Rd-69
 for xen-devel@lists.xenproject.org; Thu, 21 Jun 2018 13:05:40 +0000
In-Reply-To: <20180621130021.27029-2-ross.lagerwall@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>, netdev@vger.kernel.org
Cc: xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMjEvMDYvMTggMTU6MDAsIFJvc3MgTGFnZXJ3YWxsIHdyb3RlOgo+IEZpeGVzOiBmNTk5YzY0
ZmRmN2QgKCJ4ZW4tbmV0ZnJvbnQ6IEZpeCByYWNlIGJldHdlZW4gZGV2aWNlIHNldHVwIGFuZCBv
cGVuIikKPiBSZXBvcnRlZC1ieTogQmVuIEh1dGNoaW5ncyA8YmVuLmh1dGNoaW5nc0Bjb2RldGhp
bmsuY28udWs+Cj4gU2lnbmVkLW9mZi1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxs
QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
