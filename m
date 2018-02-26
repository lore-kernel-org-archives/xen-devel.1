From: Amit Shah <aams@amazon.com>
Subject: [PATCH 0/2] xen: fix bugs in error conditions
Date: Mon, 26 Feb 2018 17:36:33 +0000
Message-ID: <1519666595-41362-1-git-send-email-aams__47171.2173348807$1519710673$gmane$org@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yzye=fu=amazon.de=prvs=588dd4d4c=aams@srs-us1.protection.inumbo.net>)
 id 1eqMhq-0000Hg-6F
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 17:36:54 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Eduardo Valentin <eduval@amazon.com>, linux-kernel@vger.kernel.org, David Vrabel <david.vrabel@citrix.com>, Liu Shuo <shuo.a.liu@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Amit Shah <aams@amazon.com>, Thomas Gleixner <tglx@linutronix.de>, Anoob Soman <anoob.soman@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGVzZSBidWdzIHdlcmUgZm91bmQgZHVyaW5nIGNvZGUgcmV2aWV3LiAgRGV0YWls
cyBpbiB0aGUgY29tbWl0cy4KClBsZWFzZSByZXZpZXcgYW5kIGFwcGx5LgoKQ0M6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDQzogRGF2aWQgVnJhYmVsIDxkYXZpZC52
cmFiZWxAY2l0cml4LmNvbT4KQ0M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9y
YWNsZS5jb20+CkNDOiBFZHVhcmRvIFZhbGVudGluIDxlZHV2YWxAYW1hem9uLmNvbT4KQ0M6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQ0M6IFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPgpDQzogIksuIFkuIFNyaW5pdmFzYW4iIDxreXNAbWljcm9zb2Z0LmNvbT4K
Q0M6IExpdSBTaHVvIDxzaHVvLmEubGl1QGludGVsLmNvbT4KQ0M6IEFub29iIFNvbWFuIDxhbm9v
Yi5zb21hbkBjaXRyaXguY29tPgoKCkFtaXQgU2hhaCAoMik6CiAgeGVuOiBmaXggb3V0LW9mLWJv
dW5kcyBpcnEgdW5iaW5kIGZvciBNU0kgbWVzc2FnZSBncm91cHMKICB4ZW46IGV2ZW50czogZnJl
ZSBpcnFzIGluIGVycm9yIGNvbmRpdGlvbgoKIGRyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFz
ZS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKLS0gCjIuNy4zLkFN
Wk4KCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICkJlcmxpbiAtIERyZXNk
ZW4gLSBBYWNoZW4KbWFpbiBvZmZpY2U6IEtyYXVzZW5zdHIuIDM4LCAxMDExNyBCZXJsaW4KR2Vz
Y2hhZWZ0c2Z1ZWhyZXI6IERyLiBSYWxmIEhlcmJyaWNoLCBDaHJpc3RpYW4gU2NobGFlZ2VyClVz
dC1JRDogREUyODkyMzc4NzkKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1
cmcgSFJCIDE0OTE3MyBCCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
