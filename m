From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: fix !CONFIG_HVM build for clang 3.8
Date: Fri, 05 Oct 2018 01:59:52 -0600
Message-ID: <5BB719F802000078001EEA65@prv1-mh.provo.novell.com>
References: <20181004164237.8776-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vier=mr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g8L1e-00048v-PY
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 07:59:54 +0000
In-Reply-To: <20181004164237.8776-1-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjEwLjE4IGF0IDE4OjQyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
SXQgaXMgZGlzY292ZXJlZCB0aGF0IGh2bV9mdW5jcyBtYWRlIGl0IGludG8gbW9uaXRvci5vIGV2
ZW4gd2hlbiBIVk0KPiBpcyBkaXNhYmxlZC4gVGhpcyB2ZXJzaW9uIG9mIGNsYW5nIGRvZXNuJ3Qg
c2VlbSB0byBjb21wbGV0ZWx5Cj4gZWxpbWluYXRlIHRoZSBjb2RlIGFmdGVyIGlzX2h2bV9kb21h
aW4oKSBpbgo+IGFyY2hfbW9uaXRvcl9nZXRfY2FwYWJpbGl0aWVzKCkuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
