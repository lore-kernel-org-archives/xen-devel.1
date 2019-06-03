From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/5] xen/vm-event: Drop unused u_domctl
 parameter from vm_event_domctl()
Date: Mon, 03 Jun 2019 07:52:20 -0600
Message-ID: <5CF526140200007800234A60@prv1-mh.provo.novell.com>
References: <1559564728-17167-1-git-send-email-andrew.cooper3@citrix.com>
 <1559564728-17167-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hXnNy-00045A-JY
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 13:52:26 +0000
In-Reply-To: <1559564728-17167-2-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA2LjE5IGF0IDE0OjI1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhpcyBwYXJhbWV0ZXIgaXNuJ3QgdXNlZCBhdCBhbGwuICBGdXRoZXJtb3JlLCBlbGlk
ZSB0aGUgY29weWJhY2sgaW4KPiBmYWlsaW5nIGNhc2VzLCBhcyBpdCBpcyBvbmx5IHN1Y2Nlc3Nm
dWwgcGF0aHMgd2hpY2ggZ2VuZXJhdGUgZGF0YSB3aGljaAo+IG5lZWRzIHNlbmRpbmcgYmFjayB0
byB0aGUgY2FsbGVyLgo+IAo+IEZpbmFsbHksIGRyb3AgYSByZWR1bmRhbnQgZCA9PSBOVUxMIGNo
ZWNrLCBhcyB0aGF0IGxvZ2ljIGlzIGFsbCBjb21tb24KPiBhdCB0aGUgYmVnaW5pbmcgb2YgZG9f
ZG9tY3RsKCkuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAtLS0KPiBDQzogUmF6
dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+IENDOiBUYW1hcyBLIExl
bmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4gQ0M6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNh
bGFidUBiaXRkZWZlbmRlci5jb20+Cj4gLS0tCj4gIHhlbi9jb21tb24vZG9tY3RsLmMgICAgICAg
IHwgNiArKystLS0KCkp1c3QgaW4gY2FzZXMgaXQncyB3YW50ZWQvbmVlZGVkOgpBY2tlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
