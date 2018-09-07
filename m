From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3] xen: avoid crash in disable_hotplug_cpu
Date: Fri, 7 Sep 2018 11:50:08 +0200
Message-ID: <baf89177-9fcc-dda4-fefd-57537018c94e__49550.4858707593$1536313730$gmane$org@suse.com>
References: <20180907063023.16913-1-olaf@aepfle.de>
 <c26bfbe1-9032-468c-d4d0-c05eda8af762@suse.com>
 <20180907112451.442b46fe.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cynw=lv=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fyDP1-0002ep-J5
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 09:50:11 +0000
In-Reply-To: <20180907112451.442b46fe.olaf@aepfle.de>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, open list <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDkvMTggMTE6MjQsIE9sYWYgSGVyaW5nIHdyb3RlOgo+IEFtIEZyaSwgNyBTZXAgMjAx
OCAwOTo0ODoyOCArMDIwMAo+IHNjaHJpZWIgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PjoKPiAKPj4gT24gMDcvMDkvMTggMDg6MzAsIE9sYWYgSGVyaW5nIHdyb3RlOgo+Pj4gKwlpZiAo
Y3B1X29ubGluZShjcHUpKQo+Pj4gKwkJcmV0dXJuOwo+Pj4gIAlpZiAoY3B1X3ByZXNlbnQoY3B1
KSkKPj4+ICAJCXhlbl9hcmNoX3VucmVnaXN0ZXJfY3B1KGNwdSk7ICAKPiAKPj4gQ291bGQgeW91
IG1lcmdlIHRoZSB0d28gaWYgY29uZGl0aW9ucz8KPj4gaWYgKCFjcHVfb25saW5lKGNwdSkgJiYg
Y3B1X3ByZXNlbnQoY3B1KSkKPj4gCXhlbl9hcmNoX3VucmVnaXN0ZXJfY3B1KGNwdSk7Cj4gCj4g
SXMgdGhhdCBhbnkgZGlmZmVyZW50LCBiZXNpZGUgYmVpbmcgd3JvbmcsIGZyb20gd2hhdCB0aGUg
cGF0Y2ggYWN0dWFsbHkgZG9lcz8KCk5vLiBKdXN0IGEgbWF0dGVyIG9mIHN0eWxlLgoKPiBJdCB3
b3VsZCBzdGlsbCBjbGVhciB0aGUgcHJlc2VudCBiaXQgbGF0ZXIgb24uCgpUaGlzIHNob3VsZCBi
ZSBwYXJ0IG9mIHRoZSBpZiBjbGF1c2UsIG9mIGNvdXJzZS4KCgpKdWVyZ2VuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
